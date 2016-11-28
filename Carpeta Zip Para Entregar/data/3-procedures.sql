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

	IF NOT EXISTS (SELECT 1 FROM afiliado WHERE af_numdoc = @af_numdoc AND af_tipodoc = @af_tipodoc)
	BEGIN
		INSERT INTO afiliado(af_rel_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo, af_status)
		VALUES (00,  @af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo, 'a')

		INSERT INTO usuarios VALUES(CONVERT(varchar(30), @af_numdoc),HASHBYTES('SHA2_256' ,@af_apellido),0,'a')
		INSERT INTO rol_por_usuarios VALUES((SELECT us_id FROM usuarios u WHERE u.us_username like @af_numdoc),(SELECT rol_id FROM rol r WHERE r.rol_nombre = 'Afiliado'))

		UPDATE afiliado SET us_id = (SELECT us_id FROM usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc))
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
	FROM afiliado
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
	INSERT INTO usuarios VALUES(CONVERT(varchar(30), @af_numdoc),HASHBYTES('SHA2_256' ,@af_apellido),0,'a')
	INSERT INTO rol_por_usuarios VALUES((SELECT us_id FROM usuarios u WHERE u.us_username like @af_numdoc),
										(SELECT rol_id FROM rol r WHERE r.rol_nombre = 'Afiliado'))
	SET IDENTITY_INSERT afiliado ON;
	INSERT INTO afiliado(af_id, af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo, af_status)
	VALUES (@af_id, (SELECT af_cantidad_familiares FROM afiliado WHERE af_id = @af_id AND af_rel_id = 0)+1, (SELECT us_id FROM usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc)), 
			@af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo, 'a')
	SET IDENTITY_INSERT afiliado OFF;
END
GO

CREATE PROCEDURE getDatosForCompraBono
	@us_id INT
AS
BEGIN
SELECT af_id, af_rel_id, planmed_id FROM afiliado WHERE us_id = @us_id
END
GO

CREATE PROCEDURE getDatosDelAfiliado
	@af_id BIGINT,
	@af_rel_id TINYINT
AS
BEGIN
SELECT * FROM afiliado 
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
		INSERT INTO logs_cambio_plan
		(af_id,af_rel_id,plan_id_ant,plan_id_new,cambio_plan_motivo,cambio_plan_fecha)
		VALUES (@af_id,
				@af_rel_id,
				(SELECT planmed_id FROM afiliado WHERE af_id = @af_id AND af_rel_id = @af_rel_id),
				@planmed_id,
				@motivoCambio,
				@fecha
				)
	END
	BEGIN
	UPDATE afiliado 
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
        FROM rol r 
	JOIN rol_por_usuarios u ON r.rol_id = u.rol_id 
	WHERE u.us_id = @us_id
	AND r.rol_status like 'a'	
END
GO

CREATE PROCEDURE getAllRoles

AS
BEGIN
	SELECT rol_id 'ID del rol', rol_nombre 'Nombre del rol', rol_status 'Estado del rol'  FROM rol
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
	SELECT f.fun_id, f.fun_nombre 
	FROM funcionalidad_por_rol r JOIN funcionalidad f
	ON r.fun_id = f.fun_id
	WHERE rol_id = @id_rol
END
GO
	
CREATE PROCEDURE InsertarRol
	@nombre_rol VARCHAR(30)
AS
BEGIN
	INSERT into rol(rol_nombre,rol_status)VALUES(@nombre_rol,'a')
END
GO

CREATE PROCEDURE InsertarRolXFuncionalidad
	@nombre_rol VARCHAR(30),
	@fun_id INT
AS
BEGIN
	INSERT into funcionalidad_por_rol VALUES( (SELECT rol_id FROM rol WHERE rol_nombre like @nombre_rol), @fun_id)
END
GO

CREATE PROCEDURE getRol
	@rol_nombre VARCHAR(30)
AS
BEGIN
	SELECT rol_id 'ID del Rol', rol_nombre 'Nombre del rol', rol_status 'Estado del Rol' FROM rol WHERE rol_nombre like @rol_nombre
END
GO

CREATE PROCEDURE deactivateRol
	@rol_id INT
