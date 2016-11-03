CREATE PROCEDURE bajaAfiliado
	@id LONG
	@id_rel SMALLINT
	AS
	BEGIN
	UPDATE afiliado
	SET af_status = "D"
	SET af_fechaBaja = CURDATE()
	WHERE af_id = @id AND af_rel_id = @id_rel