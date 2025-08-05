
CREATE DATABASE IF NOT EXISTS `cpp_kavak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cpp_kavak`;

-- Estructura de tabla para la tabla `disponibilidad`
-- Productos disponibles

CREATE TABLE `disponibilidad` (
  `id` int(11) NOT NULL,
  `inmueble` text NOT NULL,
  `metros_cuadrados` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `disponibilidad`
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT de la tabla `disponibilidad`
ALTER TABLE `disponibilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Estructura de tabla para la tabla `financiamientos`
-- Donde se almacenan los nombres de los planes de Financiamiento y los meses que corresponde

CREATE TABLE `financiamientos` (
  `id` int(11) NOT NULL,
  `financiamiento` text NOT NULL,
  `meses` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `financiamientos`
ALTER TABLE `financiamientos`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT de la tabla `financiamientos`
ALTER TABLE `financiamientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Estructura de tabla para la tabla `planes_disponibilidad`
-- Actua como tabla intermedia

CREATE TABLE `planes_disponibilidad` (
  `id` int(11) NOT NULL,
  `id_disponibilidad` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `planes_disponibilidad`
ALTER TABLE `planes_disponibilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DISPONIBILIDAD` (`id_disponibilidad`),
  ADD KEY `PLAN` (`id_plan`);

-- AUTO_INCREMENT de la tabla `planes_disponibilidad`
ALTER TABLE `planes_disponibilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Estructura de tabla para la tabla `propuestas`
-- Propuesta del cliente hacia la compañia

CREATE TABLE `propuestas` (
  `id` int(11) NOT NULL,
  `id_disponibilidad` int(11) NOT NULL,
  `numero_propuesta` text NOT NULL,
  `precio_venta` text NOT NULL,
  `descuento` text NOT NULL,
  `meses_financiamiento` text NOT NULL,
  `inicial` text NOT NULL,
  `cuotas_mensuales` text NOT NULL,
  `cuotas_especiales` text NOT NULL,
  `cantidad_cuotas_especiales` text NOT NULL,
  `saldo_pendiente` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `propuestas`
ALTER TABLE `propuestas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_de_propuesta` (`numero_propuesta`) USING HASH,
  ADD KEY `disponibilidad` (`id_disponibilidad`);

-- AUTO_INCREMENT de la tabla `propuestas`
ALTER TABLE `propuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Estructura de tabla para la tabla `usuarios`
-- Tabla de usuarios que tienen acceso al sistema

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` text NOT NULL,
  `usuario` text NOT NULL,
  `email` text DEFAULT NULL,
  `password` text NOT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `usuarios`
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT de la tabla `usuarios`
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Estructura de tabla para la tabla `valores_planes`
-- Valores de cada plan de Finananciamiento

CREATE TABLE `valores_planes` (
  `id` int(11) NOT NULL,
  `id_financiamiento` int(11) NOT NULL,
  `precio_metros` double NOT NULL,
  `inicial_porcentaje` double NOT NULL,
  `mensualidad_porcentaje` double NOT NULL,
  `especiales_cantidad` int(11) NOT NULL,
  `especiales_porcentaje` double NOT NULL,
  `intereses` double NOT NULL,
  `descuento_porcentaje` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Indices de la tabla `valores_planes`
ALTER TABLE `valores_planes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financiamiento` (`id_financiamiento`);

-- AUTO_INCREMENT de la tabla `valores_planes`
ALTER TABLE `valores_planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- Restricciones para tablas volcadas

-- Filtros para la tabla `planes_disponibilidad`

ALTER TABLE `planes_disponibilidad`
  ADD CONSTRAINT `rel_disponibilidad` FOREIGN KEY (`id_disponibilidad`) REFERENCES `disponibilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_plan` FOREIGN KEY (`id_plan`) REFERENCES `valores_planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `propuestas`
--
ALTER TABLE `propuestas`
  ADD CONSTRAINT `propuestas_ibfk_1` FOREIGN KEY (`id_disponibilidad`) REFERENCES `disponibilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valores_planes`
--
ALTER TABLE `valores_planes`
  ADD CONSTRAINT `rel_valores_planes_id_finianciamiento` FOREIGN KEY (`id_financiamiento`) REFERENCES `financiamientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
