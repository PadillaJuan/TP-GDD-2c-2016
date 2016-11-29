USE GD2C2016;
GO
SET DATEFORMAT ymd
SET LANGUAGE us_english
SET DATEFIRST 7
GO
-- ELIMINACION DE CONSTRAINTS
-- ELIMINACION DE CONSTRAINTS


IF (OBJECT_ID('FK_plan_med', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_plan_med
IF (OBJECT_ID('FK_afi_usuario', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_afi_usuario
IF (OBJECT_ID('FK_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_afi
IF (OBJECT_ID('FK_plan_ant', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_ant
IF (OBJECT_ID('FK_plan_new', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_new

IF (OBJECT_ID('FK_esp_por_planes_1', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_1
IF (OBJECT_ID('FK_esp_por_planes_2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_2
	

IF (OBJECT_ID('FK_compra_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.registro_compra DROP constraint FK_compra_afi;

IF (OBJECT_ID('FK_compra_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_compra_bono;
IF (OBJECT_ID('FK_plan_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_plan_bono;
IF (OBJECT_ID('FK_afi_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_afi_bono;

IF (OBJECT_ID('FK_consulta_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_turno;
IF (OBJECT_ID('FK_consulta_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_bono;

IF (OBJECT_ID('FK_turno_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_afi;
IF (OBJECT_ID('FK_turno_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_prof;
IF (OBJECT_ID('FK_turno_esp', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_esp;
IF (OBJECT_ID('FK_turno_agenda', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_agenda;

IF (OBJECT_ID('FK_cancelacion_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.cancelacion DROP constraint FK_cancelacion_turno;

IF (OBJECT_ID('FK_agenda_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof;
IF (OBJECT_ID('FK_agenda_prof2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof2;
	
IF (OBJECT_ID('FK_especialidad_tipo', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.especialidad DROP constraint FK_especialidad_tipo;

IF (OBJECT_ID('FK_prof_us', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.profesional DROP constraint FK_prof_us;
	
IF (OBJECT_ID('FK_baja_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.periodo_baja DROP constraint FK_baja_prof;

IF (OBJECT_ID('FK_rolxusr_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_id;
IF (OBJECT_ID('FK_rolxusr_rol', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_rol;

IF (OBJECT_ID('FK_funxrol_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_id;
IF (OBJECT_ID('FK_funxrol_fun', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_fun;
	
GO
	
	--ELIMINACION DE TABLAS
	--ELIMINACION DE TABLAS

IF (OBJECT_ID('DREAM_TEAM.afiliado','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.afiliado;
IF (OBJECT_ID('DREAM_TEAM.logs_cambio_plan','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.logs_cambio_plan;
IF (OBJECT_ID('DREAM_TEAM.plan_medico','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.plan_medico;
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades_por_planes','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades_por_planes;
IF (OBJECT_ID('DREAM_TEAM.registro_compra','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.registro_compra;
IF (OBJECT_ID('DREAM_TEAM.bono','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.bono;
IF (OBJECT_ID('DREAM_TEAM.consulta_medica','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.consulta_medica;
IF (OBJECT_ID('DREAM_TEAM.turnos','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.turnos;
IF (OBJECT_ID('DREAM_TEAM.cancelacion','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.cancelacion;
IF (OBJECT_ID('DREAM_TEAM.agenda_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.agenda_profesional;
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades;
IF (OBJECT_ID('DREAM_TEAM.especialidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad;
IF (OBJECT_ID('DREAM_TEAM.especialidad_por_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad_por_profesional;
IF (OBJECT_ID('DREAM_TEAM.profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.profesional;
IF (OBJECT_ID('DREAM_TEAM.periodo_baja','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.periodo_baja;
IF (OBJECT_ID('DREAM_TEAM.usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.usuarios;
IF (OBJECT_ID('DREAM_TEAM.rol_por_usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol_por_usuarios;
IF (OBJECT_ID('DREAM_TEAM.rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol;
IF (OBJECT_ID('DREAM_TEAM.funcionalidad_por_rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad_por_rol;
IF (OBJECT_ID('DREAM_TEAM.funcionalidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad;

IF EXISTS (SELECT * FROM sys.schemas WHERE sys.schemas.name = 'DREAM_TEAM')
	DROP SCHEMA DREAM_TEAM
	
GO 

CREATE SCHEMA [DREAM_TEAM] AUTHORIZATION [gd]
GO
	-- CREACION DE TABLAS
	-- CREACION DE TABLAS

/* TABLA DE AFILIADOS */

CREATE TABLE DREAM_TEAM.afiliado(
	af_id INT IDENTITY(1,1),
	af_rel_id TINYINT,
	us_id INT,
	af_nombre VARCHAR(255),
	af_apellido VARCHAR(255),
	af_tipodoc	 VARCHAR(5),
	af_numdoc numeric(18,0),
	af_direccion VARCHAR(255),
	af_telefono numeric(18,0),
	af_mail VARCHAR(255) ,
	af_nacimiento DATETIME,
	af_estado_civil VARCHAR(11),
	af_cantidad_familiares TINYINT,
	planmed_id numeric(18,0),
	af_sexo CHAR(1),
	af_status CHAR(1),
	af_fechaBaja DATETIME,
	PRIMARY KEY(af_id, af_rel_id)
 );


/* TABLA DE CAMBIO DE PLAN */

CREATE TABLE DREAM_TEAM.logs_cambio_plan(
	cambio_plan_id INT PRIMARY KEY IDENTITY(1,1),
	af_id INT,
	af_rel_id TINYINT,
	plan_id_ant numeric(18,0),
	plan_id_new numeric(18,0),
	cambio_plan_motivo VARCHAR(100),
	cambio_plan_fecha DATETIME
);


/* TABLA DE PLAN MEDICO */

CREATE TABLE DREAM_TEAM.plan_medico(
	planmed_id numeric(18,0) PRIMARY KEY IDENTITY(1,1),
	plan_cuota numeric(18,0),
	plan_descripcion VARCHAR(255),
	plan_precio_bono numeric(18,0),
);


/* TABLA DE SERVICIOS POR PLANES */

CREATE TABLE DREAM_TEAM.tipo_especialidades_por_planes(
	planmed_id numeric(18,0),
	tipoEsp_id NUMERIC(18,0),
	primary key (planmed_id, tipoEsp_id),
);


/* TABLA DE REGISTRO DE COMPRA */

CREATE TABLE DREAM_TEAM.registro_compra(
	compra_id INT PRIMARY KEY IDENTITY(1,1),
	compra_af INT,
	compra_af_rel TINYINT,
	compra_cantidad TINYINT,
	compra_monto DECIMAL(7,2),
	compra_fecha DATETIME
);


/* TABLA DE BONO */

CREATE TABLE DREAM_TEAM.bono(
	bono_id INT PRIMARY KEY IDENTITY(1,1),
	bono_compra INT,
	bono_planmed numeric(18,0),
	bono_af INT,
	bono_af_rel TINYINT,
	bono_nro_consulta INT
);


/* TABLA DE CONSULTA MEDICA */

CREATE TABLE DREAM_TEAM.consulta_medica(
	cons_id INT PRIMARY KEY IDENTITY(1,1),
	cons_turno NUMERIC(18,0),
	cons_hora_llegada DATETIME,
	cons_sintomas VARCHAR(255),
	cons_diagnostico VARCHAR(255),
	cons_bono INT
);


/* TABLA DE TURNOS */

CREATE TABLE DREAM_TEAM.turnos(
	turno_id NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1),
	turno_fecha DATETIME,
	turno_estado CHAR(1),
	turno_agenda INT,
	turno_af INT,
	turno_af_rel TINYINT,
	turno_prof INT,
	turno_esp NUMERIC(18,0),
);


/* TABLA DE CANCELACIONES */

CREATE TABLE DREAM_TEAM.cancelacion(
	cancel_id  INT PRIMARY KEY IDENTITY(1,1),
	cancel_tipo CHAR(1),
	cancel_motivo VARCHAR(100),
	turno_id NUMERIC(18,0),
);


/* TABLA DE AGENDA DEL PROFESIONAL */

CREATE TABLE DREAM_TEAM.agenda_profesional(
	agenda_id INT PRIMARY KEY IDENTITY(1,1),
	agenda_prof INT,
	agenda_esp NUMERIC(18,0),
	agenda_fechayhora DATETIME
);


/* TABLA DE TIPO DE ESPECIALIDADES */

CREATE TABLE DREAM_TEAM.tipo_especialidades(
	tipoEsp_id NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1),
	tipoEsp_descripcion VARCHAR(255)
);


/* TABLA DE ESPECIALIDADES */
CREATE TABLE DREAM_TEAM.especialidad(
	esp_id NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1),
	esp_descripcion VARCHAR(255),
	tipoEsp_id NUMERIC(18,0)
);


/* TABLA DE ESPECIALIDAD POR PROFESIONAL */

CREATE TABLE DREAM_TEAM.especialidad_por_profesional(
	prof_id INT,
	esp_id NUMERIC(18,0),
	PRIMARY KEY(prof_id,esp_id)
);


/* TABLA DE PROFESIONALES */

CREATE TABLE DREAM_TEAM.profesional(
	prof_id INT PRIMARY KEY IDENTITY(1,1),
	us_id INT,
	prof_nombre VARCHAR(255),
	prof_apellido VARCHAR(255),
	prof_tipodoc VARCHAR(5),
	prof_numdoc numeric(18,0) UNIQUE,
	prof_direccion VARCHAR(255),
	prof_telefono NUMERIC(18,0),
	prof_mail VARCHAR(255),
	prof_nacimiento DATETIME,
	prof_matricula INT,
	prof_sexo CHAR(1)
);


/* TABLA DE PERIODO BAJA DE TURNO */
CREATE TABLE DREAM_TEAM.periodo_baja(
	periodo_id INT PRIMARY KEY IDENTITY(1,1),
	periodo_desde DATETIME,
	periodo_hasta DATETIME,
	prof_id INT
);


/* TABLA DE USUARIOS */

CREATE TABLE DREAM_TEAM.usuarios(
	us_id INT PRIMARY KEY IDENTITY(1,1),
	us_username VARCHAR(30),
	us_password VARBINARY(64),
	us_login_fail TINYINT,
	us_status CHAR(1)
);


/* TABLA DE ROLES POR USUARIO */

CREATE TABLE DREAM_TEAM.rol_por_usuarios(
	us_id INT,
	rol_id INT,
	PRIMARY KEY(us_id,rol_id)
);


/* TABLA DE ROLES */

CREATE TABLE DREAM_TEAM.rol(
	rol_id INT PRIMARY KEY IDENTITY(1,1),
	rol_nombre VARCHAR(30),
	rol_status CHAR(1)
);


/* TABLA DE FUNCIONALIDADES POR ROL */

CREATE TABLE DREAM_TEAM.funcionalidad_por_rol(
	rol_id INT,
	fun_id INT,
	PRIMARY KEY(rol_id,fun_id)
);


/* TABLA DE FUNCIONALIDADES */

CREATE TABLE DREAM_TEAM.funcionalidad(
	fun_id INT PRIMARY KEY IDENTITY(1,1),
	fun_nombre VARCHAR(30),
	fun_descripcion VARCHAR(100)
);


-- CREACION DE CONSTRAINTS : FOREIGN KEYS
-- Nota: Se encuentran en el mismo orden de la creacion de tablas

ALTER TABLE DREAM_TEAM.afiliado add constraint FK_afi_usuario foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
ALTER TABLE DREAM_TEAM.afiliado add constraint FK_plan_med foreign key (planmed_id) references DREAM_TEAM.plan_medico (planmed_id);

ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_afi foreign key (af_id,af_rel_id) references DREAM_TEAM.afiliado (af_id,af_rel_id);
ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_plan_ant foreign key (plan_id_ant) references DREAM_TEAM.plan_medico (planmed_id);	
ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_plan_new foreign key (plan_id_new) references DREAM_TEAM.plan_medico (planmed_id);

ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes add constraint FK_esp_por_planes_1 foreign key (planmed_id) references DREAM_TEAM.plan_medico (planmed_id);
ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes add constraint FK_esp_por_planes_2 foreign key (tipoEsp_id) references DREAM_TEAM.tipo_especialidades (tipoEsp_id);
	
ALTER TABLE DREAM_TEAM.registro_compra add constraint FK_compra_afi foreign key (compra_af,compra_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);	

ALTER TABLE DREAM_TEAM.bono add constraint FK_compra_bono foreign key (bono_compra) references DREAM_TEAM.registro_compra (compra_id);	
ALTER TABLE DREAM_TEAM.bono add constraint FK_plan_bono foreign key (bono_planmed) references DREAM_TEAM.plan_medico (planmed_id);		
ALTER TABLE DREAM_TEAM.bono add constraint FK_afi_bono foreign key (bono_af,bono_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);	

ALTER TABLE DREAM_TEAM.consulta_medica add constraint FK_consulta_turno foreign key (cons_turno) references DREAM_TEAM.turnos (turno_id);	
ALTER TABLE DREAM_TEAM.consulta_medica add constraint FK_consulta_bono foreign key (cons_bono) references DREAM_TEAM.bono (bono_id);

ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_afi foreign key (turno_af,turno_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_prof foreign key (turno_prof) references DREAM_TEAM.profesional (prof_id);		
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_esp foreign key (turno_esp) references DREAM_TEAM.especialidad (esp_id);
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_agenda foreign key (turno_agenda) references DREAM_TEAM.agenda_profesional (agenda_id);

ALTER TABLE DREAM_TEAM.cancelacion add constraint FK_cancelacion_turno foreign key (turno_id) references DREAM_TEAM.turnos (turno_id);	

ALTER TABLE DREAM_TEAM.agenda_profesional add constraint FK_agenda_prof foreign key (agenda_prof) references DREAM_TEAM.profesional (prof_id);	
ALTER TABLE DREAM_TEAM.agenda_profesional add constraint FK_agenda_prof2 foreign key (agenda_esp) references DREAM_TEAM.especialidad (esp_id);	

ALTER TABLE DREAM_TEAM.especialidad add constraint FK_especialidad_tipo foreign key (tipoEsp_id) references DREAM_TEAM.tipo_especialidades (tipoEsp_id);

ALTER TABLE DREAM_TEAM.profesional add constraint FK_prof_us foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
	
ALTER TABLE DREAM_TEAM.periodo_baja add constraint FK_baja_prof foreign key (prof_id) references DREAM_TEAM.profesional (prof_id);	

ALTER TABLE DREAM_TEAM.rol_por_usuarios add constraint FK_rolxusr_id foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
ALTER TABLE DREAM_TEAM.rol_por_usuarios add constraint FK_rolxusr_rol foreign key (rol_id) references DREAM_TEAM.rol (rol_id);

ALTER TABLE DREAM_TEAM.funcionalidad_por_rol add constraint FK_funxrol_id foreign key (rol_id) references DREAM_TEAM.rol (rol_id);
ALTER TABLE DREAM_TEAM.funcionalidad_por_rol add constraint FK_funxrol_fun foreign key (fun_id) references DREAM_TEAM.funcionalidad (fun_id);

-- CREACION DE CONSTRAINTS: UNIQUE FIELDS

ALTER TABLE DREAM_TEAM.afiliado ADD CONSTRAINT UN_DNI UNIQUE (af_numdoc, af_tipodoc)
ALTER TABLE DREAM_TEAM.agenda_profesional ADD CONSTRAINT UN_DATOS UNIQUE (agenda_prof, agenda_fechayhora);
ALTER TABLE DREAM_TEAM.rol ADD CONSTRAINT UN_NOMBREROL UNIQUE (rol_nombre)


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------


--											MIGRACION

-- DROP PROCEDURES PARA LA MIGRACION

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
if OBJECT_ID('migrarConsultas') is not null
begin
	drop procedure migrarConsultas
end
go
if OBJECT_ID('migrarAgendaProfesional') is not null
begin
	drop procedure migrarAgendaProfesional
end
go

-- CREACION DE PROCEDURES PARA LA MIGRACION
/*------------------ MIGRACION DE PLANES MEDICOS ----------------------*/
create procedure migrarPlanMedico
as
	SET IDENTITY_INSERT DREAM_TEAM.plan_medico ON 
	insert into DREAM_TEAM.plan_medico(planmed_id,plan_descripcion,plan_precio_bono)
		select Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta
		from gd_esquema.Maestra
		group by Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia
		order by Plan_Med_Codigo asc
	SET IDENTITY_INSERT DREAM_TEAM.plan_medico OFF

go
execute migrarPlanMedico
go


/*------------------ MIGRACION DE AFILIADOS ----------------------*/
create procedure migrarAfiliados
as	
	insert into DREAM_TEAM.usuarios
		select convert(varchar,Paciente_Dni),HASHBYTES('SHA2_256',Paciente_Apellido),0,'1'
		from gd_esquema.Maestra
		group by Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo

	insert into DREAM_TEAM.afiliado(af_rel_id,us_id,af_nombre,af_apellido,af_tipodoc,af_numdoc,af_direccion,af_telefono,af_mail,af_nacimiento,planmed_id, af_estado_civil, af_sexo, af_cantidad_familiares)
		select 00,us_id,Paciente_Nombre,Paciente_Apellido,'DNI',Paciente_Dni,
		       Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo, '', '', 0
		from gd_esquema.Maestra,DREAM_TEAM.usuarios
		where us_username = convert(varchar,Paciente_Dni)
		group by us_id,Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
	 
go
execute migrarAfiliados
go


/*------------------ MIGRACION DE PROFESIONALES ----------------------*/
create procedure migrarProfesional
as
	insert into DREAM_TEAM.usuarios
		select convert(varchar,Medico_Dni),HASHBYTES('SHA2_256',Medico_Apellido),0,'1'
		from gd_esquema.Maestra
		where Medico_Dni is not null
		group by Medico_Nombre,Medico_Apellido,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		order by Medico_Dni

	insert into DREAM_TEAM.profesional(us_id,prof_nombre,prof_apellido,prof_tipodoc,prof_numdoc,prof_direccion,prof_telefono,prof_mail,prof_nacimiento)
		select us_id,Medico_Nombre,Medico_Apellido,'DNI',Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		from gd_esquema.Maestra,DREAM_TEAM.usuarios
		where Medico_Dni is not null and us_username = convert(varchar,Medico_Dni)
		group by us_id,Medico_Nombre,Medico_Apellido,Medico_Dni,Medico_Direccion,Medico_Telefono,Medico_Mail,Medico_Fecha_Nac
		order by Medico_Dni
go
execute migrarProfesional
go

/*------------------ MIGRACION DE TIPO DE ESPECIALIDADES ----------------------*/
create procedure migrarTipoEspecialidades
as
	SET IDENTITY_INSERT DREAM_TEAM.tipo_especialidades ON 
	insert into DREAM_TEAM.tipo_especialidades (tipoEsp_id,tipoEsp_descripcion)
		select Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion
		from gd_esquema.Maestra
		where Tipo_Especialidad_Codigo is not null
		group by Tipo_Especialidad_Codigo,Tipo_Especialidad_Descripcion
		order by Tipo_Especialidad_Codigo
	SET IDENTITY_INSERT DREAM_TEAM.tipo_especialidades OFF 
go
execute migrarTipoEspecialidades
go


/*------------------ MIGRACION DE ESPECIALIDADES ----------------------*/
create procedure migrarEspecialidad
as
	SET IDENTITY_INSERT DREAM_TEAM.especialidad ON 
	insert into DREAM_TEAM.especialidad(esp_id,esp_descripcion,tipoEsp_id)
		select Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo
		from gd_esquema.Maestra
		where Tipo_Especialidad_Codigo is not null
		group by Especialidad_Codigo,Especialidad_Descripcion,Tipo_Especialidad_Codigo
		order by Especialidad_Codigo
	SET IDENTITY_INSERT DREAM_TEAM.especialidad OFF
go
execute migrarEspecialidad
go


/*------------------ MIGRACION DE ESPECIALIDAD POR PROFESIONAL ----------------------*/
create procedure migrarEspecialidadPorProfesional
as
	insert into DREAM_TEAM.especialidad_por_profesional(prof_id,esp_id)
		select prof_id,Especialidad_Codigo
		from gd_esquema.Maestra,DREAM_TEAM.profesional
		where prof_numdoc = Medico_Dni
		group by prof_id,Especialidad_Codigo
		order by prof_id
go
execute migrarEspecialidadPorProfesional
go


/*------------------ MIGRACION DE AGENDAS PROFESIONALES ----------------------*/
create procedure migrarAgendaProfesional
as
	insert into DREAM_TEAM.agenda_profesional
		SELECT p.prof_id, m.Especialidad_Codigo, m.Turno_Fecha
		FROM gd_esquema.Maestra m, DREAM_TEAM.profesional p
		WHERE Turno_Fecha is not null and p.prof_numdoc = m.Medico_Dni
		GROUP BY p.prof_id, m.Especialidad_Codigo, m.Turno_Fecha
		ORDER BY m.Turno_Fecha ASC
go
execute migrarAgendaProfesional
go


/*------------------ MIGRACION DE TURNOS ----------------------*/
create procedure migrarTurnos
as
	SET IDENTITY_INSERT DREAM_TEAM.turnos ON 
	insert into DREAM_TEAM.turnos(turno_id,turno_fecha,turno_estado,turno_agenda,turno_af,turno_af_rel,turno_prof,turno_esp)
		select Turno_Numero,Turno_Fecha,1,agenda_id,af_id,af_rel_id,prof_id,Especialidad_Codigo
		from gd_esquema.Maestra,DREAM_TEAM.afiliado,DREAM_TEAM.profesional,DREAM_TEAM.agenda_profesional
		where Turno_Numero is not null and af_numdoc = Paciente_Dni and prof_numdoc = Medico_Dni and Consulta_Enfermedades is not null and
			  agenda_prof = prof_id and agenda_esp = Especialidad_Codigo and agenda_fechayhora = Turno_Fecha
		order by Turno_Numero ASC

	SET IDENTITY_INSERT DREAM_TEAM.turnos OFF
go
execute migrarTurnos
go


/*------------------ MIGRACION DE REGISTROS DE COMPRA ----------------------*/
create procedure migrarRegistroCompra
as
	insert into DREAM_TEAM.registro_compra
		select af_id,af_rel_id,count(*),sum(Plan_Med_Precio_Bono_Consulta),Compra_Bono_Fecha
		from gd_esquema.Maestra,DREAM_TEAM.afiliado
		where Bono_Consulta_Numero is not null and Compra_Bono_Fecha is not null and af_numdoc = Paciente_Dni
		group by af_id, af_rel_id, Compra_Bono_Fecha
		order by Compra_Bono_Fecha
go
execute migrarRegistroCompra
go


/*------------------ MIGRACION DE BONOS ----------------------*/
create procedure migrarBonos
as
	SET IDENTITY_INSERT DREAM_TEAM.bono ON 
	insert into DREAM_TEAM.bono (bono_id,bono_compra,bono_planmed,bono_af,bono_af_rel,bono_nro_consulta)
		select m1.Bono_Consulta_Numero,compra_id,m1.Plan_Med_Codigo,af_id,af_rel_id,(
			select count(*)
			from gd_esquema.Maestra m2
			where m2.Paciente_Dni = m1.Paciente_Dni and m2.Bono_Consulta_Numero is not null and m2.Turno_Numero is null and
				  m1.Bono_Consulta_Numero >= m2.Bono_Consulta_Numero
		)
		from DREAM_TEAM.registro_compra ,gd_esquema.Maestra m1,DREAM_TEAM.afiliado 
		where compra_fecha = m1.Compra_Bono_Fecha and m1.Bono_Consulta_Numero is not null and m1.Bono_Consulta_Numero is not null and
			  compra_af = af_id and af_numdoc = m1.Paciente_Dni
		order by m1.Bono_Consulta_Numero
	SET IDENTITY_INSERT DREAM_TEAM.bono OFF 
go
execute migrarBonos
go


/*------------------ MIGRACION DE CONSULTAS ----------------------*/
create procedure migrarConsultas
as
	insert into DREAM_TEAM.consulta_medica
		select Turno_Numero,Bono_Consulta_Fecha_Impresion,Consulta_Sintomas,Consulta_Enfermedades,Bono_Consulta_Numero
		from gd_esquema.Maestra
		where Consulta_Enfermedades is not null AND Bono_Consulta_Numero is not null
		order by Turno_Numero
go
execute migrarConsultas
go



------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

--														STORED PROCEDURES

--   STORED
--   PROCEDURES

-- DROP PROCEDURES

--PARA EL AFILIADO
IF (OBJECT_ID('bajaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE bajaAfiliado;
IF (OBJECT_ID('altaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE altaAfiliado;
IF (OBJECT_ID('getNextRelID', 'P') IS NOT NULL)
	DROP PROCEDURE getNextRelID;
IF (OBJECT_ID('altaFamiliar', 'P') IS NOT NULL)
	DROP PROCEDURE altaFamiliar;
IF (OBJECT_ID('getDatosForCompraBono', 'P') IS NOT NULL)
	DROP PROCEDURE getDatosForCompraBono;
IF (OBJECT_ID('getDatosDelAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE getDatosDelAfiliado;
IF (OBJECT_ID('actualizarAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE actualizarAfiliado;

-- PARA ABM ROL
IF (OBJECT_ID('getRolesPorUsuario', 'P') IS NOT NULL)
	DROP PROCEDURE getRolesPorUsuario;
IF (OBJECT_ID('getAllRoles', 'P') IS NOT NULL)
	DROP PROCEDURE getAllRoles;
IF (OBJECT_ID('getAllFuncionalidades', 'P') IS NOT NULL)
	DROP PROCEDURE getAllFuncionalidades;
IF (OBJECT_ID('getFuncionalidadDelRol', 'P') IS NOT NULL)
	DROP PROCEDURE getFuncionalidadDelRol;
IF (OBJECT_ID('InsertarRol', 'P') IS NOT NULL)
	DROP PROCEDURE InsertarRol;
IF (OBJECT_ID('InsertarRolXFuncionalidad', 'P') IS NOT NULL)
	DROP PROCEDURE InsertarRolXFuncionalidad;
IF (OBJECT_ID('getRol', 'P') IS NOT NULL)
	DROP PROCEDURE getRol;
IF (OBJECT_ID('deactivateRol', 'P') IS NOT NULL)
	DROP PROCEDURE deactivateRol;
IF (OBJECT_ID('activateRol', 'P') IS NOT NULL)
	DROP PROCEDURE activateRol;
IF (OBJECT_ID('updateRXF', 'P') IS NOT NULL)
	DROP PROCEDURE updateRXF;
IF (OBJECT_ID('updateRol', 'P') IS NOT NULL)
	DROP PROCEDURE updateRol;

-- LOGIN
IF (OBJECT_ID('login', 'P') IS NOT NULL)
	DROP PROCEDURE login;

-- PARA COMPRA BONO
IF (OBJECT_ID('getPlanesMedicos', 'P') IS NOT NULL)
	DROP PROCEDURE getPlanesMedicos;
IF (OBJECT_ID('getPrecioBonoDelPlan', 'P') IS NOT NULL)
	DROP PROCEDURE getPrecioBonoDelPlan;
IF (OBJECT_ID('comprarBonos', 'P') IS NOT NULL)
	DROP PROCEDURE comprarBonos;
IF (OBJECT_ID('checkBono', 'P') IS NOT NULL)
	DROP PROCEDURE checkBono;
IF (OBJECT_ID('getBonosDisponibles', 'P') IS NOT NULL)
	DROP PROCEDURE getBonosDisponibles;

	-- PARA REGISTRO DE AGENDA
IF (OBJECT_ID('getEspecialidadesMedicas', 'P') IS NOT NULL)
	DROP PROCEDURE getEspecialidadesMedicas;
IF (OBJECT_ID('getEspecialidadesPorProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE getEspecialidadesPorProfesional;
IF (OBJECT_ID('addHorasAgenda', 'P') IS NOT NULL)
	DROP PROCEDURE addHorasAgenda;	
IF (OBJECT_ID('getTurnos', 'P') IS NOT NULL)
	DROP PROCEDURE getTurnos;
IF (OBJECT_ID('comprobar48horas', 'P') IS NOT NULL)
	DROP PROCEDURE comprobar48horas;


-- PARA PEDIDO DE TURNOS Y REGISTROS DE LLEGADA/CONSULTA
IF (OBJECT_ID('generateConsultaMedica', 'P') IS NOT NULL)
	DROP PROCEDURE generateConsultaMedica;
IF (OBJECT_ID('getConsultas', 'P') IS NOT NULL)
	DROP PROCEDURE getConsultas;
IF (OBJECT_ID('getTurnosDelProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE getTurnosDelProfesional;
IF (OBJECT_ID('reservarTurno', 'P') IS NOT NULL)
	DROP PROCEDURE reservarTurno;
IF (OBJECT_ID('dameTurnosDisponiblesDeLaFecha', 'P') IS NOT NULL)
	DROP PROCEDURE dameTurnosDisponiblesDeLaFecha;
IF (OBJECT_ID('finalizarConsulta', 'P') IS NOT NULL)
	DROP PROCEDURE finalizarConsulta;
IF (OBJECT_ID('bajaIntervalo', 'P') IS NOT NULL)
	DROP PROCEDURE bajaIntervalo;
IF (OBJECT_ID('cancelTurno', 'P') IS NOT NULL)
	DROP PROCEDURE cancelTurno;


-- LISTADOS
IF (OBJECT_ID('getListado1', 'P') IS NOT NULL)
	DROP PROCEDURE getListado1;
IF (OBJECT_ID('getListado2', 'P') IS NOT NULL)
	DROP PROCEDURE getListado2;
IF (OBJECT_ID('getListado3', 'P') IS NOT NULL)
	DROP PROCEDURE getListado3;
IF (OBJECT_ID('getListado4', 'P') IS NOT NULL)
	DROP PROCEDURE getListado4;
IF (OBJECT_ID('getListado5', 'P') IS NOT NULL)
	DROP PROCEDURE getListado5;
GO



			-- CREACION DE PROCEDURES
			-- CREACION DE PROCEDURES


--PARA EL AFILIADO
CREATE PROCEDURE bajaAfiliado
	@id INT,
	@id_rel TINYINT,
	@af_fechaBaja DATETIME
AS
BEGIN
	UPDATE DREAM_TEAM.afiliado
	SET af_status = 'd',
	af_fechaBaja = @af_fechaBaja
	WHERE af_id = @id AND af_rel_id = @id_rel
END
GO

CREATE PROCEDURE altaAfiliado
	@af_rel_id TINYINT,
	@af_nombre VARCHAR(255),
	@af_apellido VARCHAR(255),
	@af_tipodoc	 VARCHAR(5),
	@af_numdoc numeric(18,0),
	@af_direccion VARCHAR(255),
	@af_telefono numeric(18,0),
	@af_mail VARCHAR(255) ,
	@af_nacimiento DATETIME,
	@af_estado_civil VARCHAR(11),
	@planmed_id numeric(18,0),
	@af_sexo CHAR(1)
AS
BEGIN	

	IF NOT EXISTS (SELECT 1 FROM DREAM_TEAM.afiliado WHERE af_numdoc = @af_numdoc AND af_tipodoc = @af_tipodoc)
	BEGIN
		INSERT INTO DREAM_TEAM.afiliado(af_rel_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo, af_status)
		VALUES (00,  @af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo, 'a')

		INSERT INTO DREAM_TEAM.usuarios VALUES(CONVERT(varchar(30), @af_numdoc),HASHBYTES('SHA2_256' ,@af_apellido),0,'a')
		INSERT INTO DREAM_TEAM.rol_por_usuarios VALUES((SELECT us_id FROM DREAM_TEAM.usuarios u WHERE u.us_username like @af_numdoc),(SELECT rol_id FROM DREAM_TEAM.rol r WHERE r.rol_nombre = 'Afiliado'))

		UPDATE DREAM_TEAM.afiliado SET us_id = (SELECT us_id FROM DREAM_TEAM.usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc))
		WHERE af_numdoc = @af_numdoc AND af_tipodoc = @af_tipodoc
	END
	ELSE
	BEGIN
		RAISERROR('Ya existe un afiliado con ese tipo y Nro de documento',11,16)
	END
END
GO

CREATE PROCEDURE getNextRelID
	@af_id BIGINT
AS
BEGIN
	SELECT MAX(af_rel_id)+1
	FROM DREAM_TEAM.afiliado
	WHERE af_id = @af_id
	RETURN
END
GO

CREATE PROCEDURE altaFamiliar
	@af_id BIGINT,
	@af_rel_id TINYINT,
	@af_nombre VARCHAR(255),
	@af_apellido VARCHAR(255),
	@af_tipodoc	 VARCHAR(5),
	@af_numdoc numeric(18,0),
	@af_direccion VARCHAR(255),
	@af_telefono numeric(18,0),
	@af_mail VARCHAR(255) ,
	@af_nacimiento DATETIME,
	@af_estado_civil VARCHAR(11),
	@planmed_id numeric(18,0),
	@af_sexo CHAR(1)
AS
BEGIN
	INSERT INTO DREAM_TEAM.usuarios VALUES(CONVERT(varchar(30), @af_numdoc),HASHBYTES('SHA2_256' ,@af_apellido),0,'a')
	INSERT INTO DREAM_TEAM.rol_por_usuarios VALUES((SELECT us_id FROM DREAM_TEAM.usuarios u WHERE u.us_username like @af_numdoc),
										(SELECT rol_id FROM DREAM_TEAM.rol r WHERE r.rol_nombre = 'Afiliado'))
	SET IDENTITY_INSERT DREAM_TEAM.afiliado ON;
	INSERT INTO DREAM_TEAM.afiliado(af_id, af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo, af_status)
	VALUES (@af_id, (SELECT af_cantidad_familiares FROM DREAM_TEAM.afiliado WHERE af_id = @af_id AND af_rel_id = 0)+1, (SELECT us_id FROM DREAM_TEAM.usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc)), 
			@af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo, 'a')
	SET IDENTITY_INSERT DREAM_TEAM.afiliado OFF;
END
GO

CREATE PROCEDURE getDatosForCompraBono
	@us_id INT
AS
BEGIN
SELECT af_id, af_rel_id, planmed_id FROM DREAM_TEAM.afiliado WHERE us_id = @us_id
END
GO

CREATE PROCEDURE getDatosDelAfiliado
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN
SELECT * FROM DREAM_TEAM.afiliado 
WHERE af_id = @af_id 
AND af_rel_id = @af_rel_id
END
GO

CREATE PROCEDURE actualizarAfiliado
	@af_id BIGINT,
	@af_rel_id TINYINT,
	@af_direccion VARCHAR(255),
	@af_telefono numeric(18,0),
	@af_mail VARCHAR(255) ,
	@af_estado_civil VARCHAR(11),
	@planmed_id numeric(18,0),
	@motivoCambio VARCHAR(100),
	@fecha DATETIME,
	@af_sexo CHAR
AS
BEGIN
	IF (@motivoCambio != '')
	BEGIN
		INSERT INTO DREAM_TEAM.logs_cambio_plan
		(af_id,af_rel_id,plan_id_ant,plan_id_new,cambio_plan_motivo,cambio_plan_fecha)
		VALUES (@af_id,
				@af_rel_id,
				(SELECT planmed_id FROM DREAM_TEAM.afiliado WHERE af_id = @af_id AND af_rel_id = @af_rel_id),
				@planmed_id,
				@motivoCambio,
				@fecha
				)
	END
	BEGIN
	UPDATE DREAM_TEAM.afiliado 
		SET af_direccion = @af_direccion,
		af_telefono = @af_telefono,
		af_mail = @af_mail,
		af_estado_civil = @af_estado_civil,
		planmed_id = @planmed_id,
		af_sexo = @af_sexo
		WHERE af_id = @af_id AND af_rel_id = @af_rel_id
	END
END
GO


-- PARA ABM ROL
CREATE PROCEDURE getRolesPorUsuario
	@us_id INT
AS
BEGIN
	SELECT r.rol_id, r.rol_nombre, r.rol_status
        FROM DREAM_TEAM.rol r 
	JOIN DREAM_TEAM.rol_por_usuarios u ON r.rol_id = u.rol_id 
	WHERE u.us_id = @us_id
	AND r.rol_status like 'a'	
END
GO

CREATE PROCEDURE getAllRoles

AS
BEGIN
	SELECT rol_id 'ID del rol', rol_nombre 'Nombre del rol', rol_status 'Estado del rol'  FROM DREAM_TEAM.rol
END
GO

CREATE PROCEDURE getAllFuncionalidades

AS
BEGIN
	SELECT * FROM DREAM_TEAM.funcionalidad
END
GO

CREATE PROCEDURE getFuncionalidadDelRol
	@id_rol INT
AS
BEGIN
	SELECT f.fun_id, f.fun_nombre 
	FROM DREAM_TEAM.funcionalidad_por_rol r JOIN DREAM_TEAM.funcionalidad f
	ON r.fun_id = f.fun_id
	WHERE rol_id = @id_rol
END
GO
	
CREATE PROCEDURE InsertarRol
	@nombre_rol VARCHAR(30)
AS
BEGIN
	INSERT into DREAM_TEAM.rol(rol_nombre,rol_status)VALUES(@nombre_rol,'a')
END
GO

CREATE PROCEDURE InsertarRolXFuncionalidad
	@nombre_rol VARCHAR(30),
	@fun_id INT
AS
BEGIN
	INSERT into DREAM_TEAM.funcionalidad_por_rol VALUES( (SELECT rol_id FROM DREAM_TEAM.rol WHERE rol_nombre like @nombre_rol), @fun_id)
END
GO

CREATE PROCEDURE getRol
	@rol_nombre VARCHAR(30)
AS
BEGIN
	SELECT rol_id 'ID del Rol', rol_nombre 'Nombre del rol', rol_status 'Estado del Rol' FROM DREAM_TEAM.rol WHERE rol_nombre like @rol_nombre
END
GO

CREATE PROCEDURE deactivateRol
	@rol_id INT
AS BEGIN
	UPDATE DREAM_TEAM.rol SET rol_status = 'd' WHERE rol_id = @rol_id
	DELETE FROM DREAM_TEAM.rol_por_usuarios WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE activateRol
	@rol_id INT
AS
BEGIN
	UPDATE DREAM_TEAM.rol SET rol_status = 'a' 
	WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE updateRXF
	@id_rol INT
AS
BEGIN
	DELETE FROM DREAM_TEAM.funcionalidad_por_rol WHERE rol_id = @id_rol
END
GO

CREATE PROCEDURE updateRol
	@nombre_rol VARCHAR(30),
	@id_rol INT
AS
BEGIN
	UPDATE DREAM_TEAM.rol SET rol_nombre = @nombre_rol WHERE rol_id = @id_rol
END
GO

-- LOGIN
CREATE PROCEDURE login
	@us_name VARCHAR(30),
	@us_pw VARCHAR(64),
	@us_idR INT OUT

AS
BEGIN
SET @us_idR = -1
DECLARE loginCursor CURSOR FOR
SELECT * FROM DREAM_TEAM.usuarios 
WHERE us_username = @us_name

DECLARE @us_id INT,
		@us_username VARCHAR(30),
		@us_pwC VARBINARY(64),
		@us_log_fail TINYINT,
		@us_status CHAR(1)
OPEN loginCursor
FETCH NEXT FROM loginCursor
	INTO @us_id, @us_username, @us_pwC, @us_log_fail, @us_status
BEGIN
	IF @us_username = @us_name
	BEGIN
		IF @us_log_fail < 3
		BEGIN
			IF @us_status NOT like 'd'
			BEGIN
				IF HASHBYTES('SHA2_256',@us_pw) = @us_pwC
				BEGIN
					SET @us_idR = @us_id
					UPDATE DREAM_TEAM.usuarios SET us_login_fail = 0 WHERE us_id = @us_id
					RETURN
				END
				ELSE
				BEGIN
					RAISERROR('La contraseña es invalida',16,10)
					UPDATE DREAM_TEAM.usuarios 
					SET us_login_fail = us_login_fail+1 
					WHERE us_id = @us_id
				END
			END
			ELSE
				RAISERROR('El usuario esta desactivado',16,10)
		END
		ELSE
		BEGIN
			RAISERROR('El usuario esta bloqueado por ingresar demasiadas veces con una contraseña incorrecta',16,10)

		END
	END	
	ELSE
		RAISERROR('El nombre de usuario no es valido',16,10)
END
CLOSE loginCursor
DEALLOCATE loginCursor
END
GO


-- PARA COMPRA BONO
CREATE PROCEDURE getPlanesMedicos
AS
BEGIN
SELECT planmed_id
FROM DREAM_TEAM.plan_medico
END
GO

CREATE PROCEDURE getPrecioBonoDelPlan
	@planmed_id INT
AS
BEGIN
SELECT plan_precio_bono
FROM DREAM_TEAM.plan_medico
WHERE planmed_id = @planmed_id
END
GO

CREATE PROCEDURE comprarBonos
	@af_id BIGINT,
	@af_rel_id TINYINT,
	@cantidad INT,
	@monto INT,
	@fecha DATETIME
AS
BEGIN
	INSERT INTO DREAM_TEAM.registro_compra(compra_af,compra_af_rel,compra_cantidad,compra_monto,compra_fecha)
	VALUES(@af_id,@af_rel_id,@cantidad,@monto,@fecha)
END
GO

CREATE PROCEDURE checkBono
	@bono_id INT,
	@turno_id INT
AS
BEGIN
	DECLARE @plan_med INT
	DECLARE @tipoEsp_id INT
	DECLARE @af_id BIGINT
	DECLARE @af_rel_id TINYINT
	SELECT @af_id = turno_af, @af_rel_id = turno_af_rel FROM DREAM_TEAM.turnos
	WHERE turno_id = @turno_id
	
	SELECT @plan_med = planmed_id FROM DREAM_TEAM.afiliado a 
	JOIN DREAM_TEAM.turnos t ON a.af_id = t.turno_af AND a.af_rel_id = t.turno_af_rel
	WHERE a.af_id = @af_id AND a.af_rel_id = @af_rel_id

	SELECT @tipoEsp_id = tipoEsp_id FROM DREAM_TEAM.especialidad WHERE esp_id = (SELECT turno_esp FROM DREAM_TEAM.turnos WHERE turno_id = @turno_id)

	IF NOT EXISTS (SELECT 1 FROM DREAM_TEAM.tipo_especialidades_por_planes WHERE planmed_id = @plan_med AND tipoEsp_id = @tipoEsp_id)
		RAISERROR('El bono seleccionado para la consulta no es válido', 16, 16)
END
GO

CREATE PROCEDURE getBonosDisponibles
	@af_id BIGINT
AS
BEGIN

SELECT bono_id 'ID del bono', bono_planmed ' Plan medico que cubre el bono'
FROM DREAM_TEAM.bono
WHERE bono_nro_consulta IS NULL
AND bono_af = @af_id

END
GO



-- PARA REGISTRO DE AGENDA
CREATE PROCEDURE getEspecialidadesMedicas
AS
BEGIN
	SELECT esp_id, esp_descripcion FROM DREAM_TEAM.especialidad
END
GO

CREATE PROCEDURE getEspecialidadesPorProfesional
	@us_id INT
AS
BEGIN
	SELECT c.esp_id'ID de la especialidad', c.esp_descripcion 'Nombre de la especialidad'
    FROM DREAM_TEAM.profesional a, DREAM_TEAM.especialidad_por_profesional b, DREAM_TEAM.especialidad c
	WHERE a.us_id = @us_id AND b.prof_id = a.prof_id AND c.esp_id = b.esp_id
END
GO
CREATE PROCEDURE comprobar48horas
	@id INT,
	@desde VARCHAR(30),
	@hasta VARCHAR(30),
	@minutos_trabajados INT
AS
BEGIN	
	SET DATEFORMAT ymd
	SET DATEFIRST 7
	DECLARE @d DATETIME
	DECLARE @d2 DATETIME
	DECLARE @h DATETIME
	
	
	SET @d = CONVERT(DATETIME, @desde)
	SET @h = CONVERT(DATETIME, @hasta)
	
	SET @d = DATEADD(DAY,-DATEPART(WEEK,@d)+2,@d)
	SET @d2 = DATEADD(DAY,6,@d)
	SET @d2 = DATEADD(HOUR,23,@d)
	SET @d2 = DATEADD(MINUTE,59,@d)
	SET @h = DATEADD(DAY,-DATEPART(WEEK,@h)+1,@h)
		
	WHILE @d <= @h
	BEGIN
		IF (((ISNULL((SELECT COUNT(*) FROM DREAM_TEAM.agenda_profesional WHERE agenda_prof = @id AND agenda_fechayhora BETWEEN @d AND @d2),0) *30) + @minutos_trabajados) > 2880)
		BEGIN
			RAISERROR('Sobrepasaste las 48 horas semanales',16,1)
			RETURN 
		END
		SET @d = DATEADD(WEEK,1,@d)
		SET @d2 = DATEADD(WEEK,1,@d)
	END
END
GO
CREATE PROCEDURE addHorasAgenda
	@id INT,
	@desde VARCHAR(30),
	@hasta VARCHAR(30),
	@dia INT,
	@hora_inicio VARCHAR(20),
	@hora_fin VARCHAR(20),
	@especialidad INT
AS
BEGIN	
	SET DATEFORMAT ymd
	SET DATEFIRST 7
	DECLARE @inicialBucle TIME
	DECLARE @finalBucle TIME
	DECLARE @hi TIME
	DECLARE @hf TIME
	DECLARE @d DATETIME
	DECLARE @d2 DATETIME
	DECLARE @h DATETIME
	DECLARE @error_bandera INT;
	
	SET @error_bandera = 0

	SET @hi = CONVERT(TIME, @hora_inicio)
	SET @hf = CONVERT(TIME, @hora_fin)
	
	SET @d = CONVERT(DATETIME, @desde)
	SET @h = CONVERT(DATETIME, @hasta)

	SET @inicialBucle = @hi
	SET @finalBucle = @hf
	
	WHILE (@dia != DATEPART(weekday,@d))
	BEGIN
		SET @d = DATEADD(DAY,1,@d)
	END
	
	SET @d2 = @d
	
	WHILE @d2 <= @h
	BEGIN
		WHILE @inicialBucle <= @finalBucle
		BEGIN
			IF (SELECT COUNT(*) FROM DREAM_TEAM.agenda_profesional WHERE agenda_prof = @id AND agenda_fechayhora = (@d2 + CONVERT(DATETIME, @inicialBucle))) > 0
			BEGIN
				SET @error_bandera = 1
				RAISERROR('Algunos horarios no fueron agregados porque se sobre escribian con anteriores',16,1)
				RETURN 
			END
			SET @inicialBucle = DATEADD(MINUTE,30,@inicialBucle)
		END
		SET @inicialBucle = @hi
		SET @d2 = DATEADD(WEEK,1,@d2)
	END
	
	WHILE @d <= @h
	BEGIN
		WHILE @inicialBucle <= @finalBucle
		BEGIN
			INSERT INTO DREAM_TEAM.agenda_profesional VALUES (@id, @especialidad, @d + CONVERT(DATETIME, @inicialBucle))
			SET @inicialBucle = DATEADD(MINUTE,30,@inicialBucle)
		END
		SET @inicialBucle = @hi
		SET @d = DATEADD(WEEK,1,@d)
	END
END
GO

CREATE PROCEDURE getTurnos
	@af_id BIGINT,
	@af_rel_id TINYINT,
	@esp_id INT,
	@prof_apellido VARCHAR(50)
AS
BEGIN

	SELECT t.turno_id ' ID del turno' , e.esp_descripcion'Nombre de la especialidad' , p.prof_apellido'Apellido del profesional', a.agenda_fechayhora 'Fecha'
	FROM DREAM_TEAM.turnos t
	JOIN DREAM_TEAM.profesional p ON t.turno_prof = p.prof_id
	JOIN DREAM_TEAM.especialidad e ON e.esp_id = t.turno_esp
	JOIN DREAM_TEAM.agenda_profesional a ON agenda_id = t.turno_agenda 
	WHERE turno_af = @af_id AND turno_af_rel = @af_rel_id
	AND (@esp_id = t.turno_esp OR p.prof_apellido = @prof_apellido)
	AND turno_estado = 0

END
GO



-- PARA PEDIDO DE TURNOS Y REGISTROS DE LLEGADA/CONSULTA
CREATE PROCEDURE generateConsultaMedica
	@turno_id INT,
	@bono_id INT,
	@hora_llegada VARCHAR(30),
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN

	INSERT INTO DREAM_TEAM.consulta_medica(cons_turno,cons_bono,cons_hora_llegada)
				VALUES(@turno_id,@bono_id,CONVERT(DATETIME,@hora_llegada,126))

	UPDATE DREAM_TEAM.bono SET bono_nro_consulta= (SELECT MAX(bono_nro_consulta)+1 FROM DREAM_TEAM.bono WHERE bono_af = @af_id AND bono_af_rel = @af_rel_id),
	bono_af_rel = @af_rel_id
	WHERE bono_id = @bono_id

	
	END
GO

CREATE PROCEDURE getConsultas
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN
	SELECT c.cons_id'ID de la consulta', t.turno_prof'ID del profesional', t.turno_esp 'ID de la especialidad'
	FROM DREAM_TEAM.turnos t 
	JOIN DREAM_TEAM.consulta_medica c 
	ON turno_id = cons_turno
	WHERE turno_estado = 0
END
GO

CREATE PROCEDURE getTurnosDelProfesional
	@prof_id INT
AS
BEGIN
	SELECT turno_id 'ID del turno', DATEPART(YEAR,turno_fecha)'Año', DATEPART(MONTH,turno_fecha)'Mes', DATEPART (DAY, turno_fecha) 'Dia', DATEPART(HOUR,turno_fecha)'Hora', DATEPART(MINUTE,turno_fecha)'Minutos', turno_af'ID Familiar', turno_af_rel 'ID Relacional' 
	FROM DREAM_TEAM.turnos
	WHERE turno_prof = @prof_id
END
GO

CREATE PROCEDURE reservarTurno
    @turno_afi INT,
	@turno_agenda INT,
	@turno_prof INT,
	@turno_af_rel TINYINT,
	@turno_esp INT
AS
BEGIN
	INSERT INTO DREAM_TEAM.turnos VALUES ((SELECT agenda_fechayhora FROM DREAM_TEAM.agenda_profesional WHERE agenda_id = @turno_agenda), 0 , @turno_agenda, @turno_afi, @turno_af_rel, @turno_prof, @turno_esp)
END
GO

CREATE PROCEDURE dameTurnosDisponiblesDeLaFecha
	@fecha VARCHAR(20)
AS
BEGIN
	SELECT DATEPART(hour,agenda_fechayhora) 'Hora', DATEPART(minute, agenda_fechayhora) 'Minutos', agenda_id  'ID de la agenda'
	FROM DREAM_TEAM.agenda_profesional
	WHERE agenda_id NOT IN (SELECT turno_agenda FROM DREAM_TEAM.turnos WHERE turno_estado = 0)	
	AND CONVERT(VARCHAR(10),agenda_fechayhora,126) like CONVERT(VARCHAR(10),@fecha,126)
	ORDER BY Hora, Minutos
END
GO

CREATE PROCEDURE finalizarConsulta
	@cons_id INT,
	@sintomas VARCHAR(200),
	@diagnostico VARCHAR(200)
AS
BEGIN
	UPDATE DREAM_TEAM.consulta_medica 
	SET cons_sintomas = @sintomas,
	cons_diagnostico = @diagnostico
	WHERE cons_id = @cons_id

	UPDATE DREAM_TEAM.turnos SET turno_estado = 1 WHERE turno_id = (SELECT cons_turno FROM DREAM_TEAM.consulta_medica WHERE cons_id = @cons_id)
END
GO

CREATE PROCEDURE bajaIntervalo
	@prof_id INT,
	@desde VARCHAR(50),
	@hasta VARCHAR(50)
AS
BEGIN
	SET @desde = CONVERT(DATETIME,@desde,120)
	SET @hasta = CONVERT(DATETIME,@hasta,120)

	INSERT INTO DREAM_TEAM.periodo_baja(periodo_desde,periodo_hasta,prof_id) VALUES(@desde, @hasta, @prof_id)
END
GO

CREATE PROCEDURE cancelTurno
   	@turno_id INT, 
	@cancel_motivo VARCHAR(30), 
	@cancel_tipo CHAR(1)
AS
BEGIN
    INSERT INTO DREAM_TEAM.cancelacion VALUES (@cancel_tipo, @cancel_motivo, @turno_id)
	UPDATE DREAM_TEAM.turnos SET turno_estado = 2, turno_agenda = NULL WHERE  turno_id = @turno_id
END
GO



-- LISTADOS
CREATE PROCEDURE getListado1
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 t.turno_esp 'ID Especialidad', e.esp_descripcion 'Nombre especialidad', COUNT(c.cancel_id) 'Cantidad de cancelaciones'
	FROM DREAM_TEAM.cancelacion c
	JOIN DREAM_TEAM.turnos t ON c.turno_id = t.turno_id
	JOIN DREAM_TEAM.especialidad e ON t.turno_esp = e.esp_id
	WHERE turno_estado like '2'
	AND turno_fecha BETWEEN @fecha_inicio AND @fecha_fin
	GROUP BY t.turno_esp,e.esp_descripcion
	ORDER BY 'Cantidad de cancelaciones' DESC
END
GO

CREATE PROCEDURE getListado2
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 t.turno_prof 'ID del profesional', CONCAT(p.prof_apellido, ', ', p.prof_nombre) 'Apellido, Nombre',
				 t.turno_esp 'ID Especialidad',e.esp_descripcion 'Especialidad', COUNT(t.turno_id) 'Cantidad de consultas'
	FROM DREAM_TEAM.turnos t
	JOIN DREAM_TEAM.profesional p ON t.turno_prof = p.prof_id
	JOIN DREAM_TEAM.especialidad e ON t.turno_esp = e.esp_id
	WHERE turno_estado like '1'
	AND turno_fecha BETWEEN @fecha_inicio AND @fecha_fin
	GROUP BY t.turno_prof, p.prof_apellido, p.prof_nombre, t.turno_esp, e.esp_descripcion
	ORDER BY 'Cantidad de consultas' DESC
END
GO

CREATE PROCEDURE getListado3
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 t.turno_prof 'ID del profesional', CONCAT(p.prof_apellido, ', ', p.prof_nombre) 'Apellido, Nombre',
				 t.turno_esp 'ID Especialidad',e.esp_descripcion 'Especialidad', COUNT(t.turno_id) 'Cantidad de consultas'
	FROM DREAM_TEAM.turnos t
	JOIN DREAM_TEAM.profesional p ON t.turno_prof = p.prof_id
	JOIN DREAM_TEAM.especialidad e ON t.turno_esp = e.esp_id
	WHERE turno_estado like '1'
	AND turno_fecha BETWEEN @fecha_inicio AND @fecha_fin
	GROUP BY t.turno_prof, p.prof_apellido, p.prof_nombre, t.turno_esp, e.esp_descripcion
	ORDER BY 'Cantidad de consultas' ASC
END
GO

CREATE PROCEDURE getListado4
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 b.bono_af 'ID' , b.bono_af_rel 'IDRel', CONCAT(a.af_apellido, ', ', a.af_nombre) 'Apellido, Nombre', COUNT(*) 'Cantidad de bonos comprados'
	FROM DREAM_TEAM.bono b
	JOIN DREAM_TEAM.afiliado a ON b.bono_af = a.af_id AND b.bono_af_rel = a.af_rel_id
	JOIN DREAM_TEAM.registro_compra r ON b.bono_compra = r.compra_id
	WHERE compra_fecha BETWEEN @fecha_inicio AND @fecha_fin
	GROUP BY b.bono_af, b.bono_af_rel, a.af_nombre, a.af_apellido
	ORDER BY 'Cantidad de bonos comprados' DESC
END
GO

CREATE PROCEDURE getListado5
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 t.turno_esp'ID de la Especialidad', e.esp_descripcion'Especialidad', COUNT(*) 'Bonos utilizados'
	FROM DREAM_TEAM.turnos t
	JOIN DREAM_TEAM.especialidad e ON t.turno_esp = e.esp_id
	WHERE turno_fecha BETWEEN @fecha_inicio AND @fecha_fin
	AND turno_estado = 1
	GROUP BY t.turno_esp, e.esp_descripcion
	ORDER BY 'Bonos utilizados' DESC
END
GO



------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

--															HARDCODED DATA


---------------------------------------------CREO FUNCIONALIDADES ----------------------------------------------------

INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('ABM de Rol');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('ABM de Afiliado');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Registrar Agenda Profesional');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Compra de Bonos');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Pedido de Turno');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Registro de Llegada');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Registro de Resultado');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Cancelar Atencion Medica');
INSERT INTO DREAM_TEAM.funcionalidad (fun_nombre) VALUES ('Listado Estadistico');


------------------------------------------------- CREACION DE ROLES -----------------------------------------------------

/*Creo el DREAM_TEAM.rol Administrativo*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Administrativo', 'a');
GO

/*Se agregan DREAM_TEAM.funcionalidades al DREAM_TEAM.rol Administrativo*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol (rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Administrativo' AND tablaFuncionalidad.fun_nombre IN ('ABM de Rol', 'ABM de Afiliado', 'Compra de Bonos', 'Registro de Llegada','Listado Estadistico');
GO

/*Creo el DREAM_TEAM.rol Afiliado*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Afiliado', 'a');
GO

/*Se agregan DREAM_TEAM.funcionalidades al DREAM_TEAM.rol Afiliado*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol(rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Afiliado' AND tablaFuncionalidad.fun_nombre IN ('Compra de Bonos', 'Pedido de Turno','Cancelar Atencion Medica');
GO

/*Creo el DREAM_TEAM.rol Profesional*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Profesional', 'a');
GO

/*Se agregan DREAM_TEAM.funcionalidades al DREAM_TEAM.rol Profesional*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol (rol_id,fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_Id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Profesional' AND tablaFuncionalidad.fun_nombre IN ('Registrar Agenda Profesional', 'Registro de Resultado', 'Cancelar Atencion Medica');
GO


------------------------------------- INGRESO LOS ROLES DE LOS PROFESIONALES Y DE LOS AFILIADOS ----------------------------------------------------------

	INSERT INTO DREAM_TEAM.rol_por_usuarios 
	SELECT us_id, 2 FROM DREAM_TEAM.afiliado

		
	INSERT INTO DREAM_TEAM.rol_por_usuarios
	SELECT us_id, 3  FROM DREAM_TEAM.profesional

----------------------------------------- CUENTA ADMIN -----------------------------------------------------------------

IF (OBJECT_ID('setAdmin', 'P') IS NOT NULL)
	DROP PROCEDURE setAdmin;
GO

CREATE PROCEDURE setAdmin
AS
BEGIN
	DECLARE @us_id INT
	INSERT INTO DREAM_TEAM.usuarios VALUES('admin',HASHBYTES('SHA2_256','w23e'),0,'1')
	
	SELECT @us_id = us_id FROM DREAM_TEAM.usuarios WHERE us_username like 'admin'
	
	INSERT INTO DREAM_TEAM.rol_por_usuarios
	SELECT @us_id, r.rol_id 
	FROM DREAM_TEAM.rol r

	INSERT INTO DREAM_TEAM.afiliado (af_nombre,af_apellido,af_rel_id, us_id,planmed_id, af_tipodoc, af_numdoc, af_status)
		VALUES ('admin','admin', 0, @us_id, 555559, 'DNI', 0, 'a')

	INSERT INTO DREAM_TEAM.profesional (us_id,prof_apellido,prof_nombre) VALUES (@us_id,'admin','admin')

	INSERT INTO DREAM_TEAM.especialidad_por_profesional 
		SELECT (SELECT prof_id FROM DREAM_TEAM.profesional WHERE us_id = @us_id), esp_id FROM DREAM_TEAM.especialidad

END
GO

exec setAdmin
GO

DROP PROCEDURE setAdmin
----------------------------------------- SETEO PLANES Y ESPECIALIDADES RELACIONADAS -----------------------------------------------------------------
if OBJECT_ID('setTipoEspPorPlan') is not null
begin
	drop procedure setTipoEspPorPlan
end
go

CREATE PROCEDURE setTipoEspPorPlan
AS
BEGIN
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555555,1000)

	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555556,1000)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555556,1001)

	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555557,1000)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555557,1002)
		
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555558,1000)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555558,1001)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555558,1002)

	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555559,1000)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555559,1001)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555559,1002)
	INSERT INTO DREAM_TEAM.tipo_especialidades_por_planes VALUES (555559,1003)

END
GO

exec setTipoEspPorPlan
GO

DROP PROCEDURE setTipoEspPorPlan


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

--													TRIGGERS

/* ELIMINO TRIGGERS */

IF (OBJECT_ID('compraDeBonos', 'TR') IS NOT NULL)
	DROP TRIGGER compraDeBonos;
IF (OBJECT_ID('agregarFamiliar', 'TR') IS NOT NULL)
	DROP TRIGGER agregarFamiliar;
IF (OBJECT_ID('cancelarTurnosPorIntervalo', 'TR') IS NOT NULL)
	DROP TRIGGER cancelarTurnosPorIntervalo;
GO 

/* CREO TRIGGERS */


-- PARA LA COMPRA DE BONOS
CREATE TRIGGER compraDeBonos
	ON DREAM_TEAM.registro_compra
	AFTER INSERT
AS
BEGIN
	DECLARE @contador INT
	DECLARE @cantidad INT
	DECLARE @compra_id INT
	DECLARE @af_id BIGINT
	DECLARE @af_rel_id TINYINT

	SET @contador = 0
	SELECT @cantidad=i.compra_cantidad, @compra_id = i.compra_id, @af_id = i.compra_af, @af_rel_id = i.compra_af_rel FROM inserted i

	WHILE @contador < @cantidad
	BEGIN
		INSERT INTO DREAM_TEAM.bono(bono_compra,bono_planmed,bono_af,bono_af_rel)
		VALUES(@compra_id,(SELECT planmed_id FROM DREAM_TEAM.afiliado a WHERE a.af_id = @af_id AND a.af_rel_id = @af_rel_id),@af_id,@af_rel_id)
		SET @contador +=1
	END

END
GO

-- PARA ACTUALIZAR EL CAMPO cantidad_familiares DEL AFILIADO
CREATE TRIGGER agregarFamiliar
	ON DREAM_TEAM.afiliado
	AFTER INSERT
AS
BEGIN
	DECLARE @af_id BIGINT
	DECLARE @af_rel_id TINYINT
	SELECT @af_id = i.af_id, @af_rel_id = i.af_rel_id FROM inserted i
	IF (@af_rel_id <> 0)
		UPDATE DREAM_TEAM.afiliado SET af_cantidad_familiares+=1
		WHERE af_id = @af_id AND af_rel_id = 0
END
GO


-- PARA DAR DE BAJA LOS TURNOS CUANDO SE EJECUTA EL STORED PROCEDURE bajaIntervalo
CREATE TRIGGER cancelarTurnosPorIntervalo
ON DREAM_TEAM.periodo_baja
AFTER INSERT
AS
BEGIN
	DECLARE @prof_id INT
	DECLARE @desde DATETIME
	DECLARE @hasta DATETIME

	SELECT @desde = periodo_desde, @hasta = periodo_hasta, @prof_id = prof_id 
	FROM inserted

	DECLARE @turno_id INT

	DECLARE cursorDeTurnos CURSOR FOR
		SELECT turno_id
		FROM DREAM_TEAM.turnos t 
		JOIN DREAM_TEAM.agenda_profesional a ON t.turno_agenda = a.agenda_id
		WHERE a.agenda_fechayhora BETWEEN @desde AND @hasta
		AND a.agenda_prof = @prof_id

	OPEN cursorDeTurnos

	FETCH NEXT FROM cursorDeTurnos INTO @turno_id

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT into DREAM_TEAM.cancelacion VALUES ('p', 'El profesional dio de baja el turno por un intervalo de tiempo determinado', @turno_id)

		UPDATE DREAM_TEAM.turnos SET turno_estado = 2 WHERE turno_id = @turno_id

		FETCH NEXT FROM cursorDeTurnos INTO @turno_id

	END
	CLOSE cursorDeTurnos
	DEALLOCATE cursorDeTurnos
END
GO

