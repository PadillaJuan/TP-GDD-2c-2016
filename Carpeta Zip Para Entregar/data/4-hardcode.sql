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
WHERE tablaRol.rol_nombre = 'Afiliado' AND tablaFuncionalidad.fun_nombre IN ('Compra de Bonos', 'Pedido de Turno','Cancelar Atencion Medica');
GO

/*Creo el rol Profesional*/

INSERT INTO rol(rol_nombre, rol_status) VALUES('Profesional', 'a');
GO

/*Se agregan funcionalidades al rol Profesional*/

INSERT INTO funcionalidad_por_rol (rol_id,fun_id)
SELECT tablaRol.rol_id,tablaFuncionalidad.fun_Id 
FROM rol  tablaRol, funcionalidad tablaFuncionalidad
WHERE tablaRol.rol_nombre = 'Profesional' AND tablaFuncionalidad.fun_nombre IN ('Registrar Agenda Profesional', 'Registro de Resultado', 'Cancelar Atencion Medica');
GO


------------------------------------- INGRESO LOS ROLES DE LOS PROFESIONALES Y DE LOS AFILIADOS ----------------------------------------------------------

	INSERT INTO rol_por_usuarios 
	SELECT us_id, 2 FROM afiliado

		
	INSERT INTO rol_por_usuarios
	SELECT us_id, 3  FROM profesional

----------------------------------------- CUENTA ADMIN -----------------------------------------------------------------

IF (OBJECT_ID('setAdmin', 'P') IS NOT NULL)
	DROP PROCEDURE setAdmin;
GO

CREATE PROCEDURE setAdmin
AS
BEGIN
	DECLARE @us_id INT
	INSERT INTO usuarios VALUES('admin',HASHBYTES('SHA2_256','w23e'),0,'a')
	
	SELECT @us_id = us_id FROM usuarios WHERE us_username like 'admin'
	
	INSERT INTO rol_por_usuarios
	SELECT @us_id, r.rol_id 
	FROM rol r

	INSERT INTO afiliado (af_rel_id, us_id,planmed_id, af_tipodoc, af_numdoc)
		VALUES (0,@us_id,555555,'DNI',0)

	INSERT INTO profesional (us_id) VALUES (@us_id)

	INSERT INTO especialidad_por_profesional 
		SELECT (SELECT prof_id FROM profesional WHERE us_id = @us_id), esp_id FROM especialidad

END
GO

exec setAdmin
GO

----------------------------------------- SETEO PLANES Y ESPECIALIDADES RELACIONADAS -----------------------------------------------------------------
if OBJECT_ID('setTipoEspPorPlan') is not null
begin
	drop procedure setTipoEspPorPlan
end
go

CREATE PROCEDURE setTipoEspPorPlan
AS
BEGIN
	INSERT INTO tipo_especialidades_por_planes VALUES (555555,1000)

	INSERT INTO tipo_especialidades_por_planes VALUES (555556,1000)
	INSERT INTO tipo_especialidades_por_planes VALUES (555556,1001)

	INSERT INTO tipo_especialidades_por_planes VALUES (555557,1000)
	INSERT INTO tipo_especialidades_por_planes VALUES (555557,1002)
		
	INSERT INTO tipo_especialidades_por_planes VALUES (555558,1000)
	INSERT INTO tipo_especialidades_por_planes VALUES (555558,1001)
	INSERT INTO tipo_especialidades_por_planes VALUES (555558,1002)

	INSERT INTO tipo_especialidades_por_planes VALUES (555559,1000)
	INSERT INTO tipo_especialidades_por_planes VALUES (555559,1001)
	INSERT INTO tipo_especialidades_por_planes VALUES (555559,1002)
	INSERT INTO tipo_especialidades_por_planes VALUES (555559,1003)

END
GO

exec setTipoEspPorPlan
GO
