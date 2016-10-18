-- MySQL dump 10.10
--
-- Host: localhost    Database: mixup
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `idEmpleado` int(10) unsigned NOT NULL,
  `MixUp_idMixUp` int(10) unsigned NOT NULL,
  `nombre` varchar(60) default NULL,
  `tel` varchar(25) default NULL,
  PRIMARY KEY  (`idEmpleado`),
  KEY `Empleado_FKIndex1` (`MixUp_idMixUp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,2,'ANGELES RODRIGUEZ EDUARDO NERI','554-234-5555'),(2,3,'BECERRA ABARCA ALBERTO ISAIAS','554-234-5555'),(3,12,'BONILLA SANCHEZ MAURICIO EDUARDO','554-234-5555'),(4,15,'DEGOLLADO HERNANDEZ DANIEL','554-234-5555'),(5,18,'DEL PUERTO ZAMORA JULIO ALBERTO','554-234-5555'),(6,20,'DIAZ ARROYO SERGIO','554-234-5555'),(7,22,'DOMINGUEZ PALACIOS GERSON ISAAC','554-234-5555'),(8,25,'DURAND GONZALEZ ALDO','554-234-5555'),(9,28,'ESCARCEGA JAIME ANGEL OMAR','554-234-5555'),(10,103,'ESCOBAR PEREZ MIGUEL ANGEL','554-234-5555'),(11,2,'ESPINOSA BOYZO VICTOR','554-234-5555'),(12,3,'GARCIA MARTINEZ JESE ANDRES','554-234-5555'),(13,12,'GARCIA TORBELLIN RODRIGO','554-234-5555'),(14,15,'GIL PEREZ ANGEL ARMANDO','554-234-5555'),(15,18,'GONZALEZ DIAZ MARTIN AUGUSTO','554-234-5555'),(16,20,'GONZALEZ SANCHEZ MARS YUREN','554-234-5555'),(17,22,'GUERRERO ANDONAEGUI GABRIEL','554-234-5555'),(18,25,'HORTA GASCA KARLA JANIRA','554-234-5555'),(19,28,'LARA RUBI JULIO CESAR','554-234-5555'),(20,103,'LINARES ARVIZU JOSE DANIEL','554-234-5555'),(21,2,'MALDONADO HERNANDEZ JUAN RAFAEL','554-234-5555'),(22,3,'MENDEZ CANO ANGEL','554-234-5555'),(23,12,'MUÑOZ GOMEZ EDUARDO','554-234-5555'),(24,15,'OBISPO VARGAS SAUL','554-234-5555'),(25,18,'OLALDE SOTO JOSE CARLOS','554-234-5555'),(26,20,'PALMA GONZALEZ CARLOS EPHRA-IM','554-234-5555'),(27,22,'PEÑA LOPEZ DAVID ISSAI','554-234-5555'),(28,25,'ROJO SALAZAR JESUS NESTOR','554-234-5555'),(29,28,'SERRANO GARCIA JOSUE MARIO RAMON','554-234-5555'),(30,103,'VALENTIN LECHUGA EDDY','554-234-5555'),(31,2,'VAZQUEZ LAZCANO OSWALDO GIOVANI','554-234-5555'),(32,3,'VELAZQUEZ TORRES JAVIER JESUS','554-234-5555');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE `genero` (
  `idGenero` int(10) unsigned NOT NULL,
  `Produccion_idProduccion` int(10) unsigned NOT NULL,
  `nombre` varchar(50) default NULL,
  PRIMARY KEY  (`idGenero`,`Produccion_idProduccion`),
  KEY `Genero_FKIndex1` (`Produccion_idProduccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,1,'Alternativo'),(1,2,'Alternativo'),(1,3,'Alternativo'),(1,4,'Alternativo'),(2,5,'Pop & Rock'),(2,6,'Pop & Rock');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixprod`
--

DROP TABLE IF EXISTS `mixprod`;
CREATE TABLE `mixprod` (
  `MixUp_idMixUp` int(10) unsigned NOT NULL,
  `Produccion_idProduccion` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`MixUp_idMixUp`,`Produccion_idProduccion`),
  KEY `MixUp_has_Produccion_FKIndex1` (`MixUp_idMixUp`),
  KEY `MixUp_has_Produccion_FKIndex2` (`Produccion_idProduccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mixprod`
--

LOCK TABLES `mixprod` WRITE;
/*!40000 ALTER TABLE `mixprod` DISABLE KEYS */;
INSERT INTO `mixprod` VALUES (2,1),(2,3),(2,5),(3,2),(3,4),(3,6),(12,1),(12,3),(12,5),(15,2),(15,4),(15,6),(18,1),(18,3),(18,5),(20,2),(20,4),(20,6),(22,1),(22,3),(22,5),(25,2),(25,4),(25,6),(28,1),(28,3),(28,5),(103,2),(103,4),(103,6);
/*!40000 ALTER TABLE `mixprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixsoc`
--

DROP TABLE IF EXISTS `mixsoc`;
CREATE TABLE `mixsoc` (
  `MixUp_idMixUp` int(10) unsigned NOT NULL,
  `Socio_idSocio` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`MixUp_idMixUp`,`Socio_idSocio`),
  KEY `MixUp_has_Socio_FKIndex1` (`MixUp_idMixUp`),
  KEY `MixUp_has_Socio_FKIndex2` (`Socio_idSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mixsoc`
--

LOCK TABLES `mixsoc` WRITE;
/*!40000 ALTER TABLE `mixsoc` DISABLE KEYS */;
INSERT INTO `mixsoc` VALUES (2,1),(2,10),(2,20),(2,30),(3,2),(3,11),(3,21),(3,31),(12,3),(12,12),(12,22),(15,4),(15,13),(15,23),(18,5),(18,14),(18,24),(20,5),(20,15),(20,25),(22,6),(22,16),(22,26),(25,7),(25,17),(25,27),(28,8),(28,18),(28,28),(103,9),(103,19),(103,29);
/*!40000 ALTER TABLE `mixsoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mixup`
--

DROP TABLE IF EXISTS `mixup`;
CREATE TABLE `mixup` (
  `idMixUp` int(10) unsigned NOT NULL,
  `nombre` varchar(60) default NULL,
  `dir` varchar(350) default NULL,
  `tel` varchar(25) default NULL,
  `edo` varchar(50) default NULL,
  PRIMARY KEY  (`idMixUp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mixup`
--

LOCK TABLES `mixup` WRITE;
/*!40000 ALTER TABLE `mixup` DISABLE KEYS */;
INSERT INTO `mixup` VALUES (2,'MixUp Centro Comercial Galerías Tuxtla','Blvd. Belisario Dominguez No. 1861 Ancla 8 Col. Bugambilias C.P. 29020 Tuxtla Gutiérrez, Chiapas.','01(961) 671-8546','Chiapas'),(3,'MixUp Centro Comercial Plaza Cibeles','Blvd. Villas de Irapuato No. 1443 Loc. L-35 Col. Ejido C.P. 64050 Irapuato, Gto.','01(462) 623-0884','Guanajuato'),(12,'MixUp Centro Comercial Plaza Emporio','Av. Costera Miguel Alemán No. 1926 Loc. L14 Esq. Vicente Yáñez Pinzón Fracc. Magallanes C.P. 39670 Acapulco, Gro.','01(744) 481-1376','Guerrero'),(15,'MixUp 16 De Septiembre','16 de septiembre No. 14 (Entre Lázaro Cárdenas y Gante) Col. Centro Delegación Cuauhtemoc México D. F. C.P. 06000','01(55)5512-2766','DF'),(18,'MixUp Centro Historico','Francisco I. Madero No. 51 Esq. Isabel La Católica Col. Centro  Del. Cuauhtémoc México D. F. C.P. 06010','01(55)5510-8923','DF'),(20,'MixUp Melchor Ocampo','Plaza Galerías Melchor Ocampo Calzada Melchor Ocampo No. 193 Loc. G12, G13 y G14 Esq. Marina Nacional Col. Verónica Anzures Delegación Miguel Hidalgo México D.F. C.P. 11300','01(55)5260-0453','DF'),(22,'MixUp Perisur','Centro Comercial Perisur Av. Anillo Periférico Sur No. 4690 Loc. 169 C Col. Jardines del Pedregal Delegación Coyoacán México D.F. C.P. 04500','01(55)5528-1008','DF'),(25,'MixUp Santa Fe','Centro Comercial Santa Fe  Av. Vasco de Quiroga No. 3800 Loc. 133 Col. Santa Fé Delegación Cuajimalpa México D. F. C.P. 05109','01(55)5259-6756','DF'),(28,'MixUp Morelos','Plaza Cuernavaca. Av. Vicente Guerrero No. 110 Isla 1, local 1 Col. Lomas de la Selva C.P. 62270 Cuernavaca, Morelos','01(777) 310-0618','Morelos'),(103,'MixUp Centro Comercial Plaza Rio','Av. Paseo de los Héroes No. 98 Local B-8 (Entre Blvd. Cuauhtémoc y Av. Independencia) Col. Zona Río C.P. 22320 Tijuana, Baja California.','01 (664) 684-7789','BCN');
/*!40000 ALTER TABLE `mixup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
CREATE TABLE `produccion` (
  `idProduccion` int(10) unsigned NOT NULL,
  `titulo` varchar(60) default NULL,
  `autor` varchar(60) default NULL,
  PRIMARY KEY  (`idProduccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,'(WHATS THE STORY) MORNING GLORY?','Oasis'),(2,'10,000 DAYS','Tool'),(3,'100 BROKEN WINDOWS','IDLEWILD'),(4,'1039/SMOOTHED OUT SLAPPY HOURS','GREEN DAY'),(5,'BABY ONE MORE TIME','BRITNEY SPEARS'),(6,'10 YEARS OF GOLD','KENNY ROGERS');
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
CREATE TABLE `socio` (
  `idSocio` int(10) unsigned NOT NULL,
  `nombre` varchar(60) default NULL,
  `direccion` varchar(350) default NULL,
  `tel` varchar(25) default NULL,
  `email` varchar(40) default NULL,
  PRIMARY KEY  (`idSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES (1,'ANGELES DE LA CRUZ ANDREE MICHEL IRVING','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(2,'ARMENDARIZ CRUZ OCTAVIO ARTURO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(3,'CARVAJAL MURILLO ANA VICTORIA','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(4,'CASTAÑEDA GONZALEZ LEONARDO MAURICIO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(5,'CASTILLO GONZALEZ IVAN','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(6,'CRUZ CHAVEZ EDGAR DANIEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(7,'FLORES GALICIA OMAR ISAIAS','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(8,'GARCIA CERVANTES ANEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(9,'GARCIA MORA OSVALDO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(10,'GOMEZ TETLALMATZI JESSICA','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(11,'GONZALEZ ZAVALA HUGO CESAR','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(12,'GUZMAN RIOS RAFAEL ANGEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(13,'HERNANDEZ ESTRADA ALAN YESSAHIR','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(14,'HERNANDEZ ROSAS DANIEL ALEJANDRO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(15,'LOPEZ OBREGON ERIKA LISSETTE','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(16,'MONROY MORAN SERGIO ISRAEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(17,'NAJER GONZALEZ LESSLYE ALY','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(18,'OVIEDO ESPINOZA JOSAFAT','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(19,'PEREZ MORALES MARCELA','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(20,'PIMENTEL MARTINEZ WALDO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(21,'RAMIREZ JIMENEZ ALLAN CESAR','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(22,'RAMIREZ MARTINEZ ERICK DANIEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(23,'RIOS GASPAR IZCHEL NAYELI','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(24,'RODRIGUEZ MARTINEZ ARTURO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(25,'ROMERO GALVAN LUIS ROBERTO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(26,'SANCHEZ MONROY OMAR ISRAEL','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(27,'SORIA HIDALGO MANUEL ALEJANDRO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(28,'VAZQUEZ CARAVANTES EDUARDO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(29,'VILLA RUSSELL JUAN PABLO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(30,'LAGOS CAXNAJOY EDGAR JACOBO','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx'),(31,'ESPINOZA GIL ADALID','Av. Juarez. s/n','554-234-5555','escom@escom.ipn.mx');
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-09-03 23:29:18
