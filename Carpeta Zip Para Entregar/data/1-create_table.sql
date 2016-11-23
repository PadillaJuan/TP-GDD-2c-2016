USE GD2C2016;
GO

/* Elimino las CONSTRAINT */

IF (OBJECT_ID('FK_afi_usuario', 'F') IS NOT NULL)
	ALTER TABLE afiliado DROP constraint FK_afi_usuario;
IF (OBJECT_ID('FK_plan_med', 'F') IS NOT NULL)
	ALTER TABLE afiliado DROP constraint FK_plan_med;

IF (OBJECT_ID('FK_afi', 'F') IS NOT NULL)
	ALTER TABLE logs_cambio_plan DROP constraint FK_afi;
IF (OBJECT_ID('FK_plan_ant', 'F') IS NOT NULL)
	ALTER TABLE logs_cambio_plan DROP constraint FK_plan_ant;
IF (OBJECT_ID('FK_plan_new', 'F') IS NOT NULL)
	ALTER TABLE logs_cambio_plan DROP constraint FK_plan_new;

IF (OBJECT_ID('FK_srv_por_planes_1', 'F') IS NOT NULL)
	ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_1;
IF (OBJECT_ID('FK_srv_por_planes_2', 'F') IS NOT NULL)
	ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_2;
	

IF (OBJECT_ID('FK_compra_afi', 'F') IS NOT NULL)
	ALTER TABLE registro_compra DROP constraint FK_compra_afi;

IF (OBJECT_ID('FK_compra_bono', 'F') IS NOT NULL)
	ALTER TABLE bono DROP constraint FK_compra_bono;
IF (OBJECT_ID('FK_plan_bono', 'F') IS NOT NULL)
	ALTER TABLE bono DROP constraint FK_plan_bono;
IF (OBJECT_ID('FK_afi_bono', 'F') IS NOT NULL)
	ALTER TABLE bono DROP constraint FK_afi_bono;

IF (OBJECT_ID('FK_consulta_turno', 'F') IS NOT NULL)
	ALTER TABLE consulta_medica DROP constraint FK_consulta_turno;
IF (OBJECT_ID('FK_consulta_bono', 'F') IS NOT NULL)
	ALTER TABLE consulta_medica DROP constraint FK_consulta_bono;

IF (OBJECT_ID('FK_turno_afi', 'F') IS NOT NULL)
	ALTER TABLE turnos DROP constraint FK_turno_afi;
IF (OBJECT_ID('FK_turno_prof', 'F') IS NOT NULL)
	ALTER TABLE turnos DROP constraint FK_turno_prof;
IF (OBJECT_ID('FK_turno_esp', 'F') IS NOT NULL)
	ALTER TABLE turnos DROP constraint FK_turno_esp;
IF (OBJECT_ID('FK_turno_agenda', 'F') IS NOT NULL)
	ALTER TABLE turnos DROP constraint FK_turno_agenda;

IF (OBJECT_ID('FK_cancelacion_turno', 'F') IS NOT NULL)
	ALTER TABLE cancelacion DROP constraint FK_cancelacion_turno;

IF (OBJECT_ID('FK_agenda_prof', 'F') IS NOT NULL)
	ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof;
IF (OBJECT_ID('FK_agenda_prof2', 'F') IS NOT NULL)
	ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof2;
	
IF (OBJECT_ID('FK_especialidad_tipo', 'F') IS NOT NULL)
	ALTER TABLE especialidad DROP constraint FK_especialidad_tipo;

IF (OBJECT_ID('FK_prof_us', 'F') IS NOT NULL)
	ALTER TABLE profesional DROP constraint FK_prof_us;
	
IF (OBJECT_ID('FK_baja_prof', 'F') IS NOT NULL)
	ALTER TABLE periodo_baja DROP constraint FK_baja_prof;

IF (OBJECT_ID('FK_rolxusr_id', 'F') IS NOT NULL)
	ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_id;
IF (OBJECT_ID('FK_rolxusr_rol', 'F') IS NOT NULL)
	ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_rol;

IF (OBJECT_ID('FK_funxrol_id', 'F') IS NOT NULL)
	ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_id;
IF (OBJECT_ID('FK_funxrol_fun', 'F') IS NOT NULL)
	ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_fun;
	
GO
	
/* Elimino las tablas */

IF (OBJECT_ID('afiliado','U') IS NOT NULL)
	DROP TABLE afiliado;
IF (OBJECT_ID('logs_cambio_plan','U') IS NOT NULL)
	DROP TABLE logs_cambio_plan;
IF (OBJECT_ID('plan_medico','U') IS NOT NULL)
	DROP TABLE plan_medico;
IF (OBJECT_ID('servicios_por_planes','U') IS NOT NULL)
	DROP TABLE servicios_por_planes;
IF (OBJECT_ID('servicios','U') IS NOT NULL)
	DROP TABLE servicios;
IF (OBJECT_ID('registro_compra','U') IS NOT NULL)
	DROP TABLE registro_compra;
IF (OBJECT_ID('bono','U') IS NOT NULL)
	DROP TABLE bono;
IF (OBJECT_ID('consulta_medica','U') IS NOT NULL)
	DROP TABLE consulta_medica;
IF (OBJECT_ID('turnos','U') IS NOT NULL)
	DROP TABLE turnos;
IF (OBJECT_ID('cancelacion','U') IS NOT NULL)
	DROP TABLE cancelacion;
IF (OBJECT_ID('agenda_profesional','U') IS NOT NULL)
	DROP TABLE agenda_profesional;
IF (OBJECT_ID('tipo_especialidades','U') IS NOT NULL)
	DROP TABLE tipo_especialidades;
IF (OBJECT_ID('especialidad','U') IS NOT NULL)
	DROP TABLE especialidad;
IF (OBJECT_ID('especialidad_por_profesional','U') IS NOT NULL)
	DROP TABLE especialidad_por_profesional;
IF (OBJECT_ID('profesional','U') IS NOT NULL)
	DROP TABLE profesional;
IF (OBJECT_ID('periodo_baja','U') IS NOT NULL)
	DROP TABLE periodo_baja;
IF (OBJECT_ID('usuarios','U') IS NOT NULL)
	DROP TABLE usuarios;
IF (OBJECT_ID('rol_por_usuarios','U') IS NOT NULL)
	DROP TABLE rol_por_usuarios;
IF (OBJECT_ID('rol','U') IS NOT NULL)
	DROP TABLE rol;
IF (OBJECT_ID('funcionalidad_por_rol','U') IS NOT NULL)
	DROP TABLE funcionalidad_por_rol;
IF (OBJECT_ID('funcionalidad','U') IS NOT NULL)
	DROP TABLE funcionalidad;

	
GO 


/* TABLA DE AFILIADOS */

