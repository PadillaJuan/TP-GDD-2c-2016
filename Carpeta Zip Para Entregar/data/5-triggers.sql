/* ELIMINO TRIGGERS */

IF (OBJECT_ID('compraDeBonos', 'TR') IS NOT NULL)
	DROP TRIGGER compraDeBonos;
IF (OBJECT_ID('agregarFamiliar', 'TR') IS NOT NULL)
	DROP TRIGGER agregarFamiliar
	
GO 

/* CREO TRIGGERS */

CREATE TRIGGER compraDeBonos
	ON registro_compra
	AFTER INSERT
AS
BEGIN
	DECLARE @contador INT
	DECLARE @cantidad INT
	DECLARE @compra_id INT
	DECLARE @af_id BIGINT
	DECLARE @af_rel_id TINYINT

	SET @contador = 0
	SELECT @cantidad=i.compra_cantidad, @compra_id = i.compra_id, @af_id = i.compra_af, @af_rel_id = i.compra_af_rel FROM inserted i

	WHILE @contador < @cantidad
	BEGIN
		INSERT INTO bono(bono_compra,bono_planmed,bono_af,bono_af_rel)
		VALUES(@compra_id,(SELECT planmed_id FROM afiliado a WHERE a.af_id = @af_id AND a.af_rel_id = @af_rel_id),@af_id,@af_rel_id)
		SET @contador +=1
	END

END

CREATE TRIGGER agregarFamiliar
	ON afiliado
	AFTER INSERT
AS
BEGIN
	DECLARE @af_id BIGINT
	DECLARE @af_rel_id TINYINT
	SELECT @af_id = i.af_id, @af_rel_id = i.af_rel_id FROM inserted i
	IF (@af_rel_id <> 0)
		UPDATE afiliado SET af_cantidad_familiares+=1
		WHERE af_id = @af_id AND af_rel_id = 0
END

