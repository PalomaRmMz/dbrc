-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema reg2018_bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reg2018_bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reg2018_bd` DEFAULT CHARACTER SET utf8 ;
USE `reg2018_bd` ;

-- -----------------------------------------------------
-- Table `reg2018_bd`.`tipo_eleccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`tipo_eleccion` (
  `id_eleccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id_eleccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`distrito` (
  `id_distrito` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NOT NULL,
  `id_eleccion` INT NOT NULL,
  PRIMARY KEY (`id_distrito`),
  INDEX `fk_distrito_tipo_eleccion_idx` (`id_eleccion` ASC),
  CONSTRAINT `fk_distrito_tipo_eleccion`
    FOREIGN KEY (`id_eleccion`)
    REFERENCES `reg2018_bd`.`tipo_eleccion` (`id_eleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`tipo_constitucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`tipo_constitucion` (
  `id_constitucion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_constitucion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`partidos_diputado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`partidos_diputado` (
  `id_combinaciones` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NOT NULL,
  `id_distrito` INT NULL,
  `id_constitucion` INT NULL,
  PRIMARY KEY (`id_combinaciones`),
  INDEX `fk_combinaciones_distrito_idx` (`id_distrito` ASC),
  INDEX `fk_combinaciones_constitucion_idx` (`id_constitucion` ASC),
  CONSTRAINT `fk_combinaciones_distrito`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `reg2018_bd`.`distrito` (`id_distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_combinaciones_constitucion`
    FOREIGN KEY (`id_constitucion`)
    REFERENCES `reg2018_bd`.`tipo_constitucion` (`id_constitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`estados` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `nombre_estado` VARCHAR(256) NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_diputado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_diputado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido_paterno` VARCHAR(150) NOT NULL,
  `apellido_materno` VARCHAR(150) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `partido_politico` INT NOT NULL,
  `candidatura` VARCHAR(250) NOT NULL,
  `clave_elector` VARCHAR(150) NOT NULL,
  `curp` VARCHAR(150) NOT NULL,
  `distrito` VARCHAR(250) NOT NULL,
  `fec_nacimiento` VARCHAR(150) NOT NULL,
  `lugarnacimiento` INT NOT NULL,
  `tiempo_residencia` VARCHAR(50) NOT NULL,
  `sobrenombre` VARCHAR(150) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `user_capturista` VARCHAR(150) NOT NULL,
  `propietario_suplente` VARCHAR(50) NOT NULL,
  `prelacion` VARCHAR(20) NOT NULL,
  `id_documento` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_canDiputado_combinaciones_idx` (`partido_politico` ASC),
  INDEX `fk_duputado_estados_idx` (`lugarnacimiento` ASC),
  CONSTRAINT `fk_canDiputado_combinaciones`
    FOREIGN KEY (`partido_politico`)
    REFERENCES `reg2018_bd`.`partidos_diputado` (`id_combinaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_duputado_estados`
    FOREIGN KEY (`lugarnacimiento`)
    REFERENCES `reg2018_bd`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_documentado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_documentado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clave_elector` VARCHAR(150) NOT NULL,
  `doc_snr_ine` VARCHAR(50) NOT NULL,
  `act_de_nacimiento` VARCHAR(50) NOT NULL,
  `copia_act_de_nacimiento` VARCHAR(50) NOT NULL,
  `const_separacion_cargo` VARCHAR(50) NOT NULL,
  `escrito_bajo` VARCHAR(50) NOT NULL,
  `const_act_no_penales` VARCHAR(50) NOT NULL,
  `solicitud_registro` VARCHAR(50) NOT NULL,
  `cred_para_votar` VARCHAR(50) NOT NULL,
  `const_acept_postulacion` VARCHAR(50) NOT NULL,
  `const_residencia` VARCHAR(50) NOT NULL,
  `manifiesto` VARCHAR(50) NOT NULL,
  `capacidad_economica` VARCHAR(50) NOT NULL,
  `cedula_rfc` VARCHAR(50) NOT NULL,
  `id_tipo_registro` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`partidos_gubernatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`partidos_gubernatura` (
  `id_partido_gubernatura` INT NOT NULL AUTO_INCREMENT,
  `nombre_partido` VARCHAR(256) NOT NULL,
  `id_constitucion` INT NOT NULL,
  PRIMARY KEY (`id_partido_gubernatura`),
  INDEX `fk_constitucion_partido_gubernatura_idx` (`id_constitucion` ASC),
  CONSTRAINT `fk_constitucion_partido_gubernatura`
    FOREIGN KEY (`id_constitucion`)
    REFERENCES `reg2018_bd`.`tipo_constitucion` (`id_constitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_gubernatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_gubernatura` (
  `id_gubertatura` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NOT NULL,
  `apellido_paterno` VARCHAR(256) NOT NULL,
  `apellido_materno` VARCHAR(256) NOT NULL,
  `genero` VARCHAR(120) NOT NULL,
  `partido_politico` INT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `lugar_nacimiento` INT NULL,
  `clave_elector` VARCHAR(256) NOT NULL,
  `curp` VARCHAR(256) NOT NULL,
  `tiempo_residencia` INT NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `user_capturista` VARCHAR(150) NOT NULL,
  `sobrenombre` VARCHAR(256) NOT NULL,
  `id_documento` INT NULL,
  `candidatura` INT NOT NULL,
  PRIMARY KEY (`id_gubertatura`),
  INDEX `fk_gubernatura_partidos_gubernatura_idx` (`partido_politico` ASC),
  INDEX `fk_gubernatura_estados_idx` (`lugar_nacimiento` ASC),
  CONSTRAINT `fk_gubernatura_partidos_gubernatura`
    FOREIGN KEY (`partido_politico`)
    REFERENCES `reg2018_bd`.`partidos_gubernatura` (`id_partido_gubernatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gubernatura_estados`
    FOREIGN KEY (`lugar_nacimiento`)
    REFERENCES `reg2018_bd`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_renuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_renuncia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  `apellido_paterno` VARCHAR(150) NULL,
  `apellido_materno` VARCHAR(150) NULL,
  `genero` VARCHAR(50) NULL,
  `partido_politico` VARCHAR(250) NULL,
  `candidatura` VARCHAR(250) NULL,
  `clave_elector` VARCHAR(150) NULL,
  `curp` VARCHAR(150) NULL,
  `distrito` VARCHAR(250) NULL,
  `municipio` INT NULL,
  `comunidad` INT NULL,
  `fec_nacimiento` VARCHAR(150) NULL,
  `tiempo_residencia` VARCHAR(50) NULL,
  `sobrenombre` VARCHAR(150) NULL,
  `estado` VARCHAR(50) NULL,
  `user_capturista` VARCHAR(150) NULL,
  `propietario_suplente` VARCHAR(50) NULL,
  `prelacion` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`historial` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(150) NOT NULL,
  `tipo` VARCHAR(150) NOT NULL,
  `nombre_clv` VARCHAR(150) NOT NULL,
  `clv_original` VARCHAR(250) NULL,
  `nombre_clv_nuevo` VARCHAR(150) NULL,
  `clv_nuevo` VARCHAR(250) NULL,
  `motivo` VARCHAR(150) NOT NULL,
  `dia` VARCHAR(150) NOT NULL,
  `hora` VARCHAR(150) NOT NULL,
  `id_tipo_eleccion` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_historiañ_combinaciones_idx` (`id_tipo_eleccion` ASC),
  CONSTRAINT `fk_historiañ_combinaciones`
    FOREIGN KEY (`id_tipo_eleccion`)
    REFERENCES `reg2018_bd`.`tipo_eleccion` (`id_eleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`registro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_doc` VARCHAR(50) NOT NULL,
  `usuario` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `app` VARCHAR(50) NOT NULL,
  `apm` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `has` VARCHAR(250) NOT NULL,
  `clave_original` VARCHAR(50) NOT NULL,
  `registrocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_capturista` VARCHAR(150) NULL,
  `app_capturista` VARCHAR(150) NULL,
  `apm_capturista` VARCHAR(150) NULL,
  `usuario` VARCHAR(150) NULL,
  `password` VARCHAR(256) NULL,
  `rol` VARCHAR(150) NULL,
  `user_estado` VARCHAR(150) NULL,
  `sesion_id` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`municipios` (
  `id_municipio` INT NOT NULL AUTO_INCREMENT,
  `nombre_municipio` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id_municipio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`partidos_municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`partidos_municipio` (
  `id_partido_municipio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NULL,
  `id_constitucion` INT NOT NULL,
  `id_municipio` INT NOT NULL,
  PRIMARY KEY (`id_partido_municipio`),
  INDEX `fk_partido_municipio_tipo_constitucion_idx` (`id_constitucion` ASC),
  INDEX `fk_partido_municipio_municipios_idx` (`id_municipio` ASC),
  CONSTRAINT `fk_partido_municipio_tipo_constitucion`
    FOREIGN KEY (`id_constitucion`)
    REFERENCES `reg2018_bd`.`tipo_constitucion` (`id_constitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_municipio_municipios`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `reg2018_bd`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_ayuntamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_ayuntamiento` (
  `id_can_municipal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido_paterno` VARCHAR(150) NOT NULL,
  `apellido_materno` VARCHAR(150) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `partido_politico` INT NOT NULL,
  `id_municipio` INT NOT NULL,
  `candidatura` INT NOT NULL,
  `clave_elector` VARCHAR(150) NOT NULL,
  `curp` VARCHAR(150) NOT NULL,
  `fec_nacimiento` VARCHAR(150) NOT NULL,
  `lugarnacimiento` INT NOT NULL,
  `tiempo_residencia` VARCHAR(50) NOT NULL,
  `sobrenombre` VARCHAR(150) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `user_capturista` VARCHAR(150) NOT NULL,
  `propietario_suplente` VARCHAR(50) NOT NULL,
  `id_documento` INT NOT NULL,
  PRIMARY KEY (`id_can_municipal`),
  INDEX `fk_partidos_ayuntamiento_idx` (`partido_politico` ASC),
  INDEX `fk_ayuntamiento_estados_idx` (`lugarnacimiento` ASC),
  CONSTRAINT `fk_partidos_ayuntamiento`
    FOREIGN KEY (`partido_politico`)
    REFERENCES `reg2018_bd`.`partidos_municipio` (`id_partido_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ayuntamiento_estados`
    FOREIGN KEY (`lugarnacimiento`)
    REFERENCES `reg2018_bd`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`comunidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`comunidades` (
  `id_comunidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_comunidad` VARCHAR(256) NULL,
  `id_municipio` INT NULL,
  PRIMARY KEY (`id_comunidad`),
  INDEX `fk_municipio_comunidad_idx` (`id_municipio` ASC),
  CONSTRAINT `fk_municipio_comunidad`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `reg2018_bd`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`partidos_comunidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`partidos_comunidad` (
  `id_partido_comunidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(256) NOT NULL,
  `id_constitucion` INT NOT NULL,
  `id_comunidad` INT NOT NULL,
  PRIMARY KEY (`id_partido_comunidad`),
  INDEX `fk_constitucion_partidos_comunidad_idx` (`id_constitucion` ASC),
  INDEX `fk_comunidades_partidos_comunidad_idx` (`id_comunidad` ASC),
  CONSTRAINT `fk_constitucion_partidos_comunidad`
    FOREIGN KEY (`id_constitucion`)
    REFERENCES `reg2018_bd`.`tipo_constitucion` (`id_constitucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comunidades_partidos_comunidad`
    FOREIGN KEY (`id_comunidad`)
    REFERENCES `reg2018_bd`.`comunidades` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reg2018_bd`.`candidatura_comunidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reg2018_bd`.`candidatura_comunidad` (
  `id_can_comunidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `apellido_paterno` VARCHAR(150) NOT NULL,
  `apellido_materno` VARCHAR(150) NOT NULL,
  `genero` VARCHAR(50) NOT NULL,
  `partido_politico` INT NOT NULL,
  `id_municipio` INT NOT NULL,
  `id_comunidad` INT NOT NULL,
  `candidatura` INT NOT NULL,
  `clave_elector` VARCHAR(150) NOT NULL,
  `curp` VARCHAR(150) NOT NULL,
  `fec_nacimiento` VARCHAR(150) NOT NULL,
  `lugarnacimiento` INT NOT NULL,
  `tiempo_residencia` VARCHAR(50) NOT NULL,
  `sobrenombre` VARCHAR(150) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `user_capturista` VARCHAR(150) NOT NULL,
  `propietario_suplente` VARCHAR(50) NOT NULL,
  `id_documento` INT NULL,
  PRIMARY KEY (`id_can_comunidad`),
  INDEX `fk_partidos_comunidad_idx` (`partido_politico` ASC),
  INDEX `fk_estados_candidatura_comunidad_idx` (`lugarnacimiento` ASC),
  INDEX `fk_documento_candidatura_comunidad_idx` (`id_documento` ASC),
  INDEX `fk_municipio_can_comunidad_idx` (`id_municipio` ASC),
  INDEX `fk_comunidad_can_comunidad_idx` (`id_comunidad` ASC),
  CONSTRAINT `fk_partidos_comunidad`
    FOREIGN KEY (`partido_politico`)
    REFERENCES `reg2018_bd`.`partidos_comunidad` (`id_partido_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_candidatura_comunidad`
    FOREIGN KEY (`lugarnacimiento`)
    REFERENCES `reg2018_bd`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_candidatura_comunidad`
    FOREIGN KEY (`id_documento`)
    REFERENCES `reg2018_bd`.`candidatura_documentado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_can_comunidad`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `reg2018_bd`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comunidad_can_comunidad`
    FOREIGN KEY (`id_comunidad`)
    REFERENCES `reg2018_bd`.`comunidades` (`id_comunidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
