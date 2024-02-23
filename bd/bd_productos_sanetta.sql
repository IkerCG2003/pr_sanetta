-- Crear base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS `bd_productos_sanetta`;
USE `bd_productos_sanetta`;

-- Establecer configuraciones
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Crear tabla de ingredientes
CREATE TABLE `tbl_ingredientes` (
  `id_ingrediente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
);

-- Crear tabla de tamaños
CREATE TABLE `tbl_tamanos` (
  `id_tamano` INT(11) NOT NULL AUTO_INCREMENT,
  `tamano` CHAR(45) NOT NULL,
  PRIMARY KEY (`id_tamano`)
);

-- Crear tabla de alérgenos
CREATE TABLE `tbl_alergenos` (
  `id_alergeno` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_alergeno` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_alergeno`)
);

-- Crear tabla de categorías
CREATE TABLE `tbl_categorias` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
);

-- Crear tabla de productos
CREATE TABLE `tbl_productos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` CHAR(45) NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `disponibilidad_producto` CHAR(45) NOT NULL,
  `modalidad_producto` VARCHAR(450) NOT NULL,
  `estado_producto` CHAR(50) NOT NULL,
  `conservacion_producto` VARCHAR(45) NOT NULL,
  `precio_producto` DECIMAL(10,2) NOT NULL,
  `id_tamano` INT(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  FOREIGN KEY (`id_tamano`) REFERENCES `tbl_tamanos` (`id_tamano`)
);

-- Crear tabla de relación entre producto e ingrediente
CREATE TABLE `tbl_producto_ingrediente` (
  `id_producto` INT(11) NOT NULL,
  `id_ingrediente` INT(11) NOT NULL,
  FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  FOREIGN KEY (`id_ingrediente`) REFERENCES `tbl_ingredientes` (`id_ingrediente`)
);

-- Crear tabla de relación entre producto y alérgeno
CREATE TABLE `tbl_producto_alergeno` (
  `id_producto` INT(11) NOT NULL,
  `id_alergeno` INT(11) NOT NULL,
  FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  FOREIGN KEY (`id_alergeno`) REFERENCES `tbl_alergenos` (`id_alergeno`)
);

-- Crear tabla de relación entre producto y categoría
CREATE TABLE `tbl_producto_categoria` (
  `id_producto` INT(11) NOT NULL,
  `id_categoria` INT(11) NOT NULL,
  FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`)
);

COMMIT;
