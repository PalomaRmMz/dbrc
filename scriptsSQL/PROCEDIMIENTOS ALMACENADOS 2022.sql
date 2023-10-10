DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarSesionID`(IN `sesion_id` VARCHAR(256), IN `usuario` VARCHAR(10))
BEGIN
	UPDATE usuarios SET usuarios.sesion_id = sesion_id WHERE usuarios.usuario = usuario; 
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addComunidad`(IN `municipio` VARCHAR(150), IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `id_comunidad` INT, IN `candidatura` VARCHAR(250), IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `num_emision` VARCHAR(256), IN `ocr` VARCHAR(256), IN `cic` VARCHAR(256), IN `seccion` VARCHAR(256), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), IN `carta_3_3` VARCHAR(50), IN `carta_reeleccion` VARCHAR(50), IN `const_autorizacion_organo` VARCHAR(50), IN `manifes_autoadcripcion` VARCHAR(50), IN `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), IN `email` VARCHAR(30))
BEGIN
	DECLARE id_documento INT;
    
    CALL addDocument(carta_3_3,
						carta_reeleccion,
						const_autorizacion_organo,
						manifes_autoadcripcion,
						constancia_vinculo_comuni,clave_elector, doc_snr_ine, act_de_nacimiento, copia_act_de_nacimiento, const_separacion_cargo,
						escrito_bajo, const_act_no_penales, solicitud_registro, cred_para_votar, const_acept_postulacion, const_residencia,
						manifiesto, capacidad_economica, cedula_rfc, candidatura, id_documento);
    
	INSERT INTO candidatura_comunidad VALUES( null, nombre, apellido_paterno, apellido_materno, genero, partido_politico, municipio, id_comunidad, candidatura, clave_elector, curp, 
    num_emision,ocr, cic, seccion, fec_nacimiento, lugarnacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, id_documento, politicaP, email);
	
	call addHistorial(user_capturista, tipo, nombre_clv, clave_elector, curp, ' ' , ' ', ' ' , dia, hora, candidatura, partido_politico, '', municipio, id_comunidad, propietario_suplente, estado);
	select 1 as MENSAJE;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDiputacion`(IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `candidatura` VARCHAR(250), IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `reg_pro_num_emision` VARCHAR(254), IN `reg_pro_ocr` VARCHAR(254), IN `reg_pro_CIC` VARCHAR(254), IN `reg_pro_seccion` VARCHAR(254), IN `distrito` VARCHAR(250), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), IN `prelacion` VARCHAR(20), `supCarta3D3` VARCHAR(50), `supCartaEleccion` VARCHAR(50), `supConstAutOrganoPartidista` VARCHAR(50), `supManifestacionIndigena` VARCHAR(50), `supConsVinculoComuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), `email` VARCHAR(30))
BEGIN

	DECLARE id_documento INT;
    CALL addDocument(
    supCarta3D3,
	supCartaEleccion,
	supConstAutOrganoPartidista,
	supManifestacionIndigena,
	supConsVinculoComuni,
    clave_elector, doc_snr_ine, act_de_nacimiento, copia_act_de_nacimiento, const_separacion_cargo,
						escrito_bajo, const_act_no_penales, solicitud_registro, cred_para_votar, const_acept_postulacion, const_residencia,
						manifiesto, capacidad_economica, cedula_rfc, candidatura, id_documento);
                        
	INSERT INTO candidatura_diputado VALUES(NULL , nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, reg_pro_num_emision, reg_pro_ocr, reg_pro_CIC, reg_pro_seccion, distrito, fec_nacimiento, 
	lugarnacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion, id_documento, politicaP, email);
    
	call addHistorial(user_capturista, tipo, nombre_clv, clave_elector, curp, ' ' , ' ', ' ' , dia, hora, candidatura, partido_politico, distrito, '', '', propietario_suplente, estado);

	SELECT 1 AS MENSAJE;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDocument`(`carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `clave_elector` VARCHAR(120), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, OUT `id` INT)
BEGIN
DECLARE id_documento INT;
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
    carta_3_3 , 
    carta_reeleccion , 
    const_autorizacion_organo, 
    manifes_autoadcripcion , 
    constancia_vinculo_comuni,
	tipo_registro
	);
	
	SELECT LAST_INSERT_ID() INTO id_documento;
    set id = id_documento;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGubernatura`(`nombre` VARCHAR(120), `APP` VARCHAR(120), `APM` VARCHAR(256), `genero` VARCHAR(120), `partido_politico` INT, `fec_nacimiento` DATE, `lugar_nacimiento` VARCHAR(256), `clave_elector` VARCHAR(256), `curp` VARCHAR(256), `num_emision` VARCHAR(45), `ocr` VARCHAR(256), `cic` VARCHAR(256), `seccion` VARCHAR(256), `tiempo_residencia` VARCHAR(50), `estado` VARCHAR(50), `sobrenombre` VARCHAR(256), `user_capturista` VARCHAR(150), `id_tipo_registro` INT, `carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), `politicaPrivacidad` VARCHAR(50), `email` VARCHAR(30))
BEGIN
	DECLARE clave VARCHAR(256);
    DECLARE curp2 VARCHAR(256);
    DECLARE partido VARCHAR(256);
	DECLARE id_documento INT;
    
    SELECT partido_politico INTO partido FROM candidatura_gubernatura 
    WHERE candidatura_gubernatura.partido_politico = partido_politico;
    
	IF partido IS NULL THEN
	
    	SELECT clave_elector INTO clave FROM candidatura_gubernatura 
    	WHERE candidatura_gubernatura.clave_elector = clave_elector; 
        
        IF clave IS NULL THEN
            SELECT curp INTO curp2 FROM candidatura_gubernatura
            WHERE candidatura_gubernatura.curp = curp;

            IF curp2 IS NULL THEN
            
					CALL addDocument(
						carta_3_3, carta_reeleccion, const_autorizacion_organo, manifes_autoadcripcion, constancia_vinculo_comuni,
						clave_elector, doc_snr_ine, act_de_nacimiento, copia_act_de_nacimiento, const_separacion_cargo,
						escrito_bajo, const_act_no_penales, solicitud_registro, cred_para_votar, const_acept_postulacion, const_residencia,
						manifiesto, capacidad_economica, cedula_rfc, tipo_registro, id_documento);
					
                    INSERT INTO candidatura_gubernatura VALUES (null, nombre, APP, APM, genero, partido_politico, 
                    fec_nacimiento, lugar_nacimiento, clave_elector, curp, num_emision, ocr, cic, seccion, tiempo_residencia, estado, user_capturista, sobrenombre, 1, id_tipo_registro, politicaPrivacidad, email);
                    
                    UPDATE candidatura_gubernatura SET candidatura_gubernatura.id_documento = id_documento WHERE candidatura_gubernatura.clave_elector = clave_elector;
					
                    call addHistorial(user_capturista, tipo, nombre_clv, clave_elector, curp, ' ' , ' ', ' ' , dia, hora, id_tipo_registro, partido_politico, '', '', '', 'Propietario', estado);
                    
                    SELECT 1 AS MENSAJE;
            ELSE
                SELECT -2  AS MENSAJE ;
            END IF;
        ELSE 
            SELECT -1 AS MENSAJE;
        END IF;
    ELSE
    	SELECT 0 AS MENSAJE;
    END IF;
	
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addHistorial`(`usuario` VARCHAR(150), `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `clv_original` VARCHAR(250), IN `curp` VARCHAR(256), `nombre_clv_nuevo` VARCHAR(150), `clv_nuevo` VARCHAR(250), `motivo` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), `id_tipo_registro` INT, `id_partido` VARCHAR(46), `id_distrito` VARCHAR(46), `id_municipio` VARCHAR(46), `id_comunidad` VARCHAR(46), `prop_sup` VARCHAR(256), `estado` VARCHAR(256))
BEGIN
	INSERT INTO historial VALUES(null, usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, curp, motivo, dia, 
    hora, id_tipo_registro, id_partido, id_distrito, id_municipio, id_comunidad, prop_sup, estado);
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMunicipal`(IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `id_municipio` INT, IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `num_emision` VARCHAR(150), IN `ocr` VARCHAR(150), IN `cic` VARCHAR(150), IN `seccion` VARCHAR(150), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), `carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), IN `tipoEleccion` INT, IN `regiduria` VARCHAR(256), IN `email` VARCHAR(30))
BEGIN
	DECLARE id_documento INT;
    
    CALL addDocument(
    carta_3_3, carta_reeleccion, const_autorizacion_organo, manifes_autoadcripcion, constancia_vinculo_comuni,
    clave_elector, doc_snr_ine, act_de_nacimiento, copia_act_de_nacimiento, const_separacion_cargo,
						escrito_bajo, const_act_no_penales, solicitud_registro, cred_para_votar, const_acept_postulacion, const_residencia,
						manifiesto, capacidad_economica, cedula_rfc, tipoEleccion, id_documento);
                        
                        
    IF tipoEleccion = 6 THEN 
		
		INSERT INTO candidatura_sindicatura VALUES( null, nombre, apellido_paterno, apellido_materno, genero, partido_politico, id_municipio, tipoEleccion, clave_elector, curp, num_emision, ocr, cic, seccion, fec_nacimiento, lugarnacimiento,
				tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, id_documento, politicaP, email);
		select 1 as MENSAJE;

	ELSEIF tipoEleccion = 7 THEN 
		INSERT INTO candidatura_regiduria VALUES( null, nombre, apellido_paterno, apellido_materno, genero, partido_politico, id_municipio, regiduria, tipoEleccion, clave_elector, curp, num_emision, ocr, cic, seccion, fec_nacimiento, lugarnacimiento,
				tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, id_documento, politicaP, email);		
		select 1 as MENSAJE;
		
    ELSEIF tipoEleccion = 4 THEN
    
		INSERT INTO candidatura_ayuntamiento VALUES( null, nombre, apellido_paterno, apellido_materno, genero, partido_politico, id_municipio, tipoEleccion, clave_elector, curp, num_emision, ocr, cic,
        seccion, fec_nacimiento, lugarnacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, id_documento, politicaP, email);
		select 1 as MENSAJE;
        
	END IF;
    
    call addHistorial(user_capturista, tipo, nombre_clv, clave_elector, curp, ' ' , ' ', ' ' , dia, hora, tipoEleccion, partido_politico, '', id_municipio, '', propietario_suplente, estado);
    
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidaturaRenuncia`(IN `idTipoEleccion` INT, IN `usuario` VARCHAR(150), IN `tipoAccion` VARCHAR(150), IN `nombre` VARCHAR(150), IN `claveOriginal` VARCHAR(256), IN `claveNuevo` VARCHAR(150), IN `curp` VARCHAR(256), IN `motivoRenuncia` VARCHAR(150), IN `dia` VARCHAR(150), IN `hora` VARCHAR(150), IN `id_partido` VARCHAR(256), IN `id_distrito` VARCHAR(256), IN `id_municipio` VARCHAR(256), IN `id_comunidad` VARCHAR(256), IN `id_registro` INT)
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
        num_emision,
		cic,
		ocr,
		seccion,
		distrito,
        municipio,
        comunidad,
		fec_nacimiento, 
		tiempo_residencia, 
		sobrenombre, 
		estado, 
		user_capturista, 
		propietario_suplente, 
		prelacion,
        fecha_registro) 
		SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp, num_emision, cic, ocr, seccion, distrito, 0, 0, 
        fec_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, propietario_suplente, prelacion, dia as fecha_registro
		FROM candidatura_diputado 
		WHERE clave_elector = claveOriginal;
		
		UPDATE candidatura_renuncia SET estado = 'Renuncia' WHERE clave_elector = claveOriginal; 
		
		DELETE FROM candidatura_diputado WHERE clave_elector = claveOriginal AND candidatura_diputado.candidatura = idTipoEleccion;
	
        
	ELSEIF idTipoEleccion = 3 THEN
			INSERT INTO candidatura_renuncia( nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector,
			curp,
            num_emision,
			cic,
			ocr,
			seccion,
			distrito,
            municipio,
            comunidad,
			fec_nacimiento,
			tiempo_residencia,
			sobrenombre,
			estado,
			user_capturista,
			propietario_suplente,
			prelacion,
            fecha_registro)
			SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp,num_emision, cic, ocr, seccion, 'Circunscripción única' as distrito ,0 , 0,
			fecha_nacimiento, tiempo_residencia, sobrenombre, estado, user_capturista, 'Propietario' as propietario_suplente, '00' as prelacion, dia as fecha_registro
			FROM candidatura_gubernatura 
			WHERE clave_elector = claveOriginal;
            
			UPDATE candidatura_renuncia SET estado = 'Renuncia' WHERE clave_elector = claveOriginal;
			
			DELETE FROM candidatura_gubernatura WHERE clave_elector = claveOriginal AND candidatura_gubernatura.candidatura = idTipoEleccion;
		
		
            
	ELSEIF idTipoEleccion = 4 THEN
    
		INSERT INTO candidatura_renuncia( 
			nombre, 
            apellido_paterno, 
            apellido_materno,
            genero,
            partido_politico,
            candidatura,
            clave_elector, 
            curp,
            num_emision,
			cic,
			ocr,
			seccion,
            distrito,
            municipio,
            comunidad,
			fec_nacimiento,
			tiempo_residencia,
			sobrenombre,
			estado,
			user_capturista,
			propietario_suplente,
			prelacion,
            fecha_registro)
            SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp,num_emision, cic, ocr, seccion, 'Circunscripción única' as distrito, id_municipio, 0 , fec_nacimiento, tiempo_residencia,
					sobrenombre, estado, user_capturista, propietario_suplente, '00' as prelacion, dia as fecha_registro
			FROM candidatura_ayuntamiento 
            WHERE candidatura_ayuntamiento.clave_elector = claveOriginal;
            
		UPDATE candidatura_renuncia SET estado = 'Renuncia'  WHERE candidatura_renuncia.clave_elector = claveOriginal;
        
        DELETE FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = claveOriginal and candidatura_ayuntamiento.candidatura = idTipoEleccion;
            
	ELSEIF idTipoEleccion = 5 THEN
    
		INSERT INTO candidatura_renuncia( nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura,  clave_elector,
				curp, num_emision, cic, ocr, seccion, distrito, municipio, comunidad,
				fec_nacimiento,
				tiempo_residencia,
				sobrenombre,
				estado,
				user_capturista,
				propietario_suplente,
				prelacion,
                fecha_registro)
				SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp,num_emision, cic , ocr, seccion, 
                'Circunscripción única'  as distrito, id_municipio, id_comunidad, fec_nacimiento, tiempo_residencia,
						sobrenombre, estado, user_capturista, propietario_suplente, '00' as prelacion, dia as fecha_registro
				FROM candidatura_comunidad 
				WHERE candidatura_comunidad.clave_elector = claveOriginal;
            
		UPDATE candidatura_renuncia SET estado = 'Renuncia'  WHERE clave_elector = claveOriginal;
        
        DELETE FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = claveOriginal and candidatura_comunidad.candidatura = idTipoEleccion;
	
	ELSEIF idTipoEleccion = 6 THEN
    
		INSERT INTO candidatura_renuncia( 
			nombre, 
            apellido_paterno, 
            apellido_materno,
            genero,
            partido_politico,
            candidatura,
            clave_elector, 
            curp,
            num_emision,
			cic,
			ocr,
			seccion,
            distrito,
            municipio,
            comunidad,
			fec_nacimiento,
			tiempo_residencia,
			sobrenombre,
			estado,
			user_capturista,
			propietario_suplente,
			prelacion,
            fecha_registro)
            SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp,num_emision,cic,ocr,seccion, 'Circunscripción única' as distrito, id_municipio, 0 , fec_nacimiento, tiempo_residencia,
					sobrenombre, estado, user_capturista, propietario_suplente, '00' as prelacion, dia as fecha_registro
			FROM candidatura_sindicatura 
            WHERE candidatura_sindicatura.clave_elector = claveOriginal;
            
		UPDATE candidatura_renuncia SET estado = 'Renuncia'  WHERE clave_elector = claveOriginal;
        
        DELETE FROM candidatura_sindicatura WHERE candidatura_sindicatura.clave_elector = claveOriginal and candidatura_sindicatura.candidatura = idTipoEleccion;
            
	ELSEIF idTipoEleccion = 7 THEN
		INSERT INTO candidatura_renuncia( 
			nombre, 
            apellido_paterno, 
            apellido_materno,
            genero,
            partido_politico,
            candidatura,
            clave_elector, 
            curp,
            num_emision,
			cic,
			ocr,
			seccion,
            distrito,
            municipio,
            comunidad,
			fec_nacimiento,
			tiempo_residencia,
			sobrenombre,
			estado,
			user_capturista,
			propietario_suplente,
			prelacion,
            fecha_registro)
            SELECT nombre, apellido_paterno, apellido_materno, genero, partido_politico, candidatura, clave_elector, curp,num_emision,cic,ocr,seccion, 'Circunscripción única' as distrito, id_municipio, 0 , fec_nacimiento, tiempo_residencia,
					sobrenombre, estado, user_capturista, propietario_suplente, '00' as prelacion, dia as fecha_registro
			FROM candidatura_regiduria 
            WHERE candidatura_regiduria.clave_elector = claveOriginal;
            
		UPDATE candidatura_renuncia SET estado = 'Renuncia'  WHERE clave_elector = claveOriginal;
        DELETE FROM candidatura_regiduria WHERE candidatura_regiduria.clave_elector = claveOriginal and candidatura_regiduria.candidatura = idTipoEleccion;
	END IF;	
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `editarUsuario`(IN `nombre` VARCHAR(256), IN `app` VARCHAR(256), IN `apm` VARCHAR(256), IN `usuario` VARCHAR(256), IN `contraseña` VARCHAR(256), IN `rol` VARCHAR(256))
BEGIN

	declare passTemp varchar(256);

	IF contraseña = '' THEN 
		UPDATE usuarios SET nombre_capturista = nombre, app_capturista = app, apm_capturista = apm, usuario = usuario, rol = rol WHERE usuarios.usuario = usuario;
	ELSE 
		set passTemp = concat( 'ite' , contraseña, 'tlax' );
		UPDATE usuarios SET nombre_capturista = nombre, app_capturista = app, apm_capturista = apm, usuario = usuario, rol = rol, usuarios.password = sha2(passTemp, 0) WHERE usuarios.usuario = usuario;
    END IF;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EXIST_CANDIDATO`(IN `clave_elector` VARCHAR(256), IN `curp` VARCHAR(256))
BEGIN
    IF exists (SELECT * FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = clave_elector OR candidatura_comunidad.curp = curp) THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para comunidad' as mensaje;
	ELSEIF EXISTS(SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = clave_elector OR candidatura_ayuntamiento.curp = curp) THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para ayuntamiento' as mensaje;
	ELSEIF EXISTS(SELECT * FROM candidatura_sindicatura WHERE candidatura_sindicatura.clave_elector = clave_elector OR candidatura_sindicatura.curp = curp) THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en sindicos/as para ayuntamiento' as mensaje;
	ELSEIF EXISTS(SELECT * FROM candidatura_regiduria WHERE candidatura_regiduria.clave_elector = clave_elector OR candidatura_regiduria.curp = curp) THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en candidato para regidor' as mensaje;
	ELSEIF EXISTS(SELECT * FROM candidatura_diputado WHERE candidatura_diputado.clave_elector = clave_elector OR candidatura_diputado.curp = curp) THEN	
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para diputado' as mensaje;
	ELSEIF EXISTS(SELECT * FROM candidatura_gubernatura WHERE candidatura_gubernatura.clave_elector = clave_elector OR candidatura_gubernatura.curp = curp) THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para gubernatura' as mensaje;
    END IF;
    
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `existeSubsanacion`(IN `clave_elector` VARCHAR(256), IN `curp` VARCHAR(256), IN `candidatura` INT)
BEGIN
	IF exists (SELECT * FROM candidatura_comunidad WHERE candidatura_comunidad.clave_elector = clave_elector OR candidatura_comunidad.curp = curp) and candidatura != 5 THEN
    
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para comunidad' as mensaje;
        
	ELSEIF EXISTS(SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.clave_elector = clave_elector OR candidatura_ayuntamiento.curp = curp) and candidatura != 4 THEN
    
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para ayuntamiento' as mensaje;
        
	ELSEIF EXISTS(SELECT * FROM candidatura_sindicatura WHERE candidatura_sindicatura.clave_elector = clave_elector OR candidatura_sindicatura.curp = curp) and candidatura != 6 THEN
		SELECT 'Ya existe un registro con esa clave elector o curp en sindicos/as para ayuntamiento' as mensaje;
        
	ELSEIF EXISTS(SELECT * FROM candidatura_diputado WHERE candidatura_diputado.clave_elector = clave_elector OR candidatura_diputado.curp = curp) and (candidatura != 1 and candidatura != 2) THEN	
    
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para diputado' as mensaje;
        
	ELSEIF EXISTS(SELECT * FROM candidatura_gubernatura WHERE candidatura_gubernatura.clave_elector = clave_elector OR candidatura_gubernatura.curp = curp) and candidatura != 3 THEN
    
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para gubernatura' as mensaje;
        
	ELSEIF EXISTS(SELECT * FROM candidatura_regiduria WHERE candidatura_regiduria.clave_elector = clave_elector OR candidatura_regiduria.curp = curp) and candidatura != 7 THEN
    
		SELECT 'Ya existe un registro con esa clave elector o curp en candidatura para regiduria' as mensaje;
    END IF;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `generarFolio`(IN `tipo_doc` VARCHAR(100), IN `usuario` VARCHAR(100), IN `nombre` VARCHAR(50), IN `app` VARCHAR(50), IN `apm` VARCHAR(50), IN `fecha` DATE, IN `hora` TIME, IN `has` VARCHAR(256), IN `clave_original` VARCHAR(50), IN `tipo_eleccion` INT)
BEGIN
	declare id_registro INT(6) unsigned zerofill;
    declare folio varchar(100);
    
    
    IF tipo_eleccion = 3 THEN 

        SELECT concat(folios.folio_candidatura, folios.no_folio) INTO folio FROM folios WHERE folios.id_folio = 1;
        select folios.no_folio into id_registro  from folios where folios.id_folio = 1;
        set id_registro = id_registro + 1;
        update folios set no_folio = id_registro where id_folio = 1;
		insert into registro values(null, tipo_doc, usuario, nombre, app, apm, fecha, hora, has, clave_original, folio);
        
	ELSEIF tipo_eleccion = 1 OR tipo_eleccion = 2 THEN
    
		SELECT concat(folios.folio_candidatura, folios.no_folio) INTO folio FROM folios WHERE folios.id_folio = 2;
		update folios set no_folio = no_folio + 1 where id_folio = 2;
        insert into registro values(null, tipo_doc, usuario, nombre, app, apm, fecha, hora, has, clave_original, folio);
        
	ELSEIF tipo_eleccion = 4 OR tipo_eleccion = 6 OR tipo_eleccion = 7 THEN 
    
		SELECT concat(folios.folio_candidatura, folios.no_folio) INTO folio FROM folios WHERE folios.id_folio = 3;
		update folios set no_folio = no_folio + 1 where id_folio = 3;
        insert into registro values(null, tipo_doc, usuario, nombre, app, apm, fecha, hora, has, clave_original, folio);
        
	ELSEIF tipo_eleccion = 5 THEN
		SELECT concat(folios.folio_candidatura, folios.no_folio) INTO folio FROM folios WHERE folios.id_folio = 4;
		update folios set no_folio = no_folio + 1 where id_folio = 4;
        insert into registro values(null, tipo_doc, usuario, nombre, app, apm, fecha, hora, has, clave_original, folio);
    END IF;
    
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoCandidato`(IN `clave_elector` VARCHAR(256))
BEGIN	
	
    SELECT
	  candidatura_diputado.id as id,
      candidatura_diputado.nombre,
      candidatura_diputado.apellido_paterno,
      candidatura_diputado.apellido_materno,
      candidatura_diputado.propietario_suplente,
      candidatura_diputado.curp,
      candidatura_diputado.num_emision,
	  candidatura_diputado.cic,
	  candidatura_diputado.ocr,
	  candidatura_diputado.seccion,
	  candidatura_diputado.candidatura,
      tipo_eleccion.nombre as nombre_candidatura,
      distrito.nombre as nombre_distrito,
	  candidatura_diputado.partido_politico as id_partido,
      candidatura_diputado.distrito as id_distrito,
      '' as id_municipio,
      '' as id_comunidad,
      estados.nombre_estado as lugarnacimiento,
      partidos_politicos.nombre_partido as nombre_partido_politico,
      candidatura_diputado.genero,
      candidatura_diputado.propietario_suplente,
      candidatura_diputado.estado,
      candidatura_diputado.prelacion
    FROM candidatura_diputado, tipo_eleccion, partidos_politicos, distrito, estados
    WHERE candidatura_diputado.clave_elector = clave_elector AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND distrito.id_distrito = candidatura_diputado.distrito
    AND partidos_politicos.id_partido = candidatura_diputado.partido_politico AND estados.id_estado = candidatura_diputado.lugarnacimiento

UNION ALL

	SELECT
	candidatura_gubernatura.id_gubertatura as id,
	candidatura_gubernatura.nombre,
	candidatura_gubernatura.apellido_paterno,
	candidatura_gubernatura.apellido_materno,
	'' as propietario_suplente,
	candidatura_gubernatura.curp,
    candidatura_gubernatura.num_emision,
    candidatura_gubernatura.cic,
    candidatura_gubernatura.ocr,
    candidatura_gubernatura.seccion,
	candidatura_gubernatura.candidatura,
	tipo_eleccion.nombre as nombre_candidatura,
    '' as nombre_distrito,
    candidatura_gubernatura.partido_politico as id_partido,
    '' as id_distrito,
    '' as id_municipio,
	'' as id_comunidad,
	estados.nombre_estado as lugarnacimiento,
	partidos_politicos.nombre_partido as nombre_partido_politico,
    
	candidatura_gubernatura.genero,
    '' as propietario_suplente,
      candidatura_gubernatura.estado,
	'' as prelacion
	FROM candidatura_gubernatura, partidos_politicos, estados, tipo_eleccion
    WHERE 
    candidatura_gubernatura.clave_elector = clave_elector AND 
    partidos_politicos.id_partido = candidatura_gubernatura.partido_politico AND 
    estados.id_estado = candidatura_gubernatura.lugar_nacimiento AND 
    tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura
    
UNION ALL

	SELECT 
	candidatura_ayuntamiento.id_can_municipal as id,
    candidatura_ayuntamiento.nombre,
    candidatura_ayuntamiento.apellido_paterno,
    candidatura_ayuntamiento.apellido_materno,
    candidatura_ayuntamiento.propietario_suplente,
    candidatura_ayuntamiento.curp,
    candidatura_ayuntamiento.num_emision,
	candidatura_ayuntamiento.cic,
	candidatura_ayuntamiento.ocr,
	candidatura_ayuntamiento.seccion,
    candidatura_ayuntamiento.candidatura,
    tipo_eleccion.nombre as nombre_candidatura,
    municipios.nombre_municipio as distrito,
    
    
     candidatura_ayuntamiento.partido_politico as id_partido,
	 '' as id_distrito,
    candidatura_ayuntamiento.id_municipio as id_municipio,
	'' as id_comunidad,
    
    estados.nombre_estado as lugarnacimiento,
    partidos_politicos.nombre_partido as nombre_partido_politico,
   
    candidatura_ayuntamiento.genero,
	candidatura_ayuntamiento.propietario_suplente,
    candidatura_ayuntamiento.estado,
    
    '' as prelacion
    FROM candidatura_ayuntamiento, partidos_politicos, estados, tipo_eleccion, municipios
    WHERE candidatura_ayuntamiento.clave_elector = clave_elector
    AND municipios.id_municipio = candidatura_ayuntamiento.id_municipio
    AND partidos_politicos.id_partido = candidatura_ayuntamiento.partido_politico 
    AND estados.id_estado = candidatura_ayuntamiento.lugarnacimiento 
    AND tipo_eleccion.id_eleccion = candidatura_ayuntamiento.candidatura
    
UNION ALL

    SELECT 
	candidatura_sindicatura.id_sindicatura as id,
    candidatura_sindicatura.nombre,
    candidatura_sindicatura.apellido_paterno,
    candidatura_sindicatura.apellido_materno,
    candidatura_sindicatura.propietario_suplente,
    candidatura_sindicatura.curp,
    candidatura_sindicatura.num_emision,
	candidatura_sindicatura.cic,
	candidatura_sindicatura.ocr,
	candidatura_sindicatura.seccion,
    candidatura_sindicatura.candidatura,
    tipo_eleccion.nombre as nombre_candidatura,
    municipios.nombre_municipio as distrito,
    
    candidatura_sindicatura.partido_politico as id_partido,
	 '' as id_distrito,
    candidatura_sindicatura.id_municipio as id_municipio,
	'' as id_comunidad,
    
    
    estados.nombre_estado as lugarnacimiento,
    partidos_politicos.nombre_partido as nombre_partido_politico,
	
    candidatura_sindicatura.genero,
	candidatura_sindicatura.propietario_suplente,
    candidatura_sindicatura.estado,
    '' as prelacion
    FROM candidatura_sindicatura, partidos_politicos, estados, tipo_eleccion, municipios
    WHERE candidatura_sindicatura.clave_elector = clave_elector
    AND municipios.id_municipio = candidatura_sindicatura.id_municipio
    AND partidos_politicos.id_partido = candidatura_sindicatura.partido_politico 
    AND estados.id_estado = candidatura_sindicatura.lugarnacimiento 
    AND tipo_eleccion.id_eleccion = candidatura_sindicatura.candidatura
    
UNION ALL 

    SELECT 
	candidatura_regiduria.id_regiduria  as id,
    candidatura_regiduria.nombre,
    candidatura_regiduria.apellido_paterno,
    candidatura_regiduria.apellido_materno,
    candidatura_regiduria.propietario_suplente,
    candidatura_regiduria.curp,
    candidatura_regiduria.num_emision,
	candidatura_regiduria.cic,
	candidatura_regiduria.ocr,
	candidatura_regiduria.seccion,
    candidatura_regiduria.candidatura,
    tipo_eleccion.nombre as nombre_candidatura,
    municipios.nombre_municipio as distrito,
    
    candidatura_regiduria.partido_politico as id_partido,
     '' as id_distrito,
    candidatura_regiduria.id_municipio as id_municipio,
	'' as id_comunidad,
    
    
    estados.nombre_estado as lugarnacimiento,
    partidos_politicos.nombre_partido as nombre_partido_politico,
    
    candidatura_regiduria.genero,
	candidatura_regiduria.propietario_suplente,
    candidatura_regiduria.estado,
    '' as prelacion
    FROM candidatura_regiduria, partidos_politicos, estados, tipo_eleccion, municipios
    WHERE candidatura_regiduria.clave_elector = clave_elector 
	AND municipios.id_municipio = candidatura_regiduria.id_municipio
    AND partidos_politicos.id_partido = candidatura_regiduria.partido_politico 
    AND estados.id_estado = candidatura_regiduria.lugarnacimiento 
    AND tipo_eleccion.id_eleccion = candidatura_regiduria.candidatura
    
UNION ALL

SELECT 
	candidatura_comunidad.id_can_comunidad as id,
    candidatura_comunidad.nombre,
    candidatura_comunidad.apellido_paterno,
    candidatura_comunidad.apellido_materno,
    candidatura_comunidad.propietario_suplente,
    candidatura_comunidad.curp,
    candidatura_comunidad.num_emision,
	candidatura_comunidad.cic,
	candidatura_comunidad.ocr,
	candidatura_comunidad.seccion,
    candidatura_comunidad.candidatura,
    tipo_eleccion.nombre as nombre_candidatura,
    municipios.nombre_municipio as distrito,
    
    candidatura_comunidad.partido_politico as id_partido,
    '' as id_distrito,
    candidatura_comunidad.id_municipio as id_municipio,
	candidatura_comunidad.id_comunidad as id_comunidad,
    
    estados.nombre_estado as lugarnacimiento,
    partidos_politicos.nombre_partido as nombre_partido_politico,
    
    candidatura_comunidad.genero,
	candidatura_comunidad.propietario_suplente,
    candidatura_comunidad.estado,
    '' as prelacion
    FROM candidatura_comunidad, partidos_politicos, estados, tipo_eleccion, municipios
    WHERE candidatura_comunidad.clave_elector = clave_elector
    AND municipios.id_municipio = candidatura_comunidad.id_municipio
    AND  partidos_politicos.id_partido = candidatura_comunidad.partido_politico 
    AND estados.id_estado = candidatura_comunidad.lugarnacimiento 
    AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura;


END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoGobernador`(IN `clave_elector` VARCHAR(256))
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
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoReportes`(IN `tipo_eleccion` VARCHAR(100), IN `origen` VARCHAR(100), IN `partidos` VARCHAR(100), IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100), IN `municipio` VARCHAR(100))
BEGIN
	IF tipo_eleccion = 1 OR tipo_eleccion = 2 THEN
    
		SELECT
		candidatura_diputado.nombre,
		candidatura_diputado.apellido_paterno,
		candidatura_diputado.apellido_materno,
		candidatura_diputado.genero,
		candidatura_diputado.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_diputado.clave_elector,
        
        candidatura_diputado.num_emision,
		candidatura_diputado.ocr,
		candidatura_diputado.cic,
		candidatura_diputado.seccion,
        candidatura_diputado.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		distrito.nombre as nombre_distrito,
        '' as nombre_comunidad,
        tipo_eleccion.nombre as nombre_candidatura,
		candidatura_diputado.estado,
        historial.dia
		FROM candidatura_diputado, tipo_eleccion, partidos_politicos, distrito, historial
		WHERE 
        
	    historial.clv_original = candidatura_diputado.clave_elector
		AND historial.id_tipo_eleccion = candidatura_diputado.candidatura
		AND historial.id_partido = candidatura_diputado.partido_politico
		AND historial.tipo = 'Registro'
        
        AND candidatura_diputado.partido_politico = partidos_politicos.id_partido
		AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura
		AND distrito.id_distrito = candidatura_diputado.distrito
		AND candidatura_diputado.candidatura = tipo_eleccion
		AND IF( candidatura_diputado.distrito = origen, true, origen = 'Todos' )
		AND IF( candidatura_diputado.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_diputado.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_diputado.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_diputado.genero =  generoP, true, generoP = 'Todos')
	union all 
        SELECT 
		candidatura_renuncia.nombre,
		candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		distrito.nombre as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia

		FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, distrito
		WHERE
		partidos_politicos.id_partido = candidatura_renuncia.partido_politico
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND distrito.id_distrito = candidatura_renuncia.distrito
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
		AND candidatura_renuncia.candidatura = tipo_eleccion;
        
	ELSEIF tipo_eleccion = 3 THEN
    
		SELECT 
		candidatura_gubernatura.nombre,
		candidatura_gubernatura.apellido_paterno,
		candidatura_gubernatura.apellido_materno,
		candidatura_gubernatura.genero,
		'Propietario' as propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_gubernatura.clave_elector,
        
		candidatura_gubernatura.num_emision,
		candidatura_gubernatura.ocr,
		candidatura_gubernatura.cic,
		candidatura_gubernatura.seccion,
        candidatura_gubernatura.fecha_nacimiento as fec_nacimiento,
        timestampdiff(Year,fecha_nacimiento,'2021-11-28') as edad,
		'Circunscripción única' as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_gubernatura.estado,
        historial.dia
		FROM candidatura_gubernatura, tipo_eleccion, partidos_politicos, historial
		WHERE 

        historial.clv_original = candidatura_gubernatura.clave_elector
        AND historial.id_tipo_eleccion = candidatura_gubernatura.candidatura
        AND historial.id_partido = candidatura_gubernatura.partido_politico
        AND historial.tipo = 'Registro'

        AND candidatura_gubernatura.partido_politico = partidos_politicos.id_partido
		AND tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura
		AND candidatura_gubernatura.candidatura = tipo_eleccion		
		AND IF( candidatura_gubernatura.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_gubernatura.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_gubernatura.genero =  generoP, true, generoP = 'Todos')

	Union all
		SELECT candidatura_renuncia.nombre, candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		candidatura_renuncia.distrito as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia
		FROM candidatura_renuncia, partidos_politicos, tipo_eleccion
		WHERE
		partidos_politicos.id_partido = candidatura_renuncia.partido_politico
		AND candidatura_renuncia.candidatura = tipo_eleccion
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos');
        
	ELSEIF tipo_eleccion = 4 THEN
    
		SELECT 
		candidatura_ayuntamiento.nombre,
		candidatura_ayuntamiento.apellido_paterno,
		candidatura_ayuntamiento.apellido_materno,
		candidatura_ayuntamiento.genero,
		candidatura_ayuntamiento.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_ayuntamiento.clave_elector,
        
		candidatura_ayuntamiento.num_emision,
		candidatura_ayuntamiento.ocr,
		candidatura_ayuntamiento.cic,
		candidatura_ayuntamiento.seccion,
        candidatura_ayuntamiento.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
        
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_ayuntamiento.estado,
        historial.dia
		FROM 
        candidatura_ayuntamiento, tipo_eleccion, partidos_politicos, municipios, historial
		WHERE 
        historial.clv_original = candidatura_ayuntamiento.clave_elector
        AND historial.id_tipo_eleccion = candidatura_ayuntamiento.candidatura
        AND historial.id_partido = candidatura_ayuntamiento.partido_politico
        AND historial.tipo = 'Registro'
		
        
        AND candidatura_ayuntamiento.partido_politico = partidos_politicos.id_partido
        AND municipios.id_municipio = candidatura_ayuntamiento.id_municipio
		
		AND tipo_eleccion.id_eleccion = candidatura_ayuntamiento.candidatura
		AND candidatura_ayuntamiento.candidatura = tipo_eleccion
		AND IF( candidatura_ayuntamiento.id_municipio =  municipio, true, municipio = 'Todos' )
        AND IF( candidatura_ayuntamiento.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_ayuntamiento.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_ayuntamiento.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_ayuntamiento.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
		SELECT 
		candidatura_renuncia.nombre,
		candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia
		FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, municipios
		WHERE
		partidos_politicos.id_partido = candidatura_renuncia.partido_politico
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND municipios.id_municipio = candidatura_renuncia.municipio
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
		AND candidatura_renuncia.candidatura = 4;
        
	ELSEIF tipo_eleccion = 5 THEN
    
		SELECT 
		candidatura_comunidad.nombre,
		candidatura_comunidad.apellido_paterno,
		candidatura_comunidad.apellido_materno,
		candidatura_comunidad.genero,
		candidatura_comunidad.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_comunidad.clave_elector,
        
		candidatura_comunidad.num_emision,
		candidatura_comunidad.ocr,
		candidatura_comunidad.cic,
		candidatura_comunidad.seccion,
        candidatura_comunidad.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        comunidades.nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_comunidad.estado,
        historial.dia
		FROM candidatura_comunidad, tipo_eleccion, partidos_politicos, municipios, historial, comunidades
		WHERE 

         historial.clv_original = candidatura_comunidad.clave_elector
        AND historial.id_tipo_eleccion = candidatura_comunidad.candidatura
        AND historial.id_partido = candidatura_comunidad.partido_politico
        AND historial.tipo = 'Registro'

        AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
		AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura
		AND candidatura_comunidad.candidatura = tipo_eleccion
		AND municipios.id_municipio = candidatura_comunidad.id_municipio
        AND comunidades.id_comunidad = candidatura_comunidad.id_comunidad
        AND IF( candidatura_comunidad.id_municipio =  municipio, true, municipio = 'Todos' )
        AND IF( candidatura_comunidad.id_comunidad =  origen, true, origen = 'Todos' )
        AND IF( candidatura_comunidad.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_comunidad.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_comunidad.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_comunidad.genero =  generoP, true, generoP = 'Todos')
	Union all
	    SELECT 
		candidatura_renuncia.nombre,
		candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
        
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia
		FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, municipios
		WHERE
		partidos_politicos.id_partido = candidatura_renuncia.partido_politico
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND municipios.id_municipio = candidatura_renuncia.municipio
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
        AND IF( candidatura_renuncia.municipio =  municipio, true, municipio = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
		AND candidatura_renuncia.candidatura = 5;
        
	ELSEIF tipo_eleccion = 6 THEN
    
		SELECT 
		candidatura_sindicatura.nombre,
		candidatura_sindicatura.apellido_paterno,
		candidatura_sindicatura.apellido_materno,
		candidatura_sindicatura.genero,
		candidatura_sindicatura.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_sindicatura.clave_elector,
        
		candidatura_sindicatura.num_emision,
		candidatura_sindicatura.ocr,
		candidatura_sindicatura.cic,
		candidatura_sindicatura.seccion,
        candidatura_sindicatura.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_sindicatura.estado,
        historial.dia
		FROM candidatura_sindicatura, tipo_eleccion, partidos_politicos, municipios, historial
		WHERE 
        historial.clv_original = candidatura_sindicatura.clave_elector
        AND historial.id_tipo_eleccion = candidatura_sindicatura.candidatura
        AND historial.id_partido = candidatura_sindicatura.partido_politico
        AND historial.tipo = 'Registro'

        AND candidatura_sindicatura.partido_politico = partidos_politicos.id_partido
        AND municipios.id_municipio = candidatura_sindicatura.id_municipio
		AND tipo_eleccion.id_eleccion = candidatura_sindicatura.candidatura
		AND candidatura_sindicatura.candidatura = tipo_eleccion
        AND IF( candidatura_sindicatura.id_municipio =  origen, true, origen = 'Todos' )
        AND IF( candidatura_sindicatura.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_sindicatura.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_sindicatura.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_sindicatura.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
		SELECT 
		candidatura_renuncia.nombre,
		candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia
		FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, municipios
		WHERE partidos_politicos.id_partido = candidatura_renuncia.partido_politico
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND municipios.id_municipio = candidatura_renuncia.municipio
        AND IF( candidatura_renuncia.municipio =  origen, true, origen = 'Todos' )
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
		AND candidatura_renuncia.candidatura = 6;
        
	ELSEIF tipo_eleccion = 7 THEN
    SELECT 
		candidatura_regiduria.nombre,
		candidatura_regiduria.apellido_paterno,
		candidatura_regiduria.apellido_materno,
		candidatura_regiduria.genero,
		candidatura_regiduria.propietario_suplente,
		partidos_politicos.nombre_partido as nombre_partido_politico,
		candidatura_regiduria.clave_elector,
        
		candidatura_regiduria.num_emision,
		candidatura_regiduria.ocr,
		candidatura_regiduria.cic,
		candidatura_regiduria.seccion,
        candidatura_regiduria.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_regiduria.estado,
        historial.dia
		FROM candidatura_regiduria, tipo_eleccion, partidos_politicos, municipios, historial
		WHERE 

        historial.clv_original = candidatura_regiduria.clave_elector
        AND historial.id_tipo_eleccion = candidatura_regiduria.candidatura
        AND historial.id_partido = candidatura_regiduria.partido_politico
        AND historial.tipo = 'Registro'

        AND candidatura_regiduria.partido_politico = partidos_politicos.id_partido
        AND municipios.id_municipio = candidatura_regiduria.id_municipio
		AND tipo_eleccion.id_eleccion = candidatura_regiduria.candidatura
		AND candidatura_regiduria.candidatura = tipo_eleccion
        AND IF( candidatura_regiduria.id_municipio =  origen, true, origen = 'Todos' )
        AND IF( candidatura_regiduria.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_regiduria.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_regiduria.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_regiduria.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
		SELECT 
		candidatura_renuncia.nombre,
		candidatura_renuncia.apellido_paterno,
		candidatura_renuncia.apellido_materno,
		candidatura_renuncia.genero,
		candidatura_renuncia.propietario_suplente,
		partidos_municipio.nombre as nombre_partido_politico,
		candidatura_renuncia.clave_elector,
        
		candidatura_renuncia.num_emision,
		candidatura_renuncia.ocr,
		candidatura_renuncia.cic,
		candidatura_renuncia.seccion,
        candidatura_renuncia.fec_nacimiento,
        timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
		municipios.nombre_municipio as nombre_distrito,
        '' as nombre_comunidad,
		tipo_eleccion.nombre as nombre_candidatura,
		candidatura_renuncia.estado,
        candidatura_renuncia.fecha_registro as dia
		FROM candidatura_renuncia, partidos_municipio, tipo_eleccion, municipios
		WHERE partidos_municipio.id_partido_municipio = candidatura_renuncia.partido_politico
		AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
		AND municipios.id_municipio = candidatura_renuncia.municipio
        AND IF( candidatura_renuncia.municipio =  origen, true, origen = 'Todos' )
		AND IF( candidatura_renuncia.partido_politico = partidos, true, partidos = 'Todos' )
		AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
		AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
		AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
		AND candidatura_renuncia.candidatura = 7;
	END IF;

END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoSubsanacion`(IN `clave_elector` VARCHAR(256))
BEGIN
		SELECT 
			candidatura_gubernatura.id_gubertatura AS id,
			candidatura_gubernatura.nombre,
			candidatura_gubernatura.apellido_paterno, 
			candidatura_gubernatura.apellido_materno, 
			tipo_eleccion.nombre as candidatura,
            candidatura_gubernatura.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
            
            '' as id_distrito,
			'' as id_municipio,
			'' as id_comunidad,
			candidatura_gubernatura.partido_politico as id_partido,
            
			null as nombre_distrito, 
			estados.nombre_estado, 
			candidatura_gubernatura.fecha_nacimiento, 
			candidatura_gubernatura.genero,
			candidatura_gubernatura.clave_elector,
			candidatura_gubernatura.curp,
			candidatura_gubernatura.tiempo_residencia, 
			candidatura_gubernatura.sobrenombre,
			'00' as prelacion,
			null as propietario_suplente, 
			candidatura_gubernatura.estado,
			candidatura_gubernatura.id_documento
		FROM candidatura_gubernatura, partidos_politicos, estados, tipo_eleccion
		WHERE 
        candidatura_gubernatura.clave_elector = clave_elector AND 
        candidatura_gubernatura.partido_politico = partidos_politicos.id_partido AND 
        candidatura_gubernatura.lugar_nacimiento = estados.id_estado AND 
        tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura
        
UNION ALL
		
       SELECT 
			candidatura_diputado.id,
			candidatura_diputado.nombre,
			candidatura_diputado.apellido_paterno,
			candidatura_diputado.apellido_materno,
			tipo_eleccion.nombre as candidatura,
            candidatura_diputado.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
			distrito.nombre as nombre_distrito,
            
			candidatura_diputado.distrito as id_distrito,
			'' as id_municipio,
			'' as id_comunidad,
			candidatura_diputado.partido_politico as id_partido,
            
			estados.nombre_estado,
			candidatura_diputado.fec_nacimiento,
			candidatura_diputado.genero,
			candidatura_diputado.clave_elector,
			candidatura_diputado.curp,
			candidatura_diputado.tiempo_residencia,
			candidatura_diputado.sobrenombre,
			candidatura_diputado.prelacion,
			candidatura_diputado.propietario_suplente,
			candidatura_diputado.estado,
			candidatura_diputado.id_documento
		FROM candidatura_diputado, partidos_politicos, tipo_eleccion, distrito, estados
		WHERE candidatura_diputado.clave_elector = clave_elector 
        AND candidatura_diputado.partido_politico = partidos_politicos.id_partido 
		AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura 
        AND candidatura_diputado.distrito = distrito.id_distrito 
        AND candidatura_diputado.lugarnacimiento = estados.id_estado

UNION ALL 

	SELECT
			candidatura_ayuntamiento.id_can_municipal AS id,
			candidatura_ayuntamiento.nombre,
			candidatura_ayuntamiento.apellido_paterno, 
			candidatura_ayuntamiento.apellido_materno,
			tipo_eleccion.nombre as candidatura,
			candidatura_ayuntamiento.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
			null as nombre_distrito,
            
            
			'' as id_distrito,
			candidatura_ayuntamiento.id_municipio as id_municipio,
			'' as id_comunidad,
			candidatura_ayuntamiento.partido_politico as id_partido,
            
			estados.nombre_estado,
			candidatura_ayuntamiento.fec_nacimiento,
			candidatura_ayuntamiento.genero,
			candidatura_ayuntamiento.clave_elector,
			candidatura_ayuntamiento.curp,
			candidatura_ayuntamiento.tiempo_residencia,
			candidatura_ayuntamiento.sobrenombre,
			'00' as prelacion,
			candidatura_ayuntamiento.propietario_suplente,
			candidatura_ayuntamiento.estado,
			candidatura_ayuntamiento.id_documento
		FROM candidatura_ayuntamiento, partidos_politicos, estados, tipo_eleccion
		WHERE candidatura_ayuntamiento.clave_elector = clave_elector 
		AND candidatura_ayuntamiento.partido_politico = partidos_politicos.id_partido
		AND candidatura_ayuntamiento.lugarnacimiento = estados.id_estado
		AND tipo_eleccion.id_eleccion = candidatura_ayuntamiento.candidatura
        
UNION ALL
	SELECT
			candidatura_sindicatura.id_sindicatura AS id,
			candidatura_sindicatura.nombre,
			candidatura_sindicatura.apellido_paterno, 
			candidatura_sindicatura.apellido_materno,
			tipo_eleccion.nombre as candidatura,
			candidatura_sindicatura.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
            
			'' as id_distrito,
			candidatura_sindicatura.id_municipio as id_municipio,
			'' as id_comunidad,
			candidatura_sindicatura.partido_politico as id_partido,
            
            
			null as nombre_distrito,
			estados.nombre_estado,
			candidatura_sindicatura.fec_nacimiento,
			candidatura_sindicatura.genero,
			candidatura_sindicatura.clave_elector,
			candidatura_sindicatura.curp,
			candidatura_sindicatura.tiempo_residencia,
			candidatura_sindicatura.sobrenombre,
			'00' as prelacion,
			candidatura_sindicatura.propietario_suplente,
			candidatura_sindicatura.estado,
			candidatura_sindicatura.id_documento
		FROM candidatura_sindicatura, partidos_politicos, estados, tipo_eleccion
		WHERE candidatura_sindicatura.clave_elector = clave_elector 
		AND candidatura_sindicatura.partido_politico = partidos_politicos.id_partido
		AND candidatura_sindicatura.lugarnacimiento = estados.id_estado
		AND tipo_eleccion.id_eleccion = candidatura_sindicatura.candidatura

UNION ALL
	SELECT
			candidatura_regiduria.id_regiduria AS id,
			candidatura_regiduria.nombre,
			candidatura_regiduria.apellido_paterno, 
			candidatura_regiduria.apellido_materno,
			tipo_eleccion.nombre as candidatura,
			candidatura_regiduria.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
            
			'' as id_distrito,
			candidatura_regiduria.id_municipio as id_municipio,
			'' as id_comunidad,
			candidatura_regiduria.partido_politico as id_partido,
            
			null as nombre_distrito,
			estados.nombre_estado,
			candidatura_regiduria.fec_nacimiento,
			candidatura_regiduria.genero,
			candidatura_regiduria.clave_elector,
			candidatura_regiduria.curp,
			candidatura_regiduria.tiempo_residencia,
			candidatura_regiduria.sobrenombre,
			'00' as prelacion,
			candidatura_regiduria.propietario_suplente,
			candidatura_regiduria.estado,
			candidatura_regiduria.id_documento
		FROM candidatura_regiduria, partidos_politicos, estados, tipo_eleccion
		WHERE candidatura_regiduria.clave_elector = clave_elector 
		AND candidatura_regiduria.partido_politico = partidos_politicos.id_partido
		AND candidatura_regiduria.lugarnacimiento = estados.id_estado
		AND tipo_eleccion.id_eleccion = candidatura_regiduria.candidatura

UNION ALL 
	SELECT
			candidatura_comunidad.id_can_comunidad AS id,
			candidatura_comunidad.nombre,
			candidatura_comunidad.apellido_paterno, 
			candidatura_comunidad.apellido_materno,
			tipo_eleccion.nombre as candidatura,
			candidatura_comunidad.candidatura as id_candidatura,
			partidos_politicos.nombre_partido as partido_politico,
            
            '' as id_distrito,
			candidatura_comunidad.id_municipio as id_municipio,
			candidatura_comunidad.id_comunidad as id_comunidad,
			candidatura_comunidad.partido_politico as id_partido,
            
			null as nombre_distrito,
			estados.nombre_estado,
			candidatura_comunidad.fec_nacimiento,
			candidatura_comunidad.genero,
			candidatura_comunidad.clave_elector,
			candidatura_comunidad.curp,
			candidatura_comunidad.tiempo_residencia,
			candidatura_comunidad.sobrenombre,
			'00' as prelacion,
			candidatura_comunidad.propietario_suplente,
			candidatura_comunidad.estado,
			candidatura_comunidad.id_documento
		FROM candidatura_comunidad, partidos_politicos, estados, tipo_eleccion
		WHERE candidatura_comunidad.clave_elector = clave_elector 
		AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
		AND candidatura_comunidad.lugarnacimiento = estados.id_estado
		AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMuniParticipantes`()
BEGIN
	SELECT DISTINCT municipios.id_municipio, municipios.nombre_municipio FROM municipios, comunidades WHERE comunidades.id_municipio = municipios.id_municipio;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistrosCandidatos`(IN `clave_elector` VARCHAR(256))
BEGIN

	SELECT
		candidatura_diputado.id as id_reg,
		candidatura_diputado.nombre,
		candidatura_diputado.apellido_paterno,
		candidatura_diputado.apellido_materno,
		tipo_eleccion.nombre as candidatura,
        candidatura_diputado.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		distrito.nombre as nombre_distrito,
		estados.nombre_estado, 
		candidatura_diputado.fec_nacimiento,
		candidatura_diputado.genero,
		candidatura_diputado.clave_elector,
		candidatura_diputado.curp,
		candidatura_diputado.num_emision,
        candidatura_diputado.ocr,
        candidatura_diputado.cic,
        candidatura_diputado.seccion,
        
		candidatura_diputado.distrito as id_distrito,
		'' as id_municipio,
		'' as id_comunidad,
		candidatura_diputado.partido_politico as id_partido,
        
		candidatura_diputado.tiempo_residencia,
		candidatura_diputado.sobrenombre,
		candidatura_diputado.prelacion,
		candidatura_diputado.propietario_suplente,
		candidatura_diputado.estado,
		candidatura_diputado.id_documento
		
		FROM candidatura_diputado, partidos_politicos, tipo_eleccion, distrito, estados
		WHERE 
        candidatura_diputado.clave_elector = clave_elector AND 
        candidatura_diputado.partido_politico = partidos_politicos.id_partido 
		AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura AND candidatura_diputado.distrito = distrito.id_distrito AND candidatura_diputado.lugarnacimiento = estados.id_estado
		
	UNION ALL
	
	SELECT
		candidatura_gubernatura.id_gubertatura as id_reg,
		candidatura_gubernatura.nombre,
		candidatura_gubernatura.apellido_paterno,
		candidatura_gubernatura.apellido_materno,
		tipo_eleccion.nombre as candidatura,
        candidatura_gubernatura.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		' ' as nombre_distrito,
		estados.nombre_estado,
		candidatura_gubernatura.fecha_nacimiento as fec_nacimiento,
		candidatura_gubernatura.genero,
		candidatura_gubernatura.clave_elector,
		candidatura_gubernatura.curp,
        candidatura_gubernatura.num_emision,
        candidatura_gubernatura.ocr,
        candidatura_gubernatura.cic,
        candidatura_gubernatura.seccion,
        
		'' as id_distrito,
		'' as id_municipio,
		'' as id_comunidad,
		candidatura_gubernatura.partido_politico as id_partido,
        
		candidatura_gubernatura.tiempo_residencia,
		candidatura_gubernatura.sobrenombre,
		' ' as prelacion,
		' ' as propietario_suplente,
		candidatura_gubernatura.estado,
		candidatura_gubernatura.id_documento
		FROM candidatura_gubernatura, partidos_politicos, estados, tipo_eleccion
		WHERE 
        candidatura_gubernatura.clave_elector = clave_elector AND 
        partidos_politicos.id_partido = candidatura_gubernatura.partido_politico AND 
        estados.id_estado = candidatura_gubernatura.lugar_nacimiento AND 
        candidatura_gubernatura.candidatura = tipo_eleccion.id_eleccion
        
	UNION ALL
        SELECT 
		candidatura_ayuntamiento.id_can_municipal as id_reg,
		candidatura_ayuntamiento.nombre,
		candidatura_ayuntamiento.apellido_paterno,
		candidatura_ayuntamiento.apellido_materno,
		tipo_eleccion.nombre as candidatura,
		candidatura_ayuntamiento.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		' ' as nombre_distrito,
		estados.nombre_estado,
		candidatura_ayuntamiento.fec_nacimiento as fec_nacimiento,
		candidatura_ayuntamiento.genero,
		candidatura_ayuntamiento.clave_elector,
		candidatura_ayuntamiento.curp,
        candidatura_ayuntamiento.num_emision,
        candidatura_ayuntamiento.ocr,
        candidatura_ayuntamiento.cic,
        candidatura_ayuntamiento.seccion,
        
        '' as id_distrito,
		candidatura_ayuntamiento.id_municipio as id_municipio,
		'' as id_comunidad,
		candidatura_ayuntamiento.partido_politico as id_partido,
        
		candidatura_ayuntamiento.tiempo_residencia,
		candidatura_ayuntamiento.sobrenombre,
		' ' as prelacion,
		candidatura_ayuntamiento.propietario_suplente,
		candidatura_ayuntamiento.estado,
		candidatura_ayuntamiento.id_documento
		FROM candidatura_ayuntamiento, tipo_eleccion, estados, partidos_politicos 
		WHERE candidatura_ayuntamiento.clave_elector = clave_elector AND partidos_politicos.id_partido = candidatura_ayuntamiento.partido_politico AND 
        estados.id_estado = candidatura_ayuntamiento.lugarnacimiento AND tipo_eleccion.id_eleccion = candidatura_ayuntamiento.candidatura
        
	UNION ALL
	
		SELECT
		candidatura_comunidad.id_can_comunidad  as id_reg,
		candidatura_comunidad.nombre,
		candidatura_comunidad.apellido_paterno,
		candidatura_comunidad.apellido_materno,
		tipo_eleccion.nombre as candidatura,
        candidatura_comunidad.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		'Comunidad' as nombre_distrito,
		estados.nombre_estado, 
		candidatura_comunidad.fec_nacimiento,
		candidatura_comunidad.genero,
		candidatura_comunidad.clave_elector,
		candidatura_comunidad.curp,
        candidatura_comunidad.num_emision,
        candidatura_comunidad.ocr,
        candidatura_comunidad.cic,
        candidatura_comunidad.seccion,
        
		'' as id_distrito,
		candidatura_comunidad.id_municipio as id_municipio,
		candidatura_comunidad.id_comunidad as id_comunidad,
		candidatura_comunidad.partido_politico as id_partido,
        
		candidatura_comunidad.tiempo_residencia,
		candidatura_comunidad.sobrenombre,
		'00' as prelacion,
		candidatura_comunidad.propietario_suplente,
		candidatura_comunidad.estado,
		candidatura_comunidad.id_documento
		
		FROM candidatura_comunidad, partidos_politicos, tipo_eleccion, estados
		WHERE 
        candidatura_comunidad.clave_elector = clave_elector 
        AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
		AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura 
        AND candidatura_comunidad.lugarnacimiento = estados.id_estado
        
	UNION ALL

		SELECT 
		candidatura_sindicatura.id_sindicatura as id_reg,
		candidatura_sindicatura.nombre,
		candidatura_sindicatura.apellido_paterno,
		candidatura_sindicatura.apellido_materno,
		tipo_eleccion.nombre as candidatura,
		candidatura_sindicatura.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		' ' as nombre_distrito,
		estados.nombre_estado,
		candidatura_sindicatura.fec_nacimiento as fec_nacimiento,
		candidatura_sindicatura.genero,
		candidatura_sindicatura.clave_elector,
		candidatura_sindicatura.curp,
        candidatura_sindicatura.num_emision,
        candidatura_sindicatura.ocr,
        candidatura_sindicatura.cic,
        candidatura_sindicatura.seccion,
        
		'' as id_distrito,
		candidatura_sindicatura.id_municipio as id_municipio,
		'' as id_comunidad,
		candidatura_sindicatura.partido_politico as id_partido,
        
		candidatura_sindicatura.tiempo_residencia,
		candidatura_sindicatura.sobrenombre,
		' ' as prelacion,
		candidatura_sindicatura.propietario_suplente,
		candidatura_sindicatura.estado,
		candidatura_sindicatura.id_documento
		FROM candidatura_sindicatura, tipo_eleccion, estados, partidos_politicos 
		WHERE candidatura_sindicatura.clave_elector = clave_elector AND partidos_politicos.id_partido = candidatura_sindicatura.partido_politico AND 
        estados.id_estado = candidatura_sindicatura.lugarnacimiento AND tipo_eleccion.id_eleccion = candidatura_sindicatura.candidatura

	UNION ALL

		SELECT 
		candidatura_regiduria.id_regiduria as id_reg,
		candidatura_regiduria.nombre,
		candidatura_regiduria.apellido_paterno,
		candidatura_regiduria.apellido_materno,
		tipo_eleccion.nombre as candidatura,
		candidatura_regiduria.candidatura as id_candidatura,
		partidos_politicos.nombre_partido as partido_politico,
		' ' as nombre_distrito,
		estados.nombre_estado,
		candidatura_regiduria.fec_nacimiento as fec_nacimiento,
		candidatura_regiduria.genero,
		candidatura_regiduria.clave_elector,
		candidatura_regiduria.curp,
        candidatura_regiduria.num_emision,
        candidatura_regiduria.ocr,
        candidatura_regiduria.cic,
        candidatura_regiduria.seccion,
        
		'' as id_distrito,
		candidatura_regiduria.id_municipio as id_municipio,
		'' as id_comunidad,
		candidatura_regiduria.partido_politico as id_partido,
        
        
		candidatura_regiduria.tiempo_residencia,
		candidatura_regiduria.sobrenombre,
		candidatura_regiduria.candidatura as prelacion,
		candidatura_regiduria.propietario_suplente,
		candidatura_regiduria.estado,
		candidatura_regiduria.id_documento
		FROM candidatura_regiduria, tipo_eleccion, estados, partidos_politicos 
		WHERE candidatura_regiduria.clave_elector = clave_elector AND partidos_politicos.id_partido = candidatura_regiduria.partido_politico AND 
        estados.id_estado = candidatura_regiduria.lugarnacimiento AND tipo_eleccion.id_eleccion = candidatura_regiduria.candidatura; 
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getReportsAll`(IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100))
BEGIN
	SELECT nombre, apellido_paterno, apellido_materno, genero, propietario_suplente, nombre_partido_politico, clave_elector, num_emision, ocr, cic, seccion, nombre_distrito, nombre_candidatura, estado, dia, fec_nacimiento, nombre_comunidad, edad
		FROM ( 
			SELECT 
            candidatura_gubernatura.nombre, 
			candidatura_gubernatura.apellido_paterno, 
			candidatura_gubernatura.apellido_materno,
			candidatura_gubernatura.genero, 
			'Propietario' as propietario_suplente, 
			partidos_politicos.nombre_partido  as nombre_partido_politico,
			candidatura_gubernatura.clave_elector, 
            
            candidatura_gubernatura.num_emision,
            candidatura_gubernatura.ocr,
            candidatura_gubernatura.cic,
            candidatura_gubernatura.seccion,
            candidatura_gubernatura.fecha_nacimiento as fec_nacimiento,
            timestampdiff(Year,fecha_nacimiento,'2021-11-28') as edad,
			'Circunscripción única' as nombre_distrito, 
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_gubernatura.estado,
            historial.dia
			FROM candidatura_gubernatura, tipo_eleccion, partidos_politicos, historial
			WHERE 
            historial.clv_original = candidatura_gubernatura.clave_elector
            AND historial.id_tipo_eleccion = candidatura_gubernatura.candidatura
            AND historial.id_partido = candidatura_gubernatura.partido_politico
			AND historial.tipo = 'Registro'
            AND candidatura_gubernatura.partido_politico = partidos_politicos.id_partido
			AND tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura
           
			AND IF( candidatura_gubernatura.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_gubernatura.genero =  generoP, true, generoP = 'Todos') 
            
		UNION ALL
        
			SELECT candidatura_renuncia.nombre, 
			candidatura_renuncia.apellido_paterno,
			candidatura_renuncia.apellido_materno,
			candidatura_renuncia.genero,
			candidatura_renuncia.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_renuncia.clave_elector,
            
            candidatura_renuncia.num_emision,
            candidatura_renuncia.ocr,
            candidatura_renuncia.cic,
            candidatura_renuncia.seccion,
            candidatura_renuncia.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			candidatura_renuncia.distrito as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_renuncia.estado,
            candidatura_renuncia.fecha_registro as dia
			FROM candidatura_renuncia, partidos_politicos, tipo_eleccion
			WHERE 
			partidos_politicos.id_partido = candidatura_renuncia.partido_politico
			AND candidatura_renuncia.candidatura = 3
			AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
			AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
            
            
            
            
            
	UNION ALL
			SELECT 
			candidatura_diputado.nombre,
			candidatura_diputado.apellido_paterno,
			candidatura_diputado.apellido_materno,
			candidatura_diputado.genero,
			candidatura_diputado.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_diputado.clave_elector,
            
			candidatura_diputado.num_emision,
            candidatura_diputado.ocr,
            candidatura_diputado.cic,
            candidatura_diputado.seccion,
            candidatura_diputado.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			distrito.nombre as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_diputado.estado,
			historial.dia
			FROM candidatura_diputado, tipo_eleccion, partidos_politicos, distrito, historial
			WHERE 
			historial.clv_original = candidatura_diputado.clave_elector
            AND historial.id_tipo_eleccion = candidatura_diputado.candidatura
            AND historial.id_partido = candidatura_diputado.partido_politico
            AND historial.tipo = 'Registro'
            
            AND candidatura_diputado.partido_politico = partidos_politicos.id_partido
			AND tipo_eleccion.id_eleccion = candidatura_diputado.candidatura
			AND distrito.id_distrito = candidatura_diputado.distrito
			AND IF( candidatura_diputado.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_diputado.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_diputado.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
			SELECT 
			candidatura_renuncia.nombre,
			candidatura_renuncia.apellido_paterno,
			candidatura_renuncia.apellido_materno,
			candidatura_renuncia.genero,
			candidatura_renuncia.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_renuncia.clave_elector,
            
			candidatura_renuncia.num_emision,
            candidatura_renuncia.ocr,
            candidatura_renuncia.cic,
            candidatura_renuncia.seccion,
            candidatura_renuncia.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			distrito.nombre as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_renuncia.estado,
			candidatura_renuncia.fecha_registro as dia
			FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, distrito
			WHERE
			partidos_politicos.id_partido = candidatura_renuncia.partido_politico
			AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
			AND distrito.id_distrito = candidatura_renuncia.distrito
			AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
			AND (candidatura_renuncia.candidatura = 1 OR candidatura_renuncia.candidatura = 2)
                
		
                
	UNION ALL
			SELECT 
			candidatura_ayuntamiento.nombre,
			candidatura_ayuntamiento.apellido_paterno,
			candidatura_ayuntamiento.apellido_materno,
			candidatura_ayuntamiento.genero,
			candidatura_ayuntamiento.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_ayuntamiento.clave_elector,
            
			candidatura_ayuntamiento.num_emision,
            candidatura_ayuntamiento.ocr,
            candidatura_ayuntamiento.cic,
            candidatura_ayuntamiento.seccion,
            candidatura_ayuntamiento.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			municipios.nombre_municipio as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_ayuntamiento.estado,
            historial.dia
			FROM candidatura_ayuntamiento, tipo_eleccion, partidos_politicos, municipios, historial
			WHERE 
            historial.clv_original = candidatura_ayuntamiento.clave_elector
            AND historial.id_tipo_eleccion = candidatura_ayuntamiento.candidatura
            AND historial.id_partido = candidatura_ayuntamiento.partido_politico
            AND historial.tipo = 'Registro'
            
            AND candidatura_ayuntamiento.partido_politico = partidos_politicos.id_partido
			AND municipios.id_municipio = candidatura_ayuntamiento.id_municipio
			AND tipo_eleccion.id_eleccion = candidatura_ayuntamiento.candidatura
			AND IF( candidatura_ayuntamiento.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_ayuntamiento.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_ayuntamiento.genero =  generoP, true, generoP = 'Todos')
            
UNION ALL
			SELECT
			candidatura_sindicatura.nombre,
			candidatura_sindicatura.apellido_paterno,
			candidatura_sindicatura.apellido_materno,
			candidatura_sindicatura.genero,
			candidatura_sindicatura.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_sindicatura.clave_elector,
            
            
			candidatura_sindicatura.num_emision,
            candidatura_sindicatura.ocr,
            candidatura_sindicatura.cic,
            candidatura_sindicatura.seccion,
            candidatura_sindicatura.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
            
			municipios.nombre_municipio as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_sindicatura.estado,
            historial.dia
            
			FROM candidatura_sindicatura, tipo_eleccion, partidos_politicos, municipios, historial
			WHERE 
            historial.clv_original = candidatura_sindicatura.clave_elector
            AND historial.id_tipo_eleccion = candidatura_sindicatura.candidatura
            AND historial.id_partido = candidatura_sindicatura.partido_politico
            AND historial.tipo = 'Registro'
            
            AND candidatura_sindicatura.partido_politico = partidos_politicos.id_partido
            AND municipios.id_municipio = candidatura_sindicatura.id_municipio
			AND tipo_eleccion.id_eleccion = candidatura_sindicatura.candidatura
			AND IF( candidatura_sindicatura.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_sindicatura.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_sindicatura.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
			SELECT
			candidatura_regiduria.nombre,
			candidatura_regiduria.apellido_paterno,
			candidatura_regiduria.apellido_materno,
			candidatura_regiduria.genero,
			candidatura_regiduria.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_regiduria.clave_elector,
            
			candidatura_regiduria.num_emision,
            candidatura_regiduria.ocr,
            candidatura_regiduria.cic,
            candidatura_regiduria.seccion,
            candidatura_regiduria.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			municipios.nombre_municipio as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_regiduria.estado,
            historial.dia
			FROM candidatura_regiduria, tipo_eleccion, partidos_politicos, municipios, historial
			WHERE 
			historial.clv_original = candidatura_regiduria.clave_elector
            AND historial.id_tipo_eleccion = candidatura_regiduria.candidatura
            AND historial.id_partido = candidatura_regiduria.partido_politico
            AND historial.tipo = 'Registro'
            
            AND candidatura_regiduria.partido_politico = partidos_politicos.id_partido
            AND municipios.id_municipio = candidatura_regiduria.id_municipio
			AND tipo_eleccion.id_eleccion = candidatura_regiduria.candidatura
			AND IF( candidatura_regiduria.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_regiduria.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_regiduria.genero =  generoP, true, generoP = 'Todos')
	UNION ALL
		   SELECT 
			candidatura_renuncia.nombre,
			candidatura_renuncia.apellido_paterno,
			candidatura_renuncia.apellido_materno,
			candidatura_renuncia.genero,
			candidatura_renuncia.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_renuncia.clave_elector,
            
            
			candidatura_renuncia.num_emision,
            candidatura_renuncia.ocr,
            candidatura_renuncia.cic,
            candidatura_renuncia.seccion,
            candidatura_renuncia.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
            
			municipios.nombre_municipio as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_renuncia.estado,
			candidatura_renuncia.fecha_registro as dia
			FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, municipios
			WHERE
			partidos_politicos.id_partido = candidatura_renuncia.partido_politico
			AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
			AND municipios.id_municipio = candidatura_renuncia.municipio
			AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
			AND (candidatura_renuncia.candidatura =  4 OR candidatura_renuncia.candidatura = 6 OR candidatura_renuncia.candidatura = 7)
	UNION ALL
			SELECT 
			candidatura_comunidad.nombre,
			candidatura_comunidad.apellido_paterno,
			candidatura_comunidad.apellido_materno,
			candidatura_comunidad.genero,
			candidatura_comunidad.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_comunidad.clave_elector,
            
			candidatura_comunidad.num_emision,
            candidatura_comunidad.ocr,
            candidatura_comunidad.cic,
            candidatura_comunidad.seccion,
            candidatura_comunidad.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
			municipios.nombre_municipio as nombre_distrito,
            comunidades.nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_comunidad.estado,
            historial.dia
			FROM candidatura_comunidad, tipo_eleccion, partidos_politicos, municipios, historial, comunidades
			WHERE 
			historial.clv_original = candidatura_comunidad.clave_elector
            AND historial.id_tipo_eleccion = candidatura_comunidad.candidatura
            AND historial.id_partido = candidatura_comunidad.partido_politico
            AND historial.tipo = 'Registro'
            
            AND candidatura_comunidad.partido_politico = partidos_politicos.id_partido
			AND municipios.id_municipio = candidatura_comunidad.id_municipio
			AND tipo_eleccion.id_eleccion = candidatura_comunidad.candidatura
            AND comunidades.id_comunidad = candidatura_comunidad.id_comunidad
           			AND IF( candidatura_comunidad.estado = estado_candidato, true,  estado_candidato = 'Todos')
             

			AND IF( candidatura_comunidad.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_comunidad.genero =  generoP, true, generoP = 'Todos')
	UNION ALL 
			SELECT 
			candidatura_renuncia.nombre,
			candidatura_renuncia.apellido_paterno,
			candidatura_renuncia.apellido_materno,
			candidatura_renuncia.genero,
			candidatura_renuncia.propietario_suplente,
			partidos_politicos.nombre_partido as nombre_partido_politico,
			candidatura_renuncia.clave_elector,
            
			candidatura_renuncia.num_emision,
            candidatura_renuncia.ocr,
            candidatura_renuncia.cic,
            candidatura_renuncia.seccion,
            candidatura_renuncia.fec_nacimiento,
            timestampdiff(Year,fec_nacimiento,'2021-11-28') as edad,
            
			municipios.nombre_municipio as nombre_distrito,
            '' as nombre_comunidad,
			tipo_eleccion.nombre as nombre_candidatura,
			candidatura_renuncia.estado,
			candidatura_renuncia.fecha_registro as dia
			FROM candidatura_renuncia, partidos_politicos, tipo_eleccion, municipios
			WHERE
			partidos_politicos.id_partido = candidatura_renuncia.partido_politico
			AND tipo_eleccion.id_eleccion = candidatura_renuncia.candidatura
			AND municipios.id_municipio = candidatura_renuncia.municipio				
			AND IF( candidatura_renuncia.propietario_suplente =  tipo_candidatura, true, tipo_candidatura = 'Todos' )
			AND IF( candidatura_renuncia.estado = estado_candidato, true,  estado_candidato = 'Todos')
			AND IF( candidatura_renuncia.genero =  generoP, true, generoP = 'Todos')
			AND candidatura_renuncia.candidatura = 5 
	) datos order by nombre_candidatura, nombre_candidatura, nombre_distrito, nombre_partido_politico;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSlctPartidos`()
BEGIN

	SELECT partidos_politicos.id_partido as id, partidos_politicos.nombre_partido AS nombre_partido, partidos_politicos.tipo_constitucion as id_constitucion, tipo_constitucion.nombre as nombre_constitucion 
        FROM partidos_politicos, tipo_constitucion 
        WHERE partidos_politicos.tipo_constitucion = tipo_constitucion.id_constitucion 
        ORDER BY partidos_politicos.tipo_constitucion, id ASC;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoUsuario`(IN `nombre_capturista` VARCHAR(100), IN `app_capturista` VARCHAR(100), IN `apm_capturista` VARCHAR(100), IN `usuario` VARCHAR(100), IN `contraseña` VARCHAR(100), IN `rol` VARCHAR(100), IN `user_estado` VARCHAR(100))
BEGIN

	declare newPassword varchar(256);
    set newPassword = concat( 'ite' , contraseña, 'tlax' );

	INSERT INTO usuarios VALUES ( 
		null, 
		nombre_capturista,
        app_capturista, 
        apm_capturista,
        usuario, 
        SHA2( newPassword, 0 ),
        rol, 
        user_estado,''); 
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `otraCandidatura`(IN `curp` VARCHAR(256), IN `clave` VARCHAR(256))
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
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pruebaFecha`(IN `tipo_eleccion` VARCHAR(100), IN `origen` VARCHAR(100), IN `partidos` VARCHAR(100), IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100), IN `municipio` VARCHAR(100))
BEGIN
	SELECT nombre, apellido_paterno, apellido_materno, genero, propietario_suplente, nombre_partido_politico, clave_elector,
			nombre_distrito, nombre_candidatura, estado
			FROM ( 
            (
				SELECT 
                candidatura_gubernatura.nombre, 
                candidatura_gubernatura.apellido_paterno, 
                candidatura_gubernatura.apellido_materno,
				candidatura_gubernatura.genero, 
                'Propietario' as propietario_suplente, 
                partidos_gubernatura.nombre_partido as nombre_partido_politico,
				candidatura_gubernatura.clave_elector, 
                'Circunscripción única' as nombre_distrito, 
                tipo_eleccion.nombre as nombre_candidatura,
				candidatura_gubernatura.estado
				FROM candidatura_gubernatura, tipo_eleccion, partidos_gubernatura
				WHERE candidatura_gubernatura.partido_politico = partidos_gubernatura.id_partido_gubernatura
				AND tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura
				AND IF( candidatura_gubernatura.estado = estado_candidato, true,  estado_candidato = 'Todos')
				AND IF( candidatura_gubernatura.genero =  generoP, true, generoP = 'Todos')  
            ) 
            ) datos;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rep_diario`(IN `dia` VARCHAR(100))
BEGIN

	SELECT historial.dia, historial.nombre_clv, historial.clv_original, partido, nombre_candidatura, distrito, genero, canGu.estado, comunidad
	FROM historial JOIN 
    ( 
		select partidos_politicos.nombre_partido AS partido, tipo_eleccion.nombre as nombre_candidatura, 'Circunscripción única' as distrito, '' as comunidad, candidatura_gubernatura.genero, candidatura_gubernatura.estado, candidatura_gubernatura.clave_elector, candidatura_gubernatura.candidatura 
		from candidatura_gubernatura, partidos_politicos, tipo_eleccion
		WHERE candidatura_gubernatura.partido_politico = partidos_politicos.id_partido and tipo_eleccion.id_eleccion = candidatura_gubernatura.candidatura  ) canGu
    WHERE historial.dia = dia and historial.clv_original = canGu.clave_elector
    
    union all
        SELECT historial.dia, historial.nombre_clv, historial.clv_original, partido, nombre_candidatura, distrito, genero, canDi.estado, comunidad
		FROM historial JOIN ( 
			select PD.nombre_partido AS partido, TE.nombre as nombre_candidatura, distrito.nombre AS distrito, CD.genero, CD.estado, CD.clave_elector, candidatura , '' as comunidad
			from candidatura_diputado as CD, partidos_politicos as PD, tipo_eleccion as TE, distrito
			WHERE CD.partido_politico = PD.id_partido and TE.id_eleccion = CD.candidatura and distrito.id_distrito = CD.distrito  ) canDi 
     WHERE historial.dia = dia and historial.clv_original = canDi.clave_elector
     
	union all 
    
	SELECT historial.dia, historial.nombre_clv, historial.clv_original, partido, nombre_candidatura, distrito, genero, canAY.estado, comunidad
	FROM historial JOIN ( 
		select  PM.nombre_partido AS partido, TE.nombre as nombre_candidatura, municipios.nombre_municipio as distrito , CA.genero, CA.estado, CA.clave_elector, CA.candidatura, '' as comunidad
		from candidatura_ayuntamiento as CA, partidos_politicos as PM, tipo_eleccion as TE, municipios
		WHERE CA.partido_politico = PM.id_partido and TE.id_eleccion = CA.candidatura AND municipios.id_municipio = CA.id_municipio  ) canAY 
	WHERE historial.dia = dia and historial.clv_original = canAY.clave_elector
     
	UNION ALL
     
	SELECT historial.dia, historial.nombre_clv, historial.clv_original, partido, nombre_candidatura, distrito, genero, canCo.estado, comunidad
	FROM historial JOIN ( 
		select PC.nombre_partido AS partido, TE.nombre as nombre_candidatura, municipios.nombre_municipio as distrito, CC.genero, CC.estado, CC.clave_elector, CC.candidatura, comunidades.nombre_comunidad as comunidad
		from candidatura_comunidad as CC, partidos_politicos as PC, tipo_eleccion as TE, municipios, comunidades
		WHERE CC.partido_politico = PC.id_partido and TE.id_eleccion = CC.candidatura AND municipios.id_municipio = CC.id_municipio AND comunidades.id_comunidad = CC.id_comunidad  ) canCo 
	WHERE historial.dia = dia and historial.clv_original = canCo.clave_elector;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `subsanarMunicipal`(IN `candidato_nombre` VARCHAR(150), IN `candidato_ap_paterno` VARCHAR(150), IN `candidato_ap_materno` VARCHAR(150), IN `candidato_genero` VARCHAR(150), IN `idTipoCandidatura` INT, IN `candidato_clave_elector` VARCHAR(150), IN `candidato_curp` VARCHAR(150), IN `candidato_num_emision` VARCHAR(256), IN `candidato_ocr` VARCHAR(256), IN `candidato_cic` VARCHAR(256), IN `candidato_seccion` VARCHAR(256), IN `candidato_fec_nacimiento` VARCHAR(150), IN `candidato_tiempo_residencia` VARCHAR(50), IN `candidato_sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `usuario` VARCHAR(150), IN `tipoAccion` VARCHAR(150), IN `claveOriginal` VARCHAR(150), IN `claveNuevo` VARCHAR(150), IN `motivoRenuncia` VARCHAR(150), IN `dia` VARCHAR(150), IN `hora` VARCHAR(150), IN `carta_3_3_g` VARCHAR(50), IN `carta_reeleccion_g` VARCHAR(50), IN `const_autorizacion_organo_g` VARCHAR(50), IN `manifes_autoadcripcion_g` VARCHAR(50), IN `constancia_vinculo_comuni_g` VARCHAR(50), IN `snr` VARCHAR(50), IN `reg` VARCHAR(50), IN `act` VARCHAR(50), IN `copia` VARCHAR(50), IN `credencial` VARCHAR(50), IN `aceptacion` VARCHAR(50), IN `separacion` VARCHAR(50), IN `radicacion` VARCHAR(50), IN `nopenales` VARCHAR(50), IN `noinahbilitado` VARCHAR(50), IN `manifiesto` VARCHAR(50), IN `capacidad` VARCHAR(50), IN `cedularfc` VARCHAR(50), `email` VARCHAR(30))
BEGIN

	IF idTipoCandidatura = 6 THEN 
    
		UPDATE candidatura_sindicatura
			SET
			nombre = candidato_nombre,
			apellido_paterno = candidato_ap_paterno,
			apellido_materno = candidato_ap_materno,
			fec_nacimiento = candidato_fec_nacimiento,
			genero = candidato_genero,
			clave_elector = candidato_clave_elector,
			curp = candidato_curp,
            
            num_emision = candidato_num_emision,
			ocr = candidato_ocr,
			cic = candidato_cic,
			seccion = candidato_seccion,
            
            
			tiempo_residencia = candidato_tiempo_residencia,
			estado = estado,
			sobrenombre = candidato_sobrenombre,
            email = email
		WHERE clave_elector = claveOriginal AND candidatura = idTipoCandidatura ;
        
	ELSEIF idTipoCandidatura = 7 THEN
		
		UPDATE candidatura_regiduria
			SET
			nombre = candidato_nombre,
			apellido_paterno = candidato_ap_paterno,
			apellido_materno = candidato_ap_materno,
			fec_nacimiento = candidato_fec_nacimiento,
			genero = candidato_genero,
			clave_elector = candidato_clave_elector,
			curp = candidato_curp,
            
            num_emision = candidato_num_emision,
			ocr = candidato_ocr,
			cic = candidato_cic,
			seccion = candidato_seccion,
            
			tiempo_residencia = candidato_tiempo_residencia,
			estado = estado,
			sobrenombre = candidato_sobrenombre,
            email = email
		WHERE clave_elector = claveOriginal AND candidatura = idTipoCandidatura ;

	ELSEIF idTipoCandidatura = 4 THEN 
    
		UPDATE candidatura_ayuntamiento
		SET
			nombre = candidato_nombre,
			apellido_paterno = candidato_ap_paterno,
			apellido_materno = candidato_ap_materno,
			fec_nacimiento = candidato_fec_nacimiento,
			genero = candidato_genero,
			clave_elector = candidato_clave_elector,
			curp = candidato_curp,
            
            num_emision = candidato_num_emision,
			ocr = candidato_ocr,
			cic = candidato_cic,
			seccion = candidato_seccion,
            
			tiempo_residencia = candidato_tiempo_residencia,
			estado = estado,
			sobrenombre = candidato_sobrenombre,
            email = email
		WHERE clave_elector = claveOriginal AND candidatura = idTipoCandidatura ;
    END IF;
    
		 UPDATE candidatura_documentado
         SET
         carta_3_3= carta_3_3_g,
         carta_reeleccion = carta_reeleccion_g, 
         const_autorizacion_organo = const_autorizacion_organo_g, 
         manifes_autoadcripcion = manifes_autoadcripcion_g, 
         constancia_vinculo_comuni = constancia_vinculo_comuni_g,
         
         doc_snr_ine = snr,
         act_de_nacimiento = act,
         copia_act_de_nacimiento = copia,
         const_separacion_cargo = separacion,
         escrito_bajo = noinahbilitado,
         const_act_no_penales = nopenales,
         solicitud_registro = reg,
         cred_para_votar = credencial,
         const_acept_postulacion = aceptacion,
         const_residencia = radicacion,
         manifiesto = manifiesto,
         capacidad_economica = capacidad,
         cedula_rfc = cedularfc
         WHERE clave_elector = claveOriginal AND id_tipo_registro = idTipoCandidatura;

        UPDATE candidatura_documentado SET clave_elector = candidato_clave_elector WHERE clave_elector = claveOriginal AND id_tipo_registro = idTipoCandidatura;
        
        UPDATE historial SET clv_original = candidato_clave_elector WHERE clv_original = claveOriginal AND id_tipo_eleccion = idTipoCandidatura;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `subsanerGobernador`(IN `candidato_nombre` VARCHAR(256), IN `candidato_ap_paterno` VARCHAR(256), IN `candidato_ap_materno` VARCHAR(256), IN `candidato_fec_nacimiento` DATE, IN `candidato_genero` VARCHAR(120), IN `candidato_clave_elector` VARCHAR(256), IN `candidato_curp` VARCHAR(256), IN `candidato_num_emision_rp` VARCHAR(256), IN `candidato_ocr_rp` VARCHAR(256), IN `candidato_cic_rp` VARCHAR(256), IN `candidato_seccion_rp` VARCHAR(256), IN `candidato_tiempo_residencia` INT, IN `estado` VARCHAR(50), IN `candidato_sobrenombre` VARCHAR(256), IN `claveOriginal` VARCHAR(256), IN `id_registro` INT, `email` VARCHAR(30))
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
		num_emision = candidato_num_emision_rp,
		ocr = candidato_ocr_rp,
		cic = candidato_cic_rp,
		seccion = candidato_seccion_rp,
        tiempo_residencia = candidato_tiempo_residencia,
        candidatura_gubernatura.estado = estado,
        sobrenombre = candidato_sobrenombre,
        email = email
        WHERE clave_elector = claveOriginal AND id_gubertatura = id_registro;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDocument`(`clave_elector` VARCHAR(120), `newCarta3D3` VARCHAR(50), `newCartaEleccion` VARCHAR(50), `newConstAutOrganoPartidista` VARCHAR(50), `newManifestacionIndigena` VARCHAR(50), `newConsVinculoComuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_candidatura` INT, `clave_original` VARCHAR(120))
BEGIN
	UPDATE candidatura_documentado SET 
	candidatura_documentado.clave_elector = clave_elector,
    
    candidatura_documentado.carta_3_3 = newCarta3D3,
    candidatura_documentado.carta_reeleccion = newCartaEleccion,
    candidatura_documentado.const_autorizacion_organo = newConstAutOrganoPartidista,
    candidatura_documentado.manifes_autoadcripcion = newManifestacionIndigena,
    candidatura_documentado.constancia_vinculo_comuni = newConsVinculoComuni,
    
	candidatura_documentado.doc_snr_ine = doc_snr_ine,
	candidatura_documentado.act_de_nacimiento = act_de_nacimiento,
	candidatura_documentado.copia_act_de_nacimiento = copia_act_de_nacimiento,
	candidatura_documentado.const_separacion_cargo = const_separacion_cargo,
	candidatura_documentado.escrito_bajo = escrito_bajo,
	candidatura_documentado.const_act_no_penales = const_act_no_penales,
	candidatura_documentado.solicitud_registro = solicitud_registro,
	candidatura_documentado.cred_para_votar = cred_para_votar,
	candidatura_documentado.const_acept_postulacion = const_acept_postulacion,
	candidatura_documentado.const_residencia = const_residencia,
	candidatura_documentado.manifiesto = manifiesto,
	candidatura_documentado.capacidad_economica = capacidad_economica,
	candidatura_documentado.cedula_rfc = cedula_rfc where candidatura_documentado.clave_elector = clave_original AND candidatura_documentado.id_tipo_registro = tipo_candidatura;

END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarCSRMunicipio`(IN `municipio` INT, IN `tipo_eleccion` VARCHAR(50), IN `partido` INT)
BEGIN

	DECLARE candidatura INT;
    DECLARE sindicatura INT;
    DECLARE regidor INT;

	IF tipo_eleccion = 6 THEN 
    
		SELECT * FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.candidatura = 4 AND id_municipio = municipio AND partido_politico = partido;
        
	elseif tipo_eleccion = 7 THEN
    
		SELECT COUNT(*) INTO candidatura FROM candidatura_ayuntamiento WHERE candidatura_ayuntamiento.candidatura = 4 AND id_municipio = municipio AND partido_politico = partido;
        
        IF candidatura = 2 THEN 
			SELECT * FROM candidatura_sindicatura WHERE candidatura_sindicatura.candidatura = 6 AND id_municipio = municipio AND partido_politico = partido;
        ELSE
			select "404" AS STATUS;
        END IF;
    END IF;
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarSexo`(IN `tipoEleccion` INT, IN `distrito` INT, IN `comunidad` INT, IN `partido` INT, IN `prelacion` INT, IN `tipoCand` INT, IN `regiduria` VARCHAR(256))
BEGIN
	IF tipoCand = 1 OR tipoCand = 2 THEN 
		select genero, propietario_suplente from candidatura_diputado 
		WHERE candidatura_diputado.candidatura = tipoEleccion 
		AND candidatura_diputado.distrito = distrito 
		AND candidatura_diputado.partido_politico = partido
		AND IF(candidatura_diputado.prelacion = prelacion, true, false );
	elseif tipoCand = 4 then
		select genero, propietario_suplente from candidatura_ayuntamiento
		WHERE candidatura_ayuntamiento.id_municipio = distrito 
		AND candidatura_ayuntamiento.partido_politico = partido;
        
	ELSEIF tipoCand = 5 THEN
    
		select genero, propietario_suplente from candidatura_comunidad
		WHERE candidatura_comunidad.id_municipio = distrito
        AND candidatura_comunidad.id_comunidad = comunidad
		AND candidatura_comunidad.partido_politico = partido;
        
	ELSEIF tipoCand = 6 THEN
    
		select genero, propietario_suplente from candidatura_sindicatura
		WHERE candidatura_sindicatura.id_municipio = distrito
		AND candidatura_sindicatura.partido_politico = partido;
        
	ELSEIF tipoCand = 7 THEN
		select genero, propietario_suplente from candidatura_regiduria
		WHERE candidatura_regiduria.id_municipio = distrito
		AND candidatura_regiduria.partido_politico = partido
        AND candidatura_regiduria.num_regidor = regiduria;
    END IF;
	
END
$$ DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validarUsuario`(IN `usuario` VARCHAR(100), IN `contraseña` VARCHAR(100))
BEGIN
	declare newPassword varchar(256);
    set newPassword = concat( 'ite' , contraseña, 'tlax' );
    SELECT usuario, password, nombre_capturista, app_capturista, rol, user_estado FROM usuarios WHERE usuarios.usuario = usuario AND usuarios.password = SHA2( newPassword, 0 );
END
$$ DELIMITER ;