/*
ALTER TABLE afiliado DROP constraint FK_afi_usuario;
ALTER TABLE afiliado DROP constraint FK_plan_med;

ALTER TABLE logs_cambio_plan DROP constraint FK_afi;
ALTER TABLE logs_cambio_plan DROP constraint FK_plan_ant;	
ALTER TABLE logs_cambio_plan DROP constraint FK_plan_new;

ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_1;
ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_2;
	

ALTER TABLE registro_compra DROP constraint FK_compra_afi;	

ALTER TABLE bono DROP constraint FK_compra_bono;	
ALTER TABLE bono DROP constraint FK_plan_bono;		
ALTER TABLE bono DROP constraint FK_afi_bono;	

ALTER TABLE consulta_medica DROP constraint FK_consulta_turno;	
ALTER TABLE consulta_medica DROP constraint FK_consulta_bono;	

ALTER TABLE turnos DROP constraint FK_turno_afi;
ALTER TABLE turnos DROP constraint FK_turno_prof;		
ALTER TABLE turnos DROP constraint FK_turno_esp;
ALTER TABLE turnos DROP constraint FK_turno_agenda;

ALTER TABLE cancelacion DROP constraint FK_cancelacion_turno;	

ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof;	
ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof2;	
	
ALTER TABLE especialidad DROP constraint FK_especialidad_tipo;

ALTER TABLE profesional DROP constraint FK_prof_us;
	
ALTER TABLE periodo_baja DROP constraint FK_baja_prof;	

ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_id;
ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_rol;

ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_id;
ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_fun;

DROP TABLE agenda_profesional;
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
DROP TABLE usuarios;
*/
/*
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
////////////////////		CREACION DE TABLAS
*/



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
	bono_planmed numeric(18,0),
	bono_af INT,
	bono_af_rel TINYINT,
	bono_estado CHAR(1)
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
/*
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
////////////////////		MIGRACION
*/

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
		select Paciente_Dni,HASHBYTES('SHA2_256',Paciente_Apellido),0,'1'
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
		select Medico_Dni,HASHBYTES('SHA2_256',Medico_Apellido),0,'1'
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

create procedure migrarAgendaProfesional
as
	insert into agenda_profesional
		select prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha), datepart(dw,Turno_Fecha),year(Turno_Fecha)
		from gd_esquema.Maestra,profesional
		where Turno_Fecha is not null and Bono_Consulta_Numero is not null and prof_numdoc = Medico_Dni
		group by prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha), datepart(dw,Turno_Fecha),year(Turno_Fecha)
		order by prof_id,datepart(dw,Turno_Fecha),CONVERT(time,Turno_Fecha)

	--Agrego los horarios del 2016
	insert into agenda_profesional
		select prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha), datepart(dw,Turno_Fecha)+1,2016
		from gd_esquema.Maestra,profesional
		where Turno_Fecha is not null and Bono_Consulta_Numero is not null and prof_numdoc = Medico_Dni
		group by prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha), datepart(dw,Turno_Fecha)
		having CONVERT(time,Turno_Fecha) > convert(time,'08:30:00.0000000')
		order by prof_id,datepart(dw,Turno_Fecha),CONVERT(time,Turno_Fecha)

	--Agrego los dias Sabados
	insert into agenda_profesional
		select prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha),7,2016
		from gd_esquema.Maestra,profesional
		where Turno_Fecha is not null and Bono_Consulta_Numero is not null and prof_numdoc = Medico_Dni
		group by prof_id,Especialidad_Codigo,CONVERT(time,Turno_Fecha),datepart(dw,Turno_Fecha)
		having CONVERT(time,Turno_Fecha) >= convert(time,'10:00:00.0000000') and CONVERT(time,Turno_Fecha) < convert(time,'13:00:00.0000000')and
				 datepart(dw,Turno_Fecha) = 1
		order by prof_id,datepart(dw,Turno_Fecha),CONVERT(time,Turno_Fecha)
go
execute migrarAgendaProfesional
go


