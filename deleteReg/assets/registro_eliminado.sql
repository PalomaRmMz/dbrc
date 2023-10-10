-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-03-2018 a las 17:39:50
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reg2018_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_eliminado`
--

DROP TABLE IF EXISTS `registro_eliminado`;
CREATE TABLE IF NOT EXISTS `registro_eliminado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave_elector` varchar(50) NOT NULL,
  `capturista` varchar(50) NOT NULL,
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro_eliminado`
--

INSERT INTO `registro_eliminado` (`id`, `clave_elector`, `capturista`, `fecha`, `hora`) VALUES
(2, 'AJDNJASNDJASDNAJSD', '', '18.03.2018', '11:35:19am'),
(3, 'ANSDQIWDKMQWJKDMIQ', '', '18.03.2018', '11:36:21am'),
(4, 'ANJDSNKASNKDMKASMD', '', '18.03.2018', '11:37:26am'),
(5, 'ASDMIQWEOQ12312MKA', 'karina.fatine', '18.03.2018', '11:38:22am');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
