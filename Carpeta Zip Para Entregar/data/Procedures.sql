CREATE PROCEDURE bajaAfiliado
	@id INT,
	@id_rel TINYINT
	AS
	BEGIN
	UPDATE afiliado
	SET af_status = 'D'
	SET af_fechaBaja = GETDATE()
	WHERE af_id = @id AND af_rel_id = @id_rel


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
	@af_cantidad_familiares TINYINT,
	@planmed_id numeric(18,0),
	@af_sexo CHAR(1)
	AS
	BEGIN
	INSERT INTO afiliado(af_rel_id, us_id, af_nombre ,af_apellido ,af_tipodoc, af_numdoc, af_direccion , af_telefono , af_mail , af_nacimiento , af_estado_civil, af_cantidad_familiares, planmed_id , af_sexo)
	VALUES (@af_rel_id, @us_id, @af_nombre , @af_apellido , @af_tipodoc, @af_numdoc, @af_direccion , @af_telefono , @af_mail , @af_nacimiento , @af_estado_civil, @af_cantidad_familiares, @planmed_id , @af_sexo)

CREATE PROCEDURE getPlanesMedicos
AS
BEGIN
SELECT planmed_id
FROM Plan_medico