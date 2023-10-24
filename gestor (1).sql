-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-10-2023 a las 04:28:15
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_caso`
--

DROP TABLE IF EXISTS `tb_caso`;
CREATE TABLE IF NOT EXISTS `tb_caso` (
  `CASO_ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO_CASO` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PROPIETARIO_ID` int DEFAULT NULL,
  `ORGANIZACION` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FECHA_INICIO_CASO` date DEFAULT NULL,
  `FECHA_CIERRE_CASO` date DEFAULT NULL,
  `ESTADO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`CASO_ID`),
  KEY `FK_PROPIETARIOCASO` (`PROPIETARIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_departamento`
--

DROP TABLE IF EXISTS `tb_departamento`;
CREATE TABLE IF NOT EXISTS `tb_departamento` (
  `DEPARTAMENTO_ID` int NOT NULL AUTO_INCREMENT,
  `CODIGO_DEPARTAMENTO` int DEFAULT NULL,
  `DEPARTAMENTO_NOMBRE` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `PAIS_ID` int DEFAULT NULL,
  PRIMARY KEY (`DEPARTAMENTO_ID`),
  KEY `TB_DEPARTAMENTO` (`PAIS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_departamento`
--

INSERT INTO `tb_departamento` (`DEPARTAMENTO_ID`, `CODIGO_DEPARTAMENTO`, `DEPARTAMENTO_NOMBRE`, `PAIS_ID`) VALUES
(18, 3100, 'Chihuahua', 16),
(19, 12000, 'San Marcos', 5),
(21, 22001, 'Jutiapa', 5),
(23, 17000, 'Petén', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_direcciones`
--

DROP TABLE IF EXISTS `tb_direcciones`;
CREATE TABLE IF NOT EXISTS `tb_direcciones` (
  `DIRECCION_ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO_CASO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_OFICIO` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `CALLE` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AVENIDA` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NUMERO_CASA` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LUGARPOBLADO_ID` int DEFAULT NULL,
  `ZONA` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MUNICIPIO_ID` int DEFAULT NULL,
  `DEPARTAMENTO_ID` int DEFAULT NULL,
  `PAIS_ID` int DEFAULT NULL,
  `LATITUD` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LONGITUD` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OBSERVACIONES` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RUTA_IMAGEN` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MEDIDOR_ID` int DEFAULT NULL,
  `USUARIO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `FECHA_HORA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`DIRECCION_ID`),
  KEY `FK_LUGPOBLADO` (`LUGARPOBLADO_ID`),
  KEY `FK_MUNICIPIOS` (`MUNICIPIO_ID`),
  KEY `FK_DEPARTAMENTOS` (`DEPARTAMENTO_ID`),
  KEY `FK_PAIS` (`PAIS_ID`),
  KEY `FK_MEDIDOR` (`MEDIDOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lugarespoblados`
--

DROP TABLE IF EXISTS `tb_lugarespoblados`;
CREATE TABLE IF NOT EXISTS `tb_lugarespoblados` (
  `LUGARPOBLADO_ID` int NOT NULL AUTO_INCREMENT,
  `LUGARPOBLADO_NOMBRE` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `TIPO_LUGARPOBLADO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `RURALIDADES_LUGARPOBLADO` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MUNICIPIO_ID` int NOT NULL,
  `LUGARPOBLADO_ZONAYCALLE` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`LUGARPOBLADO_ID`),
  KEY `TB_LUGARESPOBLADOS` (`MUNICIPIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_medidorelectronico`
--

DROP TABLE IF EXISTS `tb_medidorelectronico`;
CREATE TABLE IF NOT EXISTS `tb_medidorelectronico` (
  `MEDIDOR_ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO_CASO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `MEDIDOR_NUMERO` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `EMPRESAELECTRICA` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`MEDIDOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_municipio`
--

DROP TABLE IF EXISTS `tb_municipio`;
CREATE TABLE IF NOT EXISTS `tb_municipio` (
  `MUNICIPIO_ID` int NOT NULL AUTO_INCREMENT,
  `CODIGOMUNICIPIO` int NOT NULL,
  `MUNICIPIO_NOMBRE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `DEPARTAMENTO_ID` int DEFAULT NULL,
  PRIMARY KEY (`MUNICIPIO_ID`),
  KEY `TB_MUNICIPIO` (`DEPARTAMENTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_municipio`
--

INSERT INTO `tb_municipio` (`MUNICIPIO_ID`, `CODIGOMUNICIPIO`, `MUNICIPIO_NOMBRE`, `DEPARTAMENTO_ID`) VALUES
(4, 12018, 'Ocos', 19),
(5, 12015, 'Malacatán', 19),
(6, 22007, 'Atescatempa', 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
CREATE TABLE IF NOT EXISTS `tb_pais` (
  `PAIS_ID` int NOT NULL AUTO_INCREMENT,
  `CODIGO_PAIS` int NOT NULL,
  `NOMBRE_PAIS` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `FECHA_CREACION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PAIS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_pais`
--

INSERT INTO `tb_pais` (`PAIS_ID`, `CODIGO_PAIS`, `NOMBRE_PAIS`, `FECHA_CREACION`) VALUES
(5, 502, 'Guatemala', '2023-07-31 04:56:11'),
(6, 503, 'El Salvador', '2023-07-31 04:56:45'),
(8, 505, 'Nicaragua', '2023-07-31 04:57:06'),
(9, 506, 'Costa Rica', '2023-07-31 04:57:15'),
(10, 507, 'Panamá', '2023-07-31 04:57:23'),
(16, 52, 'México', '2023-09-29 22:08:58'),
(18, 57, 'Colombia', '2023-10-24 03:37:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_propietario`
--

DROP TABLE IF EXISTS `tb_propietario`;
CREATE TABLE IF NOT EXISTS `tb_propietario` (
  `PROPIETARIO_ID` int NOT NULL AUTO_INCREMENT,
  `NUMERO_CASO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_OFICIO` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMBRE1` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMBRE2` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NOMBRE3` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APELLIDO1` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `APELLIDO2` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `APELLIDO3` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `LUGAR_NACIMIENTO` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `TIPO_DOCUMENTO` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NUMERO_DOCUMENTO` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `GENERO` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `NACIONALIDAD` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `DIRECCION` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMBRE_PADRE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NOMBRE_MADRE` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_CELULAR` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ALIAS` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RUTA_FOTO` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FECHA_HORA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PROPIETARIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_vehiculo`
--

DROP TABLE IF EXISTS `tb_vehiculo`;
CREATE TABLE IF NOT EXISTS `tb_vehiculo` (
  `ID_VEHICULO` int NOT NULL AUTO_INCREMENT,
  `PROPIETARIO_ID` int NOT NULL,
  `NUMERO_CASO` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_OFICIO` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `PLACA` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `TIPO_VEHICULO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `MARCA_VEHICULO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `LINEA_VEHICULO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `MODELO_VEHICULO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `COLOR_VEHICULO` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_CHASIS` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `NUMERO_MOTOR` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `FOTO_VEHICULO` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_VEHICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_vehiculo`
--

INSERT INTO `tb_vehiculo` (`ID_VEHICULO`, `PROPIETARIO_ID`, `NUMERO_CASO`, `NUMERO_OFICIO`, `PLACA`, `TIPO_VEHICULO`, `MARCA_VEHICULO`, `LINEA_VEHICULO`, `MODELO_VEHICULO`, `COLOR_VEHICULO`, `NUMERO_CHASIS`, `NUMERO_MOTOR`, `FOTO_VEHICULO`) VALUES
(16, 75, '4544', '453', 'ADFASD', 'ADFA', 'ASDFA', 'ASDFA', 'ASDFA', 'ADSFA', 'ASDFA', 'ADFA', '../fotosVehiculos/carrito envio.jpg'),
(18, 75, '4544', '2222', 's', 's', 's', 's', 's', 's', '', '', '../fotosVehiculos/IPHONE.png'),
(19, 75, '4544', '1', 'a', 'd', 'd', 'd', 'd', 'd', '', '', '../fotosVehiculos/defaultvehiculo.png'),
(20, 75, '4544', '7777', 'EEE', 'EEE', 'EEE', 'EEE', 'EEE', 'EEE', '', '', '../fotosVehiculos/QUIENES SOMOS.png'),
(21, 75, '4544', '55', '5', '5', '5', '5', '5', '5', '', '', '../fotosVehiculos/contactanos.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_archivos`
--

DROP TABLE IF EXISTS `t_archivos`;
CREATE TABLE IF NOT EXISTS `t_archivos` (
  `id_archivo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruta` text COLLATE utf8mb4_general_ci,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NUMERO_CASO` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NUMERO_OFICIO` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ASUNTO` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `FECHA_OFICIO` date DEFAULT NULL,
  PRIMARY KEY (`id_archivo`),
  KEY `fkUsuariosArchivos_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_archivos`
--

INSERT INTO `t_archivos` (`id_archivo`, `id_usuario`, `nombre`, `tipo`, `ruta`, `fecha`, `NUMERO_CASO`, `NUMERO_OFICIO`, `ASUNTO`, `FECHA_OFICIO`) VALUES
(53, 21, '01-2023 CARATULA.pdf', 'pdf', '../../archivos/21/01-2023 CARATULA.pdf', '2023-10-20 16:41:21', '01-2023', '01-2023', 'CARATULA', '2023-06-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios`
--

DROP TABLE IF EXISTS `t_usuarios`;
CREATE TABLE IF NOT EXISTS `t_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `email` varchar(245) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usuario` varchar(245) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` text COLLATE utf8mb4_general_ci,
  `ROL` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuarios`
--

INSERT INTO `t_usuarios` (`id_usuario`, `nombre`, `fechaNacimiento`, `email`, `usuario`, `password`, `ROL`, `insert`) VALUES
(21, 'Mooris Florian', '1985-02-09', 'moorisrflorian@gmail.com', 'mooris.florian', 'bbcd10b43f56cae4b2f4e6179f3201323eb66a65', 'ADMINISTRADOR', '2023-09-29 16:06:36'),
(28, 'Mooris Florian', '1985-02-09', '26468p@pnc.edu.gt', 'mooris.pnc', 'cc259ac57edb10fc39c91cc1359aa3733832d82d', 'USUARIOESTANDAR', '2023-10-23 21:33:49');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_departamento`
--
ALTER TABLE `tb_departamento`
  ADD CONSTRAINT `TB_DEPARTAMENTO` FOREIGN KEY (`PAIS_ID`) REFERENCES `tb_pais` (`PAIS_ID`);

--
-- Filtros para la tabla `tb_direcciones`
--
ALTER TABLE `tb_direcciones`
  ADD CONSTRAINT `FK_LUGPOBLADO` FOREIGN KEY (`LUGARPOBLADO_ID`) REFERENCES `tb_lugarespoblados` (`LUGARPOBLADO_ID`),
  ADD CONSTRAINT `FK_PAIS` FOREIGN KEY (`PAIS_ID`) REFERENCES `tb_pais` (`PAIS_ID`);

--
-- Filtros para la tabla `tb_lugarespoblados`
--
ALTER TABLE `tb_lugarespoblados`
  ADD CONSTRAINT `TB_LUGARESPOBLADOS` FOREIGN KEY (`MUNICIPIO_ID`) REFERENCES `tb_municipio` (`MUNICIPIO_ID`);

--
-- Filtros para la tabla `tb_municipio`
--
ALTER TABLE `tb_municipio`
  ADD CONSTRAINT `TB_MUNICIPIO` FOREIGN KEY (`DEPARTAMENTO_ID`) REFERENCES `tb_departamento` (`DEPARTAMENTO_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