AS BEGIN
	UPDATE rol SET rol_status = 'd' WHERE rol_id = @rol_id
	DELETE FROM rol_por_usuarios WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE activateRol
	@rol_id INT
AS
BEGIN
	UPDATE rol SET rol_status = 'a' 
	WHERE rol_id = @rol_id
END
GO

CREATE PROCEDURE updateRXF
	@id_rol INT
AS
BEGIN
	DELETE FROM funcionalidad_por_rol WHERE rol_id = @id_rol
END
GO

CREATE PROCEDURE updateRol
	@nombre_rol VARCHAR(30),
	@id_rol INT
AS
BEGIN
	UPDATE rol SET rol_nombre = @nombre_rol WHERE rol_id = @id_rol
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


-- PARA COMPRA BONO
CREATE PROCEDURE getPlanesMedicos
AS
BEGIN
SELECT planmed_id
FROM Plan_medico
END
GO

CREATE PROCEDURE getPrecioBonoDelPlan
	@planmed_id INT
AS
BEGIN
SELECT plan_precio_bono
FROM plan_medico
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
	INSERT INTO registro_compra(compra_af,compra_af_rel,compra_cantidad,compra_monto,compra_fecha)
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
	SELECT @af_id = turno_af, @af_rel_id = turno_af_rel FROM turnos
	WHERE turno_id = @turno_id
	
	SELECT @plan_med = planmed_id FROM afiliado a 
	JOIN turnos t ON a.af_id = t.turno_af AND a.af_rel_id = t.turno_af_rel
	WHERE a.af_id = @af_id AND a.af_rel_id = @af_rel_id

	SELECT @tipoEsp_id = tipoEsp_id FROM especialidad WHERE esp_id = (SELECT turno_esp FROM turnos WHERE turno_id = @turno_id)

	IF NOT EXISTS (SELECT 1 FROM tipo_especialidades_por_planes WHERE planmed_id = @plan_med AND tipoEsp_id = @tipoEsp_id)
		RAISERROR('El bono seleccionado para la consulta no es válido', 16, 16)
END
GO

CREATE PROCEDURE getBonosDisponibles
	@af_id BIGINT
AS
BEGIN

SELECT bono_id 'ID del bono', bono_planmed ' Plan medico que cubre el bono'
FROM bono
WHERE bono_nro_consulta IS NULL
AND bono_af = @af_id

END
GO



-- PARA REGISTRO DE AGENDA
CREATE PROCEDURE getEspecialidadesMedicas
AS
BEGIN
	SELECT esp_id, esp_descripcion FROM especialidad
END
GO

CREATE PROCEDURE getEspecialidadesPorProfesional
	@us_id INT
AS
BEGIN
	SELECT c.esp_id'ID de la especialidad', c.esp_descripcion 'Nombre de la especialidad'
    FROM profesional a, especialidad_por_profesional b, especialidad c
	WHERE a.us_id = @us_id AND b.prof_id = a.prof_id AND c.esp_id = b.esp_id
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
			IF (SELECT COUNT(*) FROM agenda_profesional WHERE agenda_prof = @id AND agenda_fechayhora = (@d2 + CONVERT(DATETIME, @inicialBucle))) > 0
			BEGIN
				SET @error_bandera = 1
				RAISERROR('Estas sobre-escribiendo una agenda agregada anteriormente',16,1)
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
			IF (SELECT COUNT(*) FROM agenda_profesional WHERE agenda_prof = @id AND agenda_fechayhora = (@d + CONVERT(DATETIME, @inicialBucle))) > 0
			BEGIN
				ROLLBACK TRANSACTION
				BREAK
			END
			INSERT INTO agenda_profesional VALUES (@id, @especialidad, @d + CONVERT(DATETIME, @inicialBucle))
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

	SELECT t.turno_id ' ID del turno' , e.esp_descripcion'Nombre de la especialidad' , p.prof_apellido'Apellido del profesiona', a.agenda_fechayhora 'Fecha'
	FROM turnos t
	JOIN profesional p ON t.turno_prof = p.prof_id
	JOIN especialidad e ON e.esp_id = t.turno_esp
	JOIN agenda_profesional a ON agenda_id = t.turno_agenda 
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

	INSERT INTO consulta_medica(cons_turno,cons_bono,cons_hora_llegada)
				VALUES(@turno_id,@bono_id,CONVERT(DATETIME,@hora_llegada,126))

	UPDATE bono SET bono_nro_consulta= (SELECT MAX(bono_nro_consulta)+1 FROM bono WHERE bono_af = @af_id AND bono_af_rel = @af_rel_id),
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
	FROM turnos t 
	JOIN consulta_medica c 
	ON turno_id = cons_turno
	WHERE turno_estado = 0