create procedure migrarTurnos
as
	SET IDENTITY_INSERT turnos ON 
	insert into turnos(turno_id,turno_fecha,turno_estado,turno_agenda,turno_af,turno_af_rel,turno_prof,turno_esp)
		select Turno_Numero,Turno_Fecha,1,(select agenda_id from agenda_profesional
											where agenda_prof = prof_id and agenda_esp = Especialidad_Codigo and 
												  convert(time,Turno_Fecha) = agenda_hora and datepart(dw,Turno_Fecha) = agenda_dia and
												  year(turno_fecha) = agenda_anio),
					af_id,af_rel_id,prof_id,Especialidad_Codigo
		from gd_esquema.Maestra,afiliado,profesional
		where af_numdoc = Paciente_Dni and prof_numdoc = Medico_Dni and Consulta_Enfermedades is not null
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
		order by Bono_Consulta_Numero
	SET IDENTITY_INSERT bono OFF 
go
execute migrarBonos
go

create procedure migrarConsultas
as
	insert into consulta_medica
		select Turno_Numero,Bono_Consulta_Fecha_Impresion,Consulta_Sintomas,Consulta_Enfermedades,Bono_Consulta_Numero
		from gd_esquema.Maestra
		where Bono_Consulta_Numero is not null
		order by Turno_Numero
go
execute migrarConsultas
go


/*

////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
////////////////////		PROCEDURES
*/


CREATE PROCEDURE bajaAfiliado
	@id INT,
	@id_rel TINYINT,
	@af_fechaBaja DATETIME
AS
BEGIN
	UPDATE afiliado
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
	INSERT INTO usuarios VALUES(CONVERT(varchar(30), @af_numdoc),HASHBYTES('SHA2_256' ,@af_apellido),0,'a')
	INSERT INTO rol_por_usuarios VALUES((SELECT us_id FROM usuarios u WHERE u.us_username like @af_numdoc),(SELECT rol_id FROM rol r WHERE r.rol_nombre = 'Afiliado'))

	INSERT INTO afiliado(af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo)
	VALUES (00, (SELECT us_id FROM usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc)), @af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo)
END
GO

CREATE PROCEDURE getNextRelID
	@af_id BIGINT
AS
BEGIN
	SELECT MAX(af_rel_id) +1
	FROM afiliado
	WHERE af_id = @af_id
	RETURN
END
GO

CREATE PROCEDURE getPlanesMedicos
AS
BEGIN
SELECT planmed_id
FROM Plan_medico
END
GO

CREATE PROCEDURE getRolesPorUsuario
	@us_id INT
AS
BEGIN
	SELECT r.rol_id, r.rol_nombre, r.rol_status
        FROM rol r 
	JOIN rol_por_usuarios u ON r.rol_id = u.rol_id 
	WHERE u.us_id = @us_id
	AND r.rol_status like 'a'	
END
GO

CREATE PROCEDURE getAllRoles

AS
BEGIN
	SELECT * FROM rol
END
GO

CREATE PROCEDURE getAllFuncionalidades

AS
BEGIN
	SELECT * FROM funcionalidad
END
GO

CREATE PROCEDURE getFuncionalidadDelRol
	@id_rol INT
AS
BEGIN
	SELECT fun_id FROM funcionalidad_por_rol
	WHERE rol_id = @id_rol
END
GO
	
CREATE PROCEDURE InsertarRol
	@nombre_rol VARCHAR(30)
AS
BEGIN
	INSERT into rol(rol_nombre,rol_status)VALUES(@nombre_rol,'A')
END
GO

CREATE PROCEDURE InsertarRolXFuncionalidad
	@id_rol INT,
	@fun_id INT
AS
BEGIN
	INSERT into funcionalidad_por_rol VALUES( @id_rol, @fun_id)
END
GO

CREATE PROCEDURE login
	@us_name VARCHAR(30),
	@us_pw VARCHAR(64),
	@us_idR INT OUT

