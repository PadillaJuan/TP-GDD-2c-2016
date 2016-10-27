/* TABLA DE AFILIADOS */

CREATE TABLE afiliado(
	af_id INT IDENTITY(1,1),
	af_rel_id TINYINT,
	us_id INT,
	af_nombre VARCHAR(50),
	af_apellido VARCHAR(50),
	af_tipodoc	 VARCHAR(5),
	af_numdoc INT UNIQUE,
	af_direccion VARCHAR(30),
	af_telefono VARCHAR(50),
	af_mail VARCHAR(30) ,
	af_nacimiento DATETIME,
	af_estado_civil VARCHAR(11),
	af_cantidad_familiares TINYINT,
	planmed_id INT,
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
	plan_id_ant INT,
	plan_id_new INT,
	cambio_plan_motivo VARCHAR(100),
	cambio_plan_fecha DATETIME
);


/* TABLA DE PLAN MEDICO */

CREATE TABLE plan_medico(
	planmed_id INT PRIMARY KEY IDENTITY(1,1),
	plan_cuota INT,
	plan_descripcion VARCHAR(30),
	plan_precio_bono DECIMAL(5,2)
);

/* TABLA DE SERVICIOS POR PLANES */

CREATE TABLE servicios_por_planes(
	planmed_id INT,
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
	planmed_id INT,
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
	agenda_fecha_inicial DATETIME,
	agenda_fecha_final DATETIME,
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
	prof_numdoc INT UNIQUE,
	prof_direccion VARCHAR(50),
	prof_telefono VARCHAR(20),
	prof_mail VARCHAR(40),
	prof_nacimiento DATETIME,
	prof_matricula INT UNIQUE,
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
