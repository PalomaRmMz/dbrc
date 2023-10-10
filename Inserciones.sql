
INSERT INTO `usuarios` (`id`, `nombre_capturista`, `app_capturista`, `apm_capturista`, `usuario`, `password`, `rol`, `user_estado`) VALUES
(54, 'CARLOS', 'HERNÁNDEZ', 'SANZÓN', 'carlos10', 'carlos10', 'Administrador', 'Activo'),
(60, 'KAREN', 'SEDEÑO', 'IPATZI', 'sedeno', 'sedeno89', 'Administrador', 'Inactivo'),
(61, 'JUAN PABLO', 'RAMÍREZ', 'COSETL', 'jpablo89', 'jpablo89', 'Administrador', 'Inactivo'),
(62, 'OMAR', 'CISNEROS', 'MARTINEZ', 'omar89', 'omar88', 'Administrador', 'Inactivo'),
(75, 'JOSÉ ALFREDO', 'GALICIA', 'CERVANTES', 'jalfredo', 'jalfredo55', 'Administrador', 'Activo'),
(76, 'JUAN JESÚS', 'CORTÉS', 'SANTACRUZ', 'jesuscortes', 'jesus79', 'Administrador', 'Inactivo');



INSERT into tipo_eleccion VALUES(1,"Mayoria Relativa"), (2, "Representacion Proporcional"), (3,"Gubernatura");



INSERT INTO tipo_constitucion VALUES(1,"Partidos políticos");
INSERT INTO tipo_constitucion VALUES(2,"Coaliciones");
INSERT INTO tipo_constitucion VALUES(3,"Candidatura Común");
INSERT INTO tipo_constitucion VALUES(4,"Candidatos independientes");




INSERT INTO distrito VALUES(1 ,'San Antonio Calpulalpan',1);
INSERT INTO distrito VALUES(2 ,'Tlaxco de Morelos',1);
INSERT INTO distrito VALUES(3 ,'San Cosme Xaloztoc',1);
INSERT INTO distrito VALUES(4 ,'Apizaco',1);
INSERT INTO distrito VALUES(5 ,'San Dionicio Yauhquemehcan',1);
INSERT INTO distrito VALUES(6 ,'Ixtacuixtla de Mariano Matamoros',1);
INSERT INTO distrito VALUES(7 ,'Tlaxcala de Xicohtencatl',1);
INSERT INTO distrito VALUES(8 ,'San Bernardino Contla',1);
INSERT INTO distrito VALUES(9 ,'Santa Ana Chiautempan',1);
INSERT INTO distrito VALUES(10 ,'Huamantla',1);
INSERT INTO distrito VALUES(11 ,'Huamantla',1);
INSERT INTO distrito VALUES(12 ,'San Luis Teolocholco',1);
INSERT INTO distrito VALUES(13 ,'Zacatelco',1);
INSERT INTO distrito VALUES(14 ,'Santa Maria Nativitas',1);
INSERT INTO distrito VALUES(15 ,'Vicente Guerrero',1);
INSERT INTO distrito VALUES(16 ,'PLURINOMINAL',2);





INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",2,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Nueva Alianza",2,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",2,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",2,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - PS",2,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",2,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",3,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",3,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",3,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",3,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",3,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",4,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",4,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",4,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",4,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",4,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",4,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",4,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",5,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",5,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",5,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",5,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",5,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",5,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",5,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",6,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",6,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",6,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",6,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",6,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",7,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",7,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",7,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",7,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",7,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",8,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",8,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",8,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",8,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",8,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",8,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",9,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",9,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",9,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",9,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",9,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",10,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",10,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",10,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",10,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",10,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",11,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",11,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",11,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",11,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",11,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",11,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",11,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",12,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",12,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",12,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",12,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",12,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",13,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",13,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",13,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",13,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",13,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",13,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",13,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",14,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",14,2,2);
INSERT INTO combinaciones VALUES(null,"Juntos Haremos Historia (MORENA/PT/PES)",14,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Común PRI - PVEM - NA - PS",14,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",14,4,2);

