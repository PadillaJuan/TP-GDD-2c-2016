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
