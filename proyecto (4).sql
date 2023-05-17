-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2023 a las 05:01:21
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion`
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
-- Volcado de datos para la tabla `asignacion`
--

INSERT INTO `asignacion` (`id`, `descripcion`, `fecha`, `monto`, `tipo`, `estado`, `fecharendicion`, `fechaaprobacion`, `comprobante`, `diferencia`, `eliminado`, `creado`, `modificado`, `usuario`, `idproyecto`, `idpersonal`) VALUES
(35, 'COMPRA DE MANGUERAS', '2023-05-06', 1000, 1, 3, '2023-05-06 15:21:59', '2023-05-06 15:22:10', '12221222', 0, 0, '2023-05-06 08:58:19', '2023-05-06 09:08:28', 1, 1, 2),
(36, 'COMPRA DE HERRAMIENTAS', '2023-05-06', 2000, 1, 1, NULL, NULL, '12221222', 0, 0, '2023-05-06 09:17:25', '2023-05-06 09:17:26', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
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
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `clasificacion`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(27, 'GASTOS GENERALES', 0, '2023-04-24 11:14:40', '0000-00-00 00:00:00', 1),
(28, 'CEMENTO', 0, '2023-04-24 11:14:50', '0000-00-00 00:00:00', 1),
(29, 'FIERRO', 0, '2023-04-24 11:14:57', '0000-00-00 00:00:00', 1),
(30, 'MANO DE OBRA NO CONTRATISTA', 0, '2023-04-24 11:15:05', '2023-04-24 11:15:19', 1),
(31, 'MADERA', 0, '2023-04-24 11:15:28', '0000-00-00 00:00:00', 1),
(32, 'MANGUERAS', 0, '2023-05-03 08:18:17', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
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
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `telefono`, `direccion`, `correo`, `creado`, `modificado`, `usuario`, `sello`) VALUES
(3, 'EMPRESA CONSTRUCTORA BS CHUQUISACA', '787843344', 'CALLE RENE MORENO N123 Z/CENTRAL', 'bschuquisaca@gmail.com', '2023-04-25 12:56:33', '2023-04-25 13:40:56', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `nombre`) VALUES
(1, 'EN EJECUCION'),
(2, 'PARALIZADO'),
(3, 'ENTREGA PROVISIONAL'),
(4, 'ENTREGA DEFINITIVA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
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
-- Volcado de datos para la tabla `gasto`
--

INSERT INTO `gasto` (`id`, `idtipo`, `idclasificacion`, `idasignacion`, `idpersonal`, `fecha`, `descripcion`, `egreso`, `tipo`, `comprobante`, `factura`, `idproveedor`, `img`, `creado`, `modificado`) VALUES
(31, 17, 32, 35, 2, '2023-05-06', 'COMPRA DE MANGUERAS', 300, 1, '11116', 1, 20, '31.png', '2023-05-06 10:27:18', '2023-05-06 11:26:36'),
(32, 17, 27, 35, 2, '2023-05-06', 'COMPRA DE ALMUERZO', 100, 1, '1111', 1, NULL, NULL, '2023-05-06 10:37:57', NULL),
(33, 17, 27, 35, 2, '2023-05-06', '20 LADRILLOS', 45, 1, '0000', 0, 20, NULL, '2023-05-06 11:29:34', '2023-05-06 12:30:24'),
(34, 17, 27, 35, 2, '2023-05-06', '2 BOLSAS DE CEMENTO', 130, 1, '43434434434', 1, NULL, NULL, '2023-05-06 11:30:12', '2023-05-06 12:30:15'),
(35, 17, 28, 35, 2, '2023-05-06', '3 BOLSAS DE CEMENTO', 160, 1, '0000', 1, NULL, NULL, '2023-05-06 11:33:25', '2023-05-06 12:30:05'),
(36, 17, 27, 35, 2, '2023-05-06', 'DOS PALAS Y DOS PICOS', 200, 1, '0000', 1, NULL, NULL, '2023-05-06 11:33:58', '2023-05-06 12:29:44'),
(37, 17, 27, 35, 2, '2023-05-06', 'CABLE 10 MTRS', 50, 1, '0000', 0, NULL, NULL, '2023-05-06 11:35:22', NULL),
(38, 17, 27, 35, 2, '2023-05-06', '1 COCA COLA', 10, 1, '0000', 0, NULL, NULL, '2023-05-06 12:49:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
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
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `username`, `pass`, `ci`, `nombre`, `apellido1`, `apellido2`, `celular`, `sueldo`, `creado`, `modificado`, `usuario`, `validar`, `eliminado`, `idrol`) VALUES
(1, 'juan', '81dc9bdb52d04dc20036dbd8313ed055', '13523432', 'JUAN ', 'CARMONA ', 'BELLIDO', '756543453', 3000, '2023-04-09 11:20:56', '2023-05-10 01:00:41', 1, 1, 0, 1),
(2, 'ronal', 'e10adc3949ba59abbe56e057f20f883e', '4234433', 'JAIMITO', 'QUIROGA ', 'PEREZ ', '2333332', 3000, '2023-01-02 11:29:53', '2023-05-07 00:26:52', 1, 1, 0, 3),
(3, 'carol', '81dc9bdb52d04dc20036dbd8313ed055', '37987987', 'CAROL  ', 'GIII ', 'GONZALES ', '78743990', 7000, '2023-04-18 15:34:07', '2023-05-07 23:31:30', 1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla`
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
-- Estructura de tabla para la tabla `proveedor`
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
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `nit`, `telefono`, `direccion`, `ciudad`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(2, 'FORTE  MODIFCADO', '34432423412', '32412213', 'SANTA CRUZ BOLIVA', 'BOLIVIA', 1, '2023-04-12 18:02:05', '2023-04-12 18:43:06', 1),
(3, 'FANCESA', '34432423412DEW', '455434', 'KILOMETRO 8 SALIDA A COCHABAMBA', 'BOLIVIA', 1, '2023-04-12 18:50:46', NULL, 1),
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
(20, 'FERROSUR ', '687628733', '79898798', 'AV. JAIME MENDOZA N343', 'SUCRE', 0, '2023-05-05 15:57:02', '2023-05-05 15:58:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
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
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `numero`, `codigo`, `nombre`, `nombrecompleto`, `montocontrato`, `montomodificado`, `montopagado`, `fechainicio`, `plazoinicio`, `ampliacion`, `estado`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(1, 4444, '012', 'QHORA QHORA', 'CONSTRUCCION UNIDAD EDUCATIVA QHORA QHORA ALTA (SUCRE)', 3123310, -3839, 0, '2014-11-11', 270, 270, '1', 0, '2023-03-24 00:00:00', NULL, 1),
(9, 45, 'HJH33', 'PROYECTO 1', 'PUENTE IMILLA HUAÑUSQA', 1000000, 7672770, 10000, '2023-04-06', 100, 100, '1', 0, '2023-04-15 16:28:57', NULL, 1),
(10, 6666, 'BG87', 'PROYEBHBJ', '687687', 67767, 6768770, 76876, '2023-04-13', 100, 100, '1', 1, '2023-04-15 16:30:05', '2023-04-24 09:43:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(200) DEFAULT NULL,
  `numero` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`, `numero`) VALUES
(1, 'admin', '1'),
(3, 'usuario', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id` int(11) NOT NULL,
  `idpersonal` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sesion`
--

INSERT INTO `sesion` (`id`, `idpersonal`, `fecha`, `token`) VALUES
(95, 1, '2023-04-24 19:55:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiUVVJU1BFIiwibmFtZSI6IkpVQU4iLCJmZWNoYSI6IjIwMjMtMDQtMjQgMTk6NTU6MzYiLCJpYXQiOjE2ODIzODA1MzYsImV4cCI6MTY4MzU5MDEzNn0.v8NrMkbfYjxl04LybgERlTmuCA7px4rwCzz7bk7idyM'),
(97, 1, '2023-04-25 20:12:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiUVVJU1BFIiwibmFtZSI6IkpVQU4iLCJmZWNoYSI6IjIwMjMtMDQtMjUgMjA6MTI6MDciLCJpYXQiOjE2ODIzODE1MjcsImV4cCI6MTY4MzU5MTEyN30.VbKPmoW2EQn12Zs6XeD2BBQ5pJhkoTGKCgBRj9CvYaE'),
(125, 1, '2023-04-26 11:09:39', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoianVhbiIsImFwMSI6IkNBUk1PTkEgIiwiYXAyIjoiQkVMTElETyIsIm5hbWUiOiJKVUFOIiwiZmVjaGEiOiIyMDIzLTA0LTI2IDExOjA5OjM5IiwiaWF0IjoxNjgyNTIxNzc5LCJleHAiOjE2ODM3MzEzNzl9.I8v90n1zMuwxuzKHCTaI6VQXqjaj9ylX3PQpDZKNc-c'),
(163, 2, '2023-05-07 11:10:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjoicm9uYWwiLCJhcDEiOiJRVUlST0dBICIsImFwMiI6IlBFUkVaICIsIm5hbWUiOiJKQUlNSVRPIiwiZmVjaGEiOiIyMDIzLTA1LTA3IDExOjEwOjQ3IiwiaWF0IjoxNjgzNDcyMjQ4LCJleHAiOjE2ODQ2ODE4NDh9.ok6NMDm5ZO9f27OhDi4iVCPuKJhmhpJPHafny527aGs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
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
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `descripcion`, `tipo`, `codigo`, `eliminado`, `creado`, `modificado`, `usuario`) VALUES
(17, 'GASTOS GENERALES DE LA EMPRESA', 'INGRESOS EGRESOS EMPRESA (GASTOS GENERALES)', 'T-17', 0, '2023-04-24 11:18:53', '2023-04-24 11:23:41', 1),
(18, 'EQUIPAMIENTO MENORES Y HERRAMIENTAS', 'COMPRA DE ACTIVOS MENORES', 'T-18', 0, '2023-04-24 11:20:00', '2023-04-24 11:21:03', 1),
(19, 'VEHICULOS Y MAQUINARIA', 'COMPRA DE ACTIVOS MAYORES', 'T-19', 0, '2023-04-24 11:20:53', '0000-00-00 00:00:00', 1),
(20, 'IMPUETOS', 'INGRESOS EGRESOS EMPRESA (IMPUESTOS)', 'T-20', 0, '2023-04-24 11:24:11', '0000-00-00 00:00:00', 1),
(21, 'COMISIONES E INTERESES BANCARIOS', 'INGRESOS EGRESOS DE LA EMPRESA(COMISIONES E INTERESES BANCARIOS', 'T-21', 0, '2023-04-24 11:24:59', '0000-00-00 00:00:00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proyecto_1` (`idproyecto`),
  ADD KEY `fk_proyecto_2` (`idpersonal`);

--
-- Indices de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipo` (`idtipo`),
  ADD KEY `idclasificacion` (`idclasificacion`),
  ADD KEY `idasignacion` (`idasignacion`),
  ADD KEY `idpersonal` (`idpersonal`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personal_1` (`idrol`);

--
-- Indices de la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproyecto` (`idproyecto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpersonal` (`idpersonal`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `clasificacion`
--
ALTER TABLE `clasificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `planilla`
--
ALTER TABLE `planilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `fk_proyecto_1` FOREIGN KEY (`idproyecto`) REFERENCES `proyecto` (`id`),
  ADD CONSTRAINT `fk_proyecto_2` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`);

--
-- Filtros para la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD CONSTRAINT `gasto_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`id`),
  ADD CONSTRAINT `gasto_ibfk_2` FOREIGN KEY (`idclasificacion`) REFERENCES `clasificacion` (`id`),
  ADD CONSTRAINT `gasto_ibfk_3` FOREIGN KEY (`idasignacion`) REFERENCES `asignacion` (`id`),
  ADD CONSTRAINT `gasto_ibfk_4` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`),
  ADD CONSTRAINT `gasto_ibfk_5` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD CONSTRAINT `planilla_ibfk_1` FOREIGN KEY (`idproyecto`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`idpersonal`) REFERENCES `personal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
