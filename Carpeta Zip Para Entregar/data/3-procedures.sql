/* DROP PROCEDURE */

IF (OBJECT_ID('bajaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE bajaAfiliado;
IF (OBJECT_ID('altaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE altaAfiliado;
IF (OBJECT_ID('getNextRelID', 'P') IS NOT NULL)
	DROP PROCEDURE getNextRelID;
IF (OBJECT_ID('getPlanesMedicos', 'P') IS NOT NULL)
	DROP PROCEDURE getPlanesMedicos;
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
IF (OBJECT_ID('login', 'P') IS NOT NULL)
	DROP PROCEDURE login;
IF (OBJECT_ID('getRol', 'P') IS NOT NULL)
	DROP PROCEDURE getRol;
IF (OBJECT_ID('deactivateRol', 'P') IS NOT NULL)
	DROP PROCEDURE deactivateRol;
IF (OBJECT_ID('activateRol', 'P') IS NOT NULL)
	DROP PROCEDURE activateRol;
IF (OBJECT_ID('updateRXF', 'P') IS NOT NULL)
	DROP PROCEDURE updateRXF;
IF (OBJECT_ID('getDatosDelAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE getDatosDelAfiliado;
IF (OBJECT_ID('actualizarAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE actualizarAfiliado;
IF (OBJECT_ID('getPrecioBonoDelPlan', 'P') IS NOT NULL)
	DROP PROCEDURE getPrecioBonoDelPlan;
IF (OBJECT_ID('comprarBonos', 'P') IS NOT NULL)
	DROP PROCEDURE comprarBonos;
IF (OBJECT_ID('altaFamiliar', 'P') IS NOT NULL)
	DROP PROCEDURE altaFamiliar;

	
GO

/* CREATE PROCEDURE */

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

GO

CREATE PROCEDURE updateRXF
	@id_rol INT
AS
BEGIN
	DELETE FROM funcionalidad_por_rol WHERE rol_id = @id_rol
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
	@fecha DATETIME
AS
BEGIN
	IF @motivoCambio IS NOT NULL
	BEGIN
		PRINT @motivoCambio+'HOLA'
	END
	IF @motivoCambio != ''
	BEGIN
		PRINT @motivoCambio+'CHAU'
	END
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
		planmed_id = @planmed_id
		WHERE af_id = @af_id AND af_rel_id = @af_rel_id
	END
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
	INSERT INTO afiliado(af_id, af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo)
	VALUES (@af_id, (SELECT af_cantidad_familiares FROM afiliado WHERE af_id = @af_id AND af_rel_id = 0)+1, (SELECT us_id FROM usuarios WHERE us_username like CONVERT(varchar(30), @af_numdoc)), 
			@af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo)
	SET IDENTITY_INSERT afiliado OFF;
END
GO

