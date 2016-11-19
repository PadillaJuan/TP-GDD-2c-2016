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

CREATE PROCEDURE setAdmin
AS
BEGIN
	DECLARE @us_id INT
	INSERT INTO usuarios VALUES('admin',HASHBYTES('SHA2_256','w23e'),0,'a')
	
	SET @us_id = SCOPE_IDENTITY()
	
	INSERT INTO rol_por_usuarios
	SELECT @us_id, r.rol_id 
	FROM rol r

	INSERT INTO afiliado (af_rel_id, us_id,planmed_id)
		VALUES (0,@us_id,555555)

	INSERT INTO profesional (us_id) VALUES (@us_id)

	INSERT INTO especialidad_por_profesional 
		SELECT SCOPE_IDENTITY(), esp_id FROM especialidad

END