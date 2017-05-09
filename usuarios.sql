-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-05-2017 a las 09:05:00
-- Versión del servidor: 5.7.18-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `avatar` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.png' COMMENT 'avatar de usuario',
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de usuarios con el se hace login',
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Contraseña del usuario',
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre real del usuario',
  `apellido1` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Primer apellido del usuario',
  `apellido2` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Segundo apellido del usuario',
  `administrador` tinyint(1) NOT NULL COMMENT '1 si el usuario es administrador y 0 en caso contrario',
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se dió de alta el usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`avatar`, `usuario`, `pass`, `nombre`, `apellido1`, `apellido2`, `administrador`, `fecha_alta`) VALUES
('2.png', 'adri', '123', 'Adrián', 'Gómez', 'Sepúlveda', 0, '2017-05-03 08:01:01'),
('0.png', 'cris', '123', 'Cristina', 'González', 'Serrano', 1, '2017-05-02 07:14:55'),
('1.png', 'hi', 'as', 'hola', 'asdfasdfas', 'asdfssssssss', 0, '2017-05-09 06:55:58'),
('0.png', 'isma', '123', 'Ismael', 'Maldonado', 'González', 1, '2017-05-04 10:42:32'),
('0.png', 'jc', '123', 'Juan Carlos', 'Molina', 'Ruíz', 1, '2017-05-04 10:44:50'),
('4.png', 'mei', '123', 'maria', 'asdf', 'asdf', 1, '2017-05-07 13:13:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