END
GO

CREATE PROCEDURE getTurnosDelProfesional
	@prof_id INT
AS
BEGIN
	SELECT turno_id 'ID del turno', DATEPART(YEAR,turno_fecha)'Año', DATEPART(MONTH,turno_fecha)'Mes', DATEPART (DAY, turno_fecha) 'Dia', DATEPART(HOUR,turno_fecha)'Hora', DATEPART(MINUTE,turno_fecha)'Minutos', turno_af'ID Familiar', turno_af_rel 'ID Relacional' 
	FROM turnos
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
	INSERT INTO turnos VALUES ((SELECT agenda_fechayhora FROM agenda_profesional WHERE agenda_id = @turno_agenda), 0 , @turno_agenda, @turno_afi, @turno_af_rel, @turno_prof, @turno_esp)
END
GO

CREATE PROCEDURE dameTurnosDisponiblesDeLaFecha
	@fecha VARCHAR(20)
AS
BEGIN
	SELECT DATEPART(hour,agenda_fechayhora) 'Hora', DATEPART(minute, agenda_fechayhora) 'Minutos', agenda_id  'ID de la agenda'
	FROM agenda_profesional
	WHERE agenda_id NOT IN (SELECT turno_agenda FROM turnos WHERE turno_estado = 0)	
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
	UPDATE consulta_medica 
	SET cons_sintomas = @sintomas,
	cons_diagnostico = @diagnostico
	WHERE cons_id = @cons_id

	UPDATE turnos SET turno_estado = 1 WHERE turno_id = (SELECT cons_turno FROM consulta_medica WHERE cons_id = @cons_id)
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
	
	PRINT @desde + '   ' +  @hasta

	INSERT INTO periodo_baja(periodo_desde,periodo_hasta,prof_id) VALUES(@desde, @hasta, @prof_id)
END
GO

CREATE PROCEDURE cancelTurno
   	@turno_id INT, 
	@cancel_motivo VARCHAR(30) , 
	@cancel_tipo CHAR(1)
AS
BEGIN
    INSERT INTO cancelacion VALUES (@cancel_tipo, @cancel_motivo, @turno_id)
	UPDATE turnos SET turno_estado = 2, turno_agenda = NULL WHERE  turno_id = @turno_id
END
GO



-- LISTADOS
CREATE PROCEDURE getListado1
	@fecha_inicio DATETIME,
	@fecha_fin DATETIME
AS
BEGIN
	SELECT TOP 5 t.turno_esp 'ID Especialidad', e.esp_descripcion 'Nombre especialidad', COUNT(c.cancel_id) 'Cantidad de cancelaciones'
	FROM cancelacion c
	JOIN turnos t ON c.turno_id = t.turno_id
	JOIN especialidad e ON t.turno_esp = e.esp_id
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
	FROM turnos t
	JOIN profesional p ON t.turno_prof = p.prof_id
	JOIN especialidad e ON t.turno_esp = e.esp_id
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
	FROM turnos t
	JOIN profesional p ON t.turno_prof = p.prof_id
	JOIN especialidad e ON t.turno_esp = e.esp_id
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
	FROM bono b
	JOIN afiliado a ON b.bono_af = a.af_id AND b.bono_af_rel = a.af_rel_id
	JOIN registro_compra r ON b.bono_compra = r.compra_id
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
	FROM turnos t
	JOIN especialidad e ON t.turno_esp = e.esp_id
	WHERE turno_fecha BETWEEN @fecha_inicio AND @fecha_fin
	AND turno_estado = 1
	GROUP BY t.turno_esp, e.esp_descripcion
	ORDER BY 'Bonos utilizados' DESC
END
GO
