
DELIMITER $$
CREATE PROCEDURE getRegistrosCandidatos( IN clave_elector VARCHAR(256) )
BEGIN

	SELECT
		candidatura_diputado.id as id_reg,
		candidatura_diputado.nombre,
		apellido_paterno,
		apellido_materno,
		tipo_eleccion.nombre as candidatura,
		combinaciones.nombre as partido_politico,
		distrito.nombre as nombre_distrito,
		estados.nombre_estado, 
		fec_nacimiento,
		genero,
		clave_elector,
		curp,
		tiempo_residencia,
		sobrenombre,
		prelacion,
		propietario_suplente,
		candidatura_diputado.estado,
		candidatura_diputado.id_documento
		
		FROM candidatura_diputado, combinaciones, tipo_eleccion, distrito, estados
		WHERE candidatura_diputado.clave_elector = clave_elector AND candidatura_diputado.partido_politico = combinaciones.id_combinaciones 
		AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND candidatura_diputado.distrito = distrito.id_distrito AND candidatura_diputado.lugarnacimiento = estados.id_estado
		
	UNION ALL
	
	SELECT
		candidatura_gubernatura.id_gubertatura as id_reg,
		candidatura_gubernatura.nombre,
		candidatura_gubernatura.apellido_paterno,
		candidatura_gubernatura.apellido_materno,
		'GUBERNATURA' as candidatura,
		combinaciones.nombre as partido_politico,
		null as nombre_distrito,
		estados.nombre_estado,
		candidatura_gubernatura.fecha_nacimiento as fec_nacimiento,
		candidatura_gubernatura.genero,
		candidatura_gubernatura.clave_elector,
		candidatura_gubernatura.curp,
		candidatura_gubernatura.tiempo_residencia,
		candidatura_gubernatura.sobrenombre,
		null as prelacion,
		null as propietario_suplente,
		candidatura_gubernatura.estado,
		candidatura_gubernatura.id_documento
		
		
		FROM candidatura_gubernatura, combinaciones, estados 
		WHERE candidatura_gubernatura.clave_elector = clave_elector AND combinaciones.id_combinaciones = candidatura_gubernatura.partido_politico AND estados.id_estado = candidatura_gubernatura.lugar_nacimiento;
END;




DELIMITER $$
CREATE PROCEDURE EXISTE(IN clave_elector VARCHAR(256), IN curp VARCHAR(256))
BEGIN
	DECLARE valor INT;
	
	
	select COUNT(*) INTO valor WHERE
	EXISTS (select clave_elector from candidatura_gubernatura where candidatura_gubernatura.clave_elector = clave_elector || candidatura_gubernatura.curp = curp ) OR 
	EXISTS (select clave_elector from candidatura_diputado where candidatura_diputado.clave_elector = clave_elector || candidatura_diputado.curp = curp);
	
	
	
	SELECT valor AS existe;
END;



DELIMITER $$
CREATE PROCEDURE EXISTEV2(IN clave_elector VARCHAR(256), IN curp VARCHAR(256))
BEGIN
	DECLARE gob INT;
	DECLARE dip INT;
	
	select 'GUBERNATURA' as tipo from candidatura_gubernatura where candidatura_gubernatura.clave_elector = clave_elector || candidatura_gubernatura.curp = curp
	UNION ALL
	select 'DIPUTACIONES' as tipo from candidatura_diputado where candidatura_diputado.clave_elector = clave_elector || candidatura_diputado.curp = curp;
END;




// comprueba si esta registrado dentro de la misma candidatura

DELIMITER $$
CREATE PROCEDURE otraCandidatura(IN curp varchar(256), IN clave varchar(256))
BEGIN
	DECLARE existeC varchar(256);
	DECLARE existeCvl varchar(256);
	
	SELECT curp INTO existeC FROM candidatura_diputado WHERE candidatura_diputado.curp = curp;
	
	IF existeC IS NOT NULL THEN
		SELECT 'YA HAY ALGUIEN REGISTRADO CON ESTE CURP EN CANDIDATURA DIPUTADO';
	ELSE 
		SELECT clave_elector INTO existeCvl FROM candidatura_diputado WHERE candidatura_diputado.clave_elector = clave;
        IF existeCvl IS NOT NULL THEN
        	SELECT 'YA HAY ALGUIEN REGISTRADO CON ESTA CLAVE ELECTOR EN CANDIDATURA DIPUTADO';
        ELSE
        	SELECT 'NO_EXIST' AS EXISTE;
        END IF;
	END IF;	
