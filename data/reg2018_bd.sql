-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-03-2018 a las 18:35:53
-- Versión del servidor: 5.5.47-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `reg2018_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE IF NOT EXISTS `archivo` (
  `usuario` varchar(100) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `clave_elector` varchar(250) NOT NULL,
  `hash` varchar(250) NOT NULL,
  `hora` varchar(100) NOT NULL,
  `dia` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura_diputado`
--

CREATE TABLE IF NOT EXISTS `candidatura_diputado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `apellido_paterno` varchar(150) CHARACTER SET latin1 NOT NULL,
  `apellido_materno` varchar(150) CHARACTER SET latin1 NOT NULL,
  `genero` varchar(50) CHARACTER SET latin1 NOT NULL,
  `partido_politico` varchar(250) CHARACTER SET latin1 NOT NULL,
  `candidatura` varchar(250) CHARACTER SET latin1 NOT NULL,
  `clave_elector` varchar(150) CHARACTER SET latin1 NOT NULL,
  `curp` varchar(150) CHARACTER SET latin1 NOT NULL,
  `distrito` varchar(250) CHARACTER SET latin1 NOT NULL,
  `fec_nacimiento` varchar(150) CHARACTER SET latin1 NOT NULL,
  `lugarnacimiento` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'Tlaxcala',
  `tiempo_residencia` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sobrenombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `propietario_suplente` varchar(50) CHARACTER SET latin1 NOT NULL,
  `prelacion` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `candidatura_diputado`
--

INSERT INTO `candidatura_diputado` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `partido_politico`, `candidatura`, `clave_elector`, `curp`, `distrito`, `fec_nacimiento`, `lugarnacimiento`, `tiempo_residencia`, `sobrenombre`, `estado`, `user_capturista`, `propietario_suplente`, `prelacion`) VALUES
(1, 'LUCIO MARTIN', 'AMARO', 'CARRILLO', 'MASCULINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'AMCRLC61121529H500', 'AACL611215HTLMRC15', '15-VICENTE GUERRERO', '1961-12-15', 'TLAXCALA', '10', '', 'Completo', 'karinaLuna', 'Propietario', '00'),
(2, 'GADIEL', 'CALVARIO', 'PEREZ', 'MASCULINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'CLPRGD89072829H700', 'CAPG890728HTLLRD02', '15-VICENTE GUERRERO', '1989-07-28', 'TLAXCALA', '20', '', 'Completo', 'karinaLuna', 'Suplente', ''),
(3, 'ADDIEL LUBIN ', 'MEJIA', 'HERNANDEZ', 'MASCULINO', 'Candidatura Independiente', 'MAYORIA RELATIVA', 'MJHRAD81090929H400', 'MEHA810909HTLJRD19', '03-SAN COSME XALOZTOC', '1981-09-09', 'TLAXCALA', '10', '', 'Incompleto', 'JesusVazquez', 'Propietario', '00'),
(4, 'ALEJANDRO ', 'FERNANDEZ', 'GUARNEROS', 'MASCULINO', 'Candidatura Independiente', 'MAYORIA RELATIVA', 'FRGRAL76011129H300', 'FEGA760111HTLRRL03', '03-SAN COSME XALOZTOC', '1976-01-11', 'TLAXCALA', '42', '', 'Incompleto', 'JesusVazquez', 'Suplente', ''),
(5, 'MA. VERONICA', 'PEREZ', 'BAEZ', 'FEMENINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'PRBZMA73092929M901', 'PEBV730929MTLRZR01', '11-HUAMANTLA', '1973-09-29', 'TLAXCALA', '30', '', 'Incompleto', 'EduardoReygadas', 'Propietario', '00'),
(6, 'MARIA LEONOR', 'BAUTISTA ', 'PEREZ', 'FEMENINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'BTPRLN82111029M600', 'BAPL821110MTLTRN07', '11-HUAMANTLA', '1982-11-10', 'TLAXCALA', '20', '', 'Incompleto', 'EduardoReygadas', 'Suplente', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura_documentado`
--

CREATE TABLE IF NOT EXISTS `candidatura_documentado` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `clave_elector` varchar(150) CHARACTER SET latin1 NOT NULL,
  `doc_snr_ine` varchar(50) CHARACTER SET latin1 NOT NULL,
  `act_de_nacimiento` varchar(50) CHARACTER SET latin1 NOT NULL,
  `copia_act_de_nacimiento` varchar(50) CHARACTER SET latin1 NOT NULL,
  `const_separacion_cargo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `escrito_bajo` varchar(50) CHARACTER SET latin1 NOT NULL,
  `const_act_no_penales` varchar(50) CHARACTER SET latin1 NOT NULL,
  `solicitud_registro` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cred_para_votar` varchar(50) CHARACTER SET latin1 NOT NULL,
  `const_acept_postulacion` varchar(50) CHARACTER SET latin1 NOT NULL,
  `const_residencia` varchar(50) CHARACTER SET latin1 NOT NULL,
  `manifiesto` varchar(50) CHARACTER SET latin1 NOT NULL,
  `capacidad_economica` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cedula_rfc` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `candidatura_documentado`
--

INSERT INTO `candidatura_documentado` (`id`, `clave_elector`, `doc_snr_ine`, `act_de_nacimiento`, `copia_act_de_nacimiento`, `const_separacion_cargo`, `escrito_bajo`, `const_act_no_penales`, `solicitud_registro`, `cred_para_votar`, `const_acept_postulacion`, `const_residencia`, `manifiesto`, `capacidad_economica`, `cedula_rfc`) VALUES
(1, 'AMCRLC61121529H500', 'true', 'true', 'NO APLICA', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(2, 'CLPRGD89072829H700', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(3, 'MJHRAD81090929H400', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(4, 'FRGRAL76011129H300', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(5, 'PRBZMA73092929M901', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false'),
(6, 'BTPRLN82111029M600', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura_renuncia`
--

