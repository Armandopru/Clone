-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2023 a las 18:15:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bodega`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id_codigo` int(2) NOT NULL,
  `producto` varchar(35) DEFAULT NULL,
  `empresa` varchar(35) DEFAULT NULL,
  `precio` varchar(35) NOT NULL,
  `cantidad` varchar(10) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fk_id_usuario` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id_codigo`, `producto`, `empresa`, `precio`, `cantidad`, `fecha_vencimiento`, `fk_id_usuario`) VALUES
(1, 'Carne Res', 'Carnicería el arma', '100.000', '24', '2024-11-19', 1),
(3, 'Pollo', 'Gastronomi', '95.000', '50', '2024-08-04', 2),
(4, 'Salmon', 'Sushoi', '150.000', '30', '2024-02-28', 3),
(6, 'Pan', 'Carnes Finas', '20.000', '40', '2024-05-01', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(2) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `empresa` varchar(35) NOT NULL,
  `telefono` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `Nombre`, `empresa`, `telefono`) VALUES
(1, 'Armando ', 'Carnicería el arma', '3228508341'),
(2, 'Pedro', 'Gastronomi', '3219867421'),
(3, 'Raul', 'Sushoi', '3129687569'),
(4, 'Alfredo', 'Carnicería Mi Estancia', '3229863241'),
(5, 'Fabio', 'restaurante las acasias', '3136987456'),
(6, 'Lucia', 'Carnes Unicas del Llano', '322568412'),
(7, 'Livia', 'Carnes Finas', '3695874521');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id_codigo`),
  ADD UNIQUE KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id_codigo` (`telefono`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id_codigo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `bodega_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
