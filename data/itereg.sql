-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2018 a las 05:14:21
-- Versión del servidor: 5.7.14
-- Versión de PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `itereg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
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

CREATE TABLE `candidatura_diputado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_paterno` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_materno` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `genero` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `partido_politico` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `candidatura` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `clave_elector` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `curp` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `distrito` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fec_nacimiento` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo_residencia` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `sobrenombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `user_capturista` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `propietario_suplente` varchar(50) CHARACTER SET utf8 COLLATE utf8_slovenian_ci NOT NULL,
  `prelacion` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `candidatura_diputado`
--

INSERT INTO `candidatura_diputado` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `genero`, `partido_politico`, `candidatura`, `clave_elector`, `curp`, `distrito`, `fec_nacimiento`, `tiempo_residencia`, `sobrenombre`, `estado`, `user_capturista`, `propietario_suplente`, `prelacion`) VALUES
(52, 'Josue', 'Fernández', 'Fernández', 'MASCULINO', 'Candidatura Común PRI - PVEM - PS', 'MAYORIA RELATIVA', 'ABCD123', 'ASDA7558AS', '09-CHIAUTEMPAN', '2018-02-11', '15', '', 'Renuncia', 'karina.fatine', 'Suplente', 'NO'),
(53, 'C????', 'Coo??oo??o', 'é?????', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'HHHHHHHHHHHHHHHHHH', 'HHHHHHHHHHHHHHHHHH', '08-CONTLA', '1855-02-12', '15', '', 'Incompleto', '', 'Propietario', '00'),
(54, 'Carlos', 'Hernández', 'Snazón', 'MASCULINO', 'Coalicion Por Tlaxcala al Frente (PAN/PRD/Movimiento Ciudadano/PAC)', 'MAYORIA RELATIVA', 'UUUUUUUUUUUUUUUUUU', 'UUUUUUUUUUUUUUUUUU', '10-HUAMANTLA', '1985-05-04', '12', '', 'Incompleto', 'karina.fatine', 'Propietario', '00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura_documentado`
--

