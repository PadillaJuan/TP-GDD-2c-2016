USE GD2C2016;
GO
SET DATEFORMAT ymd
SET LANGUAGE us_english
SET DATEFIRST 7
GO

-- ELIMINACION DE CONSTRAINTS
-- ELIMINACION DE CONSTRAINTS


IF (OBJECT_ID('DREAM_TEAM.FK_plan_med', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_plan_med;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_afi_usuario', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_afi_usuario;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_afi;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_plan_ant', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_ant;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_plan_new', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_new;

IF (OBJECT_ID('DREAM_TEAM.FK_esp_por_planes_1', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_1
GO
IF (OBJECT_ID('DREAM_TEAM.FK_esp_por_planes_2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_2
GO
	
IF (OBJECT_ID('DREAM_TEAM.FK_compra_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.registro_compra DROP constraint FK_compra_afi;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_compra_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_compra_bono;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_plan_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_plan_bono;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_afi_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_afi_bono;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_consulta_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_turno;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_consulta_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_bono;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_turno_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_afi;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_turno_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_prof;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_turno_esp', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_esp;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_turno_agenda', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_agenda;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_cancelacion_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.cancelacion DROP constraint FK_cancelacion_turno;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_agenda_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_agenda_prof2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof2;
GO
	
IF (OBJECT_ID('DREAM_TEAM.FK_especialidad_tipo', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.especialidad DROP constraint FK_especialidad_tipo;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_prof_us', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.profesional DROP constraint FK_prof_us;
GO
	
IF (OBJECT_ID('DREAM_TEAM.FK_baja_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.periodo_baja DROP constraint FK_baja_prof;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_rolxusr_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_id;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_rolxusr_rol', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_rol;
GO

IF (OBJECT_ID('DREAM_TEAM.FK_funxrol_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_id;
GO
IF (OBJECT_ID('DREAM_TEAM.FK_funxrol_fun', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_fun;
GO
	
	--ELIMINACION DE TABLAS
	--ELIMINACION DE TABLAS

IF (OBJECT_ID('DREAM_TEAM.afiliado','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.afiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.logs_cambio_plan','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.logs_cambio_plan;
GO
IF (OBJECT_ID('DREAM_TEAM.plan_medico','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.plan_medico;
GO
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades_por_planes','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades_por_planes;
GO
IF (OBJECT_ID('DREAM_TEAM.registro_compra','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.registro_compra;
GO
IF (OBJECT_ID('DREAM_TEAM.bono','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.bono;
GO
IF (OBJECT_ID('DREAM_TEAM.consulta_medica','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.consulta_medica;
GO
IF (OBJECT_ID('DREAM_TEAM.turnos','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.turnos;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelacion','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.cancelacion;
GO
IF (OBJECT_ID('DREAM_TEAM.agenda_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.agenda_profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades;
GO
IF (OBJECT_ID('DREAM_TEAM.especialidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad;
GO
IF (OBJECT_ID('DREAM_TEAM.especialidad_por_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad_por_profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.periodo_baja','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.periodo_baja;
GO
IF (OBJECT_ID('DREAM_TEAM.usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.usuarios;
GO
IF (OBJECT_ID('DREAM_TEAM.rol_por_usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol_por_usuarios;
GO
IF (OBJECT_ID('DREAM_TEAM.rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol;
GO
IF (OBJECT_ID('DREAM_TEAM.funcionalidad_por_rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad_por_rol;
GO
IF (OBJECT_ID('DREAM_TEAM.funcionalidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad;
GO

--											MIGRACION

-- DROP PROCEDURES PARA LA MIGRACION

if OBJECT_ID('DREAM_TEAM.migrarAfiliados') is not null
 begin
	drop procedure DREAM_TEAM.migrarAfiliados
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarPlanMedico') is not null
 begin
	drop procedure DREAM_TEAM.migrarPlanMedico
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarProfesional') is not null
 begin
	drop procedure DREAM_TEAM.migrarProfesional
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarTipoEspecialidades') is not null
 begin
	drop procedure DREAM_TEAM.migrarTipoEspecialidades
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarEspecialidad') is not null
 begin
	drop procedure DREAM_TEAM.migrarEspecialidad
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarEspecialidadPorProfesional') is not null
 begin
	drop procedure DREAM_TEAM.migrarEspecialidadPorProfesional
end
go

 if OBJECT_ID('DREAM_TEAM.migrarTurnos') is not null
 begin
	drop procedure DREAM_TEAM.migrarTurnos
 end
 go

if OBJECT_ID('DREAM_TEAM.migrarRegistroCompra') is not null
begin
	drop procedure DREAM_TEAM.migrarRegistroCompra
end
go

if OBJECT_ID('DREAM_TEAM.migrarBonos') is not null
begin
	drop procedure DREAM_TEAM.migrarBonos
end
go

if OBJECT_ID('DREAM_TEAM.migrarConsultas') is not null
begin
	drop procedure DREAM_TEAM.migrarConsultas
end
go

if OBJECT_ID('DREAM_TEAM.migrarAgendaProfesional') is not null
begin
	drop procedure DREAM_TEAM.migrarAgendaProfesional
end
go

-- DROP PROCEDURES

--PARA EL AFILIADO
IF (OBJECT_ID('DREAM_TEAM.bajaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.bajaAfiliado;
GO

IF (OBJECT_ID('DREAM_TEAM.altaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.altaAfiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.getNextRelID', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getNextRelID;
GO
IF (OBJECT_ID('DREAM_TEAM.altaFamiliar', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.altaFamiliar;
GO
IF (OBJECT_ID('DREAM_TEAM.getDatosForCompraBono', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getDatosForCompraBono;
GO
IF (OBJECT_ID('DREAM_TEAM.getDatosDelAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getDatosDelAfiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.actualizarAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.actualizarAfiliado;
GO

-- PARA ABM ROL
IF (OBJECT_ID('DREAM_TEAM.getRolesPorUsuario', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getRolesPorUsuario;
GO
IF (OBJECT_ID('DREAM_TEAM.getAllRoles', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getAllRoles;
GO
IF (OBJECT_ID('DREAM_TEAM.getAllFuncionalidades', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getAllFuncionalidades;
GO
IF (OBJECT_ID('DREAM_TEAM.getFuncionalidadDelRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getFuncionalidadDelRol;
GO
IF (OBJECT_ID('DREAM_TEAM.InsertarRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.InsertarRol;
GO
IF (OBJECT_ID('DREAM_TEAM.InsertarRolXFuncionalidad', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.InsertarRolXFuncionalidad;
GO
IF (OBJECT_ID('DREAM_TEAM.getRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getRol;
GO
IF (OBJECT_ID('DREAM_TEAM.deactivateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.deactivateRol;
GO
IF (OBJECT_ID('DREAM_TEAM.activateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.activateRol;
GO
IF (OBJECT_ID('DREAM_TEAM.updateRXF', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.updateRXF;
GO
IF (OBJECT_ID('DREAM_TEAM.updateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.updateRol;
GO

-- LOGIN
IF (OBJECT_ID('DREAM_TEAM.login', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.login;
GO

-- PARA COMPRA BONO
IF (OBJECT_ID('DREAM_TEAM.getPlanesMedicos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getPlanesMedicos;
GO
IF(OBJECT_ID('DREAM_TEAM.verifyAfiliadoExistance', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.verifyAfiliadoExistance;
GO
IF (OBJECT_ID('DREAM_TEAM.getPrecioBonoDelPlan', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getPrecioBonoDelPlan;
GO
IF (OBJECT_ID('DREAM_TEAM.comprarBonos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.comprarBonos;
GO
IF (OBJECT_ID('DREAM_TEAM.checkBono', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.checkBono;
GO
IF (OBJECT_ID('DREAM_TEAM.getBonosDisponibles', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getBonosDisponibles;
GO

	-- PARA REGISTRO DE AGENDA
IF (OBJECT_ID('DREAM_TEAM.getEspecialidadesMedicas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getEspecialidadesMedicas;
GO
IF (OBJECT_ID('DREAM_TEAM.getEspecialidadesPorProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getEspecialidadesPorProfesional;
GO
IF (OBJECT_ID('DREAM_TEAM.addHorasAgenda', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.addHorasAgenda;	
GO
IF (OBJECT_ID('DREAM_TEAM.getTurnos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getTurnos;
GO
IF (OBJECT_ID('DREAM_TEAM.comprobar48horas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.comprobar48horas;
GO


-- PARA PEDIDO DE TURNOS Y REGISTROS DE LLEGADA/CONSULTA
IF (OBJECT_ID('DREAM_TEAM.generateConsultaMedica', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.generateConsultaMedica;
GO
IF (OBJECT_ID('DREAM_TEAM.getConsultas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getConsultas;
GO
IF (OBJECT_ID('DREAM_TEAM.getTurnosDelProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getTurnosDelProfesional;
GO
IF (OBJECT_ID('DREAM_TEAM.reservarTurno', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.reservarTurno;
GO
IF (OBJECT_ID('DREAM_TEAM.dameTurnosDisponiblesDeLaFecha', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.dameTurnosDisponiblesDeLaFecha;
GO
IF (OBJECT_ID('DREAM_TEAM.finalizarConsulta', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.finalizarConsulta;
GO
IF (OBJECT_ID('DREAM_TEAM.bajaIntervalo', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.bajaIntervalo;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelTurno', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.cancelTurno;
GO


-- LISTADOS
IF (OBJECT_ID('DREAM_TEAM.getListado1', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado1;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado2', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado2;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado3', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado3;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado4', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado4;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado5', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado5;
GO

IF (OBJECT_ID('DREAM_TEAM.setAdmin', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.setAdmin;
GO

if OBJECT_ID('DREAM_TEAM.setTipoEspPorPlan') is not null
begin
	drop procedure DREAM_TEAM.setTipoEspPorPlan
end
go

/* ELIMINO TRIGGERS */

IF (OBJECT_ID('DREAM_TEAM.compraDeBonos', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.compraDeBonos;
GO
IF (OBJECT_ID('DREAM_TEAM.agregarFamiliar', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.agregarFamiliar;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelarTurnosPorIntervalo', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.cancelarTurnosPorIntervalo;
GO 

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
GO


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
GO


/* TABLA DE PLAN MEDICO */

CREATE TABLE DREAM_TEAM.plan_medico(
	planmed_id numeric(18,0) PRIMARY KEY IDENTITY(1,1),
	plan_cuota numeric(18,0),
	plan_descripcion VARCHAR(255),
	plan_precio_bono numeric(18,0),
);
GO


/* TABLA DE SERVICIOS POR PLANES */

CREATE TABLE DREAM_TEAM.tipo_especialidades_por_planes(
	planmed_id numeric(18,0),
	tipoEsp_id NUMERIC(18,0),
	primary key (planmed_id, tipoEsp_id),
);
GO


/* TABLA DE REGISTRO DE COMPRA */

CREATE TABLE DREAM_TEAM.registro_compra(
	compra_id INT PRIMARY KEY IDENTITY(1,1),
	compra_af INT,
	compra_af_rel TINYINT,
	compra_cantidad TINYINT,
	compra_monto DECIMAL(7,2),
	compra_fecha DATETIME
);
GO


/* TABLA DE BONO */

CREATE TABLE DREAM_TEAM.bono(
	bono_id INT PRIMARY KEY IDENTITY(1,1),
	bono_compra INT,
	bono_planmed numeric(18,0),
	bono_af INT,
	bono_af_rel TINYINT,
	bono_nro_consulta INT
);
GO


/* TABLA DE CONSULTA MEDICA */

CREATE TABLE DREAM_TEAM.consulta_medica(
	cons_id INT PRIMARY KEY IDENTITY(1,1),
	cons_turno NUMERIC(18,0),
	cons_hora_llegada DATETIME,
	cons_sintomas VARCHAR(255),
	cons_diagnostico VARCHAR(255),
	cons_bono INT
);
GO


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
GO


/* TABLA DE CANCELACIONES */

CREATE TABLE DREAM_TEAM.cancelacion(
	cancel_id  INT PRIMARY KEY IDENTITY(1,1),
	cancel_tipo CHAR(1),
	cancel_motivo VARCHAR(100),
	turno_id NUMERIC(18,0),
);
GO


/* TABLA DE AGENDA DEL PROFESIONAL */

CREATE TABLE DREAM_TEAM.agenda_profesional(
	agenda_id INT PRIMARY KEY IDENTITY(1,1),
	agenda_prof INT,
	agenda_esp NUMERIC(18,0),
	agenda_fechayhora DATETIME
);
GO


/* TABLA DE TIPO DE ESPECIALIDADES */

CREATE TABLE DREAM_TEAM.tipo_especialidades(
	tipoEsp_id NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1),
	tipoEsp_descripcion VARCHAR(255)
);
GO


/* TABLA DE ESPECIALIDADES */
CREATE TABLE DREAM_TEAM.especialidad(
	esp_id NUMERIC(18,0) PRIMARY KEY IDENTITY(1,1),
	esp_descripcion VARCHAR(255),
	tipoEsp_id NUMERIC(18,0)
);
GO


/* TABLA DE ESPECIALIDAD POR PROFESIONAL */

CREATE TABLE DREAM_TEAM.especialidad_por_profesional(
	prof_id INT,
	esp_id NUMERIC(18,0),
	PRIMARY KEY(prof_id,esp_id)
);
GO


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
GO


/* TABLA DE PERIODO BAJA DE TURNO */
CREATE TABLE DREAM_TEAM.periodo_baja(
	periodo_id INT PRIMARY KEY IDENTITY(1,1),
	periodo_desde DATETIME,
	periodo_hasta DATETIME,
	prof_id INT
);
GO


/* TABLA DE USUARIOS */

CREATE TABLE DREAM_TEAM.usuarios(
	us_id INT PRIMARY KEY IDENTITY(1,1),
	us_username VARCHAR(30),
	us_password VARBINARY(64),
	us_login_fail TINYINT,
	us_status CHAR(1)
);
GO


/* TABLA DE ROLES POR USUARIO */

CREATE TABLE DREAM_TEAM.rol_por_usuarios(
	us_id INT,
	rol_id INT,
	PRIMARY KEY(us_id,rol_id)
);
GO


/* TABLA DE ROLES */

CREATE TABLE DREAM_TEAM.rol(
	rol_id INT PRIMARY KEY IDENTITY(1,1),
	rol_nombre VARCHAR(30),
	rol_status CHAR(1)
);
GO


/* TABLA DE FUNCIONALIDADES POR ROL */

CREATE TABLE DREAM_TEAM.funcionalidad_por_rol(
	rol_id INT,
	fun_id INT,
	PRIMARY KEY(rol_id,fun_id)
);
GO


/* TABLA DE FUNCIONALIDADES */

CREATE TABLE DREAM_TEAM.funcionalidad(
	fun_id INT PRIMARY KEY IDENTITY(1,1),
	fun_nombre VARCHAR(30),
	fun_descripcion VARCHAR(100)
);
GO


-- CREACION DE CONSTRAINTS : FOREIGN KEYS
-- Nota: Se encuentran en el mismo orden de la creacion de tablas

ALTER TABLE DREAM_TEAM.afiliado add constraint FK_afi_usuario foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
GO
ALTER TABLE DREAM_TEAM.afiliado add constraint FK_plan_med foreign key (planmed_id) references DREAM_TEAM.plan_medico (planmed_id);
GO

ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_afi foreign key (af_id,af_rel_id) references DREAM_TEAM.afiliado (af_id,af_rel_id);
GO
ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_plan_ant foreign key (plan_id_ant) references DREAM_TEAM.plan_medico (planmed_id);	
GO
ALTER TABLE DREAM_TEAM.logs_cambio_plan add constraint FK_plan_new foreign key (plan_id_new) references DREAM_TEAM.plan_medico (planmed_id);
GO

ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes add constraint FK_esp_por_planes_1 foreign key (planmed_id) references DREAM_TEAM.plan_medico (planmed_id);
GO
ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes add constraint FK_esp_por_planes_2 foreign key (tipoEsp_id) references DREAM_TEAM.tipo_especialidades (tipoEsp_id);
GO
	
ALTER TABLE DREAM_TEAM.registro_compra add constraint FK_compra_afi foreign key (compra_af,compra_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);	
GO

ALTER TABLE DREAM_TEAM.bono add constraint FK_compra_bono foreign key (bono_compra) references DREAM_TEAM.registro_compra (compra_id);	
GO
ALTER TABLE DREAM_TEAM.bono add constraint FK_plan_bono foreign key (bono_planmed) references DREAM_TEAM.plan_medico (planmed_id);		
GO
ALTER TABLE DREAM_TEAM.bono add constraint FK_afi_bono foreign key (bono_af,bono_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);	
GO

ALTER TABLE DREAM_TEAM.consulta_medica add constraint FK_consulta_turno foreign key (cons_turno) references DREAM_TEAM.turnos (turno_id);	
GO
ALTER TABLE DREAM_TEAM.consulta_medica add constraint FK_consulta_bono foreign key (cons_bono) references DREAM_TEAM.bono (bono_id);
GO

ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_afi foreign key (turno_af,turno_af_rel) references DREAM_TEAM.afiliado (af_id,af_rel_id);
GO
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_prof foreign key (turno_prof) references DREAM_TEAM.profesional (prof_id);		
GO
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_esp foreign key (turno_esp) references DREAM_TEAM.especialidad (esp_id);
GO
ALTER TABLE DREAM_TEAM.turnos add constraint FK_turno_agenda foreign key (turno_agenda) references DREAM_TEAM.agenda_profesional (agenda_id);
GO

ALTER TABLE DREAM_TEAM.cancelacion add constraint FK_cancelacion_turno foreign key (turno_id) references DREAM_TEAM.turnos (turno_id);	
GO

ALTER TABLE DREAM_TEAM.agenda_profesional add constraint FK_agenda_prof foreign key (agenda_prof) references DREAM_TEAM.profesional (prof_id);	
GO
ALTER TABLE DREAM_TEAM.agenda_profesional add constraint FK_agenda_prof2 foreign key (agenda_esp) references DREAM_TEAM.especialidad (esp_id);	
GO

ALTER TABLE DREAM_TEAM.especialidad add constraint FK_especialidad_tipo foreign key (tipoEsp_id) references DREAM_TEAM.tipo_especialidades (tipoEsp_id);
GO

ALTER TABLE DREAM_TEAM.profesional add constraint FK_prof_us foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
GO
	
ALTER TABLE DREAM_TEAM.periodo_baja add constraint FK_baja_prof foreign key (prof_id) references DREAM_TEAM.profesional (prof_id);	
GO

ALTER TABLE DREAM_TEAM.rol_por_usuarios add constraint FK_rolxusr_id foreign key (us_id) references DREAM_TEAM.usuarios (us_id);
GO
ALTER TABLE DREAM_TEAM.rol_por_usuarios add constraint FK_rolxusr_rol foreign key (rol_id) references DREAM_TEAM.rol (rol_id);
GO

ALTER TABLE DREAM_TEAM.funcionalidad_por_rol add constraint FK_funxrol_id foreign key (rol_id) references DREAM_TEAM.rol (rol_id);
GO
ALTER TABLE DREAM_TEAM.funcionalidad_por_rol add constraint FK_funxrol_fun foreign key (fun_id) references DREAM_TEAM.funcionalidad (fun_id);
GO

-- CREACION DE CONSTRAINTS: UNIQUE FIELDS

ALTER TABLE DREAM_TEAM.afiliado ADD CONSTRAINT UN_DNI UNIQUE (af_numdoc, af_tipodoc)
GO
ALTER TABLE DREAM_TEAM.agenda_profesional ADD CONSTRAINT UN_DATOS UNIQUE (agenda_prof, agenda_fechayhora);
GO
ALTER TABLE DREAM_TEAM.rol ADD CONSTRAINT UN_NOMBREROL UNIQUE (rol_nombre)
GO


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------




-- CREACION DE PROCEDURES PARA LA MIGRACION
/*------------------ MIGRACION DE PLANES MEDICOS ----------------------*/
create procedure DREAM_TEAM.migrarPlanMedico
as
	SET IDENTITY_INSERT DREAM_TEAM.plan_medico ON 
	insert into DREAM_TEAM.plan_medico(planmed_id,plan_descripcion,plan_precio_bono)
		select Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta
		from gd_esquema.Maestra
		group by Plan_Med_Codigo,Plan_Med_Descripcion,Plan_Med_Precio_Bono_Consulta,Plan_Med_Precio_Bono_Farmacia
		order by Plan_Med_Codigo asc
	SET IDENTITY_INSERT DREAM_TEAM.plan_medico OFF

go
execute DREAM_TEAM.migrarPlanMedico
go


/*------------------ MIGRACION DE AFILIADOS ----------------------*/
create procedure DREAM_TEAM.migrarAfiliados
as	
	insert into DREAM_TEAM.usuarios
		select convert(varchar,Paciente_Dni),HASHBYTES('SHA2_256',Paciente_Apellido),0,'1'
		from gd_esquema.Maestra
		group by Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo

	insert into DREAM_TEAM.afiliado(af_rel_id,us_id,af_nombre,af_apellido,af_tipodoc,af_numdoc,af_direccion,af_telefono,af_mail,af_nacimiento,planmed_id, af_estado_civil, af_sexo, af_cantidad_familiares, af_status)
		select 00,us_id,Paciente_Nombre,Paciente_Apellido,'DNI',Paciente_Dni,
		       Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo, '', '', 0, 'a'
		from gd_esquema.Maestra,DREAM_TEAM.usuarios
		where us_username = convert(varchar,Paciente_Dni)
		group by us_id,Paciente_Nombre,Paciente_Apellido,Paciente_Dni,Paciente_Direccion,Paciente_Telefono,Paciente_Mail,Paciente_Fecha_Nac,Plan_Med_Codigo
	 
go
execute DREAM_TEAM.migrarAfiliados
go


/*------------------ MIGRACION DE PROFESIONALES ----------------------*/
create procedure DREAM_TEAM.migrarProfesional
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
execute DREAM_TEAM.migrarProfesional
go

/*------------------ MIGRACION DE TIPO DE ESPECIALIDADES ----------------------*/
create procedure DREAM_TEAM.migrarTipoEspecialidades
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
execute DREAM_TEAM.migrarTipoEspecialidades
go


/*------------------ MIGRACION DE ESPECIALIDADES ----------------------*/
create procedure DREAM_TEAM.migrarEspecialidad
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
execute DREAM_TEAM.migrarEspecialidad
go


/*------------------ MIGRACION DE ESPECIALIDAD POR PROFESIONAL ----------------------*/
create procedure DREAM_TEAM.migrarEspecialidadPorProfesional
as
	insert into DREAM_TEAM.especialidad_por_profesional(prof_id,esp_id)
		select prof_id,Especialidad_Codigo
		from gd_esquema.Maestra,DREAM_TEAM.profesional
		where prof_numdoc = Medico_Dni
		group by prof_id,Especialidad_Codigo
		order by prof_id
go
execute DREAM_TEAM. migrarEspecialidadPorProfesional
go


/*------------------ MIGRACION DE AGENDAS PROFESIONALES ----------------------*/
create procedure DREAM_TEAM.migrarAgendaProfesional
as
	insert into DREAM_TEAM.agenda_profesional
		SELECT p.prof_id, m.Especialidad_Codigo, m.Turno_Fecha
		FROM gd_esquema.Maestra m, DREAM_TEAM.profesional p
		WHERE Turno_Fecha is not null and p.prof_numdoc = m.Medico_Dni
		GROUP BY p.prof_id, m.Especialidad_Codigo, m.Turno_Fecha
		ORDER BY m.Turno_Fecha ASC
go
execute DREAM_TEAM.migrarAgendaProfesional
go


/*------------------ MIGRACION DE TURNOS ----------------------*/
create procedure DREAM_TEAM.migrarTurnos
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
execute DREAM_TEAM.migrarTurnos
go


/*------------------ MIGRACION DE REGISTROS DE COMPRA ----------------------*/
create procedure DREAM_TEAM.migrarRegistroCompra
as
	insert into DREAM_TEAM.registro_compra
		select af_id,af_rel_id,count(*),sum(Plan_Med_Precio_Bono_Consulta),Compra_Bono_Fecha
		from gd_esquema.Maestra,DREAM_TEAM.afiliado
		where Bono_Consulta_Numero is not null and Compra_Bono_Fecha is not null and af_numdoc = Paciente_Dni
		group by af_id, af_rel_id, Compra_Bono_Fecha
		order by Compra_Bono_Fecha
go
execute DREAM_TEAM.migrarRegistroCompra
go


/*------------------ MIGRACION DE BONOS ----------------------*/
create procedure DREAM_TEAM.migrarBonos
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
execute DREAM_TEAM.migrarBonos
go


/*------------------ MIGRACION DE CONSULTAS ----------------------*/
create procedure DREAM_TEAM.migrarConsultas
as
	insert into DREAM_TEAM.consulta_medica
		select Turno_Numero,Bono_Consulta_Fecha_Impresion,Consulta_Sintomas,Consulta_Enfermedades,Bono_Consulta_Numero
		from gd_esquema.Maestra
		where Consulta_Enfermedades is not null AND Bono_Consulta_Numero is not null
		order by Turno_Numero
go
execute DREAM_TEAM.migrarConsultas
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






			-- CREACION DE PROCEDURES
			-- CREACION DE PROCEDURES


--PARA EL AFILIADO
CREATE PROCEDURE DREAM_TEAM.bajaAfiliado
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

CREATE PROCEDURE DREAM_TEAM.altaAfiliado
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
	SELECT af_id, af_rel_id FROM DREAM_TEAM.afiliado WHERE af_tipodoc = @af_tipodoc AND af_numdoc = @af_numdoc
END
GO

CREATE PROCEDURE DREAM_TEAM.getNextRelID
	@af_id BIGINT
AS
BEGIN
	SELECT MAX(af_rel_id)+1
	FROM DREAM_TEAM.afiliado
	WHERE af_id = @af_id
	RETURN
END
GO

CREATE PROCEDURE DREAM_TEAM.altaFamiliar
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
	SELECT af_id, af_rel_id FROM DREAM_TEAM.afiliado WHERE af_tipodoc = @af_tipodoc AND af_numdoc = @af_numdoc
END
GO

CREATE PROCEDURE DREAM_TEAM.getDatosForCompraBono
	@us_id INT
AS
BEGIN
SELECT af_id, af_rel_id, planmed_id FROM DREAM_TEAM.afiliado WHERE us_id = @us_id
END
GO

CREATE PROCEDURE DREAM_TEAM.getDatosDelAfiliado
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN
SELECT * FROM DREAM_TEAM.afiliado 
WHERE af_id = @af_id 
AND af_rel_id = @af_rel_id
END
GO

CREATE PROCEDURE DREAM_TEAM.actualizarAfiliado
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
CREATE PROCEDURE DREAM_TEAM.getRolesPorUsuario
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

CREATE PROCEDURE DREAM_TEAM.getAllRoles

AS
BEGIN
	SELECT rol_id 'ID del rol', rol_nombre 'Nombre del rol', rol_status 'Estado del rol'  FROM DREAM_TEAM.rol
END
GO

CREATE PROCEDURE DREAM_TEAM.getAllFuncionalidades

AS
BEGIN
	SELECT * FROM DREAM_TEAM.funcionalidad
END
GO

CREATE PROCEDURE DREAM_TEAM.getFuncionalidadDelRol
	@id_rol INT
AS
BEGIN
	SELECT f.fun_id, f.fun_nombre 
	FROM DREAM_TEAM.funcionalidad_por_rol r JOIN DREAM_TEAM.funcionalidad f
	ON r.fun_id = f.fun_id
	WHERE rol_id = @id_rol
END
GO
	
CREATE PROCEDURE DREAM_TEAM.InsertarRol
	@nombre_rol VARCHAR(30)
AS
BEGIN
	INSERT into DREAM_TEAM.rol(rol_nombre,rol_status)VALUES(@nombre_rol,'a')
END
GO

CREATE PROCEDURE DREAM_TEAM.InsertarRolXFuncionalidad
	@nombre_rol VARCHAR(30),
	@fun_id INT
AS
BEGIN
	INSERT into DREAM_TEAM.funcionalidad_por_rol VALUES( (SELECT rol_id FROM DREAM_TEAM.rol WHERE rol_nombre like @nombre_rol), @fun_id)
END
GO

CREATE PROCEDURE DREAM_TEAM.getRol
	@rol_nombre VARCHAR(30)
AS
BEGIN
	SELECT rol_id 'ID del Rol', rol_nombre 'Nombre del rol', rol_status 'Estado del Rol' FROM DREAM_TEAM.rol WHERE rol_nombre like @rol_nombre
END
GO

CREATE PROCEDURE DREAM_TEAM.deactivateRol
	@rol_id INT
AS BEGIN
	UPDATE DREAM_TEAM.rol SET rol_status = 'd' WHERE rol_id = @rol_id
	DELETE FROM DREAM_TEAM.rol_por_usuarios WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE DREAM_TEAM.activateRol
	@rol_id INT
AS
BEGIN
	UPDATE DREAM_TEAM.rol SET rol_status = 'a' 
	WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE DREAM_TEAM.updateRXF
	@id_rol INT
AS
BEGIN
	DELETE FROM DREAM_TEAM.funcionalidad_por_rol WHERE rol_id = @id_rol
END
GO

CREATE PROCEDURE DREAM_TEAM.updateRol
	@nombre_rol VARCHAR(30),
	@id_rol INT
AS
BEGIN
	UPDATE DREAM_TEAM.rol SET rol_nombre = @nombre_rol WHERE rol_id = @id_rol
END
GO

-- LOGIN
CREATE PROCEDURE DREAM_TEAM.login
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
CREATE PROCEDURE DREAM_TEAM.getPlanesMedicos
AS
BEGIN
SELECT planmed_id, plan_descripcion
FROM DREAM_TEAM.plan_medico
END
GO

CREATE PROCEDURE DREAM_TEAM.getPrecioBonoDelPlan
	@planmed_id INT
AS
BEGIN
SELECT plan_precio_bono
FROM DREAM_TEAM.plan_medico
WHERE planmed_id = @planmed_id
END
GO

CREATE PROCEDURE DREAM_TEAM.verifyAfiliadoExistance
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN
	DECLARE @us_id INT
	DECLARE @planmed_id DECIMAL(18,0)
	SET @us_id = -1
	SELECT @us_id = us_id, @planmed_id = planmed_id FROM DREAM_TEAM.afiliado 
	WHERE af_id = @af_id
	AND af_rel_id = @af_rel_id
	IF @us_id != -1
		SELECT @planmed_id
	ELSE
		RAISERROR('El numero de afiliado ingresado no pertenece al sistema',16,16)
END
GO

CREATE PROCEDURE DREAM_TEAM.comprarBonos
	@af_id BIGINT,
	@af_rel_id TINYINT,
	@cantidad INT,
	@monto DECIMAL(8,2),
	@fecha DATETIME
AS
BEGIN
	DECLARE @compra_id INT
	INSERT INTO DREAM_TEAM.registro_compra(compra_af,compra_af_rel,compra_cantidad,compra_monto,compra_fecha)
	VALUES(@af_id,@af_rel_id,@cantidad,@monto,@fecha)

	SET @compra_id = SCOPE_IDENTITY();
	SELECT bono_id FROM DREAM_TEAM.bono WHERE bono_compra = @compra_id

END
GO

CREATE PROCEDURE DREAM_TEAM.checkBono
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

CREATE PROCEDURE DREAM_TEAM.getBonosDisponibles
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
CREATE PROCEDURE DREAM_TEAM.getEspecialidadesMedicas
AS
BEGIN
	SELECT esp_id, esp_descripcion FROM DREAM_TEAM.especialidad
END
GO

CREATE PROCEDURE DREAM_TEAM.getEspecialidadesPorProfesional
	@us_id INT
AS
BEGIN
	SELECT CAST(c.esp_id AS INT), c.esp_descripcion
    FROM DREAM_TEAM.profesional a, DREAM_TEAM.especialidad_por_profesional b, DREAM_TEAM.especialidad c
	WHERE a.us_id = @us_id AND b.prof_id = a.prof_id AND c.esp_id = b.esp_id
END
GO

CREATE PROCEDURE DREAM_TEAM.comprobar48horas
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

CREATE PROCEDURE DREAM_TEAM.addHorasAgenda
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

CREATE PROCEDURE DREAM_TEAM.getTurnos
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
CREATE PROCEDURE DREAM_TEAM.generateConsultaMedica
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

CREATE PROCEDURE DREAM_TEAM.getConsultas
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

CREATE PROCEDURE DREAM_TEAM.getTurnosDelProfesional
	@prof_id INT
AS
BEGIN
	SELECT turno_id 'ID del turno', DATEPART(YEAR,turno_fecha)'Año', DATEPART(MONTH,turno_fecha)'Mes', DATEPART (DAY, turno_fecha) 'Dia', DATEPART(HOUR,turno_fecha)'Hora', DATEPART(MINUTE,turno_fecha)'Minutos', turno_af'ID Familiar', turno_af_rel 'ID Relacional' 
	FROM DREAM_TEAM.turnos
	WHERE turno_prof = @prof_id
	AND turno_estado = 0
	ORDER BY 'Año', 'Mes', 'Dia', 'Hora', 'Minutos'
END
GO

CREATE PROCEDURE DREAM_TEAM.reservarTurno
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

CREATE PROCEDURE DREAM_TEAM.dameTurnosDisponiblesDeLaFecha
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

CREATE PROCEDURE DREAM_TEAM.finalizarConsulta
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

CREATE PROCEDURE DREAM_TEAM.bajaIntervalo
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

CREATE PROCEDURE DREAM_TEAM.cancelTurno
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
CREATE PROCEDURE DREAM_TEAM.getListado1
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

CREATE PROCEDURE DREAM_TEAM.getListado2
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

CREATE PROCEDURE DREAM_TEAM.getListado3
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

CREATE PROCEDURE DREAM_TEAM.getListado4
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

CREATE PROCEDURE DREAM_TEAM.getListado5
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
GO


------------------------------------------------- CREACION DE ROLES -----------------------------------------------------

/*Creo el rol Administrativo*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Administrativo', 'a');
GO

/*Se agregan funcionalidades al rol Administrativo*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol (rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Administrativo' AND tablaFuncionalidad.fun_nombre IN ('ABM de Rol', 'ABM de Afiliado', 'Compra de Bonos', 'Registro de Llegada','Listado Estadistico');
GO

/*Creo el rol Afiliado*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Afiliado', 'a');
GO

/*Se agregan funcionalidades al rol Afiliado*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol(rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Afiliado' AND tablaFuncionalidad.fun_nombre IN ('Compra de Bonos', 'Pedido de Turno','Cancelar Atencion Medica');
GO

/*Creo el rol Profesional*/

INSERT INTO DREAM_TEAM.rol(rol_nombre, rol_status) VALUES('Profesional', 'a');
GO

/*Se agregan funcionalidades al rol Profesional*/

INSERT INTO DREAM_TEAM.funcionalidad_por_rol (rol_id,fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_Id 
FROM DREAM_TEAM.rol  tablaRol, DREAM_TEAM.funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Profesional' AND tablaFuncionalidad.fun_nombre IN ('Registrar Agenda Profesional', 'Registro de Resultado', 'Cancelar Atencion Medica');
GO


------------------------------------- INGRESO LOS ROLES DE LOS PROFESIONALES Y DE LOS AFILIADOS ----------------------------------------------------------

	INSERT INTO DREAM_TEAM.rol_por_usuarios 
	SELECT us_id, 2 FROM DREAM_TEAM.afiliado
GO

		
	INSERT INTO DREAM_TEAM.rol_por_usuarios
	SELECT us_id, 3  FROM DREAM_TEAM.profesional
GO

----------------------------------------- CUENTA ADMIN -----------------------------------------------------------------

CREATE PROCEDURE DREAM_TEAM.setAdmin
AS
BEGIN
	DECLARE @us_id INT
	INSERT INTO DREAM_TEAM.usuarios VALUES('admin',HASHBYTES('SHA2_256','w23e'),0,'1')
	
	SELECT @us_id = us_id FROM DREAM_TEAM.usuarios WHERE us_username like 'admin'
	
	INSERT INTO DREAM_TEAM.rol_por_usuarios
	SELECT @us_id, r.rol_id 
	FROM DREAM_TEAM.rol r

	INSERT INTO DREAM_TEAM.afiliado (af_nombre,af_apellido,af_rel_id, us_id, af_tipodoc, af_numdoc, af_direccion, af_telefono, af_mail, af_nacimiento, af_estado_civil, af_cantidad_familiares, af_sexo, af_status,planmed_id)
		VALUES ('Administrador','General', 0, @us_id, 'DNI', 0,'',0,'',CONVERT(DATETIME,'1900-01-02'),'',0,'', 'a', 555559)

	INSERT INTO DREAM_TEAM.profesional (us_id,prof_apellido,prof_nombre) VALUES (@us_id,'Administrador','General')

	INSERT INTO DREAM_TEAM.especialidad_por_profesional 
		SELECT (SELECT prof_id FROM DREAM_TEAM.profesional WHERE us_id = @us_id), esp_id FROM DREAM_TEAM.especialidad

END
GO

exec DREAM_TEAM.setAdmin
GO

----------------------------------------- SETEO PLANES Y ESPECIALIDADES RELACIONADAS -----------------------------------------------------------------


CREATE PROCEDURE DREAM_TEAM.setTipoEspPorPlan
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

exec DREAM_TEAM.setTipoEspPorPlan
GO

DROP PROCEDURE DREAM_TEAM.setTipoEspPorPlan
GO


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

--													TRIGGERS


/* CREO TRIGGERS */


-- PARA LA COMPRA DE BONOS
CREATE TRIGGER DREAM_TEAM.compraDeBonos
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
CREATE TRIGGER DREAM_TEAM.agregarFamiliar
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
CREATE TRIGGER DREAM_TEAM.cancelarTurnosPorIntervalo
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