CREATE TABLE IF NOT EXISTS `candidatura_renuncia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `apellido_paterno` varchar(150) CHARACTER SET latin1 NOT NULL,
  `apellido_materno` varchar(150) CHARACTER SET latin1 NOT NULL,
  `genero` varchar(50) CHARACTER SET latin1 NOT NULL,
  `partido_politico` varchar(250) CHARACTER SET latin1 NOT NULL,
  `candidatura` varchar(250) CHARACTER SET latin1 NOT NULL,
  `clave_elector` varchar(150) CHARACTER SET latin1 NOT NULL,
  `curp` varchar(150) CHARACTER SET latin1 NOT NULL,
  `distrito` varchar(250) CHARACTER SET latin1 NOT NULL,
  `fec_nacimiento` varchar(150) CHARACTER SET latin1 NOT NULL,
  `tiempo_residencia` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sobrenombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `propietario_suplente` varchar(50) CHARACTER SET latin1 NOT NULL,
  `prelacion` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(150) CHARACTER SET latin1 NOT NULL,
  `tipo` varchar(150) CHARACTER SET latin1 NOT NULL,
  `nombre_clv` varchar(150) CHARACTER SET latin1 NOT NULL,
  `clv_original` varchar(250) CHARACTER SET latin1 NOT NULL,
  `nombre_clv_nuevo` varchar(150) CHARACTER SET latin1 NOT NULL,
  `clv_nuevo` varchar(250) CHARACTER SET latin1 NOT NULL,
  `motivo` varchar(150) CHARACTER SET latin1 NOT NULL,
  `dia` varchar(150) CHARACTER SET latin1 NOT NULL,
  `hora` varchar(150) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `usuario`, `tipo`, `nombre_clv`, `clv_original`, `nombre_clv_nuevo`, `clv_nuevo`, `motivo`, `dia`, `hora`) VALUES
(1, 'karinaLuna', 'Registro', 'LUCIO MARTIN AMARO CARRILLO', 'AMCRLC61121529H500', ' ', ' ', ' ', '21.03.2018', '04:08:16pm'),
(2, 'karinaLuna', 'Registro', 'GADIEL CALVARIO PEREZ', 'CLPRGD89072829H700', ' ', ' ', ' ', '21.03.2018', '04:36:55pm'),
(3, 'JesusVazquez', 'Registro', 'ADDIEL LUBIN  MEJIA HERNANDEZ', 'MJHRAD81090929H400', ' ', ' ', ' ', '21.03.2018', '04:47:22pm'),
(4, 'JesusVazquez', 'Registro', 'ALEJANDRO  FERNANDEZ GUARNEROS', 'FRGRAL76011129H300', ' ', ' ', ' ', '21.03.2018', '04:57:03pm'),
(5, 'EduardoReygadas', 'Registro', 'MA. VERONICA PEREZ BAEZ', 'PRBZMA73092929M901', ' ', ' ', ' ', '21.03.2018', '05:00:44pm'),
(6, 'EduardoReygadas', 'Registro', 'MARIA LEONOR BAUTISTA  PEREZ', 'BTPRLN82111029M600', ' ', ' ', ' ', '21.03.2018', '05:08:50pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(50) CHARACTER SET latin1 NOT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `app` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apm` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `has` varchar(250) CHARACTER SET latin1 NOT NULL,
  `clave_original` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `tipo_doc`, `usuario`, `nombre`, `app`, `apm`, `fecha`, `hora`, `has`, `clave_original`) VALUES
