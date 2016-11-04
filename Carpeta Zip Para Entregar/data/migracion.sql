
if OBJECT_ID('migrarAfiliados') is not null
 begin
	drop procedure migrarAfiliados
 end
 go

 if OBJECT_ID('migrarPlanMedico') is not null
 begin
	drop procedure migrarPlanMedico
 end
 go

 if OBJECT_ID('migrarProfesional') is not null
 begin
	drop procedure migrarProfesional
 end
 go

 if OBJECT_ID('migrarTipoEspecialidades') is not null
 begin
	drop procedure migrarTipoEspecialidades
 end
 go

 if OBJECT_ID('migrarEspecialidad') is not null
 begin
	drop procedure migrarEspecialidad
 end
 go

 if OBJECT_ID('migrarEspecialidadPorProfesional') is not null
 begin
	drop procedure migrarEspecialidadPorProfesional
end
go
 if OBJECT_ID('migrarTurnos') is not null
 begin
	drop procedure migrarTurnos
 end
 go
if OBJECT_ID('migrarRegistroCompra') is not null
begin
	drop procedure migrarRegistroCompra
end
go
if OBJECT_ID('migrarBonos') is not null
begin
	drop procedure migrarBonos
end
go

create procedure migrarPlanMedico
as
	SET IDENTITY_INSERT plan_medico ON 
	insert into plan_medico(planmed_id,plan_descripcion,plan_precio_bono)
		select Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta
		from gd_esquema.Maestra
		group by Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia
		order by Plan_Med_Codigo asc
	SET IDENTITY_INSERT plan_medico OFF

go
execute migrarPlanMedico
go

create procedure migrarAfiliados
as	
	insert into usuarios
		select Paciente_Dni,HASHBYTES('SHA2_256',Paciente_Mail),0,'1'
		from gd_esquema.Maestra
		group by Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo

	insert into afiliado(af_rel_id,us_id,af_nombre,af_apellido,af_tipodoc,af_numdoc,af_direccion,af_telefono,af_mail,af_nacimiento,planmed_id)
		select 01,us_id,Paciente_Nombre,Paciente_Apellido,'DNI',Paciente_Dni,
		       Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
		from gd_esquema.Maestra,usuarios
		where us_username = Paciente_Dni
		group by us_id,Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
	 
go
execute migrarAfiliados
go


create procedure migrarProfesional
as
	insert into usuarios
		select Medico_Dni,HASHBYTES('SHA2_256',Medico_Mail),0,'1'
		from gd_esquema.Maestra
		where Medico_Dni is not null
		group by Medico_Nombre,Medico_Apellido,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		order by Medico_Dni

	insert into profesional(us_id,prof_nombre,prof_apellido,prof_tipodoc,prof_numdoc,prof_direccion,prof_telefono,prof_mail,prof_nacimiento)
		select us_id,Medico_Nombre,Medico_Apellido,'DNI',Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		from gd_esquema.Maestra,usuarios
		where Medico_Dni is not null and us_username = Medico_Dni
		group by us_id,Medico_Nombre,Medico_Apellido,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		order by Medico_Dni

go
execute migrarProfesional
go

create procedure migrarTipoEspecialidades
as
	SET IDENTITY_INSERT tipo_especialidades ON 
	insert into tipo_especialidades (tipoEsp_id,tipoEsp_descripcion)
		select Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion
		from gd_esquema.Maestra
		where Tipo_Especialidad_Codigo is not null
		group by Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion
		order by Tipo_Especialidad_Codigo
	SET IDENTITY_INSERT tipo_especialidades OFF 
go
execute migrarTipoEspecialidades
go

create procedure migrarEspecialidad
as
	SET IDENTITY_INSERT especialidad ON 
	insert into especialidad(esp_id,esp_descripcion,tipoEsp_id)
		select Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo
		from gd_esquema.Maestra
		where Tipo_Especialidad_Codigo is not null
		group by Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo
		order by Especialidad_Codigo
	SET IDENTITY_INSERT especialidad OFF
go
execute migrarEspecialidad
go

create procedure migrarEspecialidadPorProfesional
as
	insert into especialidad_por_profesional(prof_id,esp_id)
		select prof_id,esp_id
		from especialidad,profesional
go
execute migrarEspecialidadPorProfesional
go

create procedure migrarTurnos
as
	SET IDENTITY_INSERT turnos ON 
	insert into turnos(turno_id,turno_fecha,af_id,af_rel_id,prof_id,esp_id)
		select Turno_Numero,Turno_Fecha,af_id,af_rel_id,prof_id,Especialidad_Codigo
		from gd_esquema.Maestra,afiliado,profesional
		where af_numdoc = Paciente_Dni and prof_numdoc = Medico_Dni
		group by Turno_Numero,Turno_Fecha,af_id,af_rel_id,prof_id,Especialidad_Codigo
		order by Turno_Numero
	SET IDENTITY_INSERT turnos OFF
go
execute migrarTurnos
go

create procedure migrarRegistroCompra
as
	insert into registro_compra
		select af_id,af_rel_id,count(*),sum(Plan_Med_Precio_Bono_Consulta),Compra_Bono_Fecha
		from gd_esquema.Maestra,afiliado
		where Bono_Consulta_Numero is not null and Compra_Bono_Fecha is not null and af_numdoc = Paciente_Dni
		group by af_id, af_rel_id, Compra_Bono_Fecha
		order by Compra_Bono_Fecha
go
execute migrarRegistroCompra
go

create procedure migrarBonos
as
	SET IDENTITY_INSERT bono ON 
	insert into bono (bono_id,bono_compra,bono_planmed,bono_af,bono_af_rel,bono_estado)
		select Bono_Consulta_Numero,compra_id,Plan_Med_Codigo,af_id,af_rel_id,1
		from registro_compra,gd_esquema.Maestra,afiliado
		where compra_fecha = Compra_Bono_Fecha and Bono_Consulta_Numero is not null and Bono_Consulta_Numero is not null and
			  compra_af = af_id and af_numdoc = Paciente_Dni
		order by af_id
	SET IDENTITY_INSERT bono OFF 
go
execute migrarBonos
go

