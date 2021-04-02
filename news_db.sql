-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-04-2021 a las 04:12:53
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `news_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forum`
--

CREATE TABLE `forum` (
  `forum_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_news`
--

CREATE TABLE `live_news` (
  `id` int(11) NOT NULL,
  `live_news_link` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `news_source` varchar(255) NOT NULL,
  `news_detail` longtext NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_top_story` tinyint(1) NOT NULL,
  `is_video` tinyint(1) NOT NULL,
  `is_video_of_the_day` tinyint(1) NOT NULL,
  `video_link` varchar(255) NOT NULL,
  `topic_id` int(11) NOT NULL DEFAULT 0,
  `sub_topic_id` int(11) NOT NULL DEFAULT 0,
  `news_photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `title`, `sub_title`, `news_source`, `news_detail`, `is_featured`, `is_top_story`, `is_video`, `is_video_of_the_day`, `video_link`, `topic_id`, `sub_topic_id`, `news_photo`) VALUES
(12, 'News 1', 'Subtitle News 1', 'News Source 1', 'sadaffddsfd dfsafad   ', 0, 0, 0, 1, 'http://vimeo.com/video=12345', 4, 7, '/a1.jpg'),
(13, 'Mi noticia 2', 'Subtitle News 1', 'News Source 1', 'Detalle', 1, 1, 1, 1, 'http://vimeo.com/video=12345', 4, 7, '/IOTSecurity.png'),
(14, '1', '21', '2', 'zdsffds', 0, 0, 0, 1, 'http://vimeo.com/video=12345', 4, 7, '/2021-03-04_14-43.png'),
(15, 'López Obrador se aplicará vacuna contra el COVID-19', 'CIUDAD DE MÉXICO (AP)', 'El periodico de Mexico', ' El presidente mexicano Andrés Manuel López Obrador informó el miércoles que será vacunado contra el COVID-19 la próxima semana por recomendación de sus médicos y pese a que ya superó la enfermedad.\r\n\r\nEl mandatario, de 67 años y que se infectó en enero, explicó que le hicieron un análisis de sangre recientemente y tenía anticuerpos pero, aún así, el consejo de los médicos fue vacunarse.', 1, 1, 0, 0, 'http://vimeo.com/video=12345', 4, 7, '/vacuna.png'),
(16, 'México impone restricciones de viaje en su frontera sur ', 'CIUDAD DE MÉXICO (AP)', 'El periodico de Mexico', 'México anunció el jueves que limitará los cruces no esenciales por su frontera sur con el fin de evitar la propagación del nuevo coronavirus y que iniciará “medidas de control sanitario” que no detalló.\r\n\r\nEl anuncio, hecho por la Secretaría de Relaciones Exteriores a través de su cuenta oficial en Twitter, llega después de un año de pandemia, cuando los contagios de COVID-19 parecen empezar a bajar y con un gobierno que se ha mostrado reacio a restringir los ingresos al país por el coronavirus aunque otros, como Guatemala, sí lo hicieron.', 1, 1, 1, 1, 'http://vimeo.com/video=12345', 7, 7, '/frontera_sur.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_topic`
--

CREATE TABLE `sub_topic` (
  `id` int(11) NOT NULL,
  `sub_topic_name` varchar(255) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sub_topic`
--

INSERT INTO `sub_topic` (`id`, `sub_topic_name`, `topic_id`) VALUES
(1, 'Home', 4),
(2, 'Activities', 4),
(4, 'Socials', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `topic`
--

INSERT INTO `topic` (`id`, `topic_name`) VALUES
(4, 'Family'),
(7, 'My topic');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indices de la tabla `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`forum_id`);

--
-- Indices de la tabla `live_news`
--
ALTER TABLE `live_news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indices de la tabla `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indices de la tabla `sub_topic`
--
ALTER TABLE `sub_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forum`
--
ALTER TABLE `forum`
  MODIFY `forum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_news`
--
ALTER TABLE `live_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sub_topic`
--
ALTER TABLE `sub_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
