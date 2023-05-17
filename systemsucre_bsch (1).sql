-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql-systemsucre.alwaysdata.net
-- Generation Time: May 17, 2023 at 02:04 AM
-- Server version: 10.6.11-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `systemsucre_bsch`
--

-- --------------------------------------------------------

--
-- Table structure for table `asignacion`
--

CREATE TABLE `asignacion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `fecharendicion` datetime DEFAULT NULL,
  `fechaaprobacion` datetime DEFAULT NULL,
  `comprobante` text DEFAULT NULL,
  `diferencia` float NOT NULL DEFAULT 0,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `idproyecto` int(11) DEFAULT NULL,
  `idpersonal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asignacion`
--

INSERT INTO `asignacion` (`id`, `descripcion`, `fecha`, `monto`, `tipo`, `estado`, `fecharendicion`, `fechaaprobacion`, `comprobante`, `diferencia`, `eliminado`, `creado`, `modificado`, `usuario`, `idproyecto`, `idpersonal`) VALUES
(35, 'COMPRA DE MANGUERAS', '2023-05-06', 1000, 1, 3, '2023-05-06 15:21:59', '2023-05-06 15:22:10', '12221222', 0, 0, '2023-05-06 08:58:19', '2023-05-06 09:08:28', 1, 1, 2),
(36, 'COMPRA DE HERRAMIENTAS', '2023-05-06', 2000, 1, 1, NULL, NULL, '12221222', 0, 0, '2023-05-06 09:17:25', '2023-05-06 09:17:26', 1, 1, 2),
(37, 'MONTOS PARA LA COMPRA DE EQUIPAMIENTO DEL CAMPAMENTO', '2023-05-10', 30000, 1, 1, '2023-05-10 13:25:03', '2023-05-10 13:25:18', '0000', 0, 0, '2023-05-10 13:03:08', NULL, 1, 13, 3),
(38, 'GASTOS HASTA 20 DE MAYO', '2023-05-10', 1000, 1, 1, NULL, NULL, '73462670', 0, 0, '2023-05-10 18:04:06', '2023-05-10 19:24:00', 1, 9, 4),
(39, 'GASTOS HASTA 8 DE JULIO', '2023-05-10', 50000, 1, 1, NULL, NULL, '73424223', 0, 0, '2023-05-10 18:08:30', '2023-05-10 19:24:53', 1, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `clasificacion`
--

CREATE TABLE `clasificacion` (
  `id` int(11) NOT NULL,
  `clasificacion` varchar(200) DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `creado` datetime NOT NULL,
  `modificado` datetime NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `clasificacion`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(27, 'GASTOS GENERALES', 0, '2023-04-24 11:14:40', '0000-00-00 00:00:00', 1),
(28, 'CEMENTO', 0, '2023-04-24 11:14:50', '0000-00-00 00:00:00', 1),
(29, 'FIERRO', 0, '2023-04-24 11:14:57', '0000-00-00 00:00:00', 1),
(30, 'MANO DE OBRA NO CONTRATISTA', 0, '2023-04-24 11:15:05', '2023-04-24 11:15:19', 1),
(31, 'MADERA', 0, '2023-04-24 11:15:28', '0000-00-00 00:00:00', 1),
(32, 'MANGUERAS', 0, '2023-05-03 08:18:17', '2023-05-10 12:58:44', 1),
(33, 'XXXXS', 1, '2023-05-10 12:58:19', '2023-05-10 12:58:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `correo` text NOT NULL,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `sello` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `telefono`, `direccion`, `correo`, `creado`, `modificado`, `usuario`, `sello`) VALUES
(3, 'EMPRESA CONSTRUCTORA BS CH', '787843344', 'CALLE RENE MORENO N123 Z/CENTRAL', 'bschuquisaca@gmail.com', '2023-04-25 12:56:33', '2023-05-10 18:46:07', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(1, 'EN EJECUCION'),
(2, 'PARALIZADO'),
(3, 'ENTREGA PROVISIONAL'),
(4, 'ENTREGA DEFINITIVA');

-- --------------------------------------------------------

--
-- Table structure for table `gasto`
--

CREATE TABLE `gasto` (
  `id` int(11) NOT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `idclasificacion` int(11) DEFAULT NULL,
  `idasignacion` int(11) DEFAULT NULL,
  `idpersonal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `egreso` float DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `comprobante` varchar(200) DEFAULT NULL,
  `factura` tinyint(1) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gasto`
--

INSERT INTO `gasto` (`id`, `idtipo`, `idclasificacion`, `idasignacion`, `idpersonal`, `fecha`, `descripcion`, `egreso`, `tipo`, `comprobante`, `factura`, `idproveedor`, `img`, `creado`, `modificado`) VALUES
(31, 17, 32, 35, 2, '2023-05-06', 'COMPRA DE MANGUERAS', 300, 1, '11116', 1, 20, '31.png', '2023-05-06 10:27:18', '2023-05-06 11:26:36'),
(32, 17, 27, 35, 2, '2023-05-06', 'COMPRA DE ALMUERZO', 100, 1, '1111', 1, NULL, NULL, '2023-05-06 10:37:57', NULL),
(33, 17, 27, 35, 2, '2023-05-06', '20 LADRILLOS', 45, 1, '0000', 0, 20, NULL, '2023-05-06 11:29:34', '2023-05-06 12:30:24'),
(34, 17, 27, 35, 2, '2023-05-06', '2 BOLSAS DE CEMENTO', 130, 1, '43434434434', 1, NULL, NULL, '2023-05-06 11:30:12', '2023-05-06 12:30:15'),
(35, 17, 28, 35, 2, '2023-05-06', '3 BOLSAS DE CEMENTO', 160, 1, '0000', 1, NULL, NULL, '2023-05-06 11:33:25', '2023-05-06 12:30:05'),
(36, 17, 27, 35, 2, '2023-05-06', 'DOS PALAS Y DOS PICOS', 200, 1, '0000', 1, NULL, NULL, '2023-05-06 11:33:58', '2023-05-06 12:29:44'),
(37, 17, 27, 35, 2, '2023-05-06', 'CABLE 10 MTRS', 50, 1, '0000', 0, NULL, NULL, '2023-05-06 11:35:22', NULL),
(38, 17, 27, 35, 2, '2023-05-06', '1 COCA COLA', 10, 1, '0000', 0, NULL, NULL, '2023-05-06 12:49:08', NULL),
(41, 17, 27, 37, 3, '2023-05-10', 'CARPA DE 30X10', 500, 1, '0000', 0, NULL, NULL, '2023-05-10 13:32:18', NULL),
(42, 17, 27, 37, 3, '2023-05-10', 'DOS CARRETILLAS ', 700, 1, '0000', 0, NULL, NULL, '2023-05-10 13:35:53', NULL),
(43, 17, 27, 37, 3, '2023-05-10', '3 PICOS PUNTA PLANA', 800, 1, '0000', 0, NULL, NULL, '2023-05-10 13:38:57', NULL),
(44, 17, 27, 37, 3, '2023-05-10', '1 GARRAFA', 250, 1, '0000', 0, NULL, NULL, '2023-05-10 13:53:43', NULL),
(45, 17, 27, 37, 3, '2023-05-10', '100 PUNTALES DE 5 METROS', 5000, 1, '0000', 0, NULL, NULL, '2023-05-10 13:58:20', NULL),
(46, 17, 27, 37, 3, '2023-05-10', 'TASAS DE BAÑO', 1000, 1, '0000', 0, NULL, NULL, '2023-05-10 14:06:49', NULL),
(47, 17, 27, 37, 3, '2023-05-10', 'ANTICIPO TRABAJADORES', 10000, 1, '0000', 0, NULL, NULL, '2023-05-10 14:09:12', NULL),
(48, 17, 27, 36, 2, '2023-05-10', 'COMPRA DE COBUSTIBLE DIESEL 250 LITROS', 750, 1, '0000', 0, NULL, NULL, '2023-05-10 14:16:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pass` varchar(700) DEFAULT NULL,
  `ci` varchar(15) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido1` varchar(200) DEFAULT NULL,
  `apellido2` varchar(200) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `sueldo` float DEFAULT NULL,
  `creado` datetime NOT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `validar` tinyint(1) DEFAULT 0,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `idrol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`id`, `username`, `pass`, `ci`, `nombre`, `apellido1`, `apellido2`, `celular`, `sueldo`, `creado`, `modificado`, `usuario`, `validar`, `eliminado`, `idrol`) VALUES
