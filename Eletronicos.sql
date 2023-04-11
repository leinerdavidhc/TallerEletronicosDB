CREATE DATABASE  IF NOT EXISTS `eletronicos` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eletronicos`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aparato_electronico`
--

DROP TABLE IF EXISTS `aparato_electronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aparato_electronico` (
  `CODIGO_A_E` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(45) NOT NULL,
  `TIPO_ELECTRONICO_CODIGO_T_E` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_A_E`),
  KEY `fk_APARATO_ELECTRONICO_TIPO_ELECTRONICO_idx` (`TIPO_ELECTRONICO_CODIGO_T_E`),
  CONSTRAINT `fk_APARATO_ELECTRONICO_TIPO_ELECTRONICO` FOREIGN KEY (`TIPO_ELECTRONICO_CODIGO_T_E`) REFERENCES `tipo_electronico` (`CODIGO_T_E`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aparato_electronico`
--

LOCK TABLES `aparato_electronico` WRITE;
/*!40000 ALTER TABLE `aparato_electronico` DISABLE KEYS */;
INSERT INTO `aparato_electronico` VALUES (1,'Teléfono inteligente Samsung Galaxy S21 con p',1),(2,'	Computadora portátil Lenovo IdeaPad con proc',5),(3,'Televisor inteligente Sony Bravia con resoluc',2),(4,'	Altavoz inteligente Amazon Echo Dot con asis',3),(5,'Cámara digital Canon PowerShot SX620 HS con z',4);
/*!40000 ALTER TABLE `aparato_electronico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_piezas`
--

DROP TABLE IF EXISTS `componente_piezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_piezas` (
  `CODIGO_PIEZAS` int(11) NOT NULL AUTO_INCREMENT,
  `ESPECIFICACION` varchar(45) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `APARATO_ELECTRONICO_CODIGO_A_E` int(11) NOT NULL,
  `FABRICANTE_CF` int(11) NOT NULL,
  PRIMARY KEY (`CODIGO_PIEZAS`),
  KEY `fk_COMPONENTE_PIEZAS_APARATO_ELECTRONICO1_idx` (`APARATO_ELECTRONICO_CODIGO_A_E`),
  KEY `fk_COMPONENTE_PIEZAS_FABRICANTE1_idx` (`FABRICANTE_CF`),
  CONSTRAINT `fk_COMPONENTE_PIEZAS_APARATO_ELECTRONICO1` FOREIGN KEY (`APARATO_ELECTRONICO_CODIGO_A_E`) REFERENCES `aparato_electronico` (`CODIGO_A_E`),
  CONSTRAINT `fk_COMPONENTE_PIEZAS_FABRICANTE1` FOREIGN KEY (`FABRICANTE_CF`) REFERENCES `fabricante` (`CF`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_piezas`
--

LOCK TABLES `componente_piezas` WRITE;
/*!40000 ALTER TABLE `componente_piezas` DISABLE KEYS */;
INSERT INTO `componente_piezas` VALUES (1,'Pantalla LCD de 14 pulgadas con resolución de','Pantalla LCD',2,3),(2,'	Batería recargable de iones de litio de 3.7V','Batería recargable',1,1),(3,'Parlante de 10 W con Bluetooth y conector de ','Parlante Bluetooth',4,5),(4,'Módulo de cámara de 12 MP con sensor CMOS y e','Módulo de cámara',5,4),(5,'	Tarjeta madre con procesador Intel Core i7 y','Tarjeta madre',2,3),(6,'Disco duro sólido de 1 TB y conexión SATA III','Disco duro sólido',2,5),(7,'Sensor táctil de huellas dactilares con cifra','Sensor de huellas dactilares',1,3),(8,'	Lente de enfoque automático y apertura de f/','Lente para cámara',1,5),(9,'Cámara trasera de 48 MP con sensor Sony IMX58','Módulo de cámara',2,4),(10,'Fuente de alimentación de 650 W con certifica','Fuente de alimentación',3,2);
/*!40000 ALTER TABLE `componente_piezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `CF` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_FABRICANTE` varchar(45) NOT NULL,
  `DOMICILIO_SOCIAL` varchar(45) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'Samsung','Seúl, Corea del Sur'),(2,'LG','Seúl, Corea del Sur'),(3,'Apple','Cupertino, California, Estados Unidos'),(4,'Sony','	Tokyo, Japón'),(5,'Huawei','	Shenzhen, China');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_electronico`
--

DROP TABLE IF EXISTS `tipo_electronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_electronico` (
  `CODIGO_T_E` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `CARACTERISTICAS` tinytext NOT NULL,
  PRIMARY KEY (`CODIGO_T_E`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_electronico`
--

LOCK TABLES `tipo_electronico` WRITE;
/*!40000 ALTER TABLE `tipo_electronico` DISABLE KEYS */;
INSERT INTO `tipo_electronico` VALUES (1,'Telefonos','Pantalla táctil, cámara, conexión a internet, GPS'),(2,'Televisores','Pantalla LED, conexión a internet, aplicaciones'),(3,'Altavoz','Conexión inalámbrica, asistente de voz, calidad de sonido'),(4,'Cámara digital','	Sensor de imagen, lente, pantalla LCD, zoom'),(5,'Computadora','Pantalla LCD, teclado, disco duro, memoria RAM');
/*!40000 ALTER TABLE `tipo_electronico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eletronicos'
--
/*!50003 DROP PROCEDURE IF EXISTS `Aparato_CantComp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Aparato_CantComp`()
BEGIN
SELECT aparatoE.DESCRIPCION as aparato,count(compoP.APARATO_ELECTRONICO_CODIGO_A_E) canComponente FROM aparato_electronico aparatoE
join componente_piezas compoP
on compoP.APARATO_ELECTRONICO_CODIGO_A_E=aparatoE.CODIGO_A_E
GROUP BY aparatoE.CODIGO_A_E;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aparato_cant_mayoroigual_a3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aparato_cant_mayoroigual_a3`()
BEGIN
SELECT aparatoE.DESCRIPCION as aparato,count(compoP.APARATO_ELECTRONICO_CODIGO_A_E) canComponente FROM aparato_electronico aparatoE
join componente_piezas compoP
on compoP.APARATO_ELECTRONICO_CODIGO_A_E=aparatoE.CODIGO_A_E
GROUP BY aparatoE.CODIGO_A_E
HAVING canComponente>=3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Descripcion&Nombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Descripcion&Nombre`()
BEGIN
SELECT aparato_electronico.DESCRIPCION,tipo_electronico.NOMBRE FROM aparato_electronico
join tipo_electronico
on tipo_electronico.CODIGO_T_E=aparato_electronico.TIPO_ELECTRONICO_CODIGO_T_E;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FabricanteXComponentes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FabricanteXComponentes`()
BEGIN
Select CP.NOMBRE,AE.DESCRIPCION,F.NOMBRE_FABRICANTE From componente_piezas CP
join aparato_electronico AE
on CP.APARATO_ELECTRONICO_CODIGO_A_E=AE.CODIGO_A_E
join fabricante F
on CP.FABRICANTE_CF=F.CF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10 23:57:06
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aparato_cant_menoroigual_a2`()
BEGIN
SELECT aparatoE.DESCRIPCION as aparato,count(compoP.APARATO_ELECTRONICO_CODIGO_A_E) canComponente FROM aparato_electronico aparatoE
join componente_piezas compoP
on compoP.APARATO_ELECTRONICO_CODIGO_A_E=aparatoE.CODIGO_A_E
GROUP BY aparatoE.CODIGO_A_E
HAVING canComponente<=2;
END
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aparatoXcomponente`()
BEGIN
Select CP.NOMBRE,CP.ESPECIFICACION,AE.DESCRIPCION From componente_piezas CP
join aparato_electronico AE
on CP.APARATO_ELECTRONICO_CODIGO_A_E=AE.CODIGO_A_E;
END
DELIMITER ;
