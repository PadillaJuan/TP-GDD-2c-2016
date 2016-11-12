CREATE PROCEDURE bajaAfiliado
	@id INT,
	@id_rel TINYINT
	AS
	BEGIN
	UPDATE afiliado
	SET af_status = 'D'
	SET af_fechaBaja = GETDATE()
	WHERE af_id = @id AND af_rel_id = @id_rel
END

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
	INSERT INTO afiliado(af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo)
	VALUES (@af_rel_id, @us_id, @af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, 0, @planmed_id , @af_sexo)
END

CREATE PROCEDURE getPlanesMedicos
AS
BEGIN
SELECT planmed_id
FROM Plan_medico
END

CREATE PROCEDURE getRolesPorUsuario
	@us_id INT
AS
BEGIN
	SELECT r.rol_id, r.rol_nombre, r.rol_status
        FROM rol r 
	JOIN rol_por_usuarios u ON r.rol_id = u.rol_id 
	WHERE u.id_usuario = @us_id
END

CREATE PROCEDURE getAllRoles

AS
BEGIN
	SELECT * FROM rol
END

CREATE PROCEDURE getAllFuncionalidades

AS
BEGIN
	SELECT * FROM funcionalidades
END

CREATE PROCEDURE getFuncionalidadDelRol
	@id_rol INT
AS
BEGIN
	SELECT fun_id FROM funcionalidad_por_rol
	WHERE rol_id = @id_rol
END
	
CREATE PROCEDURE InsertarRol
	@nombre_rol VARCHAR(30)
AS
BEGIN
	INSERT into rol(rol_nombre,rol_status)VALUES(@nombre_rol,'A')
END


