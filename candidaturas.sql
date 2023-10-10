-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 10:31 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `candidaturas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarSesionID` (IN `sesion_id` VARCHAR(256), IN `usuario` VARCHAR(10))  BEGIN
	UPDATE usuarios SET usuarios.sesion_id = sesion_id WHERE usuarios.usuario = usuario; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addComunidad` (IN `municipio` VARCHAR(150), IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `id_comunidad` INT, IN `candidatura` VARCHAR(250), IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `num_emision` VARCHAR(256), IN `ocr` VARCHAR(256), IN `cic` VARCHAR(256), IN `seccion` VARCHAR(256), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), IN `carta_3_3` VARCHAR(50), IN `carta_reeleccion` VARCHAR(50), IN `const_autorizacion_organo` VARCHAR(50), IN `manifes_autoadcripcion` VARCHAR(50), IN `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), IN `email` VARCHAR(30))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addDiputacion` (IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `candidatura` VARCHAR(250), IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `reg_pro_num_emision` VARCHAR(254), IN `reg_pro_ocr` VARCHAR(254), IN `reg_pro_CIC` VARCHAR(254), IN `reg_pro_seccion` VARCHAR(254), IN `distrito` VARCHAR(250), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), IN `prelacion` VARCHAR(20), `supCarta3D3` VARCHAR(50), `supCartaEleccion` VARCHAR(50), `supConstAutOrganoPartidista` VARCHAR(50), `supManifestacionIndigena` VARCHAR(50), `supConsVinculoComuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), `email` VARCHAR(30))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addDocument` (`carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `clave_elector` VARCHAR(120), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, OUT `id` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addGubernatura` (`nombre` VARCHAR(120), `APP` VARCHAR(120), `APM` VARCHAR(256), `genero` VARCHAR(120), `partido_politico` INT, `fec_nacimiento` DATE, `lugar_nacimiento` VARCHAR(256), `clave_elector` VARCHAR(256), `curp` VARCHAR(256), `num_emision` VARCHAR(45), `ocr` VARCHAR(256), `cic` VARCHAR(256), `seccion` VARCHAR(256), `tiempo_residencia` VARCHAR(50), `estado` VARCHAR(50), `sobrenombre` VARCHAR(256), `user_capturista` VARCHAR(150), `id_tipo_registro` INT, `carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_registro` INT, `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), `politicaPrivacidad` VARCHAR(50), `email` VARCHAR(30))  BEGIN
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
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addHistorial` (`usuario` VARCHAR(150), `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `clv_original` VARCHAR(250), IN `curp` VARCHAR(256), `nombre_clv_nuevo` VARCHAR(150), `clv_nuevo` VARCHAR(250), `motivo` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), `id_tipo_registro` INT, `id_partido` VARCHAR(46), `id_distrito` VARCHAR(46), `id_municipio` VARCHAR(46), `id_comunidad` VARCHAR(46), `prop_sup` VARCHAR(256), `estado` VARCHAR(256))  BEGIN
	INSERT INTO historial VALUES(null, usuario, tipo, nombre_clv, clv_original, nombre_clv_nuevo, clv_nuevo, curp, motivo, dia, 
    hora, id_tipo_registro, id_partido, id_distrito, id_municipio, id_comunidad, prop_sup, estado);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addMunicipal` (IN `nombre` VARCHAR(150), IN `apellido_paterno` VARCHAR(150), IN `apellido_materno` VARCHAR(150), IN `genero` VARCHAR(50), IN `partido_politico` VARCHAR(250), IN `id_municipio` INT, IN `clave_elector` VARCHAR(150), IN `curp` VARCHAR(150), IN `num_emision` VARCHAR(150), IN `ocr` VARCHAR(150), IN `cic` VARCHAR(150), IN `seccion` VARCHAR(150), IN `fec_nacimiento` VARCHAR(150), IN `lugarnacimiento` VARCHAR(50), IN `tiempo_residencia` VARCHAR(50), IN `sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `user_capturista` VARCHAR(150), IN `propietario_suplente` VARCHAR(50), `carta_3_3` VARCHAR(50), `carta_reeleccion` VARCHAR(50), `const_autorizacion_organo` VARCHAR(50), `manifes_autoadcripcion` VARCHAR(50), `constancia_vinculo_comuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo` VARCHAR(150), `nombre_clv` VARCHAR(150), `dia` VARCHAR(150), `hora` VARCHAR(150), IN `politicaP` VARCHAR(50), IN `tipoEleccion` INT, IN `regiduria` VARCHAR(256), IN `email` VARCHAR(30))  BEGIN
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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `candidaturaRenuncia` (IN `idTipoEleccion` INT, IN `usuario` VARCHAR(150), IN `tipoAccion` VARCHAR(150), IN `nombre` VARCHAR(150), IN `claveOriginal` VARCHAR(256), IN `claveNuevo` VARCHAR(150), IN `curp` VARCHAR(256), IN `motivoRenuncia` VARCHAR(150), IN `dia` VARCHAR(150), IN `hora` VARCHAR(150), IN `id_partido` VARCHAR(256), IN `id_distrito` VARCHAR(256), IN `id_municipio` VARCHAR(256), IN `id_comunidad` VARCHAR(256), IN `id_registro` INT)  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editarUsuario` (IN `nombre` VARCHAR(256), IN `app` VARCHAR(256), IN `apm` VARCHAR(256), IN `usuario` VARCHAR(256), IN `contraseña` VARCHAR(256), IN `rol` VARCHAR(256))  BEGIN

	declare passTemp varchar(256);

	IF contraseña = '' THEN 
		UPDATE usuarios SET nombre_capturista = nombre, app_capturista = app, apm_capturista = apm, usuario = usuario, rol = rol WHERE usuarios.usuario = usuario;
	ELSE 
		set passTemp = concat( 'ite' , contraseña, 'tlax' );
		UPDATE usuarios SET nombre_capturista = nombre, app_capturista = app, apm_capturista = apm, usuario = usuario, rol = rol, usuarios.password = sha2(passTemp, 0) WHERE usuarios.usuario = usuario;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `existeSubsanacion` (IN `clave_elector` VARCHAR(256), IN `curp` VARCHAR(256), IN `candidatura` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EXIST_CANDIDATO` (IN `clave_elector` VARCHAR(256), IN `curp` VARCHAR(256))  BEGIN
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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `generarFolio` (IN `tipo_doc` VARCHAR(100), IN `usuario` VARCHAR(100), IN `nombre` VARCHAR(50), IN `app` VARCHAR(50), IN `apm` VARCHAR(50), IN `fecha` DATE, IN `hora` TIME, IN `has` VARCHAR(256), IN `clave_original` VARCHAR(50), IN `tipo_eleccion` INT)  BEGIN
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
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoCandidato` (IN `clave_elector` VARCHAR(256))  BEGIN	
	
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


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoGobernador` (IN `clave_elector` VARCHAR(256))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoReportes` (IN `tipo_eleccion` VARCHAR(100), IN `origen` VARCHAR(100), IN `partidos` VARCHAR(100), IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100), IN `municipio` VARCHAR(100))  BEGIN
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getInfoSubsanacion` (IN `clave_elector` VARCHAR(256))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getMuniParticipantes` ()  BEGIN
	SELECT DISTINCT municipios.id_municipio, municipios.nombre_municipio FROM municipios, comunidades WHERE comunidades.id_municipio = municipios.id_municipio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistrosCandidatos` (IN `clave_elector` VARCHAR(256))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getReportsAll` (IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSlctPartidos` ()  BEGIN

	SELECT partidos_politicos.id_partido as id, partidos_politicos.nombre_partido AS nombre_partido, partidos_politicos.tipo_constitucion as id_constitucion, tipo_constitucion.nombre as nombre_constitucion 
        FROM partidos_politicos, tipo_constitucion 
        WHERE partidos_politicos.tipo_constitucion = tipo_constitucion.id_constitucion 
        ORDER BY partidos_politicos.tipo_constitucion, id ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevoUsuario` (IN `nombre_capturista` VARCHAR(100), IN `app_capturista` VARCHAR(100), IN `apm_capturista` VARCHAR(100), IN `usuario` VARCHAR(100), IN `contraseña` VARCHAR(100), IN `rol` VARCHAR(100), IN `user_estado` VARCHAR(100))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otraCandidatura` (IN `curp` VARCHAR(256), IN `clave` VARCHAR(256))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pruebaFecha` (IN `tipo_eleccion` VARCHAR(100), IN `origen` VARCHAR(100), IN `partidos` VARCHAR(100), IN `tipo_candidatura` VARCHAR(100), IN `estado_candidato` VARCHAR(100), IN `generoP` VARCHAR(100), IN `municipio` VARCHAR(100))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rep_diario` (IN `dia` VARCHAR(100))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `subsanarMunicipal` (IN `candidato_nombre` VARCHAR(150), IN `candidato_ap_paterno` VARCHAR(150), IN `candidato_ap_materno` VARCHAR(150), IN `candidato_genero` VARCHAR(150), IN `idTipoCandidatura` INT, IN `candidato_clave_elector` VARCHAR(150), IN `candidato_curp` VARCHAR(150), IN `candidato_num_emision` VARCHAR(256), IN `candidato_ocr` VARCHAR(256), IN `candidato_cic` VARCHAR(256), IN `candidato_seccion` VARCHAR(256), IN `candidato_fec_nacimiento` VARCHAR(150), IN `candidato_tiempo_residencia` VARCHAR(50), IN `candidato_sobrenombre` VARCHAR(150), IN `estado` VARCHAR(50), IN `usuario` VARCHAR(150), IN `tipoAccion` VARCHAR(150), IN `claveOriginal` VARCHAR(150), IN `claveNuevo` VARCHAR(150), IN `motivoRenuncia` VARCHAR(150), IN `dia` VARCHAR(150), IN `hora` VARCHAR(150), IN `carta_3_3_g` VARCHAR(50), IN `carta_reeleccion_g` VARCHAR(50), IN `const_autorizacion_organo_g` VARCHAR(50), IN `manifes_autoadcripcion_g` VARCHAR(50), IN `constancia_vinculo_comuni_g` VARCHAR(50), IN `snr` VARCHAR(50), IN `reg` VARCHAR(50), IN `act` VARCHAR(50), IN `copia` VARCHAR(50), IN `credencial` VARCHAR(50), IN `aceptacion` VARCHAR(50), IN `separacion` VARCHAR(50), IN `radicacion` VARCHAR(50), IN `nopenales` VARCHAR(50), IN `noinahbilitado` VARCHAR(50), IN `manifiesto` VARCHAR(50), IN `capacidad` VARCHAR(50), IN `cedularfc` VARCHAR(50), `email` VARCHAR(30))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `subsanerGobernador` (IN `candidato_nombre` VARCHAR(256), IN `candidato_ap_paterno` VARCHAR(256), IN `candidato_ap_materno` VARCHAR(256), IN `candidato_fec_nacimiento` DATE, IN `candidato_genero` VARCHAR(120), IN `candidato_clave_elector` VARCHAR(256), IN `candidato_curp` VARCHAR(256), IN `candidato_num_emision_rp` VARCHAR(256), IN `candidato_ocr_rp` VARCHAR(256), IN `candidato_cic_rp` VARCHAR(256), IN `candidato_seccion_rp` VARCHAR(256), IN `candidato_tiempo_residencia` INT, IN `estado` VARCHAR(50), IN `candidato_sobrenombre` VARCHAR(256), IN `claveOriginal` VARCHAR(256), IN `id_registro` INT, `email` VARCHAR(30))  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDocument` (`clave_elector` VARCHAR(120), `newCarta3D3` VARCHAR(50), `newCartaEleccion` VARCHAR(50), `newConstAutOrganoPartidista` VARCHAR(50), `newManifestacionIndigena` VARCHAR(50), `newConsVinculoComuni` VARCHAR(50), `doc_snr_ine` VARCHAR(50), `act_de_nacimiento` VARCHAR(50), `copia_act_de_nacimiento` VARCHAR(50), `const_separacion_cargo` VARCHAR(50), `escrito_bajo` VARCHAR(50), `const_act_no_penales` VARCHAR(50), `solicitud_registro` VARCHAR(50), `cred_para_votar` VARCHAR(50), `const_acept_postulacion` VARCHAR(50), `const_residencia` VARCHAR(50), `manifiesto` VARCHAR(50), `capacidad_economica` VARCHAR(50), `cedula_rfc` VARCHAR(50), `tipo_candidatura` INT, `clave_original` VARCHAR(120))  BEGIN
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarCSRMunicipio` (IN `municipio` INT, IN `tipo_eleccion` VARCHAR(50), IN `partido` INT)  BEGIN

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarSexo` (IN `tipoEleccion` INT, IN `distrito` INT, IN `comunidad` INT, IN `partido` INT, IN `prelacion` INT, IN `tipoCand` INT, IN `regiduria` VARCHAR(256))  BEGIN
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
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validarUsuario` (IN `usuario` VARCHAR(100), IN `contraseña` VARCHAR(100))  BEGIN
	declare newPassword varchar(256);
    set newPassword = concat( 'ite' , contraseña, 'tlax' );
    SELECT usuario, password, nombre_capturista, app_capturista, rol, user_estado FROM usuarios WHERE usuarios.usuario = usuario AND usuarios.password = SHA2( newPassword, 0 );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_ayuntamiento`
--

CREATE TABLE `candidatura_ayuntamiento` (
  `id_can_municipal` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `partido_politico` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `candidatura` int(11) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `curp` varchar(150) NOT NULL,
  `num_emision` varchar(45) NOT NULL,
  `ocr` varchar(256) NOT NULL,
  `cic` varchar(256) NOT NULL,
  `seccion` varchar(256) NOT NULL,
  `fec_nacimiento` varchar(150) NOT NULL,
  `lugarnacimiento` int(11) NOT NULL,
  `tiempo_residencia` varchar(50) NOT NULL,
  `sobrenombre` varchar(150) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `propietario_suplente` varchar(50) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `politica_privacidad` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_comunidad`
