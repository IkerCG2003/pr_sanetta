CREATE DATABASE IF NOT EXISTS `bd_productos_sanetta`;
USE `bd_productos_sanetta`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tbl_alergenos`
--

CREATE TABLE `tbl_alergenos` (
  `id_alergeno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alergeno` char(45) NOT NULL,
  PRIMARY KEY (`id_alergeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_alergenos`
--

INSERT INTO `tbl_alergenos` (`id_alergeno`, `nombre_alergeno`) VALUES
(1, 'Cacahuetes'),
(2, 'Frutos de cascara'),
(3, 'Soja'),
(4, 'Granos de sesamo'),
(5, 'Dioxido de azufre y sulfitos'),
(6, 'Gluten');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` char(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Sin Gluten'),
(2, 'Salados'),
(3, 'Bolleria'),
(4, 'Rolls'),
(5, 'Pasteleria');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tbl_tamanos`
--

CREATE TABLE `tbl_tamanos` (
  `id_tamano` int(11) NOT NULL AUTO_INCREMENT,
  `tamano` char(45) NOT NULL,
  PRIMARY KEY (`id_tamano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_tamanos`
--

INSERT INTO `tbl_tamanos` (`id_tamano`, `tamano`) VALUES
(1, 'Individual'),
(2, 'Mediana'),
(3, 'Grande'),
(4, 'Super Grande');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(45) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `ingredientes_producto` varchar(500) NOT NULL,
  `disponibilidad_producto` char(45) NOT NULL,
  `modalidad_producto` varchar(450) NOT NULL,
  `estado_producto` char(50) NOT NULL,
  `conervacion_producto` varchar(45) NOT NULL,
  `precio_producto` char(20) NOT NULL,
  `id_alergeno_1` int(11) NOT NULL,
  `id_alergeno_2` int(11) NOT NULL,
  `id_alergeno_3` int(11) NOT NULL,
  `id_alergeno_4` int(11) NOT NULL,
  `id_alergeno_5` int(11) NOT NULL,
  `id_alergeno_6` int(11) NOT NULL,
  `id_categoria_1` int(11) NOT NULL,
  `id_categoria_2` int(11) NOT NULL,
  `id_categoria_3` int(11) NOT NULL,
  `id_categoria_4` int(11) NOT NULL,
  `id_categoria_5` int(11) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  /* FK ALERGENOS */
  CONSTRAINT `fk_alergeno_producto_1` FOREIGN KEY (`id_alergeno_1`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  CONSTRAINT `fk_alergeno_producto_2` FOREIGN KEY (`id_alergeno_2`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  CONSTRAINT `fk_alergeno_producto_3` FOREIGN KEY (`id_alergeno_3`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  CONSTRAINT `fk_alergeno_producto_4` FOREIGN KEY (`id_alergeno_4`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  CONSTRAINT `fk_alergeno_producto_5` FOREIGN KEY (`id_alergeno_5`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  CONSTRAINT `fk_alergeno_producto_6` FOREIGN KEY (`id_alergeno_6`) REFERENCES `tbl_alergenos` (`id_alergeno`),
  /* FK CATEGORIA */
  CONSTRAINT `fk_categoria_producto_1` FOREIGN KEY (`id_categoria_1`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `fk_categoria_producto_2` FOREIGN KEY (`id_categoria_2`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `fk_categoria_producto_3` FOREIGN KEY (`id_categoria_3`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `fk_categoria_producto_4` FOREIGN KEY (`id_categoria_4`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `fk_categoria_producto_5` FOREIGN KEY (`id_categoria_5`) REFERENCES `tbl_categoria` (`id_categoria`),
  /* FK TAMANO */
  CONSTRAINT `fk_tamano_producto` FOREIGN KEY (`id_tamano`) REFERENCES `tbl_tamanos` (`id_tamano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;
