-- phpMyAdmin SQL Dump
-- version 5.2.1-dev+20220514.2e4c69d7b4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2022 a las 23:24:08
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bustop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buses`
--

CREATE TABLE `buses` (
  `id_bus` varchar(15) NOT NULL,
  `ruta_bus` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `buses`
--

INSERT INTO `buses` (`id_bus`, `ruta_bus`) VALUES
('BS0001', '16C'),
('BS0002', '101D'),
('BS0003', '101B'),
('BS0004', '42B');

--
-- Disparadores `buses`
--
DELIMITER $$
CREATE TRIGGER `IDBUSES` BEFORE INSERT ON `buses` FOR EACH ROW BEGIN
	DECLARE siguiente_cod int;
    SET siguiente_cod = (SELECT ifnull(MAX(CONVERT(substring(id_bus,3), signed integer)),0) FROM buses) + 1;
    
    SET new.id_bus = concat('BS',LPAD(siguiente_cod,4,'0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugares`
--

CREATE TABLE `lugares` (
  `id_place` varchar(15) NOT NULL,
  `place` varchar(50) NOT NULL,
  `bus` varchar(15) NOT NULL,
  `contribuyente` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `lugares`
--
DELIMITER $$
CREATE TRIGGER `IDPLACES` BEFORE INSERT ON `lugares` FOR EACH ROW BEGIN
	DECLARE siguiente_cod int;
    SET siguiente_cod = (SELECT ifnull(MAX(CONVERT(substring(id_place,3), signed integer)),0) FROM lugares) + 1;
    
    SET new.id_place = concat('PLC',LPAD(siguiente_cod,7,'0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recorrido`
--

CREATE TABLE `recorrido` (
  `id_route` varchar(25) NOT NULL,
  `complete_route` text NOT NULL,
  `half_route_ida` text NOT NULL,
  `half_route_vuelta` text NOT NULL,
  `bus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recorrido`
--

INSERT INTO `recorrido` (`id_route`, `complete_route`, `half_route_ida`, `half_route_vuelta`, `bus`) VALUES
('RT000001', 'https://www.google.com/maps/d/embed?mid=1GhbQjgjGeLmt1O7zPy1SLz-fF2qIvHw&ehbc=2E312F', 'https://www.google.com/maps/d/embed?mid=1-zgCbux2w-QdiS4g1-6TneTMFWiCrqc&ehbc=2E312F', 'https://www.google.com/maps/d/embed?mid=1-zgCbux2w-QdiS4g1-6TneTMFWiCrqc&ehbc=2E312F', 'BS0001');

--
-- Disparadores `recorrido`
--
DELIMITER $$
CREATE TRIGGER `IDRECORRIDO` BEFORE INSERT ON `recorrido` FOR EACH ROW BEGIN
	DECLARE siguiente_cod int;
    SET siguiente_cod = (SELECT ifnull(MAX(CONVERT(substring(id_route,3), signed integer)),0) FROM recorrido) + 1;
    
    SET new.id_route = concat('RT',LPAD(siguiente_cod,6,'0'));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` varchar(15) NOT NULL,
  `nickname` char(25) NOT NULL,
  `email` char(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `IDUSER` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN
	DECLARE siguiente_cod int;
    SET siguiente_cod = (SELECT ifnull(MAX(CONVERT(substring(id_user,3), signed integer)),0) FROM usuarios) + 1;
    
    SET new.id_user = concat('US',LPAD(siguiente_cod,5,'0'));
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id_bus`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD PRIMARY KEY (`id_place`),
  ADD KEY `relacionBusLugar` (`bus`),
  ADD KEY `contribuyente` (`contribuyente`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `recorrido`
--
ALTER TABLE `recorrido`
  ADD PRIMARY KEY (`id_route`),
  ADD KEY `relacionBus` (`bus`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lugares`
--
ALTER TABLE `lugares`
  ADD CONSTRAINT `lugares_ibfk_1` FOREIGN KEY (`contribuyente`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lugares_ibfk_2` FOREIGN KEY (`bus`) REFERENCES `buses` (`id_bus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recorrido`
--
ALTER TABLE `recorrido`
  ADD CONSTRAINT `recorrido_ibfk_1` FOREIGN KEY (`bus`) REFERENCES `buses` (`id_bus`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