AS
BEGIN
SET @us_idR = -1
DECLARE loginCursor CURSOR FOR
SELECT * FROM usuarios 
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
					UPDATE usuarios SET us_login_fail = 0 WHERE us_id = @us_id
					RETURN
				END
				ELSE
				BEGIN
					RAISERROR('La contraseña es invalida',16,10)
					UPDATE usuarios 
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

CREATE PROCEDURE getRol
	@rol_nombre VARCHAR(30)
AS
BEGIN
	SELECT * FROM rol WHERE rol_nombre like @rol_nombre
END
GO


CREATE PROCEDURE deactivateRol
	@rol_id INT
AS BEGIN
	UPDATE rol SET rol_status = 'd' WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE activateRol
	@rol_id INT
AS
BEGIN
	UPDATE rol SET rol_status = 'a' 
	WHERE rol_id = @rol_id
END

/* DROP PROCEDURES
DROP PROCEDURE bajaAfiliado
DROP PROCEDURE altaAfiliado
DROP PROCEDURE getNextRelID
DROP PROCEDURE getPlanesMedicos
DROP PROCEDURE getRolesPorUsuario
DROP PROCEDURE getAllRoles
DROP PROCEDURE getAllFuncionalidades
DROP PROCEDURE getFuncionalidadDelRol
DROP PROCEDURE insertarRol
DROP PROCEDURE InsertarRolXFuncionalidad
DROP PROCEDURE login
DROP PROCEDURE getRol
DROP PROCEDURE deactivateRol
DROP PROCEDURE activateRol
*/
/*
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL		
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
////////////////////		INFORMACION INICIAL
*/

---------------------------------------------CREO FUNCIONALIDADES ----------------------------------------------------

INSERT INTO funcionalidad (fun_nombre) VALUES ('ABM de Rol');
INSERT INTO funcionalidad (fun_nombre) VALUES ('ABM de Afiliado');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Registrar Agenda Profesional');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Compra de Bonos');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Pedido de Turno');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Registro de Llegada');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Registro de Resultado');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Cancelar Atencion Medica');
INSERT INTO funcionalidad (fun_nombre) VALUES ('Listado Estadistico');


------------------------------------------------- CREACION DE ROLES -----------------------------------------------------

/*Creo el rol Administrativo*/

INSERT INTO rol(rol_nombre, rol_status) VALUES('Administrativo', 'a');
GO

/*Se agregan funcionalidades al rol Administrativo*/

INSERT INTO funcionalidad_por_rol (rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM rol  tablaRol, funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Administrativo' AND tablaFuncionalidad.fun_nombre IN ('ABM de Rol', 'ABM de Afiliado', 'Compra de Bonos', 'Registro de Llegada','Listado Estadistico');
GO

/*Creo el rol Afiliado*/

INSERT INTO rol(rol_nombre, rol_status) VALUES('Afiliado', 'a');
GO

/*Se agregan funcionalidades al rol Afiliado*/

INSERT INTO funcionalidad_por_rol(rol_id, fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_id 
FROM rol  tablaRol, funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Afiliado' AND tablaFuncionalidad.fun_nombre IN ('Compra de Bonos', 'Pedido de Turno','Cancelar Atencion Medica', 'Listado Estadístico');
GO

/*Creo el rol Profesional*/

INSERT INTO rol(rol_nombre, rol_status) VALUES('Profesional', 'a');
GO

/*Se agregan funcionalidades al rol Profesional*/

INSERT INTO funcionalidad_por_rol (rol_id,fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_Id 
FROM rol  tablaRol, funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Profesional' AND tablaFuncionalidad.fun_nombre IN ('Registrar Agenda Profesional', 'Registro de Resultado', 'Cancelar Atencion Medica', 'Listado Estadístico');
GO


----------------------------------------- CUENTA ADMIN -----------------------------------------------------------------

INSERT INTO usuarios VALUES('admin',HASHBYTES('SHA2_256','w23e'),0,'a')

INSERT INTO rol_por_usuarios
SELECT 5579, r.rol_id 
FROM rol r