END;




DELIMITER $$
CREATE PROCEDURE getSlctPartidos(
IN id_distrito VARCHAR(50),
IN id_tipo_registro VARCHAR(50)
)
BEGIN
	IF id_distrito = -1 THEN 
		SELECT combinaciones.id_combinaciones, combinaciones.nombre as nombre_combinacion, tipo_constitucion.nombre as nombre_constitucion, tipo_constitucion.id_constitucion, combinaciones.id_tipo_registro 
		FROM combinaciones, tipo_constitucion 
		WHERE combinaciones.id_tipo_registro = id_tipo_registro AND combinaciones.id_constitucion = tipo_constitucion.id_constitucion;
	ELSE 
		SELECT id_combinaciones, combinaciones.nombre as nombre_combinacion, tipo_constitucion.nombre as nombre_constitucion, tipo_constitucion.id_constitucion 
		FROM distrito, combinaciones, tipo_constitucion 
		WHERE distrito.id_distrito = id_distrito AND combinaciones.id_tipo_registro = id_tipo_registro AND combinaciones.id_distrito = distrito.id_distrito AND combinaciones.id_constitucion = tipo_constitucion.id_constitucion;
	END IF;
END



DELIMITER $$
CREATE PROCEDURE getInfoSubsanacion( 
	IN clave_elector varchar(256)
)
BEGIN
	
		SELECT 
			candidatura_diputado.id, 
			candidatura_diputado.nombre, 
			apellido_paterno, 
			apellido_materno, 
			tipo_eleccion.nombre as candidatura, 
			combinaciones.nombre as partido_politico, 
			distrito.nombre as nombre_distrito, 
			estados.nombre_estado, 
			fec_nacimiento, 
			genero, 
			clave_elector, 
			curp, 
			tiempo_residencia, 
			sobrenombre,
			prelacion, 
			propietario_suplente, 
			candidatura_diputado.estado,
			candidatura_diputado.id_documento
		FROM candidatura_diputado, combinaciones, tipo_eleccion, distrito, estados
		WHERE candidatura_diputado.clave_elector = clave_elector AND candidatura_diputado.partido_politico = combinaciones.id_combinaciones 
		AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND candidatura_diputado.distrito = distrito.id_distrito AND candidatura_diputado.lugarnacimiento = estados.id_estado
		
	UNION ALL
	
		SELECT 
			candidatura_gubernatura.id_gubertatura AS id,
			candidatura_gubernatura.nombre,
			apellido_paterno, 
			apellido_materno, 
			'GUBERNATURA' as candidatura,
			combinaciones.nombre as partido_politico,
			null as nombre_distrito, 
			estados.nombre_estado, 
			fecha_nacimiento, 
			genero, 
			clave_elector, 
			curp, 
			tiempo_residencia, 
			sobrenombre, 
			'00' as prelacion,
			null as propietario_suplente, 
			candidatura_gubernatura.estado,
			candidatura_gubernatura.id_documento
		FROM candidatura_gubernatura, combinaciones, estados
		WHERE candidatura_gubernatura.clave_elector = clave_elector AND candidatura_gubernatura.partido_politico = combinaciones.id_combinaciones 
		AND candidatura_gubernatura.lugar_nacimiento = estados.id_estado;
			
END;