CREATE TABLE afiliado(
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

CREATE TABLE logs_cambio_plan(
	cambio_plan_id INT PRIMARY KEY IDENTITY(1,1),
	af_id INT,
	af_rel_id TINYINT,
	plan_id_ant numeric(18,0),
	plan_id_new numeric(18,0),
	cambio_plan_motivo VARCHAR(100),
	cambio_plan_fecha DATETIME
);


/* TABLA DE PLAN MEDICO */

CREATE TABLE plan_medico(
	planmed_id numeric(18,0) PRIMARY KEY IDENTITY(1,1),
	plan_cuota numeric(18,0),
	plan_descripcion VARCHAR(30),
	plan_precio_bono numeric(18,0),
);

/* TABLA DE Tipo Especialidad POR PLANES */

CREATE TABLE tipoEsp_por_planes(
	planmed_id numeric(18,0),
	tipoEsp_id INT,
	primary key (planmed_id, tipoEsp_id),
);


/* TABLA DE REGISTRO DE COMPRA */

CREATE TABLE registro_compra(
	compra_id INT PRIMARY KEY IDENTITY(1,1),
	compra_af INT,
	compra_af_rel TINYINT,
	compra_cantidad TINYINT,
	compra_monto DECIMAL(7,2),
	compra_fecha DATETIME
);


/* TABLA DE BONO */

CREATE TABLE bono(
	bono_id INT PRIMARY KEY IDENTITY(1,1),
	bono_compra INT,
	bono_nro_consulta INT,
	bono_planmed numeric(18,0),
	bono_af INT,
	bono_af_rel TINYINT
);

/* TABLA DE CONSULTA MEDICA */

CREATE TABLE consulta_medica(
	cons_id INT PRIMARY KEY IDENTITY(1,1),
	cons_turno INT,
	cons_hora_llegada DATETIME,
	cons_sintomas VARCHAR(200),
	cons_diagnostico VARCHAR(200),
	cons_bono INT
);


/* TABLA DE TURNOS */

CREATE TABLE turnos(
	turno_id INT PRIMARY KEY IDENTITY(1,1),
	turno_fecha DATETIME,
	turno_estado CHAR(1),
	turno_agenda INT,
	turno_af INT,
	turno_af_rel TINYINT,
	turno_prof INT,
	turno_esp INT,
);


/* TABLA DE CANCELACIONES */

CREATE TABLE cancelacion(
	cancel_id  INT PRIMARY KEY IDENTITY(1,1),
	cancel_tipo CHAR(1),
	cancel_motivo VARCHAR(30),
	turno_id INT,
);


/* TABLA DE AGENDA DEL PROFESIONAL */

CREATE TABLE agenda_profesional(
	agenda_id INT PRIMARY KEY IDENTITY(1,1),
	agenda_prof INT,
	agenda_esp INT,
	agenda_hora TIME,
	agenda_dia INT,
	agenda_anio INT
);

/* TABLA DE TIPO DE ESPECIALIDADES */

CREATE TABLE tipo_especialidades(
	tipoEsp_id INT PRIMARY KEY IDENTITY(1,1),
	tipoEsp_descripcion VARCHAR(50)
);

/* TABLA DE ESPECIALIDADES */
CREATE TABLE especialidad(
	esp_id INT PRIMARY KEY IDENTITY(1,1),
	esp_descripcion VARCHAR(100),
	tipoEsp_id INT
);

/* TABLA DE ESPECIALIDAD POR PROFESIONAL */

CREATE TABLE especialidad_por_profesional(
	prof_id INT,
	esp_id INT,
	PRIMARY KEY(prof_id,esp_id)
);


/* TABLA DE PROFESIONALES */

CREATE TABLE profesional(
	prof_id INT PRIMARY KEY IDENTITY(1,1),
	us_id INT,
	prof_nombre VARCHAR(50),
	prof_apellido VARCHAR(50),
	prof_tipodoc VARCHAR(5),
	prof_numdoc numeric(18,0) UNIQUE,
	prof_direccion VARCHAR(50),
	prof_telefono VARCHAR(20),
	prof_mail VARCHAR(40),
	prof_nacimiento DATETIME,
	prof_matricula INT,
	prof_sexo CHAR(1)
);

/* TABLA DE PERIODO BAJA DE TURNO */
CREATE TABLE periodo_baja(
	periodo_id INT PRIMARY KEY IDENTITY(1,1),
	periodo_desde DATETIME,
	periodo_hasta DATETIME,
	prof_id INT
);


/* TABLA DE USUARIOS */

CREATE TABLE usuarios(
	us_id INT PRIMARY KEY IDENTITY(1,1),
	us_username VARCHAR(30),
	us_password VARBINARY(64),
	us_login_fail TINYINT,
	us_status CHAR(1)
);

/* TABLA DE ROLES POR USUARIO */

CREATE TABLE rol_por_usuarios(
	us_id INT,
	rol_id INT,
	PRIMARY KEY(us_id,rol_id)
);

/* TABLA DE ROLES */

CREATE TABLE rol(
	rol_id INT PRIMARY KEY IDENTITY(1,1),
	rol_nombre VARCHAR(30),
	rol_status CHAR(1)
);

/* TABLA DE FUNCIONALIDADES POR ROL */

CREATE TABLE funcionalidad_por_rol(
	rol_id INT,
	fun_id INT,
	PRIMARY KEY(rol_id,fun_id)
);

/* TABLA DE FUNCIONALIDADES */

CREATE TABLE funcionalidad(
	fun_id INT PRIMARY KEY IDENTITY(1,1),
	fun_nombre VARCHAR(30),
	fun_descripcion VARCHAR(100)
);

/* ------------------ CREACION DE FKs (Por favor en mismo orden de creacion de tablas para no olvidar nada) --------------------*/

ALTER TABLE afiliado add constraint FK_afi_usuario foreign key (us_id) references usuarios (us_id);
ALTER TABLE afiliado add constraint FK_plan_med foreign key (planmed_id) references plan_medico (planmed_id);

ALTER TABLE logs_cambio_plan add constraint FK_afi foreign key (af_id,af_rel_id) references afiliado (af_id,af_rel_id);
ALTER TABLE logs_cambio_plan add constraint FK_plan_ant foreign key (plan_id_ant) references plan_medico (planmed_id);	
ALTER TABLE logs_cambio_plan add constraint FK_plan_new foreign key (plan_id_new) references plan_medico (planmed_id);

ALTER TABLE servicios_por_planes add constraint FK_srv_por_planes_1 foreign key (planmed_id) references plan_medico (planmed_id);
ALTER TABLE servicios_por_planes add constraint FK_srv_por_planes_2 foreign key (serv_id) references servicios (serv_id);
	

ALTER TABLE registro_compra add constraint FK_compra_afi foreign key (compra_af,compra_af_rel) references afiliado (af_id,af_rel_id);	

ALTER TABLE bono add constraint FK_compra_bono foreign key (bono_compra) references registro_compra (compra_id);	
ALTER TABLE bono add constraint FK_plan_bono foreign key (bono_planmed) references plan_medico (planmed_id);		
ALTER TABLE bono add constraint FK_afi_bono foreign key (bono_af,bono_af_rel) references afiliado (af_id,af_rel_id);	

ALTER TABLE consulta_medica add constraint FK_consulta_turno foreign key (cons_turno) references turnos (turno_id);	
ALTER TABLE consulta_medica add constraint FK_consulta_bono foreign key (cons_bono) references bono (bono_id);	

ALTER TABLE turnos add constraint FK_turno_afi foreign key (turno_af,turno_af_rel) references afiliado (af_id,af_rel_id);
ALTER TABLE turnos add constraint FK_turno_prof foreign key (turno_prof) references profesional (prof_id);		
ALTER TABLE turnos add constraint FK_turno_esp foreign key (turno_esp) references especialidad (esp_id);
ALTER TABLE turnos add constraint FK_turno_agenda foreign key (turno_agenda) references agenda_profesional (agenda_id);

ALTER TABLE cancelacion add constraint FK_cancelacion_turno foreign key (turno_id) references turnos (turno_id);	

ALTER TABLE agenda_profesional add constraint FK_agenda_prof foreign key (agenda_prof) references profesional (prof_id);	
ALTER TABLE agenda_profesional add constraint FK_agenda_prof2 foreign key (agenda_esp) references especialidad (esp_id);	
	
ALTER TABLE especialidad add constraint FK_especialidad_tipo foreign key (tipoEsp_id) references tipo_especialidades (tipoEsp_id);

ALTER TABLE profesional add constraint FK_prof_us foreign key (us_id) references usuarios (us_id);
	
ALTER TABLE periodo_baja add constraint FK_baja_prof foreign key (prof_id) references profesional (prof_id);	

ALTER TABLE rol_por_usuarios add constraint FK_rolxusr_id foreign key (us_id) references usuarios (us_id);
ALTER TABLE rol_por_usuarios add constraint FK_rolxusr_rol foreign key (rol_id) references rol (rol_id);

ALTER TABLE funcionalidad_por_rol add constraint FK_funxrol_id foreign key (rol_id) references rol (rol_id);
ALTER TABLE funcionalidad_por_rol add constraint FK_funxrol_fun foreign key (fun_id) references funcionalidad (fun_id);




ALTER TABLE afiliado ADD CONSTRAINT uniqueIdentificacion UNIQUE (af_tipodoc, af_numdoc)