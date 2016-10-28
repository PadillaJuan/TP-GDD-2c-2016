
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
	insert into afiliado(af_rel_id,af_nombre,af_apellido,af_tipodoc,af_numdoc,af_direccion,af_telefono,af_mail,af_nacimiento,planmed_id)
		select 01,Paciente_Nombre,Paciente_Apellido,'DNI',Paciente_Dni,
		       Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
		from gd_esquema.Maestra
		group by Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo

go
execute migrarAfiliados
go

create procedure migrarProfesional
as
	insert into profesional(prof_nombre,prof_apellido,prof_tipodoc,prof_numdoc,prof_direccion,prof_telefono,prof_mail,prof_nacimiento)
		select Medico_Nombre,Medico_Apellido,'DNI',Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		from gd_esquema.Maestra
		where Medico_Dni is not null
		group by Medico_Nombre,Medico_Apellido,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		order by Medico_Dni
go
execute migrarProfesional
go
