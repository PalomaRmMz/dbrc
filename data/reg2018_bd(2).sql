-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-03-2018 a las 14:35:25
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
  `tiempo_residencia` varchar(50) CHARACTER SET latin1 NOT NULL,
  `sobrenombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `estado` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_capturista` varchar(150) CHARACTER SET latin1 NOT NULL,
  `propietario_suplente` varchar(50) CHARACTER SET latin1 NOT NULL,
  `prelacion` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=195 ;

--
-- Volcado de datos para la tabla `candidatura_diputado`
--

INSERT INTO `candidatura_diputado` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `partido_politico`, `candidatura`, `clave_elector`, `curp`, `distrito`, `fec_nacimiento`, `tiempo_residencia`, `sobrenombre`, `estado`, `user_capturista`, `propietario_suplente`, `prelacion`) VALUES
(52, 'Josue', 'Fernandez', 'Fernandez', 'MASCULINO', 'Candidatura Común PRI - PVEM - PS', 'MAYORIA RELATIVA', 'ABCD123', 'ASDA7558AS', '09-CHIAUTEMPAN', '2018-02-11', '15', '', 'Renuncia', 'karina.fatine', 'Suplente', 'NO'),
(134, 'Maria', 'Pacheco', 'Morales', 'MASCULINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'ASDJAKJSDIJDISI', 'ASDNAKSDJKJADSJDKJ', '04-APIZACO', '1978-05-12', '12', '', 'Incompleto', 'alberto10', 'Suplente', '00'),
(135, 'JUAN', 'PABLO', 'RAMÍREs', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'JOPR11111111111111', 'JOPR11111111111111', '07-TLAXCALA', '1985-01-01', '01', '', 'Baja', 'jpablo89', 'Propietario', '00'),
(137, 'Milton', 'Perez', 'Toriz', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', '125621556987965635', '2413535263', '03-XALOZTOC', '1978-05-19', '10', '', 'Incompleto', '', 'Propietario', '00'),
(139, 'Emilia', 'Sanchez', 'Perez', 'FEMENINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'SADIAJSIDJIJASIJID', 'IJIJSDIAJIDJAISJDI', '02-TLAXCO', '1978-12-10', '25', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(140, 'Asdasdasdasdasd', 'Asdasdasd', 'Asdasd', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'ASZDSADASDASDASD', 'ASDASDASDASDASDA', '02-TLAXCO', '1978-02-10', '34', '', 'Incompleto', 'alberto10', 'Suplente', '00'),
(141, 'Carlos', 'Morales', 'Perez', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', 'EDSHLJFSDHÑGUFIDGS', 'UDFHIULDGYFUGFGDFO', '06-IXTACUIXTLA', '1985-10-15', '15', '', 'Incompleto', '', 'Suplente', '00'),
(142, 'Ivan', 'Ipatzi', 'Perez', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', '1234567891011', '1234567891011', '04-APIZACO', '1989-02-10', '5', '', 'Completo', 'sedeno', 'Propietario', '00'),
(143, 'Luis', 'Juárez', 'Ramirez', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'JRRMLS73082529H200', 'JRRM730825MDF001', '01-CALPULALPAN', '1973-08-25', '5', 'Wicho', 'Completo', 'omar89', 'Propietario', '00'),
(144, 'Potiyyuu', 'Yiiopo', 'Yikkyui', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', '124589751156532030', '155HRTJRT2685995Y5', '02-TLAXCO', '9698-05-12', '10', '', 'Incompleto', 'sedeno', 'Propietario', '00'),
(145, 'Rtyuyu', 'Getryu', 'Uioiluikj', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', '121655695623529565', 'RTHRTJYTKJUIL899TR', '02-TLAXCO', '9689-05-12', '10', '', 'Incompleto', 'sedeno', 'Suplente', '00'),
(147, 'Jaime', 'Amador ', 'Flores', 'MASCULINO', 'Movimiento Regeneración Nacional (Morena)', 'MAYORIA RELATIVA', 'AMFLJM69050429H000', 'NOLOTENGODESPUES00', '15-GUERRERO', '1969-05-05', '35', 'Firulais', 'Incompleto', 'omar89', 'Propietario', '00'),
(148, 'Hola', 'Hola', 'Hola', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'DSFYDUIDIFHSDJHFPI', 'HFPIUEHRUFPIRIHFUE', '06-IXTACUIXTLA', '1986-02-12', '12', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(149, 'Abcd', 'Efg', 'Hij', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'REPRESENTACION PROPORCIONAL', '444444444444444444', '444444444444444444', '03-XALOZTOC', '1858-01-01', '05', '', 'Incompleto', 'jpablo89', 'Propietario', ''),
(150, 'Maribel ', ' Bonilla', 'Garcia', 'FEMENINO', 'Partido del Trabajo (PT)', 'REPRESENTACION PROPORCIONAL', 'BNGRMR878002729M50', 'BNGRMR878002729M50', '15-GUERRERO', '1978-04-27', '25', 'Mari', 'Completo', 'omar89', 'Propietario', '10'),
(152, 'Hola', 'Hola', 'Hola', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'DJFHSDJFHSUñEHEUOH', 'ODSYFOUEOUFSJEOSNF', '06-IXTACUIXTLA', '1963-05-03', '15', '', 'Incompleto', 'alberto10', 'Suplente', '00'),
(153, 'Juan Pablo', 'RamÍrez ', 'Cosetl', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'REPRESENTACION PROPORCIONAL', 'ABCDEF544545454545', 'ABCDEF544545454545', '03-XALOZTOC', '1985-01-01', '25', '', 'Incompleto', 'jpablo89', 'Suplente', ''),
(154, 'Alejandro', 'Jair', 'RamÍrez', 'MASCULINO', 'Candidatura Independiente', 'MAYORIA RELATIVA', 'DDDDDDDDDDDDDDDDDD', 'DDDDDDDDDDDDDDDDDD', '02-TLAXCO', '1985-01-01', '52', '', 'Baja', 'jpablo89', 'Propietario', '00'),
(156, 'Ooooooooo', 'Ooooooooooooo', 'Ooooooooooooooooooo', 'FEMENINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'QQQQQQQQQQQQQQQQQQ', 'WSWWWWWWWWWWWWWWWW', '08-CONTLA', '1658-10-18', '2', '', 'Completo', 'sedeno', 'Propietario', '00'),
(157, 'aaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaa', 'rrrrrrrrr', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'REPRESENTACION PROPORCIONAL', 'eeeeeeeeeeeeeeeeee', 'eeeeeeeeeeeeeeeeee', '04-APIZACO', '1986-02-18', '10', '', 'Estado', 'sedeno', 'Propietario', '00'),
(158, 'Fa', 'Fa', 'Fa', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'REPRESENTACION PROPORCIONAL', 'AAAAAAAAAAAAAAAAA5', '555555555555555555', '07-TLAXCALA', '1978-12-12', '95', '', 'Incompleto', 'alberto10', 'Propietario', '04'),
(159, 'Asdadsasdasd', 'Asdasdasdasd', 'Jjnjnjnjnk', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'UBUHUHIUHIOHLKKJKJ', 'UIHIUHHKJKHHKJHKJH', '03-XALOZTOC', '1978-02-11', '22', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(160, 'Cars', 'Muñez', 'Muñea', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'IPUIBJBDJBNVDKJNDK', 'JVRPHJFIESHFKDSNFK', '13-ZACATELCO', '1875-05-15', '25', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(161, 'Aurelia', 'Flores', 'HernÁndez', 'FEMENINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'FLHRAR70120221M400', 'FLHRAR70120221M400', '10-HUAMANTLA', '1970-12-02', '5', 'Aure', 'Incompleto', 'omar89', 'Propietario', '00'),
(162, 'Eduardo', 'Macarena', 'Torres', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'WWWWWWWWWWWWWWWWWW', 'WWWWWWWWWWWWWWWWWW', '04-APIZACO', '1958-12-12', '21', '', 'Incompleto', '', 'Propietario', '00'),
(163, 'Alejandor', 'Jueraz', 'Blancas', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'JRBLAL74101029H300', 'JRBLAL74101029H300', '10-HUAMANTLA', '1974-10-10', '8', 'Alex', 'Incompleto', 'omar89', 'Suplente', '00'),
(164, 'Agustin', 'Hernandez', 'Lópex', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'TTTTTTTTTTTTTTTTTT', 'TTTTTTTTTTTTTTTTTT', '04-APIZACO', '1990-12-15', '10', '', 'Baja', '', 'Suplente', '00'),
(165, 'Carlos', 'Carlos', 'Carlos', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'EIWFEFIUYWIOFYEUFY', 'DHSOFUEYFUOEHUOFHE', '13-ZACATELCO', '1985-05-02', '25', '', 'Incompleto', 'alberto10', 'Suplente', '00'),
(166, 'Carlos', 'Carlos', 'Carlos', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'IIIIIIIIIIIIIIIIII', 'IIIIIIIIIIIIIIIIII', '06-IXTACUIXTLA', '1855-05-15', '48', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(167, 'Iiiiiiiiiiiiiiiiiiiiiiiii', 'Iyyhrtyhrtuyh', 'Ujhtyuyu', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'KKKKKKKKKKKKKKKKKK', 'KKKKKKKKKKKKKKKKKK', '04-APIZACO', '1986-02-18', '10', '', 'Baja', 'sedeno', 'Propietario', '00'),
(168, 'ANALY', 'FLORES', 'HERNANDEZ', 'FEMENINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'TTTTTTTTTTTTTTTTTO', 'TTTTTTTTTTTTTTTTTO', '04-APIZACO', '1990-08-10', '35', '', 'Estado', 'omar89', 'Suplente', '00'),
(169, 'Ernesto', 'Valle', 'López', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'FGFGFGFGFGTYTYTYTY', 'FGFGFGFGFGTYTYTYTY', '01-CALPULALPAN', '1992-01-15', '10', '', 'Completo', '', 'Propietario', '00'),
(170, 'Josue', 'Fernandez', 'Moreno', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'OOKSAOOKSOKKAOSKOK', 'IJJJLIJALISJJDAOIS', '08-CONTLA', '1978-05-10', '22', '', 'Incompleto', 'jpablo89', 'Propietario', '00'),
(173, 'Elexis', 'PÉrez', 'GonzÁlez', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'PRGNAL87072229H900', 'PRGNA0335073592850', '13-ZACATELCO', '1987-07-22', '31', '', 'Completo', 'omar89', 'Propietario', '00'),
(174, 'Danira', 'GonzÁlez', 'JuÁrez', 'FEMENINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'GNJRDN63021529M500', 'GNJRDN63021529M500', '13-ZACATELCO', '1963-02-15', '45', '', 'Incompleto', 'omar89', 'Suplente', '00'),
(175, 'Carlos', 'Hernández', 'Muñoz', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'GVVVVVVVVVVVVVVVVV', 'GVVVVVVVVVVVVVVVVV', '07-TLAXCALA', '1985-12-12', '56', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(176, 'Carlos', 'Muñoz', 'Cortéz', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'DFFFFFFFFFFFFFFFFF', 'DFFFFFFFFFFFFFFFFF', '14-NATIVITAS', '1985-12-12', '45', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(177, 'José', 'Ramiréz', 'Muñoz', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'GTTTTTTTTTTTTTTTTT', 'GTTTTTTTTTTTTTTTTT', '14-NATIVITAS', '1985-12-12', '15', '', 'Incompleto', 'alberto10', 'Suplente', '00'),
(178, 'Eduardo', 'LÓpez', 'HenÁndez', 'MASCULINO', 'Movimiento Regeneración Nacional (Morena)', 'MAYORIA RELATIVA', 'XXWWAAQQQQQQQQQQQQ', 'XXWWAAQQQQQQQQQQQQ', '13-ZACATELCO', '1985-05-05', '23', '', 'Incompleto', 'jpablo89', 'Propietario', '00'),
(179, 'Celsa', 'Cervantes', 'Palacios', 'FEMENINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'CRPLCL61040629M600', 'CRPLCL61040629M600', '13-ZACATELCO', '1961-04-06', '15', '', 'Incompleto', 'omar89', 'Propietario', '00'),
(180, 'Carlos', 'Nuñez', 'Pérez', 'MASCULINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', '354643213546543543', '252424546546546546', '13-ZACATELCO', '1970-01-18', '20', '', 'Incompleto', 'omar89', 'Suplente', '00'),
(181, 'Carlos', 'Mórales', 'Riverá', 'MASCULINO', 'Partido del Trabajo (PT)', 'MAYORIA RELATIVA', 'YGFFFFFFFFFFFFFFFF', 'YGFFFFFFFFFFFFFFFF', '11-HUAMANTLA', '1985-12-12', '15', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(182, 'RaÚl', 'PÉrez', 'Hernandéz', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', '437563453453453453', '437563453453453453', '01-CALPULALPAN', '1985-02-01', '45', '', 'Incompleto', 'jpablo89', 'Propietario', '00'),
(183, 'Adan', 'Ramirez', 'Perez', 'MASCULINO', 'Movimiento Regeneración Nacional (Morena)', 'REPRESENTACION PROPORCIONAL', 'ABCDEF152678H901', 'GACA895623HTLLRL00', 'Plurinominal', '1980-04-18', '15', 'Adani', 'Completo', 'omar89', 'Propietario', '01'),
(184, 'Robert', 'Moreno', 'Hernandez', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'MMMMMMMMMMMMMMMMMM', 'HHHHHHHHHHHHHHHHHH', '15-GUERRERO', '1989-12-27', '11', '', 'Incompleto', 'sedeno', 'Propietario', '00'),
(185, 'Carlos', 'Nuñez', 'Perez', 'MASCULINO', 'Partido Nueva Alianza', 'MAYORIA RELATIVA', 'ASJDJAHSDJHASJDHJA', 'AJSDHJHAJHDSJHAJSD', '02-TLAXCO', '1998-12-12', '12', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(186, 'Karla', 'Moreno', 'Sedeno', 'FEMENINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'KKKKKKKKKKKKKKKKK9', 'SSSSSSSSSSSSSSSSSS', '11-HUAMANTLA', '1985-06-06', '15', '', 'Completo', '', 'Propietario', '00'),
(187, 'Karen', 'Sedeño', 'Torres', 'FEMENINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'SSSSSSSSSSSSSSSSSS', 'KKKKKKKKKKKKKKKKK8', '11-HUAMANTLA', '1956-10-22', '10', '', 'Completo', '', 'Suplente', ''),
(188, 'Mayra', 'Perez ', 'Perez', 'FEMENINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'REPRESENTACION PROPORCIONAL', 'MAYRAAAAAAAAAAAAAA', 'MAYRAYAAAAAAAAAAAA', '09-CHIAUTEMPAN', '1956-10-25', '10', '', 'Incompleto', '', 'Propietario', '06'),
(189, 'Juan', 'RamÍrez', 'Cosetl', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'POPA58498594859485', 'POPA58498594859485', '13-ZACATELCO', '1985-05-01', '23', '', 'Incompleto', '', 'Propietario', '00'),
(190, 'Juan', 'Toleo', 'PÉrez', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', '969865463584757575', '969865463584757575', '13-ZACATELCO', '1985-01-01', '2', '', 'Incompleto', '', 'Suplente', '00'),
(191, 'Francisco', 'Juarez', 'Molina', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', 'JRMLFR94031629H700', 'JRMLFR94031629H700', '07-TLAXCALA', '1994-03-16', '15', '', 'Incompleto', '', 'Propietario', '00'),
(192, 'Charly', 'Guzman', 'Flores', 'FEMENINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'REPRESENTACION PROPORCIONAL', 'MARYGUSMANNNNNNNNN', 'MARYGUSMANFNNNNNNN', '09-CHIAUTEMPAN', '1986-12-10', '10', '', 'Incompleto', '', 'Suplente', '06'),
(193, 'Noemi', 'Aguilar', 'Papazetzi', 'FEMENINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', 'AGPPNM91041329M000', 'AGPPNM91041329M000', '07-TLAXCALA', '1991-04-13', '15', '', 'Incompleto', '', 'Suplente', ''),
(194, 'pedro', 'zanora', 'rodriguez', 'MASCULINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', 'pedroooooooooooooo', 'ppedrooooooooooooo', '04-APIZACO', '1987-02-10', '10', '', 'Estado', 'sedeno', 'Propietario', '00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=177 ;

--
-- Volcado de datos para la tabla `candidatura_documentado`
--

INSERT INTO `candidatura_documentado` (`id`, `clave_elector`, `doc_snr_ine`, `act_de_nacimiento`, `copia_act_de_nacimiento`, `const_separacion_cargo`, `escrito_bajo`, `const_act_no_penales`, `solicitud_registro`, `cred_para_votar`, `const_acept_postulacion`, `const_residencia`, `manifiesto`, `capacidad_economica`, `cedula_rfc`) VALUES
(34, 'ABCD123', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(114, 'CIMO701001DF001', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(115, 'ASDKASDJKLJKSDJKDJ', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'true', 'false', 'false'),
(116, 'ASDJAKJSDIJDISI', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', 'false', 'false', 'false', 'true', 'false', 'false'),
(117, 'JOPR11111111111111', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(118, '543FDFDFDSFDSFDFDS', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', 'false', 'false', 'false', 'false', 'false', 'false'),
(119, '125621556987965635', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'false', 'true', 'false', 'false', 'false'),
(120, 'SHDJLSHULIHWEUDHUI', 'false', 'false', 'NO APLICA', 'NO', 'false', 'true', 'false', '', 'false', 'false', 'true', 'true', 'true'),
(121, 'SADIAJSIDJIJASIJID', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'true', 'true', 'false', 'false', 'false'),
(122, 'ASZDSADASDASDASD', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'false', 'false'),
(123, 'EDSHLJFSDHÑGUFIDGS', 'NO', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'false'),
(124, '1234567891011', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(125, 'JRRMLS73082529H200', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(126, '124589751156532030', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'false', 'false', 'false', 'false', 'false'),
(127, '121655695623529565', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(128, '999999999999999999', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(129, 'AMFLJM69050429H000', 'true', 'true', 'NO', 'SI', 'true', 'false', 'false', '', 'true', 'false', 'true', 'true', 'false'),
(130, 'DSFYDUIDIFHSDJHFPI', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(131, '444444444444444444', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(132, 'BNGRMR878002729M50', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(133, 'CDVLSX50080629H500', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true'),
(134, 'DJFHSDJFHSUñEHEUOH', 'NO', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(135, 'ABCDEF544545454545', 'NO', 'true', 'NO', 'NO', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(136, 'DDDDDDDDDDDDDDDDDD', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(137, '111111111111111119', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(138, 'QQQQQQQQQQQQQQQQQQ', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(139, 'eeeeeeeeeeeeeeeeee', 'true', 'true', 'SI', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(140, 'AAAAAAAAAAAAAAAAA5', 'false', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(141, 'UBUHUHIUHIOHLKKJKJ', 'true', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(142, 'IPUIBJBDJBNVDKJNDK', 'false', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(143, 'FLHRAR70120221M400', 'true', 'true', 'NO', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(144, 'WWWWWWWWWWWWWWWWWW', 'true', 'true', 'NO APLICA', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(145, 'JRBLAL74101029H300', 'NO', 'true', 'SI', 'SI', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'false'),
(146, 'TTTTTTTTTTTTTTTTTT', 'NO', 'true', 'SI', 'SI', 'true', 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'true'),
(147, 'EIWFEFIUYWIOFYEUFY', 'NO', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true'),
(148, 'IIIIIIIIIIIIIIIIII', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(149, 'KKKKKKKKKKKKKKKKKK', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(150, 'TTTTTTTTTTTTTTTTTO', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(151, 'FGFGFGFGFGTYTYTYTY', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(152, 'OOKSAOOKSOKKAOSKOK', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(153, '999999999999999999', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(154, 'ZMSNES60091229M900', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(155, 'PRGNAL87072229H900', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(156, 'GNJRDN63021529M500', 'NO', 'true', 'NO', 'NO', 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'false', 'false'),
(157, 'GVVVVVVVVVVVVVVVVV', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(158, 'DFFFFFFFFFFFFFFFFF', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(159, 'GTTTTTTTTTTTTTTTTT', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(160, 'XXWWAAQQQQQQQQQQQQ', 'true', 'true', 'SI', 'NO', 'false', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(161, 'CRPLCL61040629M600', 'true', 'false', 'NO', 'NO', 'true', 'true', 'true', '', 'false', 'false', 'false', 'true', 'false'),
(162, '354643213546543543', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', 'true', 'false', 'false', 'false', 'false', 'false'),
(163, 'YGFFFFFFFFFFFFFFFF', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(164, '437563453453453453', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'false'),
(165, 'ABCDEF152678H900', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(166, 'MMMMMMMMMMMMMMMMMM', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'false', 'true', 'true', 'true', 'true'),
(167, 'ASJDJAHSDJHASJDHJA', 'true', 'false', 'NO', 'SI', 'false', 'false', 'false', '', 'false', 'false', 'false', 'true', 'true'),
(168, 'KKKKKKKKKKKKKKKKK9', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(169, 'SSSSSSSSSSSSSSSSSS', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(170, 'MAYRAAAAAAAAAAAAAA', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'false', 'false', 'false', 'false', 'false'),
(171, 'POPA58498594859485', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'false', 'false', 'false'),
(172, '969865463584757575', 'NO', 'true', 'SI', 'SI', 'true', 'false', 'true', 'true', 'true', 'true', 'false', 'false', 'false'),
(173, 'JRMLFR94031629H700', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(174, 'MARYGUSMANNNNNNNNN', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false'),
(175, 'AGPPNM91041329M000', 'NO', 'true', 'SI', 'SI', 'true', 'false', 'false', 'true', 'false', 'false', 'false', 'true', 'false'),
(176, 'pedroooooooooooooo', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `candidatura_renuncia`
--

INSERT INTO `candidatura_renuncia` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `partido_politico`, `candidatura`, `clave_elector`, `curp`, `distrito`, `fec_nacimiento`, `tiempo_residencia`, `sobrenombre`, `estado`, `user_capturista`, `propietario_suplente`, `prelacion`) VALUES
(8, 'JUAN', 'RAMIREZ', 'RAMIREZ', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', '999999999999999999', '999999999999999999', '07-TLAXCALA', '1985-10-01', '10', '', 'Estado', 'jpablo89', 'Propietario', '00'),
(9, 'Beti', 'Solano ', 'Sedeno', 'FEMENINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'REPRESENTACION PROPORCIONAL', '111111111111111119', '111111111111111119', '04-APIZACO', '9856-03-10', '10', '', 'Baja', '', 'Propietario', '08'),
(10, 'Carlos Alberto', 'Hernandez', 'Corona', 'MASCULINO', 'Coalicion Juntos Haremos Historia (MORENA/PT/PES)', 'MAYORIA RELATIVA', 'SHDJLSHULIHWEUDHUI', 'SLDGHUSTUFIPDTFDUF', '06-IXTACUIXTLA', '1963-12-12', '12', '', 'Incompleto', '', 'Propietario', '00'),
(11, 'Oscar ', 'Pérez', 'Gómez', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'CIMO701001DF001', 'CIMO781001HDFSRM08', '01-CALPULALPAN', '1978-08-18', '25', 'Ocmar', 'Completo', '', 'Propietario', '00'),
(12, 'Elena', 'Martinez', 'Perez', 'FEMENINO', 'Partido Encuentro Social (PES)', 'MAYORIA RELATIVA', 'ASDKASDJKLJKSDJKDJ', 'KLKAJSDKDJKAJSDKJK', '04-APIZACO', '1978-02-10', '10', '', 'Incompleto', 'alberto10', 'Propietario', '00'),
(13, 'ANA', 'LAURA', 'MORALES', 'FEMENINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', '543FDFDFDSFDSFDFDS', '111111111111111111', '07-TLAXCALA', '1985-12-12', '2', 'CATANA', 'Incompleto', 'jpablo89', 'Suplente', '00'),
(14, 'Juan', 'Ra', 'Co', 'FEMENINO', 'Candidatura Común PRI - PVEM - NA - PS', 'MAYORIA RELATIVA', '999999999999999999', '999999999999999999', '04-APIZACO', '1985-11-10', '10', '', 'Completo', 'sedeno', 'Propietario', '00'),
(15, 'ESTELA', 'ZEMPOALTECATL', 'SÁNCHEZ', 'MASCULINO', 'Candidatura Independiente', 'MAYORIA RELATIVA', 'ZMSNES60091229M900', 'ZMSNES60091229M900', '02-TLAXCO', '1960-02-19', '58', 'ALEX', 'Estado', 'omar89', 'Propietario', '00'),
(16, 'Sixto', 'Cedeño', 'Velecia', 'MASCULINO', 'Partido del Trabajo (PT)', 'REPRESENTACION PROPORCIONAL', 'CDVLSX50080629H503', 'CDVLSX50080629H500', '15-GUERRERO', '1950-08-06', '10', 'Sixto', 'Incompleto', 'omar89', 'Suplente', '10');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=119 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `usuario`, `tipo`, `nombre_clv`, `clv_original`, `nombre_clv_nuevo`, `clv_nuevo`, `motivo`, `dia`, `hora`) VALUES
(1, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '09:23:32am'),
(2, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:23:43am'),
(3, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '09:23:49am'),
(4, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '09:25:33am'),
(5, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:26:34am'),
(6, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:27:00am'),
(7, 'KARINA.FATINE', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:27:18am'),
(8, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:28:32am'),
(9, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:52:44am'),
(10, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:52:48am'),
(11, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:52:52am'),
(12, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:52:57am'),
(13, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:52:59am'),
(14, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:53:09am'),
(15, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:53:51am'),
(16, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:58:34am'),
(17, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '09:58:37am'),
(18, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '10:10:53am'),
(19, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '10:12:58am'),
(20, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '10:13:02am'),
(21, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '10:18:09am'),
(22, 'elena.mendoza', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '10:18:53am'),
(23, 'elena.mendoza', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '11:00:35am'),
(24, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '11:00:47am'),
(25, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '11:01:00am'),
(26, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '11:01:18am'),
(27, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '11:35:54am'),
(28, '', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '11:36:09am'),
(29, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:09:01pm'),
(30, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:26:15pm'),
(31, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:28:08pm'),
(32, 'carlos10', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:34:40pm'),
(33, 'karina.fatine', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '12:37:47pm'),
(34, 'carlos10', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '12:39:33pm'),
(35, 'sedeno', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:40:42pm'),
(36, 'sedeno', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:41:10pm'),
(37, 'sedeno', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '12:41:10pm'),
(38, 'sedeno', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:41:15pm'),
(39, 'carlos10', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '12:41:28pm'),
(40, 'carlos10', 'Renuncia', '', 'abcd123', '', 'NO HAY', 'FALLECIMIENTO', '28.02.2018', '12:53:09pm'),
(41, '', 'Subsanacion', '', '123456789876541245', '', '', '', '28.02.2018', '12:55:34pm'),
(42, 'carlos10', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '01:02:04pm'),
(43, 'carlos10', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '01:04:33pm'),
(44, 'carlos10', 'Renuncia', '', 'ABCD123', '', 'NO HAY', 'INCAPACIDAD', '28.02.2018', '01:04:52pm'),
(45, 'carlos10', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '01:13:45pm'),
(46, 'carlos10', 'Inicio de Sesion', '', '', '', '', '', '28.02.2018', '01:14:04pm'),
(47, 'carlos10', 'Renuncia', '', 'abcd123', '', 'NO HAY', 'RENUNCIA', '28.02.2018', '01:14:25pm'),
(48, 'sedeno', 'Cerro Sesion', '', '', '', '', '', '28.02.2018', '01:15:22pm'),
(49, 'karina.fatine', 'Inicio de Sesion', '', '', '', '', '', '01.03.2018', '02:16:01pm'),
(50, 'karina.fatine', 'Subsanacion', '', '123456789123456434', '', '', '', '01.03.2018', '04:17:08pm'),
(51, '', 'Subsanacion', '', 'JOPR11111111111111', '', '', '', '02.03.2018', '11:39:18am'),
(52, 'jpablo89', 'Subsanacion', '', '543FDFDFDSFDSFDFDS', '', '', '', '02.03.2018', '11:39:53am'),
(53, 'jpablo89', 'Subsanacion', '', 'JOPR11111111111111', '', '', '', '02.03.2018', '11:41:28am'),
(54, 'jpablo89', 'Subsanacion', '', '543FDFDFDSFDSFDFDS', '', '', '', '02.03.2018', '11:42:30am'),
(55, 'jpablo89', 'Subsanacion', '', '111111111111111111', '', '', '', '02.03.2018', '11:43:05am'),
(56, 'jpablo89', 'Subsanacion', '', '111111111111111111', '', '', '', '02.03.2018', '11:43:49am'),
(57, 'jpablo89', 'Subsanacion', '', '111111111111111111', '', '', '', '02.03.2018', '11:44:21am'),
(58, 'jpablo89', 'Subsanacion', '', '543FDFDFDSFDSFDFDS', '', '', '', '02.03.2018', '11:44:55am'),
(59, 'jpablo89', 'Subsanacion', '', '543FDFDFDSFDSFDFDS', '', '', '', '02.03.2018', '11:45:09am'),
(60, 'jpablo89', 'Subsanacion', '', '543FDFDFDSFDSFDFDS', '', '', '', '02.03.2018', '11:45:22am'),
(61, 'omar89', 'Subsanacion', '', 'JRRMLS73082529H200', '', '', '', '02.03.2018', '11:45:44am'),
(62, 'jpablo89', 'Subsanacion', '', 'JOPR11111111111111', '', '', '', '02.03.2018', '11:47:16am'),
(63, 'jpablo89', 'Subsanacion', '', '111111111111111111', '', '', '', '02.03.2018', '11:47:27am'),
(64, 'omar89', 'Subsanacion', '', 'cimo781001df002', '', '', '', '02.03.2018', '11:48:29am'),
(65, 'jpablo89', 'Sustitucion', '', 'JOPR11111111111111', '', '999999999999999999', 'INCAPACIDAD', '02.03.2018', '11:58:05am'),
(66, 'jpablo89', 'Renuncia', '', '999999999999999999', '', 'NO HAY', 'INAHBILITACION', '02.03.2018', '12:04:58pm'),
(67, 'CARLOS10', 'Subsanacion', '', 'ABCD123', '', '', '', '02.03.2018', '01:32:50pm'),
(68, 'CARLOS10', 'Subsanacion', '', 'ABCD12345', '', '', '', '02.03.2018', '01:33:16pm'),
(69, 'omar89', 'Subsanacion', '', 'CDVLSX50080629H500', '', '', '', '02.03.2018', '04:20:37pm'),
(70, 'omar89', 'Subsanacion', '', 'CDVLSX50080629H500', '', '', '', '02.03.2018', '04:20:49pm'),
(71, 'omar89', 'Subsanacion', '', 'CDVLSX50080629H501', '', '', '', '02.03.2018', '04:27:07pm'),
(72, '', 'Registro', 'Nombre', '111111111111111119', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '04:42:18pm'),
(73, 'sedeno', 'Registro', 'Nombre', 'QQQQQQQQQQQQQQQQQQ', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '04:54:03pm'),
(74, 'sedeno', 'Subsanacion', '', '111111111111111119', '', '', '', '02.03.2018', '05:00:01pm'),
(75, 'alberto10', 'Registro', 'Nombre', 'AAAAAAAAAAAAAAAAA5', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:12:22pm'),
(76, 'alberto10', 'Registro', 'Nombre', 'UBUHUHIUHIOHLKKJKJ', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:27:04pm'),
(77, 'alberto10', 'Registro', 'Nombre', 'IPUIBJBDJBNVDKJNDK', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:35:19pm'),
(78, 'omar89', 'Registro', 'Nombre', 'FLHRAR70120221M400', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:38:12pm'),
(79, '', 'Registro', 'Nombre', 'WWWWWWWWWWWWWWWWWW', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:39:32pm'),
(80, 'omar89', 'Registro', 'Nombre', 'JRBLAL74101029H300', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:41:40pm'),
(81, '', 'Registro', 'Nombre', 'TTTTTTTTTTTTTTTTTT', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:42:10pm'),
(82, 'alberto10', 'Registro', 'Nombre', 'EIWFEFIUYWIOFYEUFY', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:44:19pm'),
(83, 'alberto10', 'Registro', 'Nombre', 'IIIIIIIIIIIIIIIIII', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '05:50:48pm'),
(84, 'sedeno', 'Registro', 'Nombre', 'KKKKKKKKKKKKKKKKKK', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:13:08pm'),
(85, 'omar89', 'Subsanacion', '', 'TTTTTTTTTTTTTTTTTO', '', '', '', '02.03.2018', '07:15:11pm'),
(86, '', 'Registro', 'Nombre', 'FGFGFGFGFGTYTYTYTY', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:18:14pm'),
(87, 'omar89', 'Subsanacion', '', 'TTTTTTTTTTTTTTTTTT', '', '', '', '02.03.2018', '07:18:45pm'),
(88, 'omar89', 'Subsanacion', '', 'TTTTTTTTTTTTTTTTTT', '', '', '', '02.03.2018', '07:19:48pm'),
(89, 'jpablo89', 'Registro', 'Nombre', 'OOKSAOOKSOKKAOSKOK', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:24:42pm'),
(90, 'omar89', 'Subsanacion', '', 'DDDDDDDDDDDDDDDDDD', '', '', '', '02.03.2018', '07:26:36pm'),
(91, 'sedeno', 'Registro', 'Nombre', '999999999999999999', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:30:10pm'),
(92, 'omar89', 'Subsanacion', '', 'DDDDDDDDDDDDDDDDDD', '', '', '', '02.03.2018', '07:31:31pm'),
(93, 'jpablo89', 'Subsanacion', '', '999999999999999999', '', '', '', '02.03.2018', '07:33:32pm'),
(94, 'omar89', 'Registro', 'Nombre', 'PRGNAL87072229H900', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:43:44pm'),
(95, 'omar89', 'Registro', 'Nombre', 'GNJRDN63021529M500', 'Nombre-Nuevo', ' ', ' ', '02.03.2018', '07:46:33pm'),
(96, 'alberto10', 'Registro', 'Nombre', 'GVVVVVVVVVVVVVVVVV', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '10:42:38am'),
(97, 'alberto10', 'Registro', 'Nombre', 'DFFFFFFFFFFFFFFFFF', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '10:57:54am'),
(98, 'alberto10', 'Registro', 'Nombre', 'GTTTTTTTTTTTTTTTTT', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '11:04:29am'),
(99, 'jpablo89', 'Registro', 'Nombre', 'XXWWAAQQQQQQQQQQQQ', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '12:47:59pm'),
(100, 'omar89', 'Registro', 'Nombre', 'CRPLCL61040629M600', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '12:48:09pm'),
(101, 'omar89', 'Registro', 'Nombre', '354643213546543543', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '12:52:34pm'),
(102, 'alberto10', 'Registro', 'Nombre', 'YGFFFFFFFFFFFFFFFF', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '12:53:01pm'),
(103, 'jpablo89', 'Registro', 'Nombre', '437563453453453453', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '12:57:32pm'),
(104, 'omar89', 'Registro', 'Nombre', 'ABCDEF152678H900', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:07:18pm'),
(105, 'sedeno', 'Registro', 'Nombre', 'MMMMMMMMMMMMMMMMMM', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:32:37pm'),
(106, 'alberto10', 'Registro', 'Nombre', 'ASJDJAHSDJHASJDHJA', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:32:39pm'),
(107, 'alberto10', 'Subsanacion', 'Nombre', 'ABCDEF152678H900', 'Nombre Nuevo', '', '', '03.03.2018', '01:33:28pm'),
(108, 'alberto10', 'Subsanacion', 'Nombre', 'JOPR11111111111111', 'Nombre Nuevo', '', '', '03.03.2018', '01:37:25pm'),
(109, '', 'Registro', 'Nombre', 'KKKKKKKKKKKKKKKKK9', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:37:51pm'),
(110, '', 'Registro', 'Nombre', 'SSSSSSSSSSSSSSSSSS', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:39:55pm'),
(111, '', 'Subsanacion', 'Nombre', 'kkkkkkkkkkkkkkkkkk', 'Nombre Nuevo', '', '', '03.03.2018', '01:41:29pm'),
(112, '', 'Registro', 'Nombre', 'MAYRAAAAAAAAAAAAAA', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:44:57pm'),
(113, '', 'Registro', 'Nombre', 'POPA58498594859485', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:45:52pm'),
(114, '', 'Registro', 'Nombre', '969865463584757575', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:47:47pm'),
(115, '', 'Registro', 'Nombre', 'JRMLFR94031629H700', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:48:03pm'),
(116, '', 'Registro', 'Nombre', 'MARYGUSMANNNNNNNNN', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:49:26pm'),
(117, '', 'Registro', 'Nombre', 'AGPPNM91041329M000', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '01:52:04pm'),
(118, '', 'Subsanacion', 'Nombre', 'mayraaaaaaaaaaaaaa', 'Nombre Nuevo', '', '', '03.03.2018', '01:53:32pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(50) CHARACTER SET latin1 NOT NULL,
  `usuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fecha` date NOT NULL,
  `has` varchar(250) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=80 ;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id`, `tipo_doc`, `usuario`, `fecha`, `has`) VALUES
(0001, 'copp', 'alberto10', '2018-03-02', '9c6b999a5d3c2cc05938741f373ed4a5'),
(0002, 'copp', 'jpablo89', '2018-03-02', '7e79c97732d7fa421e64d0b21f3636d0'),
(0003, 'coind', 'alberto10', '2018-03-02', 'bdb20b2b7681a633ee51c7f6be644688'),
(0004, 'cv', 'omar89', '2018-03-02', '9e6f80dd523f1b31744973ec0234b59a'),
(0005, 'copp', 'alberto10', '2018-03-02', 'ef2dfa98f05d6ad3a724c6142013af0c'),
(0006, 'copp', 'alberto10', '2018-03-02', 'b05dbffe39744ec6fa839578b168a754'),
(0007, 'copp', 'omar89', '2018-03-02', 'cdfe85bf8dd181a404221cf71a834f41'),
(0008, 'copp', 'jpablo89', '2018-03-02', '1bdb6f95074e0afb421f26881b09c929'),
(0009, 'coind', 'jpablo89', '2018-03-02', '09274b45dd0400fe158cb03ffdfbb1aa'),
(0010, 'copp', 'jpablo89', '2018-03-02', '09274b45dd0400fe158cb03ffdfbb1aa'),
(0011, 'cv', '', '2018-03-02', 'ae92421685c869f19e3018a503a2e17c'),
(0012, 'cv', 'sedeno', '2018-03-02', '55657e14aba92962d22e1c477bef583c'),
(0013, 'copp', 'alberto10', '2018-03-02', 'd17b76f3c496753ab81d792e1ef13224'),
(0014, 'rscargopp', 'alberto10', '2018-03-02', 'd17b76f3c496753ab81d792e1ef13224'),
(0015, 'copp', '', '2018-03-02', '7c79ef0c7409f911586a8373990ae1b6'),
(0016, 'copp', 'alberto10', '2018-03-02', '65c60db7fa5faf3d6243c9f1d8dc7152'),
(0017, 'rscargopp', 'alberto10', '2018-03-02', '65c60db7fa5faf3d6243c9f1d8dc7152'),
(0018, 'copp', 'alberto10', '2018-03-02', 'fb48a0690dbeb2dc79a7e84c06cea2ba'),
(0019, 'rscargopp', 'alberto10', '2018-03-02', '8d7070ef1ca8b44b55db1eda16a115d5a10965eb'),
(0020, 'copp', 'omar89', '2018-03-02', 'cf47e3ee312aa6b2148408da087a9bab'),
(0021, 'rscargopp', 'omar89', '2018-03-02', 'c9c3902c55e3c9cf6e0698e10673e8dff4041e69'),
(0022, 'copp', '', '2018-03-02', 'a6f3f41e6ff6a09dd1cab571b48a2c39'),
(0023, 'rscargopp', '', '2018-03-02', '5611d58a733c5d6c2f0bfb2d38bdbc917b9ae675'),
(0024, 'copp', 'omar89', '2018-03-02', '64c576703092c4cec67297c38166b6b5'),
(0025, 'copp', '', '2018-03-02', '9578aa6746f5740f2ae3c17a103c723b'),
(0026, 'copp', 'alberto10', '2018-03-02', 'f52ce1709230b4daaf4d2f5f77460faa'),
(0027, 'copp', 'alberto10', '2018-03-02', 'e8c48fc643085f9761b784f99babc2b7'),
(0028, 'cv', 'sedeno', '2018-03-02', 'a898797183700acd6ebe572a56eef4ba'),
(0029, 'cv', '', '2018-03-02', '77d18559ffc80983457edc0df52abfae'),
(0030, 'copp', 'jpablo89', '2018-03-02', 'ac5c5023869f4e804943af738b16bbda'),
(0031, 'rscargopp', 'jpablo89', '2018-03-02', '49d9afd5428afaefade8267c5621076b57d83cec'),
(0032, 'cv', 'sedeno', '2018-03-02', 'b5b1836a01a8852c64929bb5a163b97d'),
(0033, 'cv', 'omar89', '2018-03-02', '95ad47f86b31ddf4b097e197f38d8a83'),
(0034, 'copp', 'omar89', '2018-03-02', '61d75e0ceca3410290fdae7c5bb13690'),
(0035, 'copp', 'alberto10', '2018-03-03', '6ae710e82194f872acdf02625349e39e'),
(0036, 'coind', 'alberto10', '2018-03-03', '0b8f044eb5603e3de700e3f2bbc10a03'),
(0037, 'cv', 'alberto10', '2018-03-03', '0312d9445d844953afda4d00222f1678'),
(0038, 'cv', 'alberto10', '2018-03-03', 'ec9908320369f1bac4a23577c5328933'),
(0039, 'copp', 'alberto10', '2018-03-03', '345226219fc4383544b195f27af88d11'),
(0040, 'copp', 'alberto10', '2018-03-03', '82dd1921bdb747ea4408497078d3a585'),
(0041, 'cv', 'alberto10', '2018-03-03', '0dd21e29265e7eb147616c4b7d368dcd'),
(0042, 'coind', 'alberto10', '2018-03-03', '143930c5ce3ee36cd5bd7e45598ef92a'),
(0043, 'coind', 'alberto10', '2018-03-03', 'ba705eabf1f9593c1446774e22287a88'),
(0044, 'SRCARGO', 'alberto10', '2018-03-03', '3fad23b1f1c8b041a39a2afe3af21a7b90dc8b2c'),
(0045, 'rscargopp', 'alberto10', '2018-03-03', '7bc88428ec967026dc7cb825ad59773ee8caa638'),
(0046, 'cv', 'alberto10', '2018-03-03', '3a48ff24ffe7bd131262bb705fa2c625'),
(0047, 'cv', 'alberto10', '2018-03-03', '7b1f1f21dad654ae92da6fb5f15afe5a'),
(0048, 'cv', 'alberto10', '2018-03-03', '238bf740e43eba424fb5ab92fe4ca859'),
(0049, 'copp', 'alberto10', '2018-03-03', 'd5f520c292eacc9e1f4a7b31e1907595'),
(0050, 'cv', 'alberto10', '2018-03-03', 'b9c1a5cb7a1783bdd45aad1e0a5970d2'),
(0051, 'copp', 'alberto10', '2018-03-03', 'fc9738266b1c33676bb1ace77d142454'),
(0052, 'coind', 'alberto10', '2018-03-03', '60a0bb4802093767160506c66b71edaf'),
(0053, 'cv', 'alberto10', '2018-03-03', 'f6ec14741089361c6f89f98d6f55523d'),
(0054, 'cv', 'alberto10', '2018-03-03', 'b3286ca576c09d7560704101dc126bce'),
(0055, 'copp', 'alberto10', '2018-03-03', '82980548ecb71a3964cf1d64323c2ac1'),
(0056, 'coind', 'alberto10', '2018-03-03', '1cbe518a21ebed0e1ee9a5abbcbaabfc'),
(0057, 'SRCARGO', 'alberto10', '2018-03-03', 'd4a787a34122a59995912908054960f9fee9fd57'),
(0058, 'rscargopp', 'alberto10', '2018-03-03', '0db5f661601ea37c162b8274c1f7cdb9c9f0fe89'),
(0059, 'copp', 'alberto10', '2018-03-03', 'dccc03f666ca860e68b6f86bb6f46c88'),
(0060, 'copp', 'jpablo89', '2018-03-03', '935213ef5ccca468deb2e6352e107362'),
(0061, 'rscargopp', 'jpablo89', '2018-03-03', '8d2b2f4a3d88ef2d9154a14f610b4f587a0dd72e'),
(0062, 'copp', 'omar89', '2018-03-03', 'fb8db5dd8cf13cb0074724338fe9223c'),
(0063, 'rscargopp', 'omar89', '2018-03-03', 'b26b8036eb6430ce062afc0dc95ef131dda47346'),
(0064, 'copp', 'omar89', '2018-03-03', '328f6ccf4e638600b075783c5dea5240'),
(0065, 'copp', 'alberto10', '2018-03-03', 'eea64255b10c81cd9c3198e4e159ce99'),
(0066, 'copp', 'jpablo89', '2018-03-03', 'af67ebf8f8c98fe606b06534b09c9830'),
(0067, 'rscargopp', 'jpablo89', '2018-03-03', '4ddc6a514465a37221962de2b8667850e6b34ab2'),
(0068, 'cv', 'omar89', '2018-03-03', '7379bcac16be45a291cc88ce1bf124b4'),
(0069, 'copp', 'sedeno', '2018-03-03', 'ed400fc3d697d337de1cc15f1c5d84aa'),
(0070, 'copp', 'alberto10', '2018-03-03', '87398b253499f8a1787edd105c7c5944'),
(0071, 'cv', '', '2018-03-03', '763519a4af30d3d00e26329be7728a7a'),
(0072, 'cv', '', '2018-03-03', '9449c4734d138964384f76c67815bdef'),
(0073, 'copp', '', '2018-03-03', '2dabfbac822dd37a894a834d0e461bb4'),
(0074, 'copp', '', '2018-03-03', '9d813dd26c62555c08314d4dc487f18a'),
(0075, 'rscargopp', '', '2018-03-03', '5f29e863199704abc5c6fba8a0ab9dd380668be4'),
(0076, 'copp', '', '2018-03-03', '6051b741e6aed2a1917c4aaa0b9b50c7'),
(0077, 'copp', '', '2018-03-03', '03680c3ecf81eee9ecdd5a5050a87193'),
(0078, 'copp', '', '2018-03-03', '0540833d89241fd0ff3db22b72d47638'),
(0079, 'copp', '', '2018-03-03', '9222971d922f93cce16aefdc9e2cd8b0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=63 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_capturista`, `app_capturista`, `apm_capturista`, `usuario`, `password`, `rol`, `user_estado`) VALUES
(28, 'Karina ', 'Fatine ', 'Andrade', 'karina.fatine', 'karina89', 'Administrador', 'Activo'),
(32, 'Lucia', 'Hernandez', 'Fernandez', 'lucia.hernandez', 'lucia56', 'Supervisor', 'Inactivo'),
(35, 'Elena', 'Mendoza', 'Piedra', 'elena.mendoza', 'elena89', 'Capturista', 'Inactivo'),
(37, 'Amelia', 'Sanchez', 'Hernandez', 'amelia.sanchez', 'amelia75', 'Subsanacion', 'Inactivo'),
(53, 'Luis', 'Hernandez', 'Martinez', 'luis10', 'luis10', 'Supervisor', 'Inactivo'),
(54, 'Carlos', 'Hernandez', 'Sanzon', 'carlos10', 'carlos10', 'Administrador', 'Activo'),
(55, 'Alberto', 'Hernandez', 'Hernandez', 'alberto10', 'alberto10', 'Administrador', 'Activo'),
(60, 'karen', 'sedeño', 'ipatzi', 'sedeno', 'sedeno89', 'Administrador', 'Activo'),
(61, 'juan pablo', 'ramirez', 'corcetl', 'jpablo89', 'jpablo89', 'Administrador', 'Activo'),
(62, 'omar', 'cisneros', 'martinez', 'omar89', 'omar89', 'Administrador', 'Activo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
