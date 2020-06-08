-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2020 a las 02:33:08
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_practica_blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` int(100) NOT NULL,
  `fecha` date NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `contenido` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `autor` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id`, `fecha`, `titulo`, `contenido`, `autor`) VALUES
(15, '2020-05-10', 'Modelo computacional que puso al mundo en cuarentena', '¿Por qué lo usamos?\r\nEs un hecho establecido desde hace mucho tiempo que un lector se distraerá con el contenido legible de una página al mirar su diseño. El punto de usar Lorem Ipsum es que tiene una distribución de letras más o menos normal, en lugar de usar \'Contenido aquí, contenido aquí\', lo que hace que parezca un inglés legible. Muchos paquetes de edición de escritorio y editores de páginas web ahora usan Lorem Ipsum como su texto de modelo predeterminado, y una búsqueda de \'lorem ipsum\' ', 'administrador'),
(16, '2020-05-08', 'Como adelgazar mejorando tu sistema digestivo', 'Â¿Donde puedo conseguir algunos?\r\nHay muchas variaciones de pasajes de Lorem Ipsum disponibles, pero la mayorÃ­a ha sufrido alteraciÃ³n de alguna forma, por humor inyectado o palabras aleatorias que ni siquiera parecen un poco creÃ­bles. Si va a utilizar un pasaje de Lorem Ipsum, debe asegurarse de que no haya nada vergonzoso oculto en medio del texto. Todos los generadores Lorem Ipsum en Internet tienden a repetir fragmentos predefinidos segÃºn sea necesario, lo que lo convierte en el primer ge', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `usuario`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'usuario', 'acceso'),
(3, 'oscar', '6789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