DELIMITER $$ 
CREATE PROCEDURE getInfoCandidato( IN clave_elector varchar(256) )
BEGIN	
	SELECT
	  candidatura_diputado.id as id,
      candidatura_diputado.nombre,
      candidatura_diputado.apellido_paterno,
      candidatura_diputado.apellido_materno,
      candidatura_diputado.propietario_suplente,
      candidatura_diputado.curp,
	  candidatura_diputado.candidatura,
      tipo_eleccion.nombre as nombre_candidatura,
      distrito.nombre as nombre_distrito,
      estados.nombre_estado as lugarnacimiento,
      combinaciones.nombre as nombre_partido_politico,
      candidatura_diputado.genero,
      candidatura_diputado.prelacion
    FROM candidatura_diputado, tipo_eleccion, combinaciones, distrito, estados
    WHERE candidatura_diputado.clave_elector = clave_elector AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND distrito.id_distrito = candidatura_diputado.distrito
    AND combinaciones.id_combinaciones = candidatura_diputado.partido_politico AND estados.id_estado = candidatura_diputado.lugarnacimiento
UNION ALL
	SELECT
	candidatura_gubernatura.id_gubertatura as id,
	candidatura_gubernatura.nombre,
	candidatura_gubernatura.apellido_paterno,
	candidatura_gubernatura.apellido_materno,
	null as propietario_suplente,
	candidatura_gubernatura.curp,
	3 as candidatura,
	'GUBERNATURA' as nombre_candidatura,
	null as distrito,
	estados.nombre_estado as lugarnacimiento,
	combinaciones.nombre as nombre_partido_politico,
	candidatura_gubernatura.genero,
	null as prelacion
	FROM candidatura_gubernatura, combinaciones, estados
    WHERE candidatura_gubernatura.clave_elector = clave_elector AND combinaciones.id_combinaciones = candidatura_gubernatura.partido_politico AND estados.id_estado = candidatura_gubernatura.lugar_nacimiento;
END;



********************************************************************  agregar documento *************************************************************

DELIMITER $$
CREATE PROCEDURE addDocument(
	clave_elector VARCHAR(120),
	doc_snr_ine VARCHAR(50),
	act_de_nacimiento VARCHAR(50),
	copia_act_de_nacimiento VARCHAR(50),
	const_separacion_cargo VARCHAR(50),
	escrito_bajo VARCHAR(50),
	const_act_no_penales VARCHAR(50),
	solicitud_registro VARCHAR(50),
	cred_para_votar VARCHAR(50),
	const_acept_postulacion VARCHAR(50),
	const_residencia VARCHAR(50),
	manifiesto VARCHAR(50),
	capacidad_economica VARCHAR(50),
	cedula_rfc VARCHAR(50),
	id_gubernatura INT,
	tipo_registro INT
	)
BEGIN

	DECLARE idDocument INT;
	
	INSERT INTO candidatura_documentado 
	VALUES(
	null,
	clave_elector,
	doc_snr_ine,
	act_de_nacimiento,
	copia_act_de_nacimiento,
	const_separacion_cargo,
	escrito_bajo, const_act_no_penales,
	solicitud_registro, cred_para_votar,
	const_acept_postulacion,
	const_residencia,
	manifiesto,
	capacidad_economica,
	cedula_rfc,
	tipo_registro
	);
	
	SELECT LAST_INSERT_ID() INTO idDocument;
	
	IF tipo_registro = 1 THEN
		UPDATE candidatura_gubernatura SET candidatura_gubernatura.id_documento = idDocument WHERE candidatura_gubernatura.id_gubertatura = id_gubernatura;
	ELSEIF tipo_registro = 2 THEN
		UPDATE candidatura_diputado SET candidatura_diputado.id_documento = idDocument WHERE candidatura_diputado.id = id_gubernatura;
	END IF;
END;


DELIMITER $$
CREATE PROCEDURE subsanerGobernador(
	IN candidato_nombre VARCHAR(256),
	IN candidato_ap_paterno VARCHAR(256),
	IN candidato_ap_materno VARCHAR(256),
	IN candidato_fec_nacimiento DATE,
	IN candidato_genero VARCHAR(120),
	IN candidato_clave_elector VARCHAR(256),
	IN candidato_curp VARCHAR(256),
	IN candidato_tiempo_residencia INT,
	IN estado VARCHAR(50),
	IN candidato_sobrenombre VARCHAR(256),
	IN claveOriginal VARCHAR(256),
	IN id_registro INT
)
BEGIN

 UPDATE candidatura_gubernatura
      SET
        nombre = candidato_nombre,
        apellido_paterno = candidato_ap_paterno,
        apellido_materno = candidato_ap_materno,
        fecha_nacimiento = candidato_fec_nacimiento,
        genero = candidato_genero,
        clave_elector = candidato_clave_elector,
        curp = candidato_curp,
        tiempo_residencia = candidato_tiempo_residencia,
        candidatura_gubernatura.estado = estado,
        sobrenombre = candidato_sobrenombre
        WHERE clave_elector = claveOriginal AND id_gubertatura = id_registro;
