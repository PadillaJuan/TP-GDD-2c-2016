

IF (OBJECT_ID('FK_plan_med', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_plan_med;
GO
IF (OBJECT_ID('FK_afi_usuario', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.afiliado DROP constraint FK_afi_usuario;
GO
IF (OBJECT_ID('FK_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_afi;
GO
IF (OBJECT_ID('FK_plan_ant', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_ant;
GO
IF (OBJECT_ID('FK_plan_new', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.logs_cambio_plan DROP constraint FK_plan_new;

IF (OBJECT_ID('FK_esp_por_planes_1', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_1
GO
IF (OBJECT_ID('FK_esp_por_planes_2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.tipo_especialidades_por_planes DROP constraint FK_esp_por_planes_2
GO
	
IF (OBJECT_ID('FK_compra_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.registro_compra DROP constraint FK_compra_afi;
GO

IF (OBJECT_ID('FK_compra_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_compra_bono;
GO
IF (OBJECT_ID('FK_plan_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_plan_bono;
GO
IF (OBJECT_ID('FK_afi_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.bono DROP constraint FK_afi_bono;
GO

IF (OBJECT_ID('FK_consulta_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_turno;
GO
IF (OBJECT_ID('FK_consulta_bono', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.consulta_medica DROP constraint FK_consulta_bono;
GO

IF (OBJECT_ID('FK_turno_afi', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_afi;
GO
IF (OBJECT_ID('FK_turno_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_prof;
GO
IF (OBJECT_ID('FK_turno_esp', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_esp;
GO
IF (OBJECT_ID('FK_turno_agenda', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.turnos DROP constraint FK_turno_agenda;
GO

IF (OBJECT_ID('FK_cancelacion_turno', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.cancelacion DROP constraint FK_cancelacion_turno;
GO

IF (OBJECT_ID('FK_agenda_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof;
GO
IF (OBJECT_ID('FK_agenda_prof2', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.agenda_profesional DROP constraint FK_agenda_prof2;
GO
	
IF (OBJECT_ID('FK_especialidad_tipo', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.especialidad DROP constraint FK_especialidad_tipo;
GO

IF (OBJECT_ID('FK_prof_us', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.profesional DROP constraint FK_prof_us;
GO
	
IF (OBJECT_ID('FK_baja_prof', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.periodo_baja DROP constraint FK_baja_prof;
GO

IF (OBJECT_ID('FK_rolxusr_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_id;
GO
IF (OBJECT_ID('FK_rolxusr_rol', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.rol_por_usuarios DROP constraint FK_rolxusr_rol;
GO

IF (OBJECT_ID('FK_funxrol_id', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_id;
GO
IF (OBJECT_ID('FK_funxrol_fun', 'F') IS NOT NULL)
	ALTER TABLE DREAM_TEAM.funcionalidad_por_rol DROP constraint FK_funxrol_fun;
GO
	
	--ELIMINACION DE TABLAS
	--ELIMINACION DE TABLAS

IF (OBJECT_ID('DREAM_TEAM.afiliado','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.afiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.logs_cambio_plan','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.logs_cambio_plan;
GO
IF (OBJECT_ID('DREAM_TEAM.plan_medico','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.plan_medico;
GO
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades_por_planes','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades_por_planes;
GO
IF (OBJECT_ID('DREAM_TEAM.registro_compra','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.registro_compra;
GO
IF (OBJECT_ID('DREAM_TEAM.bono','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.bono;
GO
IF (OBJECT_ID('DREAM_TEAM.consulta_medica','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.consulta_medica;
GO
IF (OBJECT_ID('DREAM_TEAM.turnos','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.turnos;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelacion','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.cancelacion;
GO
IF (OBJECT_ID('DREAM_TEAM.agenda_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.agenda_profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.tipo_especialidades','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.tipo_especialidades;
GO
IF (OBJECT_ID('DREAM_TEAM.especialidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad;
GO
IF (OBJECT_ID('DREAM_TEAM.especialidad_por_profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.especialidad_por_profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.profesional','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.profesional;
GO
IF (OBJECT_ID('DREAM_TEAM.periodo_baja','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.periodo_baja;
GO
IF (OBJECT_ID('DREAM_TEAM.usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.usuarios;
GO
IF (OBJECT_ID('DREAM_TEAM.rol_por_usuarios','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol_por_usuarios;
GO
IF (OBJECT_ID('DREAM_TEAM.rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.rol;
GO
IF (OBJECT_ID('DREAM_TEAM.funcionalidad_por_rol','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad_por_rol;
GO
IF (OBJECT_ID('DREAM_TEAM.funcionalidad','U') IS NOT NULL)
	DROP TABLE DREAM_TEAM.funcionalidad;
GO


IF EXISTS (SELECT * FROM sys.schemas WHERE sys.schemas.name = 'DREAM_TEAM')
	DROP SCHEMA DREAM_TEAM
GO


if OBJECT_ID('DREAM_TEAM.migrarAfiliados') is not null
 begin
	drop procedure DREAM_TEAM.migrarAfiliados
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarPlanMedico') is not null
 begin
	drop procedure DREAM_TEAM.migrarPlanMedico
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarProfesional') is not null
 begin
	drop procedure DREAM_TEAM.migrarProfesional
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarTipoEspecialidades') is not null
 begin
	drop procedure DREAM_TEAM.migrarTipoEspecialidades
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarEspecialidad') is not null
 begin
	drop procedure DREAM_TEAM.migrarEspecialidad
 end
 go

 if OBJECT_ID('DREAM_TEAM.migrarEspecialidadPorProfesional') is not null
 begin
	drop procedure DREAM_TEAM.migrarEspecialidadPorProfesional
end
go

 if OBJECT_ID('DREAM_TEAM.migrarTurnos') is not null
 begin
	drop procedure DREAM_TEAM.migrarTurnos
 end
 go

if OBJECT_ID('DREAM_TEAM.migrarRegistroCompra') is not null
begin
	drop procedure DREAM_TEAM.migrarRegistroCompra
end
go

if OBJECT_ID('DREAM_TEAM.migrarBonos') is not null
begin
	drop procedure DREAM_TEAM.migrarBonos
end
go

if OBJECT_ID('DREAM_TEAM.migrarConsultas') is not null
begin
	drop procedure DREAM_TEAM.migrarConsultas
end
go

if OBJECT_ID('DREAM_TEAM.migrarAgendaProfesional') is not null
begin
	drop procedure DREAM_TEAM.migrarAgendaProfesional
end
go

IF (OBJECT_ID('DREAM_TEAM.bajaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.bajaAfiliado;
GO

IF (OBJECT_ID('DREAM_TEAM.altaAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.altaAfiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.getNextRelID', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getNextRelID;
GO
IF (OBJECT_ID('DREAM_TEAM.altaFamiliar', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.altaFamiliar;
GO
IF (OBJECT_ID('DREAM_TEAM.getDatosForCompraBono', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getDatosForCompraBono;
GO
IF (OBJECT_ID('DREAM_TEAM.getDatosDelAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getDatosDelAfiliado;
GO
IF (OBJECT_ID('DREAM_TEAM.actualizarAfiliado', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.actualizarAfiliado;
GO

-- PARA ABM ROL
IF (OBJECT_ID('DREAM_TEAM.getRolesPorUsuario', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getRolesPorUsuario;
GO
IF (OBJECT_ID('DREAM_TEAM.getAllRoles', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getAllRoles;
GO
IF (OBJECT_ID('DREAM_TEAM.getAllFuncionalidades', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getAllFuncionalidades;
GO
IF (OBJECT_ID('DREAM_TEAM.getFuncionalidadDelRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getFuncionalidadDelRol;
GO
IF (OBJECT_ID('DREAM_TEAM.InsertarRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.InsertarRol;
GO
IF (OBJECT_ID('DREAM_TEAM.InsertarRolXFuncionalidad', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.InsertarRolXFuncionalidad;
GO
IF (OBJECT_ID('DREAM_TEAM.getRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getRol;
GO
IF (OBJECT_ID('DREAM_TEAM.deactivateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.deactivateRol;
GO
IF (OBJECT_ID('DREAM_TEAM.activateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.activateRol;
GO
IF (OBJECT_ID('DREAM_TEAM.updateRXF', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.updateRXF;
GO
IF (OBJECT_ID('DREAM_TEAM.updateRol', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.updateRol;
GO

-- LOGIN
IF (OBJECT_ID('DREAM_TEAM.login', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.login;
GO

-- PARA COMPRA BONO
IF (OBJECT_ID('DREAM_TEAM.getPlanesMedicos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getPlanesMedicos;
GO
IF (OBJECT_ID('DREAM_TEAM.getPrecioBonoDelPlan', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getPrecioBonoDelPlan;
GO
IF (OBJECT_ID('DREAM_TEAM.comprarBonos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.comprarBonos;
GO
IF (OBJECT_ID('DREAM_TEAM.checkBono', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.checkBono;
GO
IF (OBJECT_ID('DREAM_TEAM.getBonosDisponibles', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getBonosDisponibles;
GO

	-- PARA REGISTRO DE AGENDA
IF (OBJECT_ID('DREAM_TEAM.getEspecialidadesMedicas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getEspecialidadesMedicas;
GO
IF (OBJECT_ID('DREAM_TEAM.getEspecialidadesPorProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getEspecialidadesPorProfesional;
GO
IF (OBJECT_ID('DREAM_TEAM.addHorasAgenda', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.addHorasAgenda;	
GO
IF (OBJECT_ID('DREAM_TEAM.getTurnos', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getTurnos;
GO
IF (OBJECT_ID('DREAM_TEAM.comprobar48horas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.comprobar48horas;
GO


-- PARA PEDIDO DE TURNOS Y REGISTROS DE LLEGADA/CONSULTA
IF (OBJECT_ID('DREAM_TEAM.generateConsultaMedica', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.generateConsultaMedica;
GO
IF (OBJECT_ID('DREAM_TEAM.getConsultas', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getConsultas;
GO
IF (OBJECT_ID('DREAM_TEAM.getTurnosDelProfesional', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getTurnosDelProfesional;
GO
IF (OBJECT_ID('DREAM_TEAM.reservarTurno', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.reservarTurno;
GO
IF (OBJECT_ID('DREAM_TEAM.dameTurnosDisponiblesDeLaFecha', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.dameTurnosDisponiblesDeLaFecha;
GO
IF (OBJECT_ID('DREAM_TEAM.finalizarConsulta', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.finalizarConsulta;
GO
IF (OBJECT_ID('DREAM_TEAM.bajaIntervalo', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.bajaIntervalo;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelTurno', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.cancelTurno;
GO


-- LISTADOS
IF (OBJECT_ID('DREAM_TEAM.getListado1', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado1;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado2', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado2;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado3', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado3;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado4', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado4;
GO
IF (OBJECT_ID('DREAM_TEAM.getListado5', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.getListado5;
GO


IF (OBJECT_ID('DREAM_TEAM.setAdmin', 'P') IS NOT NULL)
	DROP PROCEDURE DREAM_TEAM.setAdmin;
GO

if OBJECT_ID('DREAM_TEAM.setTipoEspPorPlan') is not null
begin
	drop procedure DREAM_TEAM.setTipoEspPorPlan
end
go

IF (OBJECT_ID('DREAM_TEAM.compraDeBonos', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.compraDeBonos;
GO
IF (OBJECT_ID('DREAM_TEAM.agregarFamiliar', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.agregarFamiliar;
GO
IF (OBJECT_ID('DREAM_TEAM.cancelarTurnosPorIntervalo', 'TR') IS NOT NULL)
	DROP TRIGGER DREAM_TEAM.cancelarTurnosPorIntervalo;
GO 