(1, 'juan', '81dc9bdb52d04dc20036dbd8313ed055', '13523432', 'JUAN ', 'SANTOS', 'BELLIDO', '756543453', 3000, '2023-04-09 11:20:56', '2023-05-10 01:00:41', 1, 1, 0, 1),
(2, 'ronal', '81dc9bdb52d04dc20036dbd8313ed055', '4234433', 'JAIMITO', 'QUIROGA ', 'PEREZ ', '2333332', 3000, '2023-01-02 11:29:53', '2023-05-10 14:54:03', 0, 1, 0, 3),
(3, 'carol', '81dc9bdb52d04dc20036dbd8313ed055', '37987987', 'CAROL  ', 'GIII ', 'GONZALES ', '78743990', 7000, '2023-04-18 15:34:07', '2023-05-10 12:08:19', 1, 1, 0, 3),
(4, 'osman', '81dc9bdb52d04dc20036dbd8313ed055', '13616192', 'OSMAN', 'CASTRO', 'QUIROGA', '78676676', 3000, '2023-05-10 15:08:15', '2023-05-10 16:37:51', 1, 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `planilla`
--

CREATE TABLE `planilla` (
  `id` int(11) NOT NULL,
  `idproyecto` int(11) DEFAULT NULL,
  `fechapresentacion` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(400) DEFAULT NULL,
  `nit` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(400) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `nit`, `telefono`, `direccion`, `ciudad`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(2, 'FORTE  MODIFCADO', '34432423412', '32412213', 'SANTA CRUZ BOLIVA', 'BOLIVIA', 1, '2023-04-12 18:02:05', '2023-04-12 18:43:06', 1),
(3, 'FANCESA', '34432423412DEW', '455434', 'KILOMETRO 8 SALIDA A COCHABAMBA', 'BOLIVIA', 0, '2023-04-12 18:50:46', NULL, 1),
(4, 'WDWQDWQ', 'ONOINOI', '87987398', 'MNJ ', 'BOLIVIA', 1, '2023-04-18 14:02:24', NULL, 1),
(5, 'YHBAFASF', 'JOIJOIJ', '9897987', '798HJHOI', 'ARG', 1, '2023-04-18 14:02:49', NULL, 1),
(6, 'ASFSAFASF', 'JOIJOIJ32', '87987987', 'CDCASCS', 'PAR', 1, '2023-04-18 14:03:10', NULL, 1),
(7, 'CCASCJIKN', 'JOIJOIJ32DE', '4234234', 'RFDD FDS', 'BRZ', 1, '2023-04-18 14:04:03', NULL, 1),
(8, 'DQWCOCNJB', 'NLCBDAKBK', '124214', '2FDS F', 'COL', 1, '2023-04-18 14:04:29', NULL, 1),
(9, 'CNJBHASKJHCB', 'VDSBKVBSD', '8767676', 'HUJBKHSDBH', 'CHILE', 1, '2023-04-18 14:05:00', NULL, 1),
(10, 'SNFÑKFNJ', 'BJBJ', '7676766', 'VJDSBVKJBJH', 'PERU', 1, '2023-04-18 14:05:26', NULL, 1),
(11, 'IBJHBYUH', '798789878', '798798798', 'NCDLJNVKDBSK', 'VEN', 0, '2023-04-18 14:06:05', NULL, 1),
(12, 'YEWIYVHV', '76769768976', '78676987', 'CJBSDKBJHB', 'BOL', 0, '2023-04-18 14:06:58', NULL, 1),
(13, 'CACASCAS', '32432432', '23423434', 'DASDASDAS', 'DASD', 0, '2023-04-18 14:14:10', NULL, 1),
(14, 'LAS LOMAS', '32RFEFWEF', '790878912', 'AVENIDA MARCELO QUIROGA SANTA CRUZ', 'BOLIVIA', 0, '2023-04-22 13:49:23', NULL, 1),
(15, 'SUCRE MET', '9897324', '7908789', 'ZONA LAJASTAMBO SUCRE BOLIVA', 'BOLIVIA', 0, '2023-04-22 13:52:48', NULL, 1),
(16, 'CONCRETEC SA', '9897324WE', '79087844', 'ZONA LAJASTAMBO SUCRE BOLIVA', 'BOLIVIA', 0, '2023-04-22 13:54:20', NULL, 1),
(17, 'CHARCAS', '98973268732', '67568455', 'ZONA LAJASTAMBO SUCRE BOLIVA', 'BOLIVIA', 0, '2023-04-22 13:58:00', NULL, 1),
(18, 'LADRILLOS SA', '98973268332', '67568454', 'ZONA LAJASTAMBO SUCRE BOLIVA', 'BOLIVIA', 0, '2023-04-22 14:01:32', NULL, 1),
(19, 'LAS CAMPERO', '665654554', '7666766', 'SAV. MARCELO QUIROGA ', 'SUCRE', 0, '2023-05-03 08:20:56', NULL, 2),
(20, 'FERROSUR ', '687628733', '79898798', 'AV. JAIME MENDOZA N343', 'SUCRE', 0, '2023-05-05 15:57:02', '2023-05-05 15:58:17', 1),
(21, 'SOBOCE', '12321323', '56565', 'SIN ESPECIFICAR', 'SIN ESPECIFICAR', 0, '2023-05-10 11:53:40', '2023-05-10 11:54:24', 1),
(22, 'ITACAMBA', '232443434324', '78767666', 'SIN ESPECIFICAR', 'SIN ESPECIFICAR', 0, '2023-05-10 11:58:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `proyecto`
--

CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `codigo` varchar(5) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `nombrecompleto` varchar(400) DEFAULT NULL,
  `montocontrato` float DEFAULT NULL,
  `montomodificado` float DEFAULT NULL,
  `montopagado` float DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `plazoinicio` int(11) DEFAULT NULL,
  `ampliacion` int(11) DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `creado` datetime DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proyecto`
--

INSERT INTO `proyecto` (`id`, `numero`, `codigo`, `nombre`, `nombrecompleto`, `montocontrato`, `montomodificado`, `montopagado`, `fechainicio`, `plazoinicio`, `ampliacion`, `estado`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(1, 4444, '012', 'QHORA QHORA', 'CONSTRUCCION UNIDAD EDUCATIVA QHORA QHORA ALTA (SUCRE)', 3123310, -3839, 0, '2014-11-11', 270, 270, '1', 0, '2023-03-24 00:00:00', NULL, 1),
(9, 45, 'HJH33', 'PUENTE IMILLA HIAÑUSQA', 'PUENTE IMILLA HUAÑUSQA DISTRITO VII', 1000000, 7672770, 10000, '2023-04-06', 100, 100, '1', 0, '2023-04-15 16:28:57', NULL, 1),
(10, 6666, 'BG87', 'PROYEBHBJ', '687687', 67767, 6768770, 76876, '2023-04-13', 100, 100, '1', 1, '2023-04-15 16:30:05', '2023-04-24 09:43:00', 1),
(11, 8998, 'KJ333', 'PUENTE MONTEAGUDO', 'PUENTE PARA MAQUINARIA PESADA DE MONTEAGUDO', 2000000, 2000, 0, '2023-05-19', 300, 300, '1', 0, '2023-05-10 12:24:53', NULL, 1),
(12, 90898, 'NK888', 'ESCUELA SAN CRISTOBAL', 'COLEGIO SAN CRISTOBAL EN HUACARETA', 1000000, 2000, 0, '2023-05-20', 100, 100, '1', 0, '2023-05-10 12:28:26', NULL, 1),
(13, 7873, '8HCID', 'PUENTE GRANDE', 'PUENTE MUNICIPIO SAN LUCAS', 5000000, 500000, 0, '2023-05-28', 250, 250, '1', 0, '2023-05-10 12:39:34', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(200) DEFAULT NULL,
  `numero` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `rol`, `numero`) VALUES
(1, 'admin', '1'),
(3, 'usuario', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sesion`
--

CREATE TABLE `sesion` (
  `id` int(11) NOT NULL,
  `idpersonal` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sesion`
--

INSERT INTO `sesion` (`id`, `idpersonal`, `fecha`, `token`) VALUES
(95, 1, '2023-04-24 19:55:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiUVVJU1BFIiwibmFtZSI6IkpVQU4iLCJmZWNoYSI6IjIwMjMtMDQtMjQgMTk6NTU6MzYiLCJpYXQiOjE2ODIzODA1MzYsImV4cCI6MTY4MzU5MDEzNn0.v8NrMkbfYjxl04LybgERlTmuCA7px4rwCzz7bk7idyM'),
(97, 1, '2023-04-25 20:12:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiUVVJU1BFIiwibmFtZSI6IkpVQU4iLCJmZWNoYSI6IjIwMjMtMDQtMjUgMjA6MTI6MDciLCJpYXQiOjE2ODIzODE1MjcsImV4cCI6MTY4MzU5MTEyN30.VbKPmoW2EQn12Zs6XeD2BBQ5pJhkoTGKCgBRj9CvYaE'),
(125, 1, '2023-04-26 11:09:39', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOIiwiZmVjaGEiOiIyMDIzLTA0LTI2IDExOjA5OjM5IiwiaWF0IjoxNjgyNTIxNzc5LCJleHAiOjE2ODM3MzEzNzl9.I8v90n1zMuwxuzKHCTaI6VQXqjaj9ylX3PQpDZKNc-c'),
(164, 1, '2023-05-08 09:09:51', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0wOCAwOTowOTo1MSIsImlhdCI6MTY4MzU1MTM5MSwiZXhwIjoxNjg0NzYwOTkxfQ.TK86_7tQkLI64PMTMwOx0tk-LrQTp2Jj5A-VTizXeX4'),
(178, 1, '2023-05-10 21:21:52', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAyMToyMTo1MiIsImlhdCI6MTY4Mzc0NjUxMiwiZXhwIjoxNjg0OTU2MTEyfQ.TwaLcjlk7Iz3T4_hC62xoxu9fntdRZGZcqgKaxLQTAw'),
(179, 1, '2023-05-10 21:29:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAyMToyOToyNiIsImlhdCI6MTY4Mzc0Njk2NiwiZXhwIjoxNjg0OTU2NTY2fQ.OcYokI21DAcLQGaAMMsmHGsb2Yw2oQgvGHcOEWhHfXM'),
(180, 1, '2023-05-10 21:35:30', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAyMTozNTozMCIsImlhdCI6MTY4Mzc0NzMzMCwiZXhwIjoxNjg0OTU2OTMwfQ.Y6xNWEK_16qy9kulGIIAr2vgd2AkT7lsjCEV4SLhzH8'),
(182, 2, '2023-05-10 22:02:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoicm9uYWwiLCJhcDEiOiJRVUlST0dBICIsImFwMiI6IlBFUkVaICIsIm5hbWUiOiJKQUlNSVRPIiwiZmVjaGEiOiIyMDIzLTA1LTEwIDIyOjAyOjE3IiwiaWF0IjoxNjgzNzQ4OTM3LCJleHAiOjE2ODQ5NTg1Mzd9.HEEmTPExI7pmR8K3vsktAibN1Ks3M77pXdtTQ0hwQZI'),
(183, 1, '2023-05-10 22:14:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAyMjoxNDoyMyIsImlhdCI6MTY4Mzc0OTY2MywiZXhwIjoxNjg0OTU5MjYzfQ.T9zOC7P6AjRw_hqXFxFZPXgdw5rAcNzK0qFilfUmtrI'),
(184, 1, '2023-05-10 00:17:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAwMDoxNzo1NCIsImlhdCI6MTY4Mzc1NzA3NCwiZXhwIjoxNjg0OTY2Njc0fQ.--V8nyb6pP7P-iTuZeM5RXcJDY0dBiKXjcOA-ScKtIA'),
(185, 2, '2023-05-10 00:30:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoicm9uYWwiLCJhcDEiOiJRVUlST0dBICIsImFwMiI6IlBFUkVaICIsIm5hbWUiOiJKQUlNSVRPIiwiZmVjaGEiOiIyMDIzLTA1LTEwIDAwOjMwOjI1IiwiaWF0IjoxNjgzNzU3ODI1LCJleHAiOjE2ODQ5Njc0MjV9.2j_z4HDTW7qDn4cCsOA65UVlAXLgNlvEwgtREYVK5QM'),
(190, 3, '2023-05-10 00:52:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoiY2Fyb2wiLCJhcDEiOiJHSUlJICIsImFwMiI6IkdPTlpBTEVTICIsIm5hbWUiOiJDQVJPTCAgIiwiZmVjaGEiOiIyMDIzLTA1LTEwIDAwOjUyOjMxIiwiaWF0IjoxNjgzNzU5MTUxLCJleHAiOjE2ODQ5Njg3NTF9.fBFmLXH4lBr9yu91RJs2jGlUf7Iff36iB-pLeDX8nAY'),
(191, 1, '2023-05-10 00:59:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOICIsImZlY2hhIjoiMjAyMy0wNS0xMCAwMDo1OToyNSIsImlhdCI6MTY4Mzc1OTU2NSwiZXhwIjoxNjg0OTY5MTY1fQ.3X1y1qyEvwpGYe5_TCVskWDt8u72FJ9wdqsISLV5MbE'),
(194, 3, '2023-05-11 04:45:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoiY2Fyb2wiLCJhcDEiOiJHSUlJICIsImFwMiI6IkdPTlpBTEVTICIsIm5hbWUiOiJDQVJPTCAgIiwiZmVjaGEiOiIyMDIzLTA1LTExIDA0OjQ1OjI3IiwiaWF0IjoxNjgzNzczMTI3LCJleHAiOjE2ODQ5ODI3Mjd9.HcmICwSNMX-G-VFGRSUVGaAHWbGhBdyaJM2vtMz5_fU'),
(195, 2, '2023-05-11 04:45:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoicm9uYWwiLCJhcDEiOiJRVUlST0dBICIsImFwMiI6IlBFUkVaICIsIm5hbWUiOiJKQUlNSVRPIiwiZmVjaGEiOiIyMDIzLTA1LTExIDA0OjQ1OjQ3IiwiaWF0IjoxNjgzNzczMTQ3LCJleHAiOjE2ODQ5ODI3NDd9.Gf6uuFSueHjb3G5huKirHSFD2GLYbwlukKVioDCxO4U'),
(196, 1, '2023-05-12 05:35:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IlNBTlRPUyIsImFwMiI6IkJFTExJRE8iLCJuYW1lIjoiSlVBTiAiLCJmZWNoYSI6IjIwMjMtMDUtMTIgMDU6MzU6MjciLCJpYXQiOjE2ODM4NjI1MjcsImV4cCI6MTY4NTA3MjEyN30.FifNR82ON9c2_tzKrEQAyHOSUaJTdGKmitgU4Z6zpQ0'),
(197, 2, '2023-05-12 05:37:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoicm9uYWwiLCJhcDEiOiJRVUlST0dBICIsImFwMiI6IlBFUkVaICIsIm5hbWUiOiJKQUlNSVRPIiwiZmVjaGEiOiIyMDIzLTA1LTEyIDA1OjM3OjAyIiwiaWF0IjoxNjgzODYyNjIyLCJleHAiOjE2ODUwNzIyMjJ9.TAORmLI_rPQd190NKaQerm7i1bRbvUtDjktWaTXzloA'),
(198, 1, '2023-05-12 05:39:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IlNBTlRPUyIsImFwMiI6IkJFTExJRE8iLCJuYW1lIjoiSlVBTiAiLCJmZWNoYSI6IjIwMjMtMDUtMTIgMDU6Mzk6MDgiLCJpYXQiOjE2ODM4NjI3NDgsImV4cCI6MTY4NTA3MjM0OH0.HJjvqDPZx0sLDmdkh3GjzhRMpFkDGhWt3Pt69n-DJ7U'),
(199, 1, '2023-05-15 15:10:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IlNBTlRPUyIsImFwMiI6IkJFTExJRE8iLCJuYW1lIjoiSlVBTiAiLCJmZWNoYSI6IjIwMjMtMDUtMTUgMTU6MTA6MzUiLCJpYXQiOjE2ODQxNTYyMzUsImV4cCI6MTY4NTM2NTgzNX0.nN5ZYs0q81I0B_nk04Fgf74gzwLYsX9dEsoruu9XtzY');

-- --------------------------------------------------------

--
-- Table structure for table `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo` varchar(200) DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT 0,
  `creado` datetime NOT NULL,
  `modificado` datetime NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo`
--

INSERT INTO `tipo` (`id`, `descripcion`, `tipo`, `codigo`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(17, 'GASTOS GENERALES DE LA EMPRESA', 'INGRESOS EGRESOS EMPRESA (GASTOS GENERALES)', 'T-17', 0, '2023-04-24 11:18:53', '2023-04-24 11:23:41', 1),
(18, 'EQUIPAMIENTO MENORES Y HERRAMIENTAS', 'COMPRA DE ACTIVOS MENORES', 'T-18', 0, '2023-04-24 11:20:00', '2023-04-24 11:21:03', 1),
(19, 'VEHICULOS Y MAQUINARIA', 'COMPRA DE ACTIVOS MAYORES', 'T-19', 0, '2023-04-24 11:20:53', '0000-00-00 00:00:00', 1),
(20, 'IMPUETOS', 'INGRESOS EGRESOS EMPRESA (IMPUESTOS)', 'T-20', 0, '2023-04-24 11:24:11', '0000-00-00 00:00:00', 1),
(21, 'COMISIONES E INTERESES BANCARIOS', 'INGRESOS EGRESOS DE LA EMPRESA(COMISIONES E INTERESES BANCARIOS', 'T-21', 0, '2023-04-24 11:24:59', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyecto_1` (`idproyecto`),
  ADD KEY `fk_proyecto_2` (`idpersonal`);

--
-- Indexes for table `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipo` (`idtipo`),
  ADD KEY `idclasificacion` (`idclasificacion`),
  ADD KEY `idasignacion` (`idasignacion`),
  ADD KEY `idpersonal` (`idpersonal`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personal_1` (`idrol`);

--
-- Indexes for table `planilla`
--
ALTER TABLE `planilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproyecto` (`idproyecto`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpersonal` (`idpersonal`);

--
-- Indexes for table `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `planilla`
--
ALTER TABLE `planilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `fk_proyecto_1` FOREIGN KEY (`idproyecto`) REFERENCES `proyecto` (`id`),
  ADD CONSTRAINT `fk_proyecto_2` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`);

--
-- Constraints for table `gasto`
--
ALTER TABLE `gasto`
  ADD CONSTRAINT `gasto_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`id`),
  ADD CONSTRAINT `gasto_ibfk_2` FOREIGN KEY (`idclasificacion`) REFERENCES `clasificacion` (`id`),
  ADD CONSTRAINT `gasto_ibfk_3` FOREIGN KEY (`idasignacion`) REFERENCES `asignacion` (`id`),
  ADD CONSTRAINT `gasto_ibfk_4` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `gasto_ibfk_5` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`id`);

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`id`);

--
-- Constraints for table `planilla`
--
ALTER TABLE `planilla`
  ADD CONSTRAINT `planilla_ibfk_1` FOREIGN KEY (`idproyecto`) REFERENCES `proyecto` (`id`);

--
-- Constraints for table `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