END;


DELIMITER $$
CREATE PROCEDURE addGubernatura(
    nombre VARCHAR(120), 
    APP VARCHAR(120), 
    APM VARCHAR(256),
    genero VARCHAR(120),
    partido_politico INT,
    fec_nacimiento DATE,
    lugar_nacimiento VARCHAR(256),
    clave_elector varchar(256),
    curp VARCHAR(256),
    tiempo_residencia VARCHAR(50),
    estado varchar(50),
    sobrenombre VARCHAR(256),
	user_capturista varchar(150),
	id_tipo_registro int
)
BEGIN
	DECLARE clave VARCHAR(256);
    DECLARE curp2 VARCHAR(256);
    DECLARE partido VARCHAR(256);
	DECLARE idGubernatura INT;
    
    SELECT partido_politico INTO partido FROM candidatura_gubernatura 
    WHERE candidatura_gubernatura.partido_politico = partido_politico;
    
	IF partido IS NULL THEN
	
    	SELECT clave_elector INTO clave FROM candidatura_gubernatura 
    	WHERE candidatura_gubernatura.clave_elector = clave_elector; 
        
        IF clave IS NULL THEN
            SELECT curp INTO curp2 FROM candidatura_gubernatura
            WHERE candidatura_gubernatura.curp = curp;

            IF curp2 IS NULL THEN
			
                    INSERT INTO candidatura_gubernatura VALUES (null, nombre, APP, APM, genero, partido_politico, 
                    fec_nacimiento, lugar_nacimiento, clave_elector, curp, tiempo_residencia, estado, user_capturista, sobrenombre, id_tipo_registro );
					
					SELECT LAST_INSERT_ID() INTO idGubernatura;
					
					
                    SELECT 1 AS MENSAJE, idGubernatura AS ID;
            ELSE
                SELECT -2  AS MENSAJE ;
            END IF;
        ELSE 
            SELECT -1 AS MENSAJE;
        END IF;
    ELSE
    	SELECT 0 AS MENSAJE;
    END IF;
	
END;



DELIMITER $$
CREATE PROCEDURE addHistorial( 
	usuario VARCHAR(150),
	tipo VARCHAR(150),
	nombre_clv VARCHAR(150),
	clv_original VARCHAR(250),
	nombre_clv_nuevo VARCHAR(150),
	clv_nuevo VARCHAR(250),
	motivo VARCHAR(150),
	dia VARCHAR(150),
	hora VARCHAR(150)
)
BEGIN
	INSERT INTO historial VALUES(null, usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, motivo, dia, hora);
END;




DELIMITER $$
CREATE PROCEDURE getInfoGobernador(IN clave_elector varchar(256))
BEGIN

SELECT 
	candidatura_gubernatura.nombre,
    candidatura_gubernatura.apellido_paterno,
    candidatura_gubernatura.apellido_materno,
    candidatura_gubernatura.genero,
    combinaciones.nombre as nombre_partido, 
    candidatura_gubernatura.fecha_nacimiento,
    estados.nombre_estado,
    candidatura_gubernatura.clave_elector,
    candidatura_gubernatura.curp,
    candidatura_gubernatura.tiempo_residencia,
    candidatura_gubernatura.estado,
    candidatura_gubernatura.sobrenombre
    FROM candidatura_gubernatura, combinaciones, estados 
    WHERE candidatura_gubernatura.clave_elector = clave_elector AND combinaciones.id_combinaciones = candidatura_gubernatura.partido_politico AND estados.id_estado = candidatura_gubernatura.lugar_nacimiento;