(0001, 'cv', 'karinaLuna', 'KARINA', 'LUNA', 'ROMERO', '2018-03-21', '16:08:16', '63d0d22442e1c313b181b6e9b7cfb85e', 'AMCRLC61121529H500'),
(0002, 'cv', 'karinaLuna', 'KARINA', 'LUNA', 'ROMERO', '2018-03-21', '16:36:56', '32c017c0d4f16460cf0a235f41626466', 'CLPRGD89072829H700'),
(0003, 'coind', 'JesusVazquez', ' ', ' ', ' ', '2018-03-21', '16:47:22', '267f86bbf817a11b3819ae2769054672', 'MJHRAD81090929H400'),
(0004, 'coind', 'JesusVazquez', ' ', ' ', ' ', '2018-03-21', '16:57:03', '053c573fc05e8c309cf36e026cad650f', 'FRGRAL76011129H300'),
(0005, 'copp', 'EduardoReygadas', ' ', ' ', ' ', '2018-03-21', '17:00:44', '643466a124fd8d5f1bc830d3af2f7423', 'PRBZMA73092929M901'),
(0006, 'copp', 'EduardoReygadas', ' ', ' ', ' ', '2018-03-21', '17:08:51', '6567983b56bc4917a6d0ef86087cbaa5', 'BTPRLN82111029M600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_eliminado`
--

CREATE TABLE IF NOT EXISTS `registro_eliminado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_elector` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `capturista` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `hora` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `app_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `apm_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `usuario` varchar(150) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `rol` varchar(150) CHARACTER SET latin1 NOT NULL,
  `user_estado` varchar(150) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=77 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_capturista`, `app_capturista`, `apm_capturista`, `usuario`, `password`, `rol`, `user_estado`) VALUES
(28, 'Karina ', 'Fatine ', 'Andrade', 'karina.fatine', 'karina89', 'Administrador', 'Inactivo'),
(32, 'Lucia', 'Hernandez', 'Fernandez', 'lucia.hernandez', 'lucia56', 'Supervisor', 'Inactivo'),
(35, 'Elena', 'Mendoza', 'Piedra', 'elena.mendoza', 'elena89', 'Capturista', 'Inactivo'),
(37, 'Amelia', 'Sanchez', 'Hernandez', 'amelia.sanchez', 'amelia75', 'Subsanacion', 'Inactivo'),
(53, 'Luis', 'Hernandez', 'Martinez', 'luis10', 'luis10', 'Supervisor', 'Inactivo'),
(54, 'CARLOS', 'HERNÁNDEZ', 'SANZÓN', 'carlos10', 'carlos10', 'Administrador', 'Inactivo'),
(55, 'Alberto', 'Hernandez', 'Hernandez', 'alberto10', 'alberto10', 'Administrador', 'Inactivo'),
(60, 'KAREN', 'SEDEÑO', 'IPATZI', 'sedeno', 'sedeno89', 'Administrador', 'Inactivo'),
(61, 'JUAN PABLO', 'RAMÍREZ', 'COSETL', 'jpablo89', 'jpablo89', 'Administrador', 'Inactivo'),
(62, 'OMAR', 'CISNEROS', 'MARTINEZ', 'omar89', 'omar88', 'Administrador', 'Inactivo'),
(63, 'CARLOS ALBERTO', 'HERNÁNDEZ', 'SANZóN', 'cahs10', 'cahs10', 'Administrador', 'Inactivo'),
(64, 'LUIS', 'RAMIRÉZ', 'MUÑOZ', 'LUIS89', 'LUIS89', 'Subsanacion', 'Inactivo'),
(65, 'FERMIN DE JESÚS ', 'SOSA', 'SáNCHEZ', 'FerminSosa', 'ferminsosa', 'Capturista', 'Inactivo'),
(66, 'JESÚS ENRIQUE', 'VÁZQUEZ', 'RODRÍGUEZ', 'JesusVazquez', 'jesusvazquez', 'Capturista', 'Activo'),
(67, 'JESSÍCA', 'MARTÍNEZ', 'MOJÍCA', 'JessicaMartinez', 'jessicamartinez', 'Capturista', 'Inactivo'),
(68, 'KARINA', 'LUNA', 'ROMERO', 'KarinaLuna', 'karinaluna', 'Capturista', 'Activo'),
(69, 'FRIDA PAULINA', 'TORIZ', 'RODRIGUEZ', 'FridaToriz', 'fridatoriz', 'Subsanacion', 'Inactivo'),
(70, 'EDUARDO', 'REYGADAS', 'NAVA', 'EduardoReygadas', 'eduardoreygadas', 'Capturista', 'Inactivo'),
(71, 'MARÍA ELENA', 'MÁRQUEZ', 'AGUILAR', 'MariaMarquez', 'mariamarquez', 'Subsanacion', 'Inactivo'),
(72, 'MARIBEL', 'SÁNCHEZ', 'FLORES', 'MaribelSanchez', 'maribelsanchez', 'Subsanacion', 'Inactivo'),
(73, 'IRVIN', 'ZARAGOZA', 'CRUZ', 'IrvinZaragoza', 'irvinzaragoza', 'Capturista', 'Inactivo'),
(74, 'JOSÉ', 'MUÑOZ', 'TORRES', 'jose', 'jose10', 'Capturista', 'Inactivo'),
(75, 'JOSÉ ALFREDO', 'GALICIA', 'CERVANTES', 'jalfredo', 'jalfredo55', 'Administrador', 'Inactivo'),
(76, 'JUAN JESÚS', 'CORTÉS', 'SANTACRUZ', 'jesuscortes', 'jesus79', 'Administrador', 'Activo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
