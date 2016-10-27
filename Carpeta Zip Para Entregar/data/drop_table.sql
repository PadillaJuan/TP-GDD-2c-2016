ALTER TABLE afiliado DROP constraint FK_afi_usuario;
ALTER TABLE afiliado DROP constraint FK_plan_med;

ALTER TABLE logs_cambio_plan DROP constraint FK_afi;
ALTER TABLE logs_cambio_plan DROP constraint FK_plan_ant;	
ALTER TABLE logs_cambio_plan DROP constraint FK_plan_new;

ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_1;
ALTER TABLE servicios_por_planes DROP constraint FK_srv_por_planes_2;
	

ALTER TABLE registro_compra DROP constraint FK_compra_afi;	

ALTER TABLE bono DROP constraint FK_compra_bono;	
ALTER TABLE bono DROP constraint FK_plan_bono;		
ALTER TABLE bono DROP constraint FK_afi_bono;	

ALTER TABLE consulta_medica DROP constraint FK_consulta_turno;	
ALTER TABLE consulta_medica DROP constraint FK_consulta_bono;	

ALTER TABLE turnos DROP constraint FK_turno_afi;
ALTER TABLE turnos DROP constraint FK_turno_prof;		
ALTER TABLE turnos DROP constraint FK_turno_esp;

ALTER TABLE cancelacion DROP constraint FK_cancelacion_turno;	

ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof;	
ALTER TABLE agenda_profesional DROP constraint FK_agenda_prof2;	
	
ALTER TABLE especialidad DROP constraint FK_especialidad_tipo;

ALTER TABLE profesional DROP constraint FK_prof_us;
	
ALTER TABLE periodo_baja DROP constraint FK_baja_prof;	

ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_id;
ALTER TABLE rol_por_usuarios DROP constraint FK_rolxusr_rol;

ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_id;
ALTER TABLE funcionalidad_por_rol DROP constraint FK_funxrol_fun;

DROP TABLE agenda_profesional;
DROP TABLE cancelacion;
DROP TABLE bono;
DROP TABLE afiliado;
DROP TABLE consulta_medica;
DROP TABLE especialidad;
DROP TABLE especialidad_por_profesional;
DROP TABLE funcionalidad;
DROP TABLE funcionalidad_por_rol;
DROP TABLE logs_cambio_plan;
DROP TABLE periodo_baja;
DROP TABLE plan_medico;
DROP TABLE profesional;
DROP TABLE registro_compra;
DROP TABLE rol;
DROP TABLE rol_por_usuarios;
DROP TABLE servicios;
DROP TABLE servicios_por_planes;
DROP TABLE tipo_especialidades;
DROP TABLE turnos;
DROP TABLE usuarios;
