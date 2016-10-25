/*DROP TABLE agenda_profesional;
DROP TABLE cancelacion;
DROP TABLE bono;
DROP TABLE afiliado;
DROP TABLE consulta_medica;
DROP TABLE especialidad;
DROP TABLE especialidad_por_profesional;
DROP TABLE funcionalidad;
DROP TABLE funcionalidad_por_rol;
DROP TABLE logs_cambio_plan;
DROP TABLE periodo_baja;
DROP TABLE plan_medico;
DROP TABLE profesional;
DROP TABLE registro_compra;
DROP TABLE rol;
DROP TABLE rol_por_usuarios;
DROP TABLE servicios;
DROP TABLE servicios_por_planes;
DROP TABLE tipo_especialidades;
DROP TABLE turnos;
DROP TABLE usuarios;*/

/*----------- CREACION DE TABLAS ------------- */

/* TABLA DE AFILIADOS */

CREATE TABLE afiliado(
	af_id BIGINT,
	af_rel_id SMALLINT,
	us_id BIGINT,
	af_nombre VARCHAR(50),
	af_apellido VARCHAR(50),
	af_tipodoc	 VARCHAR(5),
	af_numdoc BIGINT,
	af_direccion VARCHAR(30),
	af_telefono VARCHAR(50),
	af_mail VARCHAR(30) ,
	af_nacimiento DATETIME,
	af_estado_civil VARCHAR(11),
	af_cantidad_familiares INT,
	planmed_id INT,
	af_sexo CHAR(1),
	af_status CHAR(1),
	af_fechaBaja DATETIME,
	PRIMARY KEY(af_id, af_rel_id)
 );


/* TABLA DE CAMBIO DE PLAN */

CREATE TABLE logs_cambio_plan(
	cambio_plan_id BIGINT PRIMARY KEY,
	af_id BIGINT,
	af_rel_id SMALLINT,
	plan_id_ant INT,
	plan_id_new INT,
	cambio_plan_motivo VARCHAR(100),
	cambio_plan_fecha DATETIME
);


/* TABLA DE PLAN MEDICO */

CREATE TABLE plan_medico(
	planmed_id INT PRIMARY KEY,
	plan_cuota INT,
	plan_nombre VARCHAR(30),
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
	serv_id INT PRIMARY KEY,
	serv_desc VARCHAR(100)
);

/* TABLA DE REGISTRO DE COMPRA */

CREATE TABLE registro_compra(
	compra_id INT PRIMARY KEY,
	af_id BIGINT,
	af_rel_id SMALLINT,
	compra_cantidad INT,
	compra_monto DECIMAL(7,2),
	compra_estado VARCHAR(10)
);


/* TABLA DE BONO */

CREATE TABLE bono(
	bono_id INT PRIMARY KEY,
	compra_id INT,
	planmed_id INT,
	af_id BIGINT,
	af_rel_id SMALLINT,
	bono_estado INT
);

/* TABLA DE CONSULTA MEDICA */

CREATE TABLE consulta_medica(
	cons_id INT PRIMARY KEY,
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
	turno_id INT PRIMARY KEY,
	turno_hora DATETIME,
	turno_estado CHAR(1),
	af_id BIGINT,
	af_rel_id SMALLINT,
	prof_id BIGINT,
	esp_id INT,
);


/* TABLA DE CANCELACIONES */

CREATE TABLE cancelacion(
	cancel_id  INT PRIMARY KEY,
	cancel_tipo CHAR(1),
	cancel_motivo VARCHAR(30),
	turno_id INT,
);


/* TABLA DE AGENDA DEL PROFESIONAL */

CREATE TABLE agenda_profesional(
	agenda_id BIGINT PRIMARY KEY,
	prof_id BIGINT,
	agenda_fecha_inicial DATETIME,
	agenda_fecha_final DATETIME,
	esp_id INT
);

/* TABLA DE TIPO DE ESPECIALIDADES */

CREATE TABLE tipo_especialidades(
	tipoEsp_id INT PRIMARY KEY,
	tipoEsp_descripcion VARCHAR(50)
);

/* TABLA DE ESPECIALIDADES */
CREATE TABLE especialidad(
	esp_id INT PRIMARY KEY,
	esp_descripcion VARCHAR(100),
	tipoEsp_id INT
);

/* TABLA DE ESPECIALIDAD POR PROFESIONAL */

CREATE TABLE especialidad_por_profesional(
	prof_id BIGINT,
	esp_id INT,
	PRIMARY KEY(prof_id,esp_id)
);


/* TABLA DE PROFESIONALES */

CREATE TABLE profesional(
	prof_id BIGINT PRIMARY KEY,
	us_id BIGINT,
	prof_nombre VARCHAR(50),
	prof_apellido VARCHAR(50),
	prof_tipodoc VARCHAR(5),
	prof_numdoc BIGINT,
	prof_direccion VARCHAR(50),
	prof_telefono VARCHAR(20),
	prof_mail VARCHAR(40),
	prof_nacimiento DATETIME,
	prof_matricula BIGINT,
	prof_sexo CHAR(1)
);

/* TABLA DE PERIODO BAJA DE TURNO */
CREATE TABLE periodo_baja(
	periodo_id INT PRIMARY KEY,
	periodo_desde DATE,
	periodo_hasta DATE,
	prof_id BIGINT
);


/* TABLA DE USUARIOS */

CREATE TABLE usuarios(
	us_id BIGINT PRIMARY KEY IDENTITY(1,1),
	us_username VARCHAR(30),
	us_password CHAR(64),
	us_login_fail SMALLINT,
	us_status Char(1)
);

