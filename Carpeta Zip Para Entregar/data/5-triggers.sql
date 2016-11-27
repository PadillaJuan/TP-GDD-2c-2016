/* ELIMINO TRIGGERS */

IF (OBJECT_ID('compraDeBonos', 'TR') IS NOT NULL)
	DROP TRIGGER compraDeBonos;
IF (OBJECT_ID('agregarFamiliar', 'TR') IS NOT NULL)
	DROP TRIGGER agregarFamiliar;
IF (OBJECT_ID('cancelarTurnosPorIntervalo', 'TR') IS NOT NULL)
	DROP TRIGGER cancelarTurnosPorIntervalo;
GO 

/* CREO TRIGGERS */


-- PARA LA COMPRA DE BONOS
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
GO

-- PARA ACTUALIZAR EL CAMPO cantidad_familiares DEL AFILIADO
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
GO


-- PARA DAR DE BAJA LOS TURNOS CUANDO SE EJECUTA EL STORED PROCEDURE bajaIntervalo
CREATE TRIGGER cancelarTurnosPorIntervalo
ON periodo_baja
AFTER INSERT
AS
BEGIN
	DECLARE @prof_id INT
	DECLARE @desde DATETIME
	DECLARE @hasta DATETIME

	SELECT @desde = periodo_desde, @hasta = periodo_hasta, @prof_id = prof_id 
	FROM inserted

	DECLARE @turno_id INT

	DECLARE cursorDeTurnos CURSOR FOR
		SELECT turno_id
		FROM turnos t 
		JOIN agenda_profesional a ON t.turno_agenda = a.agenda_id
		WHERE a.agenda_fechayhora BETWEEN @desde AND @hasta
		AND a.agenda_prof = @prof_id

	OPEN cursorDeTurnos

	FETCH NEXT FROM cursorDeTurnos INTO @turno_id

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT into cancelacion VALUES ('p', 'El profesional dio de baja el turno por un intervalo', @turno_id)

		UPDATE turnos SET turno_estado = 2 WHERE turno_id = @turno_id

		FETCH NEXT FROM cursorDeTurnos INTO @turno_id

	END
	CLOSE cursorDeTurnos
	DEALLOCATE cursorDeTurnos
END
GO