END;

DELIMITER $$
CREATE PROCEDURE addDiputacion(
	IN nombre VARCHAR(150),
	IN apellido_paterno VARCHAR(150),
	IN apellido_materno VARCHAR(150),
	IN genero VARCHAR(50),
	IN partido_politico VARCHAR(250),
	IN candidatura VARCHAR(250),
	IN clave_elector VARCHAR(150),
	IN curp VARCHAR(150),
	IN distrito VARCHAR(250),
	IN fec_nacimiento VARCHAR(150),
	IN lugarnacimiento VARCHAR(50),
	IN tiempo_residencia VARCHAR(50),
	IN sobrenombre VARCHAR(150),
	IN estado VARCHAR(50),
	IN user_capturista VARCHAR(150),
	IN propietario_suplente VARCHAR(50),
	IN prelacion VARCHAR(20)
)
BEGIN

	DECLARE idDiputacion INT;

	INSERT INTO candidatura_diputado VALUES(NULL , nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, distrito, fec_nacimiento, 
	lugarnacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion, 1);
	
	SELECT LAST_INSERT_ID() INTO idDiputacion;

	SELECT 1 AS MENSAJE, idDiputacion AS ID;

END;


DELIMITER $$
CREATE PROCEDURE candidaturaRenuncia(
	IN idTipoEleccion INT,
	IN usuario VARCHAR(150),
	IN tipoAccion VARCHAR(150),
	IN nombre VARCHAR(150),
	IN claveOriginal VARCHAR(256),
	IN claveNuevo VARCHAR(150),
	IN motivoRenuncia VARCHAR(150),
	IN dia VARCHAR(150),
	IN hora VARCHAR(150),
	IN id_registro INT
)
BEGIN
	IF idTipoEleccion = 1 OR idTipoEleccion = 2 THEN
	
		INSERT INTO candidatura_renuncia(
		nombre,
		apellido_paterno, 
		apellido_materno, 
		genero, 
		partido_politico, 
		candidatura, 
		clave_elector, 
		curp, 
		distrito, 
		fec_nacimiento, 
		tiempo_residencia, 
		sobrenombre, 
		estado, 
		user_capturista, 
		propietario_suplente, 
		prelacion) 
		SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, distrito, fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion 
		FROM candidatura_diputado 
		WHERE clave_elector = claveOriginal;
		
		UPDATE candidatura_renuncia SET estado = 'RENUNCIA' WHERE clave_elector = claveOriginal; 
		
		DELETE FROM candidatura_diputado WHERE clave_elector = claveOriginal AND candidatura_diputado.id = id_registro;
		
		INSERT INTO historial(usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, motivo, dia, hora) 
		VALUES ( usuario, tipoAccion, nombre, claveOriginal, "-", claveNuevo, motivoRenuncia, dia, hora );
		
	ELSEIF idTipoEleccion = 3 THEN
	
		INSERT INTO candidatura_renuncia(
			nombre,
			apellido_paterno, 
			apellido_materno, 
			genero,
			partido_politico,
			candidatura, 
			clave_elector,
			curp,
			distrito,
			fec_nacimiento,
			tiempo_residencia,
			sobrenombre,
			estado,
			user_capturista,
			propietario_suplente,
			prelacion)
			SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, null as candidatura, clave_elector, curp, null as distrito, 
			fecha_nacimiento, tiempo_residencia, sobrenombre, estado, null as user_capturista, null as propietario_suplente, '00' as prelacion 
			FROM candidatura_gubernatura 
			WHERE clave_elector = claveOriginal;
			
			UPDATE candidatura_renuncia SET estado = 'RENUNCIA' WHERE clave_elector = claveOriginal;
			
			DELETE FROM candidatura_gubernatura WHERE clave_elector = claveOriginal AND candidatura_gubernatura.id_gubertatura = id_registro;
			
			INSERT INTO historial(usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, motivo, dia, hora) 
			VALUES ( usuario, tipoAccion, nombre, claveOriginal, "-", claveNuevo, motivoRenuncia, dia, hora );
	END IF;	
END;