--

CREATE TABLE `candidatura_comunidad` (
  `id_can_comunidad` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `partido_politico` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_comunidad` int(11) NOT NULL,
  `candidatura` int(11) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `curp` varchar(150) NOT NULL,
  `num_emision` varchar(45) NOT NULL,
  `ocr` varchar(256) NOT NULL,
  `cic` varchar(256) NOT NULL,
  `seccion` varchar(256) NOT NULL,
  `fec_nacimiento` varchar(150) NOT NULL,
  `lugarnacimiento` int(11) NOT NULL,
  `tiempo_residencia` varchar(50) NOT NULL,
  `sobrenombre` varchar(150) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `propietario_suplente` varchar(50) NOT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `politica_privacidad` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_diputado`
--

CREATE TABLE `candidatura_diputado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `partido_politico` int(11) NOT NULL,
  `candidatura` varchar(250) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `curp` varchar(150) NOT NULL,
  `num_emision` varchar(45) DEFAULT NULL,
  `ocr` varchar(256) DEFAULT NULL,
  `cic` varchar(256) DEFAULT NULL,
  `seccion` varchar(256) DEFAULT NULL,
  `distrito` varchar(250) NOT NULL,
  `fec_nacimiento` varchar(150) NOT NULL,
  `lugarnacimiento` int(11) NOT NULL,
  `tiempo_residencia` varchar(50) NOT NULL,
  `sobrenombre` varchar(150) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `propietario_suplente` varchar(50) NOT NULL,
  `prelacion` varchar(20) NOT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `politica_privacidad` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_documentado`
--

CREATE TABLE `candidatura_documentado` (
  `id` int(11) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `doc_snr_ine` varchar(50) NOT NULL,
  `act_de_nacimiento` varchar(50) NOT NULL,
  `copia_act_de_nacimiento` varchar(50) NOT NULL,
  `const_separacion_cargo` varchar(50) NOT NULL,
  `escrito_bajo` varchar(50) NOT NULL,
  `const_act_no_penales` varchar(50) NOT NULL,
  `solicitud_registro` varchar(50) NOT NULL,
  `cred_para_votar` varchar(50) NOT NULL,
  `const_acept_postulacion` varchar(50) NOT NULL,
  `const_residencia` varchar(50) NOT NULL,
  `manifiesto` varchar(50) NOT NULL,
  `capacidad_economica` varchar(50) NOT NULL,
  `cedula_rfc` varchar(50) NOT NULL,
  `carta_3_3` varchar(50) NOT NULL,
  `carta_reeleccion` varchar(50) NOT NULL,
  `const_autorizacion_organo` varchar(50) NOT NULL,
  `manifes_autoadcripcion` varchar(50) NOT NULL,
  `constancia_vinculo_comuni` varchar(50) NOT NULL,
  `id_tipo_registro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_gubernatura`
--

CREATE TABLE `candidatura_gubernatura` (
  `id_gubertatura` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apellido_paterno` varchar(256) NOT NULL,
  `apellido_materno` varchar(256) NOT NULL,
  `genero` varchar(120) NOT NULL,
  `partido_politico` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` int(11) DEFAULT NULL,
  `clave_elector` varchar(256) NOT NULL,
  `curp` varchar(256) NOT NULL,
  `num_emision` varchar(45) NOT NULL,
  `ocr` varchar(256) NOT NULL,
  `cic` varchar(256) NOT NULL,
  `seccion` varchar(256) NOT NULL,
  `tiempo_residencia` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `sobrenombre` varchar(256) NOT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `candidatura` int(11) NOT NULL,
  `politica_privacidad` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_regiduria`
--

CREATE TABLE `candidatura_regiduria` (
  `id_regiduria` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido_paterno` varchar(150) DEFAULT NULL,
  `apellido_materno` varchar(150) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `partido_politico` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `num_regidor` int(11) DEFAULT NULL,
  `candidatura` int(11) DEFAULT NULL,
  `clave_elector` varchar(150) DEFAULT NULL,
  `curp` varchar(150) DEFAULT NULL,
  `num_emision` varchar(45) NOT NULL,
  `ocr` varchar(256) NOT NULL,
  `cic` varchar(256) NOT NULL,
  `seccion` varchar(256) NOT NULL,
  `fec_nacimiento` varchar(150) DEFAULT NULL,
  `lugarnacimiento` int(11) DEFAULT NULL,
  `tiempo_residencia` varchar(50) DEFAULT NULL,
  `sobrenombre` varchar(150) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `user_capturista` varchar(150) DEFAULT NULL,
  `propietario_suplente` varchar(50) DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL,
  `politica_privacidad` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_renuncia`
--

CREATE TABLE `candidatura_renuncia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `apellido_paterno` varchar(150) DEFAULT NULL,
  `apellido_materno` varchar(150) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `partido_politico` varchar(250) DEFAULT NULL,
  `candidatura` varchar(250) DEFAULT NULL,
  `clave_elector` varchar(150) DEFAULT NULL,
  `curp` varchar(150) DEFAULT NULL,
  `num_emision` varchar(45) DEFAULT NULL,
  `ocr` varchar(256) DEFAULT NULL,
  `cic` varchar(256) DEFAULT NULL,
  `seccion` varchar(256) DEFAULT NULL,
  `distrito` varchar(250) DEFAULT NULL,
  `municipio` int(11) DEFAULT NULL,
  `comunidad` int(11) DEFAULT NULL,
  `fec_nacimiento` varchar(150) DEFAULT NULL,
  `tiempo_residencia` varchar(50) DEFAULT NULL,
  `sobrenombre` varchar(150) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `user_capturista` varchar(150) DEFAULT NULL,
  `propietario_suplente` varchar(50) DEFAULT NULL,
  `prelacion` varchar(20) DEFAULT NULL,
  `fecha_registro` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidatura_sindicatura`
--

CREATE TABLE `candidatura_sindicatura` (
  `id_sindicatura` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `partido_politico` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `candidatura` int(11) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `curp` varchar(150) NOT NULL,
  `num_emision` varchar(45) NOT NULL,
  `ocr` varchar(256) NOT NULL,
  `cic` varchar(256) NOT NULL,
  `seccion` varchar(256) NOT NULL,
  `fec_nacimiento` varchar(150) NOT NULL,
  `lugarnacimiento` int(11) NOT NULL,
  `tiempo_residencia` varchar(50) NOT NULL,
  `sobrenombre` varchar(150) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `propietario_suplente` varchar(50) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `politica_privacidad` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comunidades`
--

CREATE TABLE `comunidades` (
  `id_comunidad` int(11) NOT NULL,
  `nombre_comunidad` varchar(256) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comunidades`
--

INSERT INTO `comunidades` (`id_comunidad`, `nombre_comunidad`, `id_municipio`) VALUES
(1, 'Sección 1ª, Acuamanala', 1),
(2, 'Sección 2ª, Guadalupe Hidalgo', 1),
(3, 'Sección 3ª, Chimalpa', 1),
(4, 'Sección 4ª, Olextla de Juárez', 1),
(5, 'Felipe Carrillo Puerto', 2),
(6, 'Santa María Las Cuevas', 2),
(7, 'Barrio de Guadalupe', 2),
(8, 'Barrio de La Concepción', 2),
(9, 'Mesa Redonda', 2),
(10, 'Barrio de San Antonio', 2),
(11, 'Nexnopala', 2),
(12, 'Barrio de Santiago', 2),
(13, 'San Antonio Tecopilco', 2),
(14, 'Xaltitla', 2),
(15, 'San Juan Ocotitla', 2),
(16, 'Santa Cruz Pocitos', 2),
(17, 'Lomas de Jonguito', 2),
(18, 'Nazareth', 2),
(19, 'Concepción Hidalgo', 2),
(20, 'San José Pilancón', 2),
(21, 'Lázaro Cárdenas', 2),
(22, 'San José Buenavista', 2),
(23, 'La Garita', 2),
(24, 'Ranchería Pocitos', 2),
(25, 'San Damián Tlacocalpan', 3),
(26, 'San Matías Tepetomatitlán', 4),
(27, 'Belén Atzitzimititlán', 4),
(28, 'Tlatempa', 4),
(29, 'Barrio de Tecolotla', 4),
(30, 'Colonia San Isidro Apizaquito', 5),
(31, 'Santa Anita Huiloac', 5),
(32, 'San Luis Apizaquito', 5),
(33, 'Guadalupe Texcalac', 5),
(34, 'Santa María Texcalac', 5),
(35, 'Colonia Cerrito de Guadalupe', 5),
(36, 'Colonia José María Morelos', 5),
(37, 'Zumpango', 6),
(38, 'Santiago Villalta', 6),
(39, 'Colonia La Trasquila', 6),
(40, 'Benito Juárez Tezoyo', 6),
(41, 'Villa de las Flores', 6),
(42, 'San Pedro Ecatepec', 6),
(43, 'Santa Clara Ozumba', 6),
(44, 'Colonia Agrícola San Luis', 6),
(45, 'Colonia Francisco Sarabia', 8),
(46, 'San Mateo Actipan', 8),
(47, 'Colonia El Mirador', 8),
(48, 'Colonia Alfonso Espejel', 8),
(49, 'San Cristóbal Zacacalco', 8),
(50, 'Santa Cruz Guadalupe', 9),
(51, 'Colonia Chalma', 9),
(52, 'Xaxala', 9),
(53, 'Colonia El Alto', 9),
(54, 'Colonia Industrial', 9),
(55, 'Colonia Reforma', 9),
(56, 'Barrio de Texcacoac', 9),
(57, 'Sección 1ª, San Bernardino', 10),
(58, 'Sección 2ª', 10),
(59, 'Sección 3ª, San Miguel Xaltipan', 10),
(60, 'Sección 6ª, Tlacatecpa', 10),
(61, 'Sección 7ª', 10),
(62, 'Sección 8ª, Sta. María Aquiahuac', 10),
(63, 'Sección 9ª, Colhuaca', 10),
(64, 'Colonia Ignacio Allende', 11),
(65, 'Santa Beatriz La Nueva', 11),
(66, 'Colonia Manuel Ávila Camacho', 11),
(67, 'Colonia Plan de Ayala', 11),
(68, 'Colonia Loma Bonita', 11),
(69, 'Colonia José María Morelos', 11),
(70, 'San Francisco Cuexcontzi', 11),
(71, 'Sección 1ª, Coaxomulco (Barrio de Atenco)', 12),
(72, 'Sección 2ª, Coaxomulco (Tecuicuilco)', 12),
(73, 'Zacamolpa', 12),
(74, 'San Lorenzo Xaltelulco', 12),
(75, 'San Miguel Buenavista', 12),
(76, 'Barrio de Guadalupe', 13),
(77, 'Vicente Guerrero', 13),
(78, 'Colonia La Soledad', 13),
(79, 'Colonia Mazatepec', 13),
(80, 'Colonia Gustavo Díaz Ordaz', 14),
(81, 'Ranchería de la Cruz', 16),
(82, 'Ranchería de Torres', 16),
(83, 'Colonia San Francisco Tecoac', 16),
(84, 'Benito Juárez', 16),
(85, 'Colonia José María Morelos', 16),
(86, 'Colonia Acasillados San Martín Notario', 16),
(87, 'El Carmen Xalpatlahuaya', 16),
(88, 'Barrio de Santa Anita', 16),
(89, 'Barrio de San José', 16),
(90, 'Barrio de San Antonio', 16),
(91, 'San José Xicohténcatl', 16),
(92, 'Barrio de San Sebastián', 16),
(93, 'Barrio San Francisco Yancuitlalpan', 16),
(94, 'Santa María Yancuitlalpan', 16),
(95, 'Nuevo Barrio Francisco Villa', 16),
(96, 'N.C.P. José María Morelos', 16),
(97, 'Francisco I. Madero La Mesa', 16),
(98, 'Ranchería Altamira de Guadalupe', 16),
(99, 'Colonia Chapultepec', 16),
(100, 'Colonia Francisco Villa Tecoac', 16),
(101, 'Ranchería de Jesús', 16),
(102, 'Lázaro Cárdenas', 16),
(103, 'Colonia Hermenegildo Galeana', 16),
(104, 'Colonia Cuauhtémoc', 16),
(105, 'Colonia Mariano Matamoros', 16),
(106, 'Barrio La Preciosa', 16),
(107, 'Ranchería Los Pilares', 16),
(108, 'Barrio de San Lucas', 16),
(109, 'Ignacio Zaragoza', 16),
(110, 'Francisco I. Madero Tecopilco El Valle', 16),
(111, 'Colonia Emiliano Zapata', 16),
(112, 'Adolfo López Mateos', 17),
(113, 'Santa María Ixcotla', 17),
(114, 'San Simeón Xipetzingo', 17),
(115, 'Santiago Tlalpan', 17),
(116, 'San Lorenzo Techalote', 17),
(117, 'Ignacio Zaragoza', 17),
(118, 'San Manuel Tlalpan', 17),
(119, 'San Felipe Ixtacuixtla', 18),
(120, 'San Diego Xocoyucan', 18),
(121, 'San Antonio Atotonilco', 18),
(122, 'Ranchería La Soledad', 18),
(123, 'Santa Cruz El Porvenir', 18),
(124, 'San Antonio Tizostoc', 18),
(125, 'Santa Inés Tecuexcomac', 18),
(126, 'San Miguel La Presa', 18),
(127, 'San Gabriel Popocatla', 18),
(128, 'La Trinidad Tenexyecac', 18),
(129, 'Espíritu Santo', 18),
(130, 'San Antonio Tecoac', 18),
(131, 'Primera Sección', 22),
(132, 'Segunda Sección', 22),
(133, 'Tercera Sección', 22),
(134, 'Cuarta Sección', 22),
(135, 'Colonia San Isidro Chipila', 23),
(136, 'San José Cuamantzingo', 23),
(137, 'Guadalupe Cuauhtémoc', 23),
(138, 'San Felipe Hidalgo', 24),
(139, 'Tepuente', 24),
(140, 'Francisco I. Madero', 24),
(141, 'San José Atoyatenco', 25),
(142, 'San Miguel Analco', 25),
(143, 'San Rafael Tenanyecac', 25),
(144, 'San Miguel Xochitecatitla', 25),
(145, 'Santiago Michac', 25),
(146, 'Santa Cruz Techachalco', 26),
(147, 'San Francisco Temetzontla', 26),
(148, 'San Jorge Tezoquipan', 26),
(149, 'Colonia Emiliano Zapata', 26),
(150, 'San Tadeo Huiloapan', 26),
(151, 'San Ambrosio Texantla', 26),
(152, 'Santa Catarina Apatlahco', 26),
(153, 'Jesús Acatitla', 26),
(154, 'Panzacola', 27),
(155, 'San Marcos Contla', 27),
(156, 'San Buenaventura', 27),
(157, 'Barrio de San Bartolomé', 35),
(158, 'Barrio de Jesús', 35),
(159, 'Barrio de San Miguel', 35),
(160, 'Barrio de San Nicolás', 35),
(161, 'Barrio de Santiago', 35),
(162, 'Barrio de San Pedro', 35),
(163, 'Barrio de Tlaltepango', 35),
(164, 'Barrio de San Sebastián', 35),
(165, 'Barrio de San Isidro Buensuceso', 35),
(166, 'Barrio de La Santísima', 35),
(167, 'Barrio de San Cosme', 35),
(168, 'Barrio del Cristo', 35),
(169, 'Francisco Villa', 36),
(170, 'La Providencia', 36),
(171, 'Colonia Estocapa', 39),
(172, 'Barrio de Tlaxcaltecatla', 39),
(173, 'Barrio de Tlapayatla', 39),
(174, 'Santa Cruz Quilehtla', 40),
(175, 'Santiago Ayometitla', 40),
(176, 'San Lucas Tlacochcalco', 41),
(177, 'Jesús Huiznahuac', 41),
(178, 'San Miguel Contla', 41),
(179, 'Guadalupe Tlachco', 41),
(180, 'Sección 1ª, Tecahualoya', 44),
(181, 'Sección 2ª, Teolocholco', 44),
(182, 'Sección. 3ª, Barrio de Contla', 44),
(183, 'Sección 5ª, Actipac', 44),
(184, 'Sección 6ª, Cuauhtla', 44),
(185, 'Acxotla del Monte', 44),
(186, 'Cuaxinca', 44),
(187, 'El Carmen Aztama', 44),
(188, 'San Mateo Ayecac', 45),
(189, 'Guadalupe Victoria', 45),
(190, 'Villalta', 45),
(191, 'La Aurora', 46),
(192, 'San Cosme Atlamaxac', 46),
(193, 'San Pedro Xalcaltzingo', 46),
(194, 'Santiago Tlacochcalco', 46),
(195, 'Colonia Guadalupe Victoria', 47),
(196, 'Villareal', 47),
(197, 'Colonia El Capulín', 47),
(198, 'Nicolás Bravo', 47),
(199, 'Toluca de Guadalupe ', 47),
(200, 'Chipilo', 47),
(201, 'Santa Fe La Troje', 48),
(202, 'Ocotitla, Sección 3ª', 48),
(203, 'Colonia Agrícola de Dolores', 48),
(204, 'Colonia José Ma. Morelos', 48),
(205, 'San Bartolomé Matlalohcan', 48),
(206, 'Colonia Plan de Ayala', 48),
(207, 'San Francisco Atexcatzingo', 48),
(208, 'Sección 4ª, Chiautzingo', 48),
(209, 'Sección 2ª, Teotlalpan', 48),
(210, 'Sección 1ª, Actipan Infonavit', 48),
(211, 'San Isidro Piedras Negras', 48),
(212, 'Santa María Capulac', 48),
(213, 'San Bartolomé Tenango', 49),
(214, 'San Andrés Cuamilpa', 49),
(215, 'Santa Isabel Tetlatlahuca', 49),
(216, 'Santa Cruz Aquiahuac', 49),
(217, 'Ocotlán', 50),
(218, 'San Gabriel Cuauhtla', 50),
(219, 'San Esteban Tizatlán', 50),
(220, 'Santa María Acuitlapilco', 50),
(221, 'San Lucas Cuauhtelulpan', 50),
(222, 'Santa María Ixtulco', 50),
(223, 'San Hipólito Chimalpa', 50),
(224, 'San Buenaventura Atempa', 50),
(225, 'La Trinidad Tepehitec', 50),
(226, 'Quinta Sección Barrio Chico', 51),
(227, 'Ranchería Ojo de Agua', 51),
(228, 'Colonia Ejidal', 51),
(229, 'Santa María Zotoluca', 51),
(230, 'Unión Ejidal Tierra y Libertad', 51),
(231, 'San Pedro La Cueva', 51),
(232, 'Ranchería Las Mesas', 51),
(233, 'San José Tepeyahualco', 51),
(234, 'Colonia Tepatlaxco', 51),
(235, 'San Lorenzo Soltepec', 51),
(236, 'Col. José Ma. Morelos Buenavista', 51),
(237, '6ª Sección', 51),
(238, 'La Rosa', 51),
(239, 'La Palma', 51),
(240, 'Lagunillas', 51),
(241, 'La Magdalena Soltepec', 51),
(242, 'La Ciénega', 51),
(243, 'San Antonio Huexotitla', 51),
(244, 'El Rosario', 51),
(245, 'Col. Máximo Rojas Xalostoc', 51),
(246, 'Col. Iturbide', 51),
(247, 'Capilla de Tepeyahualco', 51),
(248, 'El Sabinal', 51),
(249, 'Col. San Juan', 51),
(250, 'Aserradero Casa Blanca', 51),
(251, 'Atotonilco', 51),
(252, 'Mariano Matamoros', 51),
(253, 'Acopinalco del Peñón', 51),
(254, 'Col. Postal y Vista Hermosa', 51),
(255, 'Santa Cruz Venustiano Carranza', 52),
(256, 'Los Reyes Quiahuixtlán', 53),
(257, 'San Juan Totolac', 53),
(258, 'Barrio de Zaragoza', 53),
(259, 'San Francisco Ocotelulco', 53),
(260, 'La Candelaria Teotlalpan', 53),
(261, 'San Miguel Tlamahuco', 53),
(262, 'Acxotla del Río', 53),
(263, 'San Mateo Inohpil', 54),
(264, 'Xaltianquisco Sección 3ª', 54),
(265, 'San Salvador Tzompantepec', 54),
(266, 'San Andrés Ahuashuastepec', 54),
(267, 'San Juan Quetzalcoapan', 54),
(268, 'Colonia Venustiano Carranza', 55),
(269, 'Guadalupe Texmolac', 55),
(270, 'Colonia Velasco', 55),
(271, 'Colonia José López Portillo', 55),
(272, 'Santa Cruz Zacatzontetla', 55),
(273, 'San Pedro Tlacotepec', 55),
(274, 'San Cosme Xaloztoc Huiznáhuac 1ª. Sección', 55),
(275, 'San Cosme Xaloztoc 2ª. Sección', 55),
(276, 'Colonia Santa Martha Sección 3ª', 55),
(277, 'La Ascención Huitzcolotepec', 56),
(278, 'Topilco de Juárez', 56),
(279, 'San José Texopa', 56),
(280, 'Cuatla', 56),
(281, 'Santa Bárbara Acuicuiztepec', 56),
(282, 'Las Mesas', 56),
(283, 'San Benito Xaltocan', 58),
(284, 'Santa Ursula Zimatepec', 58),
(285, 'San Lorenzo Tlacualoyan', 58),
(286, 'Barrio de Huacaltzingo', 58),
(287, 'San Francisco Tlacuilohcan', 58),
(288, 'San José Tetel', 58),
(289, 'Santa María Atlihuetzia', 58),
(290, 'Ocotoxco', 58),
(291, '3ª. Sección, Barrio de Guardia', 59),
(292, '5ª. Sección, Barrio Xitototla', 59),
(293, '3ª. Sección, Barrio de Xochicalco', 59),
(294, '1ª. Sección, Tlacacola', 59),
(295, '4ª. Sección, Barrio Manantiales', 59),
(296, '2ª. Sección', 59),
(297, 'Barrio de Exquitla', 59),
(298, 'Colonia Francisco Javier Mina', 60),
(299, 'San Juan Bautista Mier', 60);

-- --------------------------------------------------------

--
-- Table structure for table `distrito`
--

CREATE TABLE `distrito` (
  `id_distrito` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `id_eleccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distrito`
--

INSERT INTO `distrito` (`id_distrito`, `nombre`, `id_eleccion`) VALUES
(1, 'San Antonio Calpulalpan', 1),
(2, 'Tlaxco de Morelos', 1),
(3, 'San Cosme Xaloztoc', 1),
(4, 'Apizaco', 1),
(5, 'San Dionicio Yauhquemehcan', 1),
(6, 'Ixtacuixtla de Mariano Matamoros', 1),
(7, 'Tlaxcala de Xicohténcatl', 1),
(8, 'San Bernardino Contla', 1),
(9, 'Santa Ana Chiautempan', 1),
(10, 'Huamantla', 1),
(11, 'Huamantla', 1),
(12, 'San Luis Teolocholco', 1),
(13, 'Zacatelco', 1),
(14, 'Santa María Nativitas', 1),
(15, 'Vicente Guerrero', 1),
(16, 'PLURINOMINAL', 2);

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estados`
--

INSERT INTO `estados` (`id_estado`, `nombre_estado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila'),
(8, 'Colima'),
(9, 'Distrito Federal'),
(10, 'Durango'),
(11, 'Estado de México'),
(12, 'Guanajuato'),
(13, 'Guerrero'),
(14, 'Hidalgo'),
(15, 'Jalisco'),
(16, 'Michoacán'),
(17, 'Morelos'),
(18, 'Nayarit'),
(19, 'Nuevo León'),
(20, 'Oaxaca'),
(21, 'Puebla'),
(22, 'Querétaro'),
(23, 'Quintana Roo'),
(24, 'San Luis Potosí'),
(25, 'Sinaloa'),
(26, 'Sonora'),
(27, 'Tabasco'),
(28, 'Tamaulipas'),
(29, 'Tlaxcala'),
(30, 'Veracruz'),
(31, 'Yucatán'),
(32, 'Zacatecas');

-- --------------------------------------------------------

--
-- Table structure for table `folios`
--

CREATE TABLE `folios` (
  `id_folio` int(11) NOT NULL,
  `no_folio` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `folio_candidatura` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `folios`
--

INSERT INTO `folios` (`id_folio`, `no_folio`, `folio_candidatura`) VALUES
(1, 000001, 'CG'),
(2, 000001, 'CD'),
(3, 000001, 'CA'),
(4, 000001, 'CC');

-- --------------------------------------------------------

--
-- Table structure for table `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `nombre_clv` varchar(150) NOT NULL,
  `clv_original` varchar(250) DEFAULT NULL,
  `nombre_clv_nuevo` varchar(150) DEFAULT NULL,
  `clv_nuevo` varchar(250) DEFAULT NULL,
  `curp` varchar(256) DEFAULT NULL,
  `motivo` varchar(150) NOT NULL,
  `dia` varchar(150) NOT NULL,
  `hora` varchar(150) NOT NULL,
  `id_tipo_eleccion` int(11) NOT NULL,
  `id_partido` varchar(45) DEFAULT NULL,
  `id_distrito` varchar(45) DEFAULT NULL,
  `id_municipio` varchar(45) DEFAULT NULL,
  `id_comunidad` varchar(45) DEFAULT NULL,
  `prop_sup` varchar(256) DEFAULT NULL,
  `estado` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `nombre_municipio` varchar(256) NOT NULL,
  `num_regidores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `nombre_municipio`, `num_regidores`) VALUES
(1, 'Acuamanala de Miguel Hidalgo', 5),
(2, 'Atltzayanca', 6),
(3, 'Amaxac de Guerrero', 6),
(4, 'Apetatitlán de Antonio Carvajal', 6),
(5, 'Apizaco', 7),
(6, 'Atlangatepec', 5),
(7, 'Benito Juárez', 5),
(8, 'Calpulalpan', 7),
(9, 'Chiautempan', 7),
(10, 'Contla de Juan Cuamatzi', 7),
(11, 'Cuapiaxtla', 6),
(12, 'Cuaxomulco', 5),
(13, 'El Carmen Tequexquitla', 6),
(14, 'Emiliano Zapata', 5),
(15, 'Españita', 5),
(16, 'Huamantla', 7),
(17, 'Hueyotlipan', 6),
(18, 'Ixtacuixtla de Mariano Matamoros', 7),
(19, 'Ixtenco', 5),
(20, 'La Magdalena Tlaltelulco', 6),
(21, 'Lázaro Cárdenas', 5),
(22, 'Mazatecochco de José María Morelos', 6),
(23, 'Muñoz de Domingo Arenas', 5),
(24, 'Nanacamilpa de Mariano Arista', 6),
(25, 'Natívitas', 6),
(26, 'Panotla', 6),
(27, 'Papalotla de Xicohténcatl', 7),
(28, 'San Damián Texóloc', 5),
(29, 'San Francisco Tetlanohcan', 6),
(30, 'San Jerónimo Zacualpan', 5),
(31, 'San José Teacalco', 5),
(32, 'San Juan Huactzinco', 5),
(33, 'San Lorenzo Axocomanitla', 5),
(34, 'San Lucas Tecopilco', 5),
(35, 'San Pablo del Monte', 7),
(36, 'Sanctórum de Lázaro Cárdenas', 5),
(37, 'Santa Ana Nopalucan', 5),
(38, 'Santa Apolonia Teacalco', 5),
(39, 'Santa Catarina Ayometla', 5),
(40, 'Santa Cruz Quilehtla', 5),
(41, 'Santa Cruz Tlaxcala', 6),
(42, 'Santa Isabel Xiloxoxtla', 5),
(43, 'Tenancingo', 6),
(44, 'Teolocholco', 6),
(45, 'Tepetitla de Lardizábal', 6),
(46, 'Tepeyanco', 6),
(47, 'Terrenate', 6),
(48, 'Tetla de la Solidaridad', 7),
(49, 'Tetlatlahuca', 6),
(50, 'Tlaxcala', 7),
(51, 'Tlaxco', 7),
(52, 'Tocatlán', 5),
(53, 'Totolac', 6),
(54, 'Tzompantepec', 6),
(55, 'Xaloztoc', 6),
(56, 'Xaltocan', 6),
(57, 'Xicohtzinco', 6),
(58, 'Yauhquemehcan', 7),
(59, 'Zacatelco', 7),
(60, 'Ziltlaltépec de Trinidad Sánchez Santos', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orden_sindicatura`
--

CREATE TABLE `orden_sindicatura` (
  `id_orden_sindicatura` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `encabezado_por` varchar(50) NOT NULL,
  `numero_sindicaturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orden_sindicatura`
--

INSERT INTO `orden_sindicatura` (`id_orden_sindicatura`, `id_municipio`, `encabezado_por`, `numero_sindicaturas`) VALUES
(1, 1, '0', 4),
(2, 2, '1', 2),
(3, 4, '0', 3),
(4, 3, '1', 1),
(5, 59, '1', 2),
(6, 6, '0', 3),
(7, 5, '1', 3),
(8, 7, '0', 2),
(9, 8, '1', 5);

-- --------------------------------------------------------

--
-- Table structure for table `partidos_comunidad`
--

CREATE TABLE `partidos_comunidad` (
  `id_partido_comunidad` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `id_constitucion` int(11) NOT NULL,
  `id_comunidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partidos_comunidad`
--

INSERT INTO `partidos_comunidad` (`id_partido_comunidad`, `nombre`, `id_constitucion`, `id_comunidad`) VALUES
(1, 'Movimiento Ciudadano (MC)', 1, 1),
(2, 'Partido Nueva Alianza', 1, 1),
(3, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 1),
(4, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 1),
(5, 'Candidatura  Común PRI - PVEM - PS', 3, 2),
(6, 'Candidatura Independiente', 4, 2),
(7, 'Movimiento Ciudadano (MC)', 1, 2),
(8, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 2),
(9, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 3),
(10, 'Candidatura Común PRI - PVEM - NA - PS', 3, 3),
(11, 'Candidatura Independiente', 4, 3),
(12, 'Movimiento Ciudadano (MC)', 1, 3),
(13, 'Movimiento Regeneración Nacional (Morena)', 1, 4),
(14, 'Partido del Trabajo (PT)', 1, 4),
(15, 'Partido Encuentro Social (PES)', 1, 4),
(16, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 4),
(17, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 5),
(18, 'Candidatura Independiente', 4, 5),
(19, 'Movimiento Ciudadano (MC)', 1, 5),
(20, 'Movimiento Regeneración Nacional (Morena)', 1, 5),
(21, 'Partido del Trabajo (PT)', 1, 6),
(22, 'Partido Encuentro Social (PES)', 1, 6),
(23, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 6),
(24, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 6),
(25, 'Candidatura Independiente', 4, 7),
(26, 'Movimiento Ciudadano (MC)', 1, 7),
(27, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 7),
(28, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 7),
(29, 'Candidatura Común PRI - PVEM - NA - PS', 3, 8),
(30, 'Candidatura Independiente', 4, 8),
(31, 'Movimiento Ciudadano (MC)', 1, 8),
(32, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 8),
(33, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 9),
(34, 'Candidatura Común PRI - PVEM - NA - PS', 3, 9),
(35, 'Candidatura Independiente', 4, 9),
(36, 'Movimiento Ciudadano (MC)', 1, 9),
(37, 'Movimiento Regeneración Nacional (Morena)', 1, 10),
(38, 'Partido Encuentro Social (PES)', 1, 10),
(39, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 10),
(40, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 10),
(41, 'Candidatura Independiente', 4, 11),
(42, 'Movimiento Ciudadano (MC)', 1, 11),
(43, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 11),
(44, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 11),
(45, 'Candidatura Común PRI - PVEM - NA - PS', 3, 12),
(46, 'Candidatura Independiente', 4, 12),
(47, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 12),
(48, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 12),
(49, 'Candidatura Común PRI - PVEM - NA - PS', 3, 13),
(50, 'Candidatura Independiente', 4, 13),
(51, 'Movimiento Ciudadano (MC)', 1, 13),
(52, 'Movimiento Regeneración Nacional (Morena)', 1, 13),
(53, 'Partido del Trabajo (PT)', 1, 13),
(54, 'Partido Encuentro Social (PES)', 1, 14),
(55, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 14),
(56, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 14),
(57, 'Candidatura Independiente', 4, 14),
(58, 'Movimiento Ciudadano (MC)', 1, 14),
(59, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 15),
(60, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 15),
(61, 'Candidatura Común PRI - PVEM - NA - PS', 3, 15),
(62, 'Candidatura Independiente', 4, 15),
(63, 'Movimiento Ciudadano (MC)', 1, 15),
(64, 'Movimiento Regeneración Nacional (Morena)', 1, 16),
(65, 'Partido del Trabajo (PT)', 1, 16),
(66, 'Partido Encuentro Social (PES)', 1, 16),
(67, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 16),
(68, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 16),
(69, 'Candidatura Independiente', 4, 17),
(70, 'Movimiento Ciudadano (MC)', 1, 17),
(71, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 17),
(72, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 17),
(73, 'Candidatura Común PRI - PVEM - NA - PS', 3, 17),
(74, 'Candidatura Independiente', 4, 18),
(75, 'Movimiento Ciudadano (MC)', 1, 18),
(76, 'Movimiento Regeneración Nacional (Morena)', 1, 18),
(77, 'Partido del Trabajo (PT)', 1, 18),
(78, 'Partido Encuentro Social (PES)', 1, 18),
(79, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 19),
(80, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 19),
(81, 'Candidatura Independiente', 4, 19),
(82, 'Partido Acción Nacional (PAN)', 1, 19),
(83, 'Partido Revolucionario Institucional (PRI)', 1, 19),
(84, 'Partido de la Revolución Democratica (PRD)', 1, 20),
(85, 'Partido del Trabajo (PT)', 1, 20),
(86, 'Partido Movimiento Ciudadano', 1, 20),
(87, 'Partido Alianza Ciudadana (PAC)', 1, 20),
(88, 'Partido Socialista (PS)', 1, 20),
(89, 'Partido Verde Ecologista de México (PVEM)', 1, 21),
(90, 'Partido Nueva Alianza', 1, 21),
(91, 'Partido Encuentro Social (PES)', 1, 21),
(92, 'Movimiento Regeneración Nacional (Morena)', 1, 21),
(93, 'Movimiento Ciudadano (MC)', 1, 21),
(94, 'Partido Nueva Alianza', 1, 22),
(95, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 22),
(96, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 22),
(97, 'Candidatura  Común PRI - PVEM - PS', 3, 22),
(98, 'Candidatura Independiente', 4, 22),
(99, 'Movimiento Ciudadano (MC)', 1, 23),
(100, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 23),
(101, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 23),
(102, 'Candidatura Común PRI - PVEM - NA - PS', 3, 23),
(103, 'Candidatura Independiente', 4, 23),
(104, 'Movimiento Ciudadano (MC)', 1, 24),
(105, 'Movimiento Regeneración Nacional (Morena)', 1, 24),
(106, 'Partido del Trabajo (PT)', 1, 24),
(107, 'Partido Encuentro Social (PES)', 1, 24),
(108, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 24),
(109, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 25),
(110, 'Candidatura Independiente', 4, 25),
(111, 'Movimiento Ciudadano (MC)', 1, 25),
(112, 'Movimiento Regeneración Nacional (Morena)', 1, 25),
(113, 'Partido del Trabajo (PT)', 1, 25),
(114, 'Partido Encuentro Social (PES)', 1, 26),
(115, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 26),
(116, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 26),
(117, 'Candidatura Independiente', 4, 26),
(118, 'Movimiento Ciudadano (MC)', 1, 26),
(119, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 27),
(120, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 27),
(121, 'Candidatura Común PRI - PVEM - NA - PS', 3, 27),
(122, 'Candidatura Independiente', 4, 27),
(123, 'Movimiento Ciudadano (MC)', 1, 27),
(124, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 28),
(125, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 28),
(126, 'Candidatura Común PRI - PVEM - NA - PS', 3, 28),
(127, 'Candidatura Independiente', 4, 28),
(128, 'Movimiento Ciudadano (MC)', 1, 28),
(129, 'Movimiento Regeneración Nacional (Morena)', 1, 29),
(130, 'Partido Encuentro Social (PES)', 1, 29),
(131, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 29),
(132, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 29),
(133, 'Candidatura Independiente', 4, 29),
(134, 'Movimiento Ciudadano (MC)', 1, 30),
(135, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 30),
(136, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 30),
(137, 'Candidatura Común PRI - PVEM - NA - PS', 3, 30),
(138, 'Candidatura Independiente', 4, 30),
(139, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 40),
(140, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 40),
(141, 'Candidatura Común PRI - PVEM - NA - PS', 3, 40),
(142, 'Candidatura Independiente', 4, 40),
(143, 'Movimiento Ciudadano (MC)', 1, 41),
(144, 'Movimiento Regeneración Nacional (Morena)', 1, 42),
(145, 'Partido del Trabajo (PT)', 1, 42),
(146, 'Partido Encuentro Social (PES)', 1, 42),
(147, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 42),
(148, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 42),
(149, 'Candidatura Independiente', 4, 43),
(150, 'Movimiento Ciudadano (MC)', 1, 43),
(151, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 43),
(152, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 43),
(153, 'Candidatura Común PRI - PVEM - NA - PS', 3, 43),
(154, 'Candidatura Independiente', 4, 44),
(155, 'Movimiento Ciudadano (MC)', 1, 44),
(156, 'Movimiento Regeneración Nacional (Morena)', 1, 44),
(157, 'Partido del Trabajo (PT)', 1, 44),
(158, 'Partido Encuentro Social (PES)', 1, 44),
(159, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 45),
(160, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 45),
(161, 'Candidatura Independiente', 4, 45),
(162, 'Movimiento Ciudadano (MC)', 1, 45),
(163, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 45),
(164, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 36),
(165, 'Candidatura Común PRI - PVEM - NA - PS', 3, 36),
(166, 'Candidatura Independiente', 4, 36),
(167, 'Movimiento Ciudadano (MC)', 1, 36),
(168, 'Movimiento Regeneración Nacional (Morena)', 1, 36),
(169, 'Partido del Trabajo (PT)', 1, 47),
(170, 'Partido Encuentro Social (PES)', 1, 47),
(171, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 47),
(172, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 47),
(173, 'Candidatura Independiente', 4, 47),
(174, 'Partido Acción Nacional (PAN)', 1, 48),
(175, 'Partido Revolucionario Institucional (PRI)', 1, 48),
(176, 'Partido de la Revolución Democratica (PRD)', 1, 48),
(177, 'Partido del Trabajo (PT)', 1, 48),
(178, 'Partido Movimiento Ciudadano', 1, 48),
(179, 'Partido Alianza Ciudadana (PAC)', 1, 49),
(180, 'Partido Socialista (PS)', 1, 49),
(181, 'Partido Verde Ecologista de México (PVEM)', 1, 49),
(182, 'Partido Nueva Alianza', 1, 49),
(183, 'Partido Encuentro Social (PES)', 1, 49),
(184, 'Movimiento Regeneración Nacional (Morena)', 1, 50),
(185, 'Movimiento Ciudadano (MC)', 1, 50),
(186, 'Partido Nueva Alianza', 1, 50),
(187, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 50),
(188, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 50),
(189, 'Candidatura  Común PRI - PVEM - PS', 3, 51),
(190, 'Candidatura Independiente', 4, 51),
(191, 'Movimiento Ciudadano (MC)', 1, 51),
(192, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 51),
(193, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 51),
(194, 'Candidatura Común PRI - PVEM - NA - PS', 3, 52),
(195, 'Candidatura Independiente', 4, 52),
(196, 'Movimiento Ciudadano (MC)', 1, 52),
(197, 'Movimiento Regeneración Nacional (Morena)', 1, 52),
(198, 'Partido del Trabajo (PT)', 1, 52),
(199, 'Partido Encuentro Social (PES)', 1, 53),
(200, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 53),
(201, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 53),
(202, 'Candidatura Independiente', 4, 53),
(203, 'Movimiento Ciudadano (MC)', 1, 53),
(204, 'Movimiento Regeneración Nacional (Morena)', 1, 54),
(205, 'Partido del Trabajo (PT)', 1, 54),
(206, 'Partido Encuentro Social (PES)', 1, 54),
(207, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 54),
(208, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 54),
(209, 'Candidatura Independiente', 4, 55),
(210, 'Movimiento Ciudadano (MC)', 1, 55),
(211, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 55),
(212, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 55),
(213, 'Candidatura Común PRI - PVEM - NA - PS', 3, 55),
(214, 'Candidatura Independiente', 4, 56),
(215, 'Movimiento Ciudadano (MC)', 1, 56),
(216, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 56),
(217, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 56),
(218, 'Candidatura Común PRI - PVEM - NA - PS', 3, 56),
(219, 'Candidatura Independiente', 4, 57),
(220, 'Movimiento Ciudadano (MC)', 1, 57),
(221, 'Movimiento Regeneración Nacional (Morena)', 1, 57),
(222, 'Partido Encuentro Social (PES)', 1, 57),
(223, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 57),
(224, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 58),
(225, 'Candidatura Independiente', 4, 58),
(226, 'Movimiento Ciudadano (MC)', 1, 58),
(227, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 58),
(228, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 58),
(229, 'Candidatura Común PRI - PVEM - NA - PS', 3, 58),
(230, 'Candidatura Independiente', 4, 59),
(231, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 159),
(232, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 59),
(233, 'Candidatura Común PRI - PVEM - NA - PS', 3, 59);

-- --------------------------------------------------------

--
-- Table structure for table `partidos_diputado`
--

CREATE TABLE `partidos_diputado` (
  `id_combinaciones` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `id_distrito` int(11) DEFAULT NULL,
  `id_constitucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partidos_diputado`
--

INSERT INTO `partidos_diputado` (`id_combinaciones`, `nombre`, `id_distrito`, `id_constitucion`) VALUES
(1, 'Movimiento Ciudadano (MC)', 2, 1),
(2, 'Partido Nueva Alianza', 2, 1),
(3, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 2),
(4, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 2),
(5, 'Candidatura  Común PRI - PVEM - PS', 2, 3),
(6, 'Candidatura Independiente', 2, 4),
(7, 'Movimiento Ciudadano (MC)', 3, 1),
(8, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 3, 2),
(9, 'Juntos Haremos Historia (MORENA/PT/PES)', 3, 2),
(10, 'Candidatura Común PRI - PVEM - NA - PS', 3, 3),
(11, 'Candidatura Independiente', 3, 4),
(12, 'Movimiento Ciudadano (MC)', 4, 1),
(13, 'Movimiento Regeneración Nacional (Morena)', 4, 1),
(14, 'Partido del Trabajo (PT)', 4, 1),
(15, 'Partido Encuentro Social (PES)', 4, 1),
(16, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 4, 2),
(17, 'Candidatura  Común PRI - PVEM - NA - PS', 4, 3),
(18, 'Candidatura Independiente', 4, 4),
(19, 'Movimiento Ciudadano (MC)', 5, 1),
(20, 'Movimiento Regeneración Nacional (Morena)', 5, 1),
(21, 'Partido del Trabajo (PT)', 5, 1),
(22, 'Partido Encuentro Social (PES)', 5, 1),
(23, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 5, 2),
(24, 'Candidatura  Común PRI - PVEM - NA - PS', 5, 3),
(25, 'Candidatura Independiente', 5, 4),
(26, 'Movimiento Ciudadano (MC)', 6, 1),
(27, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 6, 2),
(28, 'Juntos Haremos Historia (MORENA/PT/PES)', 6, 2),
(29, 'Candidatura Común PRI - PVEM - NA - PS', 6, 3),
(30, 'Candidatura Independiente', 6, 4),
(31, 'Movimiento Ciudadano (MC)', 7, 1),
(32, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 7, 2),
(33, 'Juntos Haremos Historia (MORENA/PT/PES)', 7, 2),
(34, 'Candidatura Común PRI - PVEM - NA - PS', 7, 3),
(35, 'Candidatura Independiente', 7, 4),
(36, 'Movimiento Ciudadano (MC)', 8, 1),
(37, 'Movimiento Regeneración Nacional (Morena)', 8, 1),
(38, 'Partido Encuentro Social (PES)', 8, 1),
(39, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 8, 2),
(40, 'Candidatura  Común PRI - PVEM - NA - PS', 8, 3),
(41, 'Candidatura Independiente', 8, 4),
(42, 'Movimiento Ciudadano (MC)', 9, 1),
(43, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 9, 2),
(44, 'Juntos Haremos Historia (MORENA/PT/PES)', 9, 2),
(45, 'Candidatura Común PRI - PVEM - NA - PS', 9, 3),
(46, 'Candidatura Independiente', 9, 4),
(47, 'Movimiento Ciudadano (MC)', 10, 1),
(48, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 10, 2),
(49, 'Juntos Haremos Historia (MORENA/PT/PES)', 10, 2),
(50, 'Candidatura Común PRI - PVEM - NA - PS', 10, 3),
(51, 'Candidatura Independiente', 10, 4),
(52, 'Movimiento Ciudadano (MC)', 11, 1),
(53, 'Movimiento Regeneración Nacional (Morena)', 11, 1),
(54, 'Partido del Trabajo (PT)', 11, 1),
(55, 'Partido Encuentro Social (PES)', 11, 1),
(56, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 11, 2),
(57, 'Candidatura  Común PRI - PVEM - NA - PS', 11, 3),
(58, 'Candidatura Independiente', 11, 4),
(59, 'Movimiento Ciudadano (MC)', 12, 1),
(60, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 12, 2),
(61, 'Juntos Haremos Historia (MORENA/PT/PES)', 12, 2),
(62, 'Candidatura Común PRI - PVEM - NA - PS', 12, 3),
(63, 'Candidatura Independiente', 12, 4),
(64, 'Movimiento Ciudadano (MC)', 13, 1),
(65, 'Movimiento Regeneración Nacional (Morena)', 13, 1),
(66, 'Partido del Trabajo (PT)', 13, 1),
(67, 'Partido Encuentro Social (PES)', 13, 1),
(68, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 13, 2),
(69, 'Candidatura  Común PRI - PVEM - NA - PS', 13, 3),
(70, 'Candidatura Independiente', 13, 4),
(71, 'Movimiento Ciudadano (MC)', 14, 1),
(72, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 14, 2),
(73, 'Juntos Haremos Historia (MORENA/PT/PES)', 14, 2),
(74, 'Candidatura Común PRI - PVEM - NA - PS', 14, 3),
(75, 'Candidatura Independiente', 14, 4),
(76, 'Movimiento Ciudadano (MC)', 15, 1),
(77, 'Movimiento Regeneración Nacional (Morena)', 15, 1),
(78, 'Partido del Trabajo (PT)', 15, 1),
(79, 'Partido Encuentro Social (PES)', 15, 1),
(80, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 15, 2),
(81, 'Candidatura  Común PRI - PVEM - NA - PS', 15, 3),
(82, 'Candidatura Independiente', 15, 4),
(83, 'Partido Acción Nacional (PAN)', 16, 1),
(84, 'Partido Revolucionario Institucional (PRI)', 16, 1),
(85, 'Partido de la Revolución Democratica (PRD)', 16, 1),
(86, 'Partido del Trabajo (PT)', 16, 1),
(87, 'Partido Movimiento Ciudadano', 16, 1),
(88, 'Partido Alianza Ciudadana (PAC)', 16, 1),
(89, 'Partido Socialista (PS)', 16, 1),
(90, 'Partido Verde Ecologista de México (PVEM)', 16, 1),
(91, 'Partido Nueva Alianza', 16, 1),
(92, 'Partido Encuentro Social (PES)', 16, 1),
(93, 'Movimiento Regeneración Nacional (Morena)', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `partidos_municipio`
--

CREATE TABLE `partidos_municipio` (
  `id_partido_municipio` int(11) NOT NULL,
  `nombre` varchar(256) DEFAULT NULL,
  `id_constitucion` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partidos_municipio`
--

INSERT INTO `partidos_municipio` (`id_partido_municipio`, `nombre`, `id_constitucion`, `id_municipio`) VALUES
(1, 'Movimiento Ciudadano (MC)', 1, 1),
(2, 'Partido Nueva Alianza', 1, 1),
(3, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 2),
(4, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 2),
(5, 'Candidatura  Común PRI - PVEM - PS', 3, 2),
(6, 'Candidatura Independiente', 4, 2),
(7, 'Movimiento Ciudadano (MC)', 1, 3),
(8, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 3),
(9, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 3),
(10, 'Candidatura Común PRI - PVEM - NA - PS', 3, 3),
(11, 'Candidatura Independiente', 4, 3),
(12, 'Movimiento Ciudadano (MC)', 1, 4),
(13, 'Movimiento Regeneración Nacional (Morena)', 1, 4),
(14, 'Partido del Trabajo (PT)', 1, 4),
(15, 'Partido Encuentro Social (PES)', 1, 4),
(16, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 4),
(17, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 4),
(18, 'Candidatura Independiente', 4, 4),
(19, 'Movimiento Ciudadano (MC)', 1, 5),
(20, 'Movimiento Regeneración Nacional (Morena)', 1, 5),
(21, 'Partido del Trabajo (PT)', 1, 5),
(22, 'Partido Encuentro Social (PES)', 1, 5),
(23, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 5),
(24, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 5),
(25, 'Candidatura Independiente', 4, 5),
(26, 'Movimiento Ciudadano (MC)', 1, 6),
(27, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 6),
(28, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 6),
(29, 'Candidatura Común PRI - PVEM - NA - PS', 3, 6),
(30, 'Candidatura Independiente', 4, 6),
(31, 'Movimiento Ciudadano (MC)', 1, 7),
(32, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 7),
(33, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 7),
(34, 'Candidatura Común PRI - PVEM - NA - PS', 3, 7),
(35, 'Candidatura Independiente', 4, 7),
(36, 'Movimiento Ciudadano (MC)', 1, 8),
(37, 'Movimiento Regeneración Nacional (Morena)', 1, 8),
(38, 'Partido Encuentro Social (PES)', 1, 8),
(39, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 8),
(40, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 8),
(41, 'Candidatura Independiente', 4, 8),
(42, 'Movimiento Ciudadano (MC)', 1, 9),
(43, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 9),
(44, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 9),
(45, 'Candidatura Común PRI - PVEM - NA - PS', 3, 9),
(46, 'Candidatura Independiente', 4, 9),
(47, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 10),
(48, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 10),
(49, 'Candidatura Común PRI - PVEM - NA - PS', 3, 10),
(50, 'Candidatura Independiente', 4, 10),
(51, 'Movimiento Ciudadano (MC)', 1, 11),
(52, 'Movimiento Regeneración Nacional (Morena)', 1, 11),
(53, 'Partido del Trabajo (PT)', 1, 11),
(54, 'Partido Encuentro Social (PES)', 1, 11),
(55, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 11),
(56, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 11),
(57, 'Candidatura Independiente', 4, 11),
(58, 'Movimiento Ciudadano (MC)', 1, 12),
(59, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 12),
(60, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 12),
(61, 'Candidatura Común PRI - PVEM - NA - PS', 3, 12),
(62, 'Candidatura Independiente', 4, 12),
(63, 'Movimiento Ciudadano (MC)', 1, 13),
(64, 'Movimiento Regeneración Nacional (Morena)', 1, 13),
(65, 'Partido del Trabajo (PT)', 1, 13),
(66, 'Partido Encuentro Social (PES)', 1, 13),
(67, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 13),
(68, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 13),
(69, 'Candidatura Independiente', 4, 13),
(70, 'Movimiento Ciudadano (MC)', 1, 14),
(71, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 14),
(72, 'Juntos Haremos Historia (MORENA/PT/PES)', 2, 14),
(73, 'Candidatura Común PRI - PVEM - NA - PS', 3, 14),
(74, 'Candidatura Independiente', 4, 14),
(75, 'Movimiento Ciudadano (MC)', 1, 15),
(76, 'Movimiento Regeneración Nacional (Morena)', 1, 15),
(77, 'Partido del Trabajo (PT)', 1, 15),
(78, 'Partido Encuentro Social (PES)', 1, 15),
(79, 'Por Tlaxcala al Frente (PAN/PRD/PAC)', 2, 15),
(80, 'Candidatura  Común PRI - PVEM - NA - PS', 3, 15),
(81, 'Candidatura Independiente', 4, 15),
(82, 'Partido Acción Nacional (PAN)', 1, 16),
(83, 'Partido Revolucionario Institucional (PRI)', 1, 16),
(84, 'Partido de la Revolución Democratica (PRD)', 1, 16),
(85, 'Partido del Trabajo (PT)', 1, 16),
(86, 'Partido Movimiento Ciudadano', 1, 16),
(87, 'Partido Alianza Ciudadana (PAC)', 1, 16),
(88, 'Partido Socialista (PS)', 1, 16),
(89, 'Partido Verde Ecologista de México (PVEM)', 1, 16),
(90, 'Partido Nueva Alianza', 1, 16),
(91, 'Partido Encuentro Social (PES)', 1, 16),
(92, 'Movimiento Regeneración Nacional (Morena)', 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `partidos_politicos`
--

CREATE TABLE `partidos_politicos` (
  `id_partido` int(11) NOT NULL,
  `nombre_partido` varchar(256) NOT NULL,
  `tipo_constitucion` int(11) DEFAULT NULL,
  `id_orden_aparicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partidos_politicos`
--

INSERT INTO `partidos_politicos` (`id_partido`, `nombre_partido`, `tipo_constitucion`, `id_orden_aparicion`) VALUES
(1, 'Partido Acción Nacional', 1, 1),
(2, 'Partido Revolucionario Institucional', 1, 2),
(3, 'Partido de la Revolución Democrática', 1, 3),
(4, 'Partido Verde Ecologista de México', 1, 4),
(5, 'Partido del Trabajo', 1, 5),
(6, 'Movimiento Ciudadano', 1, 6),
(7, 'Morena', 1, 7),
(8, 'Partido Encuentro Solidario', 1, 8),
(9, 'Redes Sociales Progresistas', 1, 9),
(10, 'Fuerza Social por México', 1, 10),
(11, 'Partido Alianza Ciudadana', 1, 11),
(12, 'Partido Socialista', 1, 12),
(13, 'Nueva Alianza Tlaxcala', 1, 13),
(14, 'Encuentro Social Tlaxcala', 1, 14),
(15, 'Impacto Social SI', 1, 15),
(18, 'Unidos por Tlaxcala (PAN/PRI/PRD/PAC/PS)', 2, 18),
(19, 'Juntos Haremos Historia en Tlaxcala (MORENA/PT/PVEM/NUEVA ALIANZA TLAXCALA/ENCUENTRO SOCIAL)', 2, 19),
(20, 'CANDIDATURA INDEPENDIENTE', 4, 20);

-- --------------------------------------------------------

--
-- Table structure for table `registro`
--

CREATE TABLE `registro` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `tipo_doc` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `app` varchar(50) NOT NULL,
  `apm` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `has` varchar(250) NOT NULL,
  `clave_original` varchar(50) NOT NULL,
  `folioDoc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_constitucion`
--

CREATE TABLE `tipo_constitucion` (
  `id_constitucion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_constitucion`
--

INSERT INTO `tipo_constitucion` (`id_constitucion`, `nombre`) VALUES
(1, 'Partidos políticos'),
(2, 'Coaliciones'),
(3, 'Candidatura Común'),
(4, 'Candidaturas independientes');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_eleccion`
--

CREATE TABLE `tipo_eleccion` (
  `id_eleccion` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_eleccion`
--

INSERT INTO `tipo_eleccion` (`id_eleccion`, `nombre`) VALUES
(1, 'MAYORÍA RELATIVA'),
(2, 'REPRESENTACIÓN PROPORCIONAL'),
(3, 'GUBERNATURA'),
(4, 'MUNICIPAL'),
(5, 'COMUNIDAD'),
(6, 'SINDICATURA'),
(7, 'REGIDURIA');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_capturista` varchar(150) DEFAULT NULL,
  `app_capturista` varchar(150) DEFAULT NULL,
  `apm_capturista` varchar(150) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `rol` varchar(150) DEFAULT NULL,
  `user_estado` varchar(150) DEFAULT NULL,
  `sesion_id` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_capturista`, `app_capturista`, `apm_capturista`, `usuario`, `password`, `rol`, `user_estado`, `sesion_id`) VALUES
(1, 'ARTURO', 'GALICIA', 'SOLIS', 'AGALICIA', 'e2a56703ac5f0d09a080a337964500db6b1c3b63f8d63436d1e8404aec245edb', 'Administrador', 'Activo', 'tdat6kpq7uuqiih24gri4ngnro'),
(2, 'PALOMA', 'RAMIREZ', 'MEZA', 'RPALOMA', '8108a4a7ec587eb3fd5f841dcc3f997c9bfd114eb8af543c1d4e4cad716b4bd9', 'Administrador', 'Activo', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidatura_ayuntamiento`
--
ALTER TABLE `candidatura_ayuntamiento`
  ADD PRIMARY KEY (`id_can_municipal`),
  ADD KEY `fk_partidos_ayuntamiento_idx` (`partido_politico`),
  ADD KEY `fk_ayuntamiento_estados_idx` (`lugarnacimiento`);

--
-- Indexes for table `candidatura_comunidad`
--
ALTER TABLE `candidatura_comunidad`
  ADD PRIMARY KEY (`id_can_comunidad`),
  ADD KEY `fk_estados_candidatura_comunidad_idx` (`lugarnacimiento`),
  ADD KEY `fk_documento_candidatura_comunidad_idx` (`id_documento`),
  ADD KEY `fk_comunidad_can_comunidad` (`id_comunidad`);

--
-- Indexes for table `candidatura_diputado`
--
ALTER TABLE `candidatura_diputado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_duputado_estados_idx` (`lugarnacimiento`),
  ADD KEY `partido_politico` (`partido_politico`);

--
-- Indexes for table `candidatura_documentado`
--
ALTER TABLE `candidatura_documentado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidatura_gubernatura`
--
ALTER TABLE `candidatura_gubernatura`
  ADD PRIMARY KEY (`id_gubertatura`),
  ADD KEY `fk_gubernatura_estados_idx` (`lugar_nacimiento`);

--
-- Indexes for table `candidatura_regiduria`
--
ALTER TABLE `candidatura_regiduria`
  ADD PRIMARY KEY (`id_regiduria`);

--
-- Indexes for table `candidatura_renuncia`
--
ALTER TABLE `candidatura_renuncia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidatura_sindicatura`
--
ALTER TABLE `candidatura_sindicatura`
  ADD PRIMARY KEY (`id_sindicatura`),
  ADD KEY `fk_estados_can_sindicatura_idx` (`lugarnacimiento`),
  ADD KEY `fk_municipio_can_sindicatura_idx` (`id_municipio`);

--
-- Indexes for table `comunidades`
--
ALTER TABLE `comunidades`
  ADD PRIMARY KEY (`id_comunidad`);

--
-- Indexes for table `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_distrito`),
  ADD KEY `fk_distrito_tipo_eleccion_idx` (`id_eleccion`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `folios`
--
ALTER TABLE `folios`
  ADD PRIMARY KEY (`id_folio`);

--
-- Indexes for table `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historiañ_combinaciones_idx` (`id_tipo_eleccion`);

--
-- Indexes for table `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indexes for table `orden_sindicatura`
--
ALTER TABLE `orden_sindicatura`
  ADD PRIMARY KEY (`id_orden_sindicatura`);

--
-- Indexes for table `partidos_comunidad`
--
ALTER TABLE `partidos_comunidad`
  ADD PRIMARY KEY (`id_partido_comunidad`),
  ADD KEY `fk_comunidades_partidos_comunidad` (`id_comunidad`),
  ADD KEY `fk_constitucion_partidos_comunidad` (`id_constitucion`);

--
-- Indexes for table `partidos_diputado`
--
ALTER TABLE `partidos_diputado`
  ADD PRIMARY KEY (`id_combinaciones`),
  ADD KEY `fk_combinaciones_distrito_idx` (`id_distrito`),
  ADD KEY `fk_combinaciones_constitucion_idx` (`id_constitucion`);

--
-- Indexes for table `partidos_municipio`
--
ALTER TABLE `partidos_municipio`
  ADD PRIMARY KEY (`id_partido_municipio`),
  ADD KEY `fk_partido_municipio_tipo_constitucion_idx` (`id_constitucion`);

--
-- Indexes for table `partidos_politicos`
--
ALTER TABLE `partidos_politicos`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `fk_partidos_politicos_constitucion_idx` (`tipo_constitucion`);

--
-- Indexes for table `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_constitucion`
--
ALTER TABLE `tipo_constitucion`
  ADD PRIMARY KEY (`id_constitucion`);

--
-- Indexes for table `tipo_eleccion`
--
ALTER TABLE `tipo_eleccion`
  ADD PRIMARY KEY (`id_eleccion`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidatura_ayuntamiento`
--
ALTER TABLE `candidatura_ayuntamiento`
  MODIFY `id_can_municipal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_comunidad`
--
ALTER TABLE `candidatura_comunidad`
  MODIFY `id_can_comunidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_diputado`
--
ALTER TABLE `candidatura_diputado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_documentado`
--
ALTER TABLE `candidatura_documentado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_gubernatura`
--
ALTER TABLE `candidatura_gubernatura`
  MODIFY `id_gubertatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_regiduria`
--
ALTER TABLE `candidatura_regiduria`
  MODIFY `id_regiduria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_renuncia`
--
ALTER TABLE `candidatura_renuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidatura_sindicatura`
--
ALTER TABLE `candidatura_sindicatura`
  MODIFY `id_sindicatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comunidades`
--
ALTER TABLE `comunidades`
  MODIFY `id_comunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_distrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `folios`
--
ALTER TABLE `folios`
  MODIFY `id_folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `orden_sindicatura`
--
ALTER TABLE `orden_sindicatura`
  MODIFY `id_orden_sindicatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `partidos_comunidad`
--
ALTER TABLE `partidos_comunidad`
  MODIFY `id_partido_comunidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `partidos_diputado`
--
ALTER TABLE `partidos_diputado`
  MODIFY `id_combinaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `partidos_municipio`
--
ALTER TABLE `partidos_municipio`
  MODIFY `id_partido_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `partidos_politicos`
--
ALTER TABLE `partidos_politicos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_constitucion`
--
ALTER TABLE `tipo_constitucion`
  MODIFY `id_constitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipo_eleccion`
--
ALTER TABLE `tipo_eleccion`
  MODIFY `id_eleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidatura_ayuntamiento`
--
ALTER TABLE `candidatura_ayuntamiento`
  ADD CONSTRAINT `fk_ayuntamiento_estados` FOREIGN KEY (`lugarnacimiento`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `fk_partidos_ayuntamiento` FOREIGN KEY (`partido_politico`) REFERENCES `partidos_municipio` (`id_partido_municipio`);

--
-- Constraints for table `candidatura_comunidad`
--
ALTER TABLE `candidatura_comunidad`
  ADD CONSTRAINT `fk_comunidad_can_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidades` (`id_comunidad`),
  ADD CONSTRAINT `fk_documento_candidatura_comunidad` FOREIGN KEY (`id_documento`) REFERENCES `candidatura_documentado` (`id`),
  ADD CONSTRAINT `fk_estados_candidatura_comunidad` FOREIGN KEY (`lugarnacimiento`) REFERENCES `estados` (`id_estado`);

--
-- Constraints for table `candidatura_diputado`
--
ALTER TABLE `candidatura_diputado`
  ADD CONSTRAINT `fk_duputado_estados` FOREIGN KEY (`lugarnacimiento`) REFERENCES `estados` (`id_estado`);

--
-- Constraints for table `candidatura_gubernatura`
--
ALTER TABLE `candidatura_gubernatura`
  ADD CONSTRAINT `fk_gubernatura_estados` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `estados` (`id_estado`);

--
-- Constraints for table `candidatura_sindicatura`
--
ALTER TABLE `candidatura_sindicatura`
  ADD CONSTRAINT `fk_estados_can_sindicatura` FOREIGN KEY (`lugarnacimiento`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `fk_municipio_can_sindicatura` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`);

--
-- Constraints for table `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `fk_distrito_tipo_eleccion` FOREIGN KEY (`id_eleccion`) REFERENCES `tipo_eleccion` (`id_eleccion`);

--
-- Constraints for table `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_historiañ_combinaciones` FOREIGN KEY (`id_tipo_eleccion`) REFERENCES `tipo_eleccion` (`id_eleccion`);

--
-- Constraints for table `partidos_comunidad`
--
ALTER TABLE `partidos_comunidad`
  ADD CONSTRAINT `fk_comunidades_partidos_comunidad` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidades` (`id_comunidad`),
  ADD CONSTRAINT `fk_constitucion_partidos_comunidad` FOREIGN KEY (`id_constitucion`) REFERENCES `tipo_constitucion` (`id_constitucion`);

--
-- Constraints for table `partidos_diputado`
--
ALTER TABLE `partidos_diputado`
  ADD CONSTRAINT `fk_combinaciones_constitucion` FOREIGN KEY (`id_constitucion`) REFERENCES `tipo_constitucion` (`id_constitucion`),
  ADD CONSTRAINT `fk_combinaciones_distrito` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`);

--
-- Constraints for table `partidos_municipio`
--
ALTER TABLE `partidos_municipio`
  ADD CONSTRAINT `fk_partido_municipio_tipo_constitucion` FOREIGN KEY (`id_constitucion`) REFERENCES `tipo_constitucion` (`id_constitucion`);

--
-- Constraints for table `partidos_politicos`
--
ALTER TABLE `partidos_politicos`
  ADD CONSTRAINT `fk_partidos_politicos_constitucion` FOREIGN KEY (`tipo_constitucion`) REFERENCES `tipo_constitucion` (`id_constitucion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
