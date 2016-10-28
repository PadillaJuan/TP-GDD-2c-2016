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

/* TABLA DE SERVICIOS POR PLANES */

CREATE TABLE servicios_por_planes(
	planmed_id numeric(18,0),
	serv_id INT,
	primary key (planmed_id, serv_id),
);


/* TABLA DE SERVICIOS */

CREATE TABLE servicios(
	serv_id INT PRIMARY KEY IDENTITY(1,1),
	serv_desc VARCHAR(100)
);

/* TABLA DE REGISTRO DE COMPRA */

CREATE TABLE registro_compra(
	compra_id INT PRIMARY KEY IDENTITY(1,1),
	af_id INT,
	af_rel_id TINYINT,
	compra_cantidad TINYINT,
	compra_monto DECIMAL(7,2),
	compra_estado CHAR(1)
);


/* TABLA DE BONO */

CREATE TABLE bono(
	bono_id INT PRIMARY KEY IDENTITY(1,1),
	compra_id INT,
	planmed_id numeric(18,0),
	af_id INT,
	af_rel_id TINYINT,
	bono_estado CHAR(1)
);

/* TABLA DE CONSULTA MEDICA */

CREATE TABLE consulta_medica(
	cons_id INT PRIMARY KEY IDENTITY(1,1),
	turno_id INT,
	cons_hora_llegada DATETIME,
	cons_hora_turno DATETIME,
	cons_sintomas VARCHAR(200),
	cons_diagnostico VARCHAR(200),
	cons_estado CHAR(1),
	bono_id INT
);


/* TABLA DE TURNOS */

CREATE TABLE turnos(
	turno_id INT PRIMARY KEY IDENTITY(1,1),
	turno_fecha DATETIME,
	turno_estado CHAR(1),
	agenda_id INT,
	af_id INT,
	af_rel_id TINYINT,
	prof_id INT,
	esp_id INT,
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
	prof_id INT,
	agenda_fecha DATETIME,
	esp_id INT
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
	us_password CHAR(64),
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
	

ALTER TABLE registro_compra add constraint FK_compra_afi foreign key (af_id,af_rel_id) references afiliado (af_id,af_rel_id);	

ALTER TABLE bono add constraint FK_compra_bono foreign key (compra_id) references registro_compra (compra_id);	
ALTER TABLE bono add constraint FK_plan_bono foreign key (planmed_id) references plan_medico (planmed_id);		
ALTER TABLE bono add constraint FK_afi_bono foreign key (af_id,af_rel_id) references afiliado (af_id,af_rel_id);	

ALTER TABLE consulta_medica add constraint FK_consulta_turno foreign key (turno_id) references turnos (turno_id);	
ALTER TABLE consulta_medica add constraint FK_consulta_bono foreign key (bono_id) references bono (bono_id);	

ALTER TABLE turnos add constraint FK_turno_afi foreign key (af_id,af_rel_id) references afiliado (af_id,af_rel_id);
ALTER TABLE turnos add constraint FK_turno_prof foreign key (prof_id) references profesional (prof_id);		
ALTER TABLE turnos add constraint FK_turno_esp foreign key (esp_id) references especialidad (esp_id);
ALTER TABLE turnos add constraint FK_turno_agenda foreign key (agenda_id) references agenda_profesional (agenda_id);

ALTER TABLE cancelacion add constraint FK_cancelacion_turno foreign key (turno_id) references turnos (turno_id);	

ALTER TABLE agenda_profesional add constraint FK_agenda_prof foreign key (prof_id) references profesional (prof_id);	
ALTER TABLE agenda_profesional add constraint FK_agenda_prof2 foreign key (esp_id) references especialidad (esp_id);	
	
ALTER TABLE especialidad add constraint FK_especialidad_tipo foreign key (tipoEsp_id) references tipo_especialidades (tipoEsp_id);

ALTER TABLE profesional add constraint FK_prof_us foreign key (us_id) references usuarios (us_id);
	
ALTER TABLE periodo_baja add constraint FK_baja_prof foreign key (prof_id) references profesional (prof_id);	

ALTER TABLE rol_por_usuarios add constraint FK_rolxusr_id foreign key (us_id) references usuarios (us_id);
ALTER TABLE rol_por_usuarios add constraint FK_rolxusr_rol foreign key (rol_id) references rol (rol_id);

ALTER TABLE funcionalidad_por_rol add constraint FK_funxrol_id foreign key (rol_id) references rol (rol_id);
ALTER TABLE funcionalidad_por_rol add constraint FK_funxrol_fun foreign key (fun_id) references funcionalidad (fun_id);