CREATE TABLE `candidatura_documentado` (
  `id` int(100) NOT NULL,
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
  `cedula_rfc` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `candidatura_documentado`
--

INSERT INTO `candidatura_documentado` (`id`, `clave_elector`, `doc_snr_ine`, `act_de_nacimiento`, `copia_act_de_nacimiento`, `const_separacion_cargo`, `escrito_bajo`, `const_act_no_penales`, `solicitud_registro`, `cred_para_votar`, `const_acept_postulacion`, `const_residencia`, `manifiesto`, `capacidad_economica`, `cedula_rfc`) VALUES
(34, 'ABCD123', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(153, '999999999999999999', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(152, 'OOKSAOOKSOKKAOSKOK', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(151, 'FGFGFGFGFGTYTYTYTY', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(150, 'TTTTTTTTTTTTTTTTTO', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(149, 'KKKKKKKKKKKKKKKKKK', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(148, 'IIIIIIIIIIIIIIIIII', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(147, 'EIWFEFIUYWIOFYEUFY', 'NO', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true'),
(146, 'TTTTTTTTTTTTTTTTTT', 'NO', 'true', 'SI', 'SI', 'true', 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'true'),
(145, 'JRBLAL74101029H300', 'NO', 'true', 'SI', 'SI', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'true', 'false'),
(144, 'WWWWWWWWWWWWWWWWWW', 'true', 'true', 'NO APLICA', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(143, 'FLHRAR70120221M400', 'true', 'true', 'NO', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(142, 'IPUIBJBDJBNVDKJNDK', 'false', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(141, 'UBUHUHIUHIOHLKKJKJ', 'true', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(140, 'AAAAAAAAAAAAAAAAA5', 'false', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(139, 'eeeeeeeeeeeeeeeeee', 'true', 'true', 'SI', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(138, 'QQQQQQQQQQQQQQQQQQ', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(137, '111111111111111119', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(136, 'DDDDDDDDDDDDDDDDDD', 'true', 'true', 'SI', 'NO', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(135, 'ABCDEF544545454545', 'NO', 'true', 'NO', 'NO', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(134, 'DJFHSDJFHSUñEHEUOH', 'NO', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(133, 'CDVLSX50080629H500', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', 'true', 'true', 'true', 'false', 'true', 'true'),
(132, 'BNGRMR878002729M50', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(131, '444444444444444444', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(130, 'DSFYDUIDIFHSDJHFPI', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(129, 'AMFLJM69050429H000', 'true', 'true', 'NO', 'SI', 'true', 'false', 'false', '', 'true', 'false', 'true', 'true', 'false'),
(128, '999999999999999999', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true'),
(127, '121655695623529565', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(126, '124589751156532030', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'false', 'false', 'false', 'false', 'false'),
(125, 'JRRMLS73082529H200', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(124, '1234567891011', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(123, 'EDSHLJFSDHÑGUFIDGS', 'NO', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', 'false', 'false', 'false', 'true', 'true', 'false'),
(122, 'ASZDSADASDASDASD', 'NO', 'true', 'NO APLICA', 'NO APLICA', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'false', 'false'),
(121, 'SADIAJSIDJIJASIJID', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'true', 'true', 'false', 'false', 'false'),
(120, 'SHDJLSHULIHWEUDHUI', 'false', 'false', 'NO APLICA', 'NO', 'false', 'true', 'false', '', 'false', 'false', 'true', 'true', 'true'),
(119, '125621556987965635', 'true', 'true', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', '', 'false', 'true', 'false', 'false', 'false'),
(117, 'JOPR11111111111111', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(118, '543FDFDFDSFDSFDFDS', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', 'false', 'false', 'false', 'false', 'false', 'false'),
(116, 'ASDJAKJSDIJDISI', 'NO', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'true', 'false', 'false', 'false', 'true', 'false', 'false'),
(114, 'CIMO701001DF001', 'true', 'true', 'NO APLICA', 'NO APLICA', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(115, 'ASDKASDJKLJKSDJKDJ', 'true', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'true', 'false', 'false'),
(154, 'ZMSNES60091229M900', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false', 'false'),
(155, 'PRGNAL87072229H900', 'true', 'true', 'SI', 'SI', 'true', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true'),
(156, 'GNJRDN63021529M500', 'NO', 'true', 'NO', 'NO', 'false', 'true', 'true', 'true', 'false', 'true', 'true', 'false', 'false'),
(157, 'HHHHHHHHHHHHHHHHHH', 'false', 'false', 'NO APLICA', 'NO', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false'),
(158, 'UUUUUUUUUUUUUUUUUU', 'false', 'false', 'NO APLICA', 'NO APLICA', 'false', 'false', 'false', '', 'false', 'false', 'false', 'false', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatura_renuncia`
--

CREATE TABLE `candidatura_renuncia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `partido_politico` varchar(250) NOT NULL,
  `candidatura` varchar(250) NOT NULL,
  `clave_elector` varchar(150) NOT NULL,
  `curp` varchar(150) NOT NULL,
  `distrito` varchar(250) NOT NULL,
  `fec_nacimiento` varchar(150) NOT NULL,
  `tiempo_residencia` varchar(50) NOT NULL,
  `sobrenombre` varchar(150) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `user_capturista` varchar(150) NOT NULL,
  `propietario_suplente` varchar(50) NOT NULL,
  `prelacion` varchar(20) NOT NULL DEFAULT '00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `nombre_clv` varchar(150) NOT NULL,
  `clv_original` varchar(250) NOT NULL,
  `nombre_clv_nuevo` varchar(150) NOT NULL,
  `clv_nuevo` varchar(250) NOT NULL,
  `motivo` varchar(150) NOT NULL,
  `dia` varchar(150) NOT NULL,
  `hora` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(96, '', 'Registro', 'Nombre', 'HHHHHHHHHHHHHHHHHH', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '04:57:55am'),
(97, 'karina.fatine', 'Registro', 'Nombre', 'UUUUUUUUUUUUUUUUUU', 'Nombre-Nuevo', ' ', ' ', '03.03.2018', '05:05:57am');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `tipo_doc` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `has` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(0035, 'coind', 'karina.fatine', '2018-03-03', '8e2e3c6866e8cc8a852e365548668b9f'),
(0036, 'copp', 'karina.fatine', '2018-03-03', 'cd524255a8ff0dbb1104e5fb473bbe94'),
(0037, 'cv', 'karina.fatine', '2018-03-03', '89e46c2a27a9597698db48f56f7b2360'),
(0038, 'cv', 'karina.fatine', '2018-03-03', 'cd1e502bf2d4689626ef86618cc43c9a'),
(0039, 'rscargopp', '', '2018-03-03', '76c157bd714ae0c6cb46827585f272712fdc7759'),
(0040, 'copp', '', '2018-03-03', '3f575e56cbcf5429597eb88ac0d7c00f'),
(0041, 'copp', '', '2018-03-03', 'c8cd139638a71e8a74dbdba43ef0cd71'),
(0042, 'copp', '', '2018-03-03', 'df3501d03d1bf7e72cd9543f719ae051'),
(0043, 'copp', '', '2018-03-03', 'dda3fefe2d9d9be1f35501c10e96c59b'),
(0044, 'copp', 'karina.fatine', '2018-03-03', 'aad56b67043a4a119d39907ef0655809'),
(0045, 'coind', 'karina.fatine', '2018-03-03', '2f1ad7ee063bdb1c4e91776eec2918c2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_capturista` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `app_capturista` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `apm_capturista` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `rol` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `user_estado` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_capturista`, `app_capturista`, `apm_capturista`, `usuario`, `password`, `rol`, `user_estado`) VALUES
(35, 'Elena', 'Mendoza', 'Piedra', 'elena.mendoza', 'elena89', 'Capturista', 'Inactivo'),
(37, 'Amelia', 'Sanchez', 'Hernandez', 'amelia.sanchez', 'amelia75', 'Subsanacion', 'Inactivo'),
(32, 'Lucia', 'Hernandez', 'Fernandez', 'lucia.hernandez', 'lucia56', 'Supervisor', 'Inactivo'),
(28, 'Karina ', 'Fatine ', 'Andrade', 'karina.fatine', 'karina89', 'Administrador', 'Inactivo'),
(54, 'Carlos', 'Hernandez', 'Sanzon', 'carlos10', 'carlos10', 'Administrador', 'Activo'),
(55, 'Alberto', 'Hernandez', 'Hernandez', 'alberto10', 'alberto10', 'Administrador', 'Activo'),
(53, 'Luis', 'Hernandez', 'Martinez', 'luis10', 'luis10', 'Subsanacion', 'Inactivo'),
(62, 'omar', 'cisneros', 'martinez', 'omar89', 'omar89', 'Administrador', 'Activo'),
(60, 'karen', 'sedeño', 'ipatzi', 'sedeno', 'sedeno89', 'Administrador', 'Activo'),
(61, 'juan pablo', 'ramirez', 'corcetl', 'jpablo89', 'jpablo89', 'Administrador', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatura_diputado`
--
ALTER TABLE `candidatura_diputado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `candidatura_documentado`
--
ALTER TABLE `candidatura_documentado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `candidatura_renuncia`
--
ALTER TABLE `candidatura_renuncia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatura_diputado`
--
ALTER TABLE `candidatura_diputado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `candidatura_documentado`
--
ALTER TABLE `candidatura_documentado`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT de la tabla `candidatura_renuncia`
--
ALTER TABLE `candidatura_renuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