INSERT INTO combinaciones VALUES(null,"Movimiento Ciudadano (MC)",15,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",15,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",15,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",15,1,2);
INSERT INTO combinaciones VALUES(null,"Por Tlaxcala al Frente (PAN/PRD/PAC)",15,2,2);
INSERT INTO combinaciones VALUES(null,"Candidatura  Común PRI - PVEM - NA - PS",15,3,2);
INSERT INTO combinaciones VALUES(null,"Candidatura Independiente",15,4,2);

INSERT INTO combinaciones VALUES(null,"Partido Acción Nacional (PAN)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Revolucionario Institucional (PRI)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido de la Revolución Democratica (PRD)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido del Trabajo (PT)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Movimiento Ciudadano",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Alianza Ciudadana (PAC)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Socialista (PS)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Verde Ecologista de México (PVEM)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Nueva Alianza",16,1,2);
INSERT INTO combinaciones VALUES(null,"Partido Encuentro Social (PES)",16,1,2);
INSERT INTO combinaciones VALUES(null,"Movimiento Regeneración Nacional (Morena)",16,1,2);



INSERT INTO combinaciones VALUES(null,'PARTIDO ACCIÓN NACIONAL' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO REVOLUCIÓN INSTITUCIONAL' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO DE LA REVOLUCIÓN DEMOCRÁTICA' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO VERDE ECOLOGÍSTA DE MÉXICO' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'MOVIMIENTO CIUDADANO' ,null,2,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO NUEVA ALIANZA' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO ALIANZA CIUDADANA' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO SOCIALISTA' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'MORENA' ,null,2,1);
INSERT INTO combinaciones VALUES(null,'PARTIDO ENCUENTRO SOCIAL' ,null,1,1);
INSERT INTO combinaciones VALUES(null,'CANDIDATO INDEPENDIENTE' ,null,4,1);






	INSERT INTO estados VALUES(1 ,'Aguascalientes');
	INSERT INTO estados VALUES(2 ,'Baja California');
	INSERT INTO estados VALUES(3 ,'Baja California Sur');
	INSERT INTO estados VALUES(4 ,'Campeche');
	INSERT INTO estados VALUES(5 ,'Chiapas');
	INSERT INTO estados VALUES(6 ,'Chihuahua');
	INSERT INTO estados VALUES(7 ,'Coahuila');
	INSERT INTO estados VALUES(8 ,'Colima');
	INSERT INTO estados VALUES(9 ,'Distrito Federal');
	INSERT INTO estados VALUES(10 ,'Durango');
	INSERT INTO estados VALUES(11 ,'Estado de México');
	INSERT INTO estados VALUES(12 ,'Guanajuato');
	INSERT INTO estados VALUES(13 ,'Guerrero');
	INSERT INTO estados VALUES(14 ,'Hidalgo');
	INSERT INTO estados VALUES(15 ,'Jalisco');
	INSERT INTO estados VALUES(16 ,'Michoacán');
	INSERT INTO estados VALUES(17 ,'Morelos');
	INSERT INTO estados VALUES(18 ,'Nayarit');
	INSERT INTO estados VALUES(19 ,'Nuevo León');
	INSERT INTO estados VALUES(20 ,'Oaxaca');
	INSERT INTO estados VALUES(21 ,'Puebla');
	INSERT INTO estados VALUES(22 ,'Querétaro');
	INSERT INTO estados VALUES(23 ,'Quintana Roo');
	INSERT INTO estados VALUES(24 ,'San Luis Potosí');
	INSERT INTO estados VALUES(25 ,'Sinaloa');
	INSERT INTO estados VALUES(26 ,'Sonora');
	INSERT INTO estados VALUES(27 ,'Tabasco');
	INSERT INTO estados VALUES(28 ,'Tamaulipas');
	INSERT INTO estados VALUES(29 ,'Tlaxcala');
	INSERT INTO estados VALUES(30 ,'Veracruz');
	INSERT INTO estados VALUES(31 ,'Yucatán');
	INSERT INTO estados VALUES(32 ,'Zacatecas');