/* TABLA DE ROLES POR USUARIO */

CREATE TABLE rol_por_usuarios(
	us_id BIGINT,
	rol_id INT,
	PRIMARY KEY(us_id,rol_id)
);

/* TABLA DE ROLES */

CREATE TABLE rol(
	rol_id INT PRIMARY KEY,
	rol_nombre VARCHAR(30),
	rol_status INT
);

/* TABLA DE FUNCIONALIDADES POR ROL */

CREATE TABLE funcionalidad_por_rol(
	rol_id INT,
	fun_id INT,
	PRIMARY KEY(rol_id,fun_id)
);

/* TABLA DE FUNCIONALIDADES */

CREATE TABLE funcionalidad(
	fun_id INT PRIMARY KEY,
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


CREATE TABLE #tmp_usuarios
( 
	u_id bigint identity(1,1),
	u_nombre VARCHAR(50),
	u_apellido VARCHAR(50),
	u_tipodoc VARCHAR(5),
	u_numdoc BIGINT,
	u_direccion VARCHAR(30),
	u_telefono VARCHAR(50),
	u_mail VARCHAR(30),
	u_nacimiento DATETIME,
	a_planmed INT,
);

--CREO TRIGGER EN Afiliados QUE ME INSERTA EL Afiliado EN LA TABLA Usuarios--


/*create TRIGGER  alta_usu_afi ON afiliados
	 after insert AS
begin
SET IDENTITY_INSERT usuarios  ON
  
	insert into  usuarios
	(us_id ,us_username , us_password)
	select N_ID_USUARIO, N_DOCUMENTO,(SELECT SUBSTRING(master.dbo.fn_varbintohexstr(HASHBYTES('SHA2_256',N_DOCUMENTO)),3,250))
	from inserted
	
	SET IDENTITY_INSERT usuarios  off
end;
GO
--CREO TRIGGER EN Profesionales QUE ME INSERTA AL Profesional EN LA TABLA Usuarios--

create TRIGGER  alta_USU_EMP  ON profesionales
	 after insert AS
begin
SET IDENTITY_INSERT usuarios  ON

	insert into  GDD_15.USUARIOS
	(n_id_usuario,c_usuario_nombre , C_PASSWORD )
	select N_ID_USUARIO, N_CUIT, (SELECT SUBSTRING(master.dbo.fn_varbintohexstr(HASHBYTES('SHA2_256',N_CUIT)),3,250))
	from inserted
	
	SET IDENTITY_INSERT gdd_15.USUARIOS  off
end;
GO

*/

-- Stored Procedure que migra afiliados y profesionales ---

CREATE PROCEDURE migro_usuarios AS
BEGIN
	/*  INSERTO afiliados  en la tmp_usuarios*/
	INSERT INTO #tmp_usuarios
	(	
	u_nombre,
	u_apellido,
	u_tipodoc,
	u_numdoc,
	u_direccion,
	u_telefono,
	u_mail,
	u_nacimiento,
	a_planmed
	)
	SELECT DISTINCT m.Paciente_Nombre,
	                m.Paciente_Apellido,
					'DNI',					
					m.Paciente_Dni,
					m.Paciente_Apellido,
					m.Paciente_Telefono,
					m.Paciente_Mail,
					m.Paciente_Fecha_Nac,
					m.Plan_Med_Codigo				
	FROM gd_esquema.Maestra m
	WHERE m.Paciente_Dni IS NOT NULL AND m.Plan_Med_Codigo IS NOT NULL
	
	/*  INSERTO profesionales  en la tmp_usuarios*/
	INSERT INTO #tmp_usuarios
	(
		
		u_nombre,
	    u_apellido,
	    u_tipodoc,
	    u_numdoc,
	    u_direccion,
	    u_telefono,
	    u_mail,
	    u_nacimiento
	)
	SELECT DISTINCT m.Medico_Nombre,
	                m.Medico_Apellido,
					'Dni',
					m.Medico_Dni,
					m.Medico_Direccion,
					m.Medico_Telefono,
					m.Medico_Mail,
					m.Medico_Fecha_Nac
							
	FROM gd_esquema.Maestra m
	WHERE m.Medico_Dni IS NOT NULL


	alter TABLE usuarios 
	NOCHECK CONSTRAINT FK_afi_usuario;

/*INSERTO Afiliados */
	INSERT INTO Afiliados
	(	
	    --us_id,
		u_nombre,
	    u_apellido,
	    u_tipodoc,
	    u_numdoc,
	    u_direccion,
	    u_telefono,
	    u_mail,
	    u_nacimiento,
		a_planmed


	)
select	u_nombre,
	    u_apellido,
	    u_tipodoc,
	    u_numdoc,
	    u_direccion,
	    u_telefono,
	    u_mail,
	    u_nacimiento
		from #tmp_usuarios
where u_tipodoc is not null and a_planmed is not null;

	alter TABLE profesional 
	NOCHECK CONSTRAINT FK_prof_us;

/*INSERTO Medicos*/
	INSERT INTO profesional
	(
		--us_id
		u_nombre,
	    u_apellido,
	    u_tipodoc,
	    u_numdoc,
	    u_direccion,
	    u_telefono,
	    u_mail,
	    u_nacimiento
	)
SELECT --us_id
		u_nombre,
	    u_apellido,
	    u_tipodoc,
	    u_numdoc,
	    u_direccion,
	    u_telefono,
	    u_mail,
	    u_nacimiento
		FROM #tmp_usuarios
		WHERE u_tipodoc IS NOT NULL
		;
END;
