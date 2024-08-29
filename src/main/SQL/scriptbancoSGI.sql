CREATE DATABASE  IF NOT EXISTS `bdsgi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdsgi`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdsgi
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `contasapagar`
--

DROP TABLE IF EXISTS `contasapagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contasapagar` (
  `idcontapagar` int NOT NULL AUTO_INCREMENT,
  `cntnomefornecedor` varchar(255) DEFAULT NULL,
  `cntidfilial` int NOT NULL,
  `cntdescricaoconta` varchar(255) DEFAULT NULL,
  `cntdtvencimento` date DEFAULT NULL,
  `cntstatuspagamento` enum('Pendente','Pago') DEFAULT NULL,
  `cntvalor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idcontapagar`),
  KEY `cntidfilial` (`cntidfilial`),
  CONSTRAINT `contasapagar_ibfk_1` FOREIGN KEY (`cntidfilial`) REFERENCES `filial` (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contasapagar`
--

LOCK TABLES `contasapagar` WRITE;
/*!40000 ALTER TABLE `contasapagar` DISABLE KEYS */;
INSERT INTO `contasapagar` VALUES (4,'Amazonas Energia',1,'Conta de luz referente ao mês de Julho de 2024','2024-08-13','Pago',356.00),(5,'Amazonas Energia',2,'Conta de Energia de Agosto','2024-08-16','Pendente',256.00),(6,'Amazonas Energia',1,'Conta de Energia de Agosto','2024-08-12','Pago',250.50),(7,'Cold Cool Limpeza e Manutenção de Ar-Condicionados',1,'Manutenção do Ar-Condicionado do templo','2024-08-13','Pago',150.00),(8,'Aguas de Manaus',1,'Conta de Agua de Agosto ','2024-08-16','Pago',360.66),(9,'Aguas de Manaus',1,'Conta de Agua de Agosto ','2024-08-11','Pago',360.66),(10,'Aguas de Manaus',3,'Conta de Agua de Agosto','2024-08-15','Pendente',150.00),(11,'Cold Cool Limpeza e Manutenção de Ar-Condicionados',3,'Manutenção do Ar-Condicionado do templo','2024-08-15','Pendente',360.66),(12,'Amazonas Energia',1,'Conta de luz referente ao mês de Julho de 2024','2024-07-17','Pago',356.00),(13,'Amazonas Energia',1,'Conta de Energia de Junho','2024-06-11','Pago',250.50),(14,'Amazonas Energia',2,'Conta de Energia de Junho','2024-06-12','Pago',256.00),(15,'Amazonas Energia',3,'Conta de Energia de Junho','2024-06-13','Pago',256.00),(16,'Amazonas Energia',1,'Conta de Energia de Agosto','2024-08-23','Pendente',250.00),(17,'V&V Produtos de Limpeza',2,'Despesa com pordutos de limpeza ','2024-08-27','Pago',120.00);
/*!40000 ALTER TABLE `contasapagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corallouvor`
--

DROP TABLE IF EXISTS `corallouvor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corallouvor` (
  `idcoral` int NOT NULL,
  PRIMARY KEY (`idcoral`),
  UNIQUE KEY `idcoral` (`idcoral`),
  CONSTRAINT `corallouvor_ibfk_1` FOREIGN KEY (`idcoral`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corallouvor`
--

LOCK TABLES `corallouvor` WRITE;
/*!40000 ALTER TABLE `corallouvor` DISABLE KEYS */;
/*!40000 ALTER TABLE `corallouvor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diacono`
--

DROP TABLE IF EXISTS `diacono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diacono` (
  `iddiacono` int NOT NULL,
  PRIMARY KEY (`iddiacono`),
  UNIQUE KEY `iddiacono` (`iddiacono`),
  CONSTRAINT `diacono_ibfk_1` FOREIGN KEY (`iddiacono`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diacono`
--

LOCK TABLES `diacono` WRITE;
/*!40000 ALTER TABLE `diacono` DISABLE KEYS */;
/*!40000 ALTER TABLE `diacono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dizimosofertas`
--

DROP TABLE IF EXISTS `dizimosofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dizimosofertas` (
  `iddizimooferta` int NOT NULL AUTO_INCREMENT,
  `dzomembroid` int NOT NULL,
  `dzotipo` enum('Dizimo','Oferta') DEFAULT NULL,
  `dzovalor` decimal(10,2) DEFAULT NULL,
  `dzodtcontribuicao` date DEFAULT NULL,
  PRIMARY KEY (`iddizimooferta`),
  KEY `dzomembroid` (`dzomembroid`),
  CONSTRAINT `dizimosofertas_ibfk_1` FOREIGN KEY (`dzomembroid`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dizimosofertas`
--

LOCK TABLES `dizimosofertas` WRITE;
/*!40000 ALTER TABLE `dizimosofertas` DISABLE KEYS */;
INSERT INTO `dizimosofertas` VALUES (44,15,'Oferta',360.35,'2024-07-28'),(50,15,'Dizimo',250.65,'2024-07-28'),(51,15,'Oferta',360.35,'2024-07-28'),(52,15,'Dizimo',360.35,'2024-07-28'),(53,15,'Dizimo',250.65,'2024-07-28'),(54,15,'Dizimo',250.65,'2024-07-28'),(55,15,'Dizimo',250.65,'2024-07-28'),(56,15,'Dizimo',250.65,'2024-07-28'),(57,15,'Dizimo',250.65,'2024-07-28'),(58,15,'Dizimo',250.65,'2024-07-28'),(59,15,'Dizimo',250.65,'2024-07-28'),(60,15,'Dizimo',250.65,'2024-07-28'),(61,15,'Dizimo',250.65,'2024-07-28'),(62,15,'Oferta',360.35,'2024-07-28'),(63,15,'Dizimo',360.35,'2024-07-28'),(64,15,'Dizimo',360.35,'2024-07-28'),(65,15,'Dizimo',250.65,'2024-07-28'),(66,15,'Dizimo',250.65,'2024-07-28'),(67,15,'Dizimo',250.65,'2024-07-28'),(68,15,'Dizimo',250.65,'2024-07-28'),(69,15,'Dizimo',250.65,'2024-07-28'),(70,15,'Dizimo',250.65,'2024-07-28'),(71,15,'Dizimo',360.35,'2024-07-28'),(72,15,'Dizimo',250.65,'2024-07-28'),(73,15,'Dizimo',250.65,'2024-07-28'),(74,15,'Dizimo',2626.00,'2024-07-31'),(75,15,'Oferta',250.66,'2024-07-28'),(77,0,'Dizimo',200.00,'2022-05-15'),(78,15,'Oferta',75.50,'2023-08-21'),(79,21,'Dizimo',125.75,'2024-02-10'),(80,22,'Oferta',300.00,'2022-12-31'),(81,25,'Dizimo',50.25,'2023-01-01'),(82,26,'Oferta',175.00,'2024-06-15'),(83,27,'Dizimo',220.30,'2022-07-07'),(84,31,'Oferta',90.75,'2023-09-22'),(85,32,'Dizimo',45.50,'2024-11-11'),(86,0,'Oferta',210.10,'2023-04-19'),(87,15,'Dizimo',190.85,'2022-10-25'),(88,21,'Oferta',60.00,'2024-03-03'),(89,22,'Dizimo',155.75,'2023-12-05'),(90,25,'Oferta',320.20,'2022-06-18'),(91,26,'Dizimo',180.50,'2023-07-09'),(92,27,'Oferta',70.75,'2024-10-10'),(93,31,'Dizimo',250.30,'2022-03-15'),(94,32,'Oferta',110.60,'2023-05-14'),(95,0,'Dizimo',135.00,'2024-01-20'),(96,15,'Oferta',180.75,'2022-09-23'),(98,22,'Oferta',275.50,'2024-04-25'),(99,25,'Dizimo',60.75,'2022-08-17'),(100,26,'Oferta',145.10,'2023-02-12'),(101,27,'Dizimo',200.00,'2024-05-13'),(102,31,'Oferta',85.75,'2022-12-29'),(103,32,'Dizimo',50.30,'2023-10-04'),(104,0,'Dizimo',160.00,'2022-04-10'),(105,15,'Oferta',130.25,'2023-05-30'),(106,21,'Dizimo',90.40,'2024-07-01'),(107,22,'Oferta',300.50,'2022-11-15'),(108,25,'Dizimo',70.10,'2023-08-09'),(109,26,'Oferta',250.00,'2024-01-25'),(110,27,'Dizimo',180.20,'2022-10-20'),(111,31,'Oferta',95.60,'2023-12-02'),(112,32,'Dizimo',40.75,'2024-03-22'),(113,0,'Oferta',205.90,'2022-06-10'),(114,15,'Dizimo',150.40,'2023-07-19'),(115,21,'Oferta',85.00,'2024-04-12'),(116,22,'Dizimo',170.55,'2022-12-08'),(117,25,'Oferta',310.10,'2023-02-28'),(118,26,'Dizimo',140.25,'2024-05-05'),(119,27,'Oferta',60.80,'2022-11-29'),(120,31,'Dizimo',220.00,'2023-03-14'),(122,0,'Dizimo',175.50,'2023-06-22'),(123,15,'Oferta',120.75,'2022-07-14'),(124,21,'Dizimo',100.30,'2024-02-05'),(125,22,'Oferta',290.00,'2023-10-09'),(126,25,'Dizimo',80.25,'2022-09-12'),(127,26,'Oferta',160.75,'2024-06-30'),(128,27,'Dizimo',210.50,'2023-11-11'),(129,31,'Oferta',85.90,'2024-07-23'),(130,32,'Dizimo',55.40,'2022-05-29'),(131,0,'Dizimo',190.00,'2022-12-01'),(132,15,'Oferta',85.90,'2023-03-12'),(133,21,'Dizimo',140.30,'2024-05-20'),(134,22,'Oferta',275.50,'2022-11-23'),(135,25,'Dizimo',70.75,'2023-01-18'),(136,26,'Oferta',200.25,'2024-08-11'),(137,27,'Dizimo',160.00,'2022-06-30'),(138,31,'Oferta',100.40,'2023-10-05'),(139,32,'Dizimo',45.50,'2024-02-15'),(140,0,'Oferta',220.75,'2022-07-20'),(141,15,'Dizimo',130.60,'2023-08-15'),(142,21,'Oferta',75.90,'2024-09-18'),(143,22,'Dizimo',190.25,'2022-10-12'),(144,25,'Oferta',285.00,'2023-12-30'),(145,26,'Dizimo',150.00,'2024-03-07'),(146,27,'Oferta',65.80,'2022-08-21'),(147,31,'Dizimo',200.75,'2023-11-26'),(148,32,'Oferta',95.50,'2024-06-07'),(149,0,'Dizimo',175.25,'2023-02-20'),(150,15,'Oferta',110.90,'2022-05-10'),(151,21,'Dizimo',85.50,'2024-04-22'),(152,22,'Oferta',260.75,'2023-11-04'),(153,25,'Dizimo',90.30,'2022-09-08'),(154,26,'Oferta',170.00,'2024-01-13'),(155,27,'Dizimo',220.10,'2023-07-05'),(156,31,'Oferta',105.20,'2024-05-29'),(157,32,'Dizimo',60.75,'2022-11-17'),(158,0,'Dizimo',140.50,'2023-01-12'),(159,0,'Dizimo',140.50,'2023-01-12'),(160,15,'Oferta',110.25,'2022-08-05'),(161,21,'Dizimo',165.30,'2024-07-15'),(162,22,'Oferta',280.00,'2023-10-22'),(163,25,'Dizimo',85.00,'2022-12-14'),(164,26,'Oferta',220.50,'2024-04-30'),(165,27,'Dizimo',175.75,'2023-11-10'),(166,31,'Oferta',90.20,'2024-02-28'),(167,32,'Dizimo',50.90,'2022-10-03'),(168,0,'Oferta',230.60,'2022-09-30'),(169,15,'Dizimo',140.40,'2023-06-08'),(170,21,'Oferta',95.75,'2024-11-01'),(171,22,'Dizimo',185.20,'2023-12-20'),(172,25,'Oferta',275.10,'2022-07-12'),(173,26,'Dizimo',155.00,'2024-05-25'),(174,27,'Oferta',70.30,'2023-08-09'),(175,31,'Dizimo',210.75,'2024-01-17'),(176,32,'Oferta',85.90,'2022-11-23'),(177,0,'Dizimo',150.50,'2023-03-10'),(178,15,'Oferta',95.00,'2022-06-14'),(179,21,'Dizimo',170.40,'2024-08-20'),(180,22,'Oferta',290.25,'2023-09-15'),(181,25,'Dizimo',75.60,'2022-12-01'),(182,26,'Oferta',200.10,'2024-06-14'),(183,27,'Dizimo',190.90,'2023-04-19'),(184,31,'Oferta',100.00,'2024-03-08'),(185,32,'Dizimo',65.50,'2022-07-29'),(186,0,'Oferta',215.40,'2022-10-11'),(187,15,'Dizimo',125.20,'2023-05-21'),(188,21,'Oferta',80.10,'2024-02-17'),(189,22,'Dizimo',175.30,'2023-11-07'),(190,25,'Oferta',285.50,'2022-08-24'),(191,26,'Dizimo',145.75,'2024-09-12'),(192,27,'Oferta',60.90,'2023-10-21'),(193,31,'Dizimo',200.50,'2024-04-03'),(194,32,'Oferta',70.25,'2022-12-10'),(195,15,'Dizimo',360.35,'2024-07-30'),(196,21,'Oferta',360.35,'2024-07-29'),(197,15,'Dizimo',250.00,'2024-07-30'),(198,21,'Oferta',360.35,'2024-07-30'),(199,25,'Oferta',360.35,'2024-07-30'),(200,15,'Dizimo',368.34,'2024-07-30'),(201,0,'Dizimo',250.65,'2024-07-30'),(202,0,'Dizimo',250.65,'2024-07-30'),(203,15,'Dizimo',360.35,'2024-07-30'),(204,15,'Oferta',360.35,'2024-07-30'),(205,15,'Dizimo',250.65,'2024-08-02'),(207,21,'Dizimo',360.33,'2024-08-04'),(208,27,'Dizimo',360.35,'2024-08-04'),(209,15,'Dizimo',360.35,'2024-08-04'),(210,15,'Dizimo',360.35,'2024-08-04'),(211,15,'Dizimo',360.35,'2024-08-04'),(212,22,'Dizimo',360.35,'2024-08-04'),(213,37,'Dizimo',360.33,'2024-08-10'),(214,37,'Dizimo',360.36,'2024-08-10'),(215,21,'Dizimo',360.40,'2024-08-10'),(216,37,'Oferta',10.12,'2024-08-10'),(217,21,'Oferta',10.12,'2024-08-10'),(218,25,'Oferta',85.56,'2024-08-11'),(219,37,'Dizimo',3600.00,'2024-08-13'),(220,27,'Dizimo',500.00,'2024-08-13'),(221,25,'Dizimo',500.00,'2024-08-13'),(222,26,'Dizimo',500.00,'2024-08-13'),(223,33,'Oferta',5000.00,'2024-08-14'),(224,37,'Oferta',1000.00,'2024-08-13'),(225,41,'Oferta',1000.00,'2024-08-13'),(226,15,'Oferta',360.36,'2024-08-13'),(227,15,'Oferta',250.00,'2024-08-12'),(228,25,'Oferta',1000.00,'2024-08-13'),(229,15,'Oferta',1000.00,'2024-08-13'),(230,15,'Oferta',250.00,'2024-08-13'),(231,21,'Oferta',360.36,'2024-08-13'),(232,15,'Oferta',1000.00,'2024-08-13'),(233,37,'Oferta',360.36,'2024-08-13'),(234,21,'Dizimo',5000.00,'2024-08-13'),(235,15,'Oferta',1000.00,'2024-08-13'),(236,15,'Oferta',100.00,'2024-08-13'),(237,15,'Oferta',100.00,'2024-08-13'),(238,15,'Oferta',360.40,'2024-08-13'),(239,15,'Oferta',360.36,'2024-08-13'),(240,15,'Oferta',360.40,'2024-08-13'),(241,37,'Oferta',360.36,'2024-08-13'),(242,37,'Oferta',5000.00,'2024-06-13'),(243,26,'Dizimo',360.40,'2024-08-13'),(244,15,'Dizimo',150.00,'2024-08-13'),(245,15,'Oferta',1000.00,'2024-07-23'),(246,25,'Oferta',1000.00,'2024-07-23'),(247,15,'Oferta',360.36,'2024-08-13'),(248,21,'Oferta',360.36,'2024-08-13'),(249,43,'Dizimo',250.65,'2024-08-13'),(250,43,'Dizimo',360.58,'2024-08-16'),(251,15,'Dizimo',360.36,'2024-08-19'),(252,15,'Dizimo',10.12,'2024-08-19'),(253,15,'Dizimo',360.36,'2024-08-19'),(254,15,'Dizimo',360.36,'2024-08-21'),(255,37,'Dizimo',25020.00,'2024-08-21'),(256,44,'Dizimo',370.65,'2024-08-22'),(257,44,'Dizimo',370.36,'2024-08-22'),(258,49,'Dizimo',250.33,'2024-08-26');
/*!40000 ALTER TABLE `dizimosofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doacoesdebens`
--

DROP TABLE IF EXISTS `doacoesdebens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doacoesdebens` (
  `iddoacao` int NOT NULL AUTO_INCREMENT,
  `doanomedoador` varchar(255) DEFAULT NULL,
  `doamembroid` int DEFAULT NULL,
  `doadescricao` text,
  `doadtdoacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `doavalor` decimal(10,2) DEFAULT NULL,
  `status` enum('Pendente','Entregue','Recusado') DEFAULT NULL,
  `doaidfilial` int NOT NULL,
  PRIMARY KEY (`iddoacao`),
  KEY `doamembroid` (`doamembroid`),
  KEY `doaidfilial` (`doaidfilial`),
  CONSTRAINT `doacoesdebens_ibfk_3` FOREIGN KEY (`doamembroid`) REFERENCES `membro` (`mbrid`),
  CONSTRAINT `doacoesdebens_ibfk_4` FOREIGN KEY (`doaidfilial`) REFERENCES `filial` (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doacoesdebens`
--

LOCK TABLES `doacoesdebens` WRITE;
/*!40000 ALTER TABLE `doacoesdebens` DISABLE KEYS */;
INSERT INTO `doacoesdebens` VALUES (4,'Sannyer',47,'Roupas Infantis para meninas','2024-08-10 04:00:00',250.00,'Entregue',2),(5,'Sannyer',32,'Roupas Infantis','2024-08-17 04:00:00',250.00,'Entregue',3),(7,'Sannyer',31,'Roupas Infantis','2024-08-26 04:00:00',250.00,'Entregue',3);
/*!40000 ALTER TABLE `doacoesdebens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `endid` int NOT NULL AUTO_INCREMENT,
  `endmbrid` int NOT NULL,
  `endrua` varchar(100) NOT NULL,
  `endnumero` varchar(11) NOT NULL,
  `endbairro` varchar(100) DEFAULT NULL,
  `endcep` varchar(10) NOT NULL,
  `endcidade` varchar(50) NOT NULL,
  `endestado` varchar(50) NOT NULL,
  PRIMARY KEY (`endid`),
  KEY `endmbrid` (`endmbrid`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`endmbrid`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,15,'235','26','Cidade Nova','69096800','Manaus','Amazonas'),(2,21,'235','26','Cidade Nova','69096800','Manaus','Amazonas'),(3,22,'Beco Santa Cruz','26','SÃ£o Jorge','78096800','Manaus','Amazonas'),(4,25,'235','26','Amazonino Mendes','69096800','Manaus','Amazonas'),(5,26,'Rua colatina','34','Aleixo','98063800','Manaus','Amazonas'),(6,27,'Av Visconde de Porto Alegre','03','Centro','69020720','Manaus ','Amazonas'),(7,31,'Rua 235','26','Coroado','69096-800','Manaus','AM'),(8,32,'Rua 235','26','Coroado','69096800','Manaus','AM'),(9,33,'Rua 235','26','Coroado','69096-800','Manaus','AM'),(10,36,'Rua 235','26','Coroado','69096-800','Manaus','AM'),(11,37,'Rua 235','26','Coroado','69096800','Manaus','AM'),(12,41,'Colatina','45','Novo Aleixo','69096800','Manaus','Amazonas'),(13,42,'Rua 235','26','Coroado','69096-800','Manaus','AM'),(14,43,'Rua 235','26','Coroado','69096800','Manaus','AM'),(15,44,'Rua 235','26','Coroado','69096-800','Manaus','AM'),(16,45,'Rua 235','26','Coroado','69096800','Manaus','AM'),(17,47,'Rua 235','26','Coroado','69096800','Manaus','AM'),(18,48,'Rua 235','26','Coroado','69096800','Manaus','AM'),(19,49,'Colatina','56','Novo Aleixo','69039980','Manaus','Amazonas');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadocivil` (
  `estid` int NOT NULL AUTO_INCREMENT,
  `estdescricao` varchar(50) NOT NULL,
  PRIMARY KEY (`estid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'SOLTEIRO(A)'),(2,'DIVORCIADO(A)'),(3,'VIUVO(A)'),(4,'CASADO(A)');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `idevento` int NOT NULL AUTO_INCREMENT,
  `evetitulo` varchar(255) DEFAULT NULL,
  `evedescricao` varchar(255) DEFAULT NULL,
  `evedata` date DEFAULT NULL,
  `evehora` time DEFAULT NULL,
  `evelocalizacao` varchar(255) DEFAULT NULL,
  `evestatus` enum('Agendado','Concluido','Cancelado') DEFAULT NULL,
  `eveidfil` int NOT NULL,
  PRIMARY KEY (`idevento`),
  KEY `eveidfil` (`eveidfil`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`eveidfil`) REFERENCES `filial` (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (4,'Culto de Sábado','Celebração dos Cultos de Sábado','2024-08-17','18:30:00','Templo','Agendado',2),(5,'Culto de Domingo','Celebração dos Cultos de Domingo','2024-08-19','10:27:00','Templo','Agendado',1),(6,'Culto de Domingo','Celebração dos Cultos de Domingo a noite','2024-09-01','19:00:00','Templo Campos Elisios','Agendado',1),(7,'Culto de Domingo','Celebração dos Cultos de Domingo','2024-08-27','19:50:00','Templo','Agendado',1),(8,'Culto de Domigo','Celebração dos Cultos de Domingo a Noite','2024-09-01','19:00:00','Templo Campos Elisios','Agendado',1),(9,'Celebração','Celebração dos cultos segunda feira a noite ','2024-08-26','18:30:00','Templo Campos Elisios','Agendado',1),(10,'Palestra sobre a familía','Palestra sobre o bem estar da família','2024-08-31','15:00:00','Centro de Covenções da Amazonia','Agendado',3);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filial` (
  `idfilial` int NOT NULL AUTO_INCREMENT,
  `filsedeid` int DEFAULT NULL,
  `filnome` varchar(255) NOT NULL,
  `filtelefone` varchar(15) NOT NULL,
  `filemail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idfilial`),
  KEY `filsedeid` (`filsedeid`),
  CONSTRAINT `filial_ibfk_1` FOREIGN KEY (`filsedeid`) REFERENCES `sedetemplo` (`sedid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,1,'FILIAL CAMPOS ELISIOS','9289926578','ccjvcamposelisios@gmail.com'),(2,1,'FILIAL COROADO','9289927896','ccjvcoroado@gmail.com'),(3,1,'FILIAL CACHOEIRINHA','9289786578','ccjvcachoeirinha@gmail.com'),(4,1,'Visitantes','99999999999','visitante');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro`
--

DROP TABLE IF EXISTS `membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membro` (
  `mbrid` int NOT NULL AUTO_INCREMENT,
  `mbrsedeid` int DEFAULT NULL,
  `mbrnome` varchar(255) NOT NULL,
  `mbrcpf` varchar(20) NOT NULL,
  `mbrsuperior` int DEFAULT NULL,
  `mbrnumero_identidade` varchar(20) NOT NULL,
  `mbremail` varchar(30) NOT NULL,
  `mbrsenha` varchar(32) NOT NULL,
  `mbrtelefone` varchar(20) NOT NULL,
  `mbrata_nascimento` date NOT NULL,
  `mbrcivilid` int NOT NULL,
  `mbrfoto` varchar(255) DEFAULT NULL,
  `mbrativo` tinyint(1) NOT NULL,
  `mbracesso` enum('Administrador','Usuario') DEFAULT NULL,
  `mbrfilid` int NOT NULL,
  PRIMARY KEY (`mbrid`),
  UNIQUE KEY `mbrcpf` (`mbrcpf`),
  UNIQUE KEY `mbrnumero_identidade` (`mbrnumero_identidade`),
  UNIQUE KEY `mbremail` (`mbremail`),
  KEY `mbrcivilid` (`mbrcivilid`),
  KEY `mbrsedeid` (`mbrsedeid`),
  KEY `mbrsuperior` (`mbrsuperior`),
  KEY `mbrfilid` (`mbrfilid`),
  CONSTRAINT `membro_ibfk_1` FOREIGN KEY (`mbrcivilid`) REFERENCES `estadocivil` (`estid`),
  CONSTRAINT `membro_ibfk_2` FOREIGN KEY (`mbrsedeid`) REFERENCES `sedetemplo` (`sedid`),
  CONSTRAINT `membro_ibfk_3` FOREIGN KEY (`mbrsuperior`) REFERENCES `membro` (`mbrid`),
  CONSTRAINT `membro_ibfk_4` FOREIGN KEY (`mbrfilid`) REFERENCES `filial` (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro`
--

LOCK TABLES `membro` WRITE;
/*!40000 ALTER TABLE `membro` DISABLE KEYS */;
INSERT INTO `membro` VALUES (0,1,'Visitante','11111111112',NULL,'11111111','visitante','21232f297a57a5a743894a0e4a801fc3','1111111111','9999-12-01',1,NULL,0,'Usuario',0),(1,1,'admins admins admins','12312312312',NULL,'000000000','admin@email.com','21232f297a57a5a743894a0e4a801fc3','123123123321','2024-03-17',1,NULL,1,'Administrador',0),(15,1,'Sannyer Cardoso','12345678945',22,'45612312','sannyer@gmail.com','c6056f342538fb9801545342fc007269','45789456123','1999-11-15',1,'blog-item-01-art.png',1,'Administrador',2),(21,1,'Irismar Ferreira de Carvalho','11111111111',NULL,'78978945','irismar@gmail.com','c6056f342538fb9801545342fc007269','1516165165','1970-03-12',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\indigena.jpg',1,'Usuario',1),(22,1,'Fani Tamires de Souza Batista','44444444444',NULL,'96374123','fanitamires@gmail.com','b51e8dbebd4ba8a8f342190a4b9f08d7','79846512352','1986-04-24',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SGIPAINEL\\img\\5.jpg',1,'Administrador',1),(25,1,'Eduardo Teixeira Nery','45645645645',NULL,'74145625','eduardo@gmail.com','6074c6aa3488f3c2dddff2a7ca821aab','1516165165','1965-08-20',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\3.jpg',1,'Administrador',2),(26,1,'Marinaldo Lima dos Santos','78945612321',NULL,'74185263','marinaldo@gmail.com','dbae5fc64ddad142e86b389f0de1c60c','9299988775533','1975-02-03',4,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SGIPAINEL\\img\\1.jpg',1,'Usuario',2),(27,1,'Arlindo Almeida Andrade','84268426523',22,'45136789','arlindo@gmail.com','82039d16dce0aab3913b6a7ac73deff7','9299988775544','1976-03-23',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SGIPAINEL\\img\\4.jpg',1,'Usuario',3),(31,1,'Ronald Gospel','78945625832',NULL,'74145621','carvalhosannyer@gmail.com','c6056f342538fb9801545342fc007269','92999827524','1970-08-18',4,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SGIPAINEL\\img\\1.jpg',1,'Usuario',3),(32,1,'Alessandro André','74561238912',NULL,'74145612','aa@gmail.com','c6056f342538fb9801545342fc007269','92993031154','2009-01-04',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\1.jpg',1,'Usuario',1),(33,1,'Samuel','78978978978',NULL,'45645654','samuel@gmail.com','75429d136f65d2d6168b9b6c5f6ec951','7878787878','2012-01-31',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\1.jpg',1,'Administrador',1),(36,1,'Wallace Almeida','49849818158',NULL,'98419804','wallaceA@gmail.com','c6056f342538fb9801545342fc007269','92999827524','2024-07-31',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\831ddb27f32658c2e7b40df0c55743fe.jpg',1,'Administrador',1),(37,1,'Jamily Carvalho de Araujo','78945681468',NULL,'8494984','jamily@gmail.com','c6056f342538fb9801545342fc007269','92999827524','2006-08-03',1,'2.jpg',1,'Usuario',1),(41,1,'Ronaldo Gaspar Batista','45263478952',NULL,'85694128','ronaldoGaspar@gmail.com','ad4889b4b79bd7368941278bb9aa3768','92999827523','1995-06-13',4,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\1.jpg',1,'Usuario',1),(42,1,'Antônio da Cruz','56344785985',NULL,'7848987','antonio@gmail.com','c6056f342538fb9801545342fc007269','92999827524','1996-08-13',1,'4.jpg',1,'Administrador',1),(43,1,'Delsimar Ferreira de Carvalho','88455556698',32,'74145626','delsimar@gmail.com','c6056f342538fb9801545342fc007269','92999827524','1996-07-24',3,'3.jpg',1,'Administrador',1),(44,1,'Wilmar Ferreira de Carvalho','789789789456',NULL,'74145646','wilmar@gmail.com','c6056f342538fb9801545342fc007269','92999827524','1990-06-13',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\1.jpg',1,'Administrador',2),(45,1,'Nikola Tesla','74569878745',NULL,'45698457','nikola.tesla@gmail.com','e10adc3949ba59abbe56e057f20f883e','99999999999','1856-06-10',1,'Tesla_circa_1890.jpeg',1,'Administrador',2),(47,1,'Cris Emanuele','67534609156',NULL,'62789372','cris@gmail.com','890c6e04e089056366f6d64eb38c3958','92999827524','2004-08-22',1,'IMG-20240802-WA0016.jpg',1,'Administrador',1),(48,1,'Marianalda Souza','44635481135',NULL,'55867184','marinalda@gmail.com','e10adc3949ba59abbe56e057f20f883e','92999827524','1648-05-15',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\5.jpg',1,'Usuario',1),(49,1,'Josiney Quintino','78459755111',NULL,'41698748','josiney@gmail.com','e10adc3949ba59abbe56e057f20f883e','92987787777','1980-08-31',1,'C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\SGI\\img\\logo.png',1,'Usuario',2);
/*!40000 ALTER TABLE `membro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musico`
--

DROP TABLE IF EXISTS `musico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musico` (
  `idmusico` int NOT NULL,
  PRIMARY KEY (`idmusico`),
  UNIQUE KEY `idmusico` (`idmusico`),
  CONSTRAINT `musico_ibfk_1` FOREIGN KEY (`idmusico`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musico`
--

LOCK TABLES `musico` WRITE;
/*!40000 ALTER TABLE `musico` DISABLE KEYS */;
/*!40000 ALTER TABLE `musico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcacaointercessao`
--

DROP TABLE IF EXISTS `orcacaointercessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcacaointercessao` (
  `idoracao` int NOT NULL,
  PRIMARY KEY (`idoracao`),
  UNIQUE KEY `idoracao` (`idoracao`),
  CONSTRAINT `orcacaointercessao_ibfk_1` FOREIGN KEY (`idoracao`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcacaointercessao`
--

LOCK TABLES `orcacaointercessao` WRITE;
/*!40000 ALTER TABLE `orcacaointercessao` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcacaointercessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastor`
--

DROP TABLE IF EXISTS `pastor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pastor` (
  `idpastor` int NOT NULL,
  PRIMARY KEY (`idpastor`),
  UNIQUE KEY `idpastor` (`idpastor`),
  CONSTRAINT `pastor_ibfk_1` FOREIGN KEY (`idpastor`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastor`
--

LOCK TABLES `pastor` WRITE;
/*!40000 ALTER TABLE `pastor` DISABLE KEYS */;
INSERT INTO `pastor` VALUES (31);
/*!40000 ALTER TABLE `pastor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrimonio`
--

DROP TABLE IF EXISTS `patrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrimonio` (
  `idpatrimonio` int NOT NULL AUTO_INCREMENT,
  `ptrnome` varchar(255) NOT NULL,
  `ptridfil` int DEFAULT NULL,
  `ptrdescricao` varchar(255) DEFAULT NULL,
  `ptrvalor` decimal(10,2) DEFAULT NULL,
  `ptrdataaquisicao` date DEFAULT NULL,
  `ptrestado` enum('Novo','Usado','Danificado') DEFAULT NULL,
  PRIMARY KEY (`idpatrimonio`),
  KEY `ptridfil` (`ptridfil`),
  CONSTRAINT `patrimonio_ibfk_1` FOREIGN KEY (`ptridfil`) REFERENCES `filial` (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrimonio`
--

LOCK TABLES `patrimonio` WRITE;
/*!40000 ALTER TABLE `patrimonio` DISABLE KEYS */;
INSERT INTO `patrimonio` VALUES (4,'Caixa de som',2,'Caixa de Som JBL',500.00,'2024-08-02','Novo'),(5,'Bateria ',3,'Bateria da cor vemelha',500.66,'2024-08-02','Usado'),(6,'Guitarra',2,'Guitarra Eletrica da cor preta',500.00,'2024-08-02','Usado'),(7,'Projetor ',1,'Projetor da marca EPSON',560.00,'2024-08-06','Usado');
/*!40000 ALTER TABLE `patrimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porteiro`
--

DROP TABLE IF EXISTS `porteiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porteiro` (
  `idporteiro` int NOT NULL,
  PRIMARY KEY (`idporteiro`),
  UNIQUE KEY `idporteiro` (`idporteiro`),
  CONSTRAINT `porteiro_ibfk_1` FOREIGN KEY (`idporteiro`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porteiro`
--

LOCK TABLES `porteiro` WRITE;
/*!40000 ALTER TABLE `porteiro` DISABLE KEYS */;
INSERT INTO `porteiro` VALUES (26);
/*!40000 ALTER TABLE `porteiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presbitero`
--

DROP TABLE IF EXISTS `presbitero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presbitero` (
  `idpresbitero` int NOT NULL,
  PRIMARY KEY (`idpresbitero`),
  UNIQUE KEY `idpresbitero` (`idpresbitero`),
  CONSTRAINT `presbitero_ibfk_1` FOREIGN KEY (`idpresbitero`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presbitero`
--

LOCK TABLES `presbitero` WRITE;
/*!40000 ALTER TABLE `presbitero` DISABLE KEYS */;
/*!40000 ALTER TABLE `presbitero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secretaria` (
  `idsecretaria` int NOT NULL,
  PRIMARY KEY (`idsecretaria`),
  UNIQUE KEY `idsecretaria` (`idsecretaria`),
  CONSTRAINT `secretaria_ibfk_1` FOREIGN KEY (`idsecretaria`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
INSERT INTO `secretaria` VALUES (22),(25),(41);
/*!40000 ALTER TABLE `secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedetemplo`
--

DROP TABLE IF EXISTS `sedetemplo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedetemplo` (
  `sedid` int NOT NULL AUTO_INCREMENT,
  `sednome` varchar(255) NOT NULL,
  `sedtelefone` varchar(15) NOT NULL,
  `sedemail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sedid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedetemplo`
--

LOCK TABLES `sedetemplo` WRITE;
/*!40000 ALTER TABLE `sedetemplo` DISABLE KEYS */;
INSERT INTO `sedetemplo` VALUES (1,'MANAUS','92999827625','ccjvmanaus@gmail.com');
/*!40000 ALTER TABLE `sedetemplo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sonoplastia`
--

DROP TABLE IF EXISTS `sonoplastia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sonoplastia` (
  `idsonoplastia` int NOT NULL,
  PRIMARY KEY (`idsonoplastia`),
  UNIQUE KEY `idsonoplastia` (`idsonoplastia`),
  CONSTRAINT `sonoplastia_ibfk_1` FOREIGN KEY (`idsonoplastia`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sonoplastia`
--

LOCK TABLES `sonoplastia` WRITE;
/*!40000 ALTER TABLE `sonoplastia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sonoplastia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa` (
  `trfid` int NOT NULL AUTO_INCREMENT,
  `trftitulo` varchar(255) DEFAULT NULL,
  `trffilial` int DEFAULT NULL,
  `trfdescricao` varchar(255) DEFAULT NULL,
  `trfmbrid` int DEFAULT NULL,
  `trfdata` date DEFAULT NULL,
  `trfhora` time DEFAULT NULL,
  `trfstatus` enum('Agendado','Concluido','Cancelado') DEFAULT NULL,
  PRIMARY KEY (`trfid`),
  KEY `trffilial` (`trffilial`),
  KEY `trfmbrid` (`trfmbrid`),
  CONSTRAINT `tarefa_ibfk_1` FOREIGN KEY (`trffilial`) REFERENCES `filial` (`idfilial`),
  CONSTRAINT `tarefa_ibfk_2` FOREIGN KEY (`trfmbrid`) REFERENCES `membro` (`mbrid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (2,'Compra de Matrial de Limpeza',1,'Necess?rio a compra de material de limpeza ',15,'2024-04-16','23:00:00','Concluido'),(3,'Compra de Ingedientes %> %>',1,'Compra de ingrediente para sopa solidaria da semana santa dia 29/03',22,'2024-03-27','08:00:00','Cancelado'),(4,'Compra de Matrial de Limpeza',1,'Necess?rio a compra de material de limpeza ',15,'2024-03-29','23:00:00','Concluido'),(5,'Distribui??o de Comida',1,'Realizar distribuicao de alimentos no dia 29/03',25,'2024-03-27','14:00:00','Concluido'),(6,'Compra de novas Cortinas',1,'Compra de novas de cortinas para o palco ',25,'2024-08-02','19:51:00','Cancelado'),(7,'Roupas para moradores de rua',1,'Angariar roupas para doa��o aos moradores de rua',25,'2024-04-27','15:00:00','Concluido'),(8,'Compras de Ovos de chocolate',2,'Compra de Ovos de chocolate para distribuição ao crianças da Igreja',21,'2024-07-30','19:00:00','Agendado'),(9,'Compra de Equipamentos de Som',1,'Realizar compra de novos equipamentos de som ',15,'2024-08-11','21:10:00','Cancelado'),(10,'Organização de cadeiras ',1,'Organizar as Cadeiras para o culto de 20/04/2024',37,'2024-08-19','17:30:00','Agendado'),(11,'Compra de máterias de Higienização',1,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',15,'2024-08-08','20:06:00','Cancelado'),(12,'Aquisição de Projetor',1,'Necessário a comprar de Data Show (Projetor) para Filial Campos Elisios, fundamental para Culto do dia 21 de Junho',22,'2024-08-20','18:24:00','Concluido'),(13,'Compra de máterias de Higienização',1,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',15,'2024-08-30','19:40:00','Agendado'),(14,'Compra de máterias de Higienização',2,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',15,'2024-08-22','19:41:00','Agendado'),(15,'Compra de máterias de Higienização',1,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',15,'2024-08-30','12:42:00','Agendado'),(16,'Compra de Metrial de Limpeza',1,'Realizar a limpeza das cadeira do templo',15,'2024-08-30','10:44:00','Agendado'),(17,'Limpeza de Cadeiras',1,'Realizar a limpeza das cadeira do templo',15,'2024-09-05','19:45:00','Agendado'),(18,'Compra de Metrial de Limpeza',3,'Necessário a compra de material de limpeza ',15,'2024-08-30','19:46:00','Agendado'),(20,'Compra de ingredientes',1,'Realizar a compra de ingredientes para sopão beneficente do dia 10/08/2024 ',15,'2024-08-09','16:00:00','Agendado'),(22,'Compra de máterias de Higienização',2,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',22,'2024-08-10','16:01:00','Agendado'),(23,'Compra de máterias de Higienização',1,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',22,'2024-08-10','21:08:00','Agendado'),(26,'Organização de cadeiras ',1,'Realizar a compra de máterias de higienização de cadeiras, banheiros e salas.',45,'2024-08-18','14:30:00','Agendado'),(27,'Organização de cadeiras ',1,'Organizar as Cadeiras para o culto de 20/04/2024',45,'2024-08-20','13:58:00','Agendado'),(28,'Organização do Local de palestra',3,'Organizar o local do palestra sobre o bem estar da família',48,'2024-08-31','11:00:00','Agendado');
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_filial`
--

DROP TABLE IF EXISTS `vw_filial`;
/*!50001 DROP VIEW IF EXISTS `vw_filial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_filial` AS SELECT 
 1 AS `idfilial`,
 1 AS `filsedeid`,
 1 AS `filnome`,
 1 AS `filtelefone`,
 1 AS `filemail`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_membros`
--

DROP TABLE IF EXISTS `vw_membros`;
/*!50001 DROP VIEW IF EXISTS `vw_membros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_membros` AS SELECT 
 1 AS `mbrid`,
 1 AS `mbrnome`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bdsgi'
--
/*!50003 DROP FUNCTION IF EXISTS `f_achou_membro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   FUNCTION `f_achou_membro`(p_membro INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE v_achou_membro TINYINT(1) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO v_achou_membro
    FROM membro
    WHERE mbrid = p_membro;
    
    IF v_achou_membro > 0 THEN
        RETURN TRUE;
    ELSE    
        RETURN FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_achou_membro_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   FUNCTION `f_achou_membro_cpf`(p_cpf VARCHAR(20)) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE v_achou_membro TINYINT(1) DEFAULT 0;
   SET v_achou_membro =(SELECT mbrid v_achou_membro
    FROM membro
    WHERE mbrcpf = p_cpf and mbrativo = 1);
    
    IF v_achou_membro > 0 THEN
        RETURN v_achou_membro;
    ELSE    
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_total_dizimo_oferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   FUNCTION `f_total_dizimo_oferta`(p_tipo varchar(20)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2) default 0 ;
   SET v_total =(select sum(dzovalor) from dizimosofertas where dzotipo = p_tipo);
    
    IF v_total > 0 THEN
        RETURN v_total;
    ELSE    
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_total_patrimonio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   FUNCTION `f_total_patrimonio`() RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE v_total DECIMAL(10,2) default 0 ;
   SET v_total =(select sum(ptrvalor) from patrimonio);
    
    IF v_total > 0 THEN
        RETURN v_total;
    ELSE    
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `quantidade_membros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   FUNCTION `quantidade_membros`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE v_achou_membro int default 0 ;
   SET v_achou_membro =(select count(*) from membro where mbrativo =1 and  mbrid  not in(0,1));
    
    IF v_achou_membro > 0 THEN
        RETURN v_achou_membro;
    ELSE    
        RETURN 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_patrimonios_por_filial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `listar_patrimonios_por_filial`(p_ptridfil int)
begin
	declare v_achoufilial boolean default false;
    set v_achoufilial = (select count(*) from filial where idfilial = p_ptridfil);
    
    if v_achoufilial then
    
		select idpatrimonio, ptrnome,filnome,ptrdescricao, ptrvalor, ptrdataaquisicao, ptrestado from patrimonio 
			inner join filial on ptridfil = idfilial where ptridfil = p_ptridfil  order by idpatrimonio;
	else 
		select "Filial Inexistente";
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `novo_dizomo_oferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `novo_dizomo_oferta`(p_membro int,
										p_tipo varchar(50),
										p_valor decimal(10,2),
                                        p_data date)
begin
		
        declare v_existe_membro boolean default false;
        
        set v_existe_membro = (select count(*) from membro where mbrid = p_membro);
        
        if v_existe_membro then
			
				insert dizimosofertas(dzomembroid, dzotipo, dzovalor, dzodtcontribuicao)
                values(p_membro, p_tipo, p_valor, p_data);
		else	
			select 'Não existe membro com essa ID';
		end if;
        
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_aniversariantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_aniversariantes`(p_mes INT)
BEGIN
	SELECT mbrid,mbrnome, SUBSTRING_INDEX(mbrfoto, '\\', -1) AS nome_arquivo, mbrativo, mbrata_nascimento FROM membro 
    WHERE MONTH(mbrata_nascimento)=p_mes AND mbrativo = '1' and mbrid not in(1,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_atualizar_membro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_atualizar_membro`(
    IN p_mbrid INT,
    IN p_mbrsedeid INT,
    IN p_mbrnome VARCHAR(255),
    IN p_mbrcpf VARCHAR(20),
    IN p_mbrsuperior INT,
    IN p_mbrnumero_identidade VARCHAR(20),
    IN p_mbremail VARCHAR(30),
    IN p_mbrtelefone VARCHAR(20),
    IN p_mbrata_nascimento DATE,
    IN p_mbrcivilid INT,
    IN p_mbrativo BOOLEAN,
    IN p_mbracesso ENUM('Administrador', 'Usuario'),
    IN p_endrua VARCHAR(100),
    IN p_endnumero VARCHAR(11),
    IN p_endbairro VARCHAR(100),
    IN p_endcep VARCHAR(10),
    IN p_endcidade VARCHAR(50),
    IN p_endestado VARCHAR(50),
    IN p_cargoSelecao INT, 
    IN p_idfilial INT, 
    IN p_foto varchar(150)
)
BEGIN
    DECLARE mbr_id INT;

    -- Atualiza os dados do membro
    UPDATE membro
    SET
        mbrsedeid = p_mbrsedeid,
        mbrnome = p_mbrnome,
        mbrcpf = p_mbrcpf,
        mbrsuperior = CASE WHEN p_mbrsuperior = 0 THEN NULL ELSE p_mbrsuperior END,
        mbrnumero_identidade = p_mbrnumero_identidade,
        mbremail = p_mbremail,
        mbrtelefone = p_mbrtelefone,
        mbrata_nascimento = p_mbrata_nascimento,
        mbrcivilid = p_mbrcivilid,
        mbrativo = p_mbrativo,
        mbracesso = p_mbracesso,
        mbrfilid = p_idfilial,
        mbrfoto = p_foto
    WHERE mbrid = p_mbrid;

    -- Atualiza o endereço do membro
    UPDATE endereco
    SET
        endrua = p_endrua,
        endnumero = p_endnumero,
        endbairro = p_endbairro,
        endcep = p_endcep,
        endcidade = p_endcidade,
        endestado = p_endestado
    WHERE endmbrid = p_mbrid;

    -- Remove o membro do cargo atual
    CALL sp_remove_membro_cargo(p_mbrid);

    -- Chama a procedure para escolher o novo cargo do membro
    CALL sp_escolhe_cargo(p_mbrid, p_cargoSelecao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_desativar_membro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_desativar_membro`(p_mbrid int)
begin

	declare v_achou_membro boolean default false;
    set v_achou_membro = (select count(*) from membro where mbrid=p_mbrid);
    
    if v_achou_membro then
		update membro set mbrativo = 0 where mbrid = p_mbrid;
	else
		select 'Membro não encontrado' as resposta;
	end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dizimosOfertas_por_tipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_dizimosOfertas_por_tipo`(p_tipo varchar(32))
begin
		select dzovalor, dzodtcontribuicao, filnome  from dizimosofertas
		inner join membro on dzomembroid = mbrid
		inner join filial on mbrfilid = idfilial
		where dzotipo = p_tipo
		order by filnome, dzodtcontribuicao;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dizimo_por_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_dizimo_por_mes`(p_mes char(2), p_ano char(4), p_tipo varchar(15))
begin
			
            select iddizimooferta, mbrnome, filnome,dzodtcontribuicao, dzotipo, dzovalor  from dizimosofertas inner join
			membro on dzomembroid = mbrid
			inner join filial on mbrfilid = idfilial
			where MONTH(dzodtcontribuicao)= p_mes and YEAR(dzodtcontribuicao) = p_ano and dzotipo = p_tipo
            order by iddizimooferta;
        
        end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_editar_tarefa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_editar_tarefa`(p_trfid int,
									p_trftitulo VARCHAR(255),
									p_trffilial INT,
									p_trfdescricao VARCHAR(255),
                                    p_trfmbrid INT,
                                    p_trfdata DATE,
                                    p_trfhora TIME,
                                    p_trfstatus ENUM('Agendado','Concluido','Cancelado'))
BEGIN

	declare v_achou_tarefa boolean default false;
    set v_achou_tarefa = (select count(*) from tarefa where trfid = p_trfid);
    
    if v_achou_tarefa then
		update tarefa set	trftitulo = p_trftitulo,
							trffilial = p_trffilial,
                            trfdescricao = p_trfdescricao,
                            trfmbrid = p_trfmbrid,
                            trfdata = p_trfdata,
                            trfhora = p_trfhora,
                            trfstatus = p_trfstatus
		where trfid = p_trfid ;
	else	
		select 'ID de tarefa invalida' as resposta;
	end if;
                            
        
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_escolhe_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_escolhe_cargo`(
    IN p_mbr_id INT,
    IN p_cargoSelecao INT
)
BEGIN
    DECLARE cargo_id INT;

    IF p_cargoSelecao = 1 THEN
        INSERT INTO pastor (idpastor) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 2 THEN
        INSERT INTO presbitero (idpresbitero) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 3 THEN
        INSERT INTO secretaria (idsecretaria) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 4 THEN
        INSERT INTO diacono (iddiacono) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 5 THEN
        INSERT INTO porteiro (idporteiro) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 6 THEN
        INSERT INTO musico (idmusico) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 7 THEN
        INSERT INTO corallouvor (idcoral) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 8 THEN
        INSERT INTO orcacaointercessao (idoracao) VALUES (p_mbr_id);
    ELSEIF p_cargoSelecao = 9 THEN
        INSERT INTO sonoplastia (idsonoplastia) VALUES (p_mbr_id);
    ELSE
        SET cargo_id = NULL;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_excluir_dizimoOFerta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_excluir_dizimoOFerta`(p_dzoid int)
begin
			declare v_achou_registro boolean default false;
            set v_achou_registro = (select count(*) from dizimosofertas where iddizimooferta = p_dzoid group by iddizimooferta);
            
            if v_achou_registro then
				delete from dizimosofertas where iddizimooferta = p_dzoid;
                select 'Registro Deletado!';
			else
				select 'Registro inexistente!';
			end if;
        end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_filial`()
BEGIN
	SELECT idfilial, filnome FROM filial;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_grupos`(p_grupo VARCHAR(255))
BEGIN
    SELECT
        m.mbrid,
        m.mbrnome,
        m.mbrcpf,
        m.mbremail,
        sednome,
        sup.mbrnome,
        CASE
            WHEN p.idpastor IS NOT NULL THEN 'Pastor'
            WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
            WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
            WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
            WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
            WHEN msc.idmusico IS NOT NULL THEN 'Músico'
            WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
            WHEN oi.idoracao IS NOT NULL THEN 'Oração e Intercessão'
            WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
            ELSE 'Comum'
        END AS cargo,
        filnome
    FROM
        membro m
    INNER JOIN
        sedetemplo ON m.mbrsedeid = sedid
    INNER JOIN
        estadocivil ON m.mbrcivilid = estid
    LEFT JOIN
        membro sup ON m.mbrsuperior = sup.mbrid
    LEFT JOIN
        endereco e ON m.mbrid = e.endmbrid
    LEFT JOIN
        pastor p ON m.mbrid = p.idpastor
    LEFT JOIN
        presbitero pr ON m.mbrid = pr.idpresbitero
    LEFT JOIN
        secretaria s ON m.mbrid = s.idsecretaria
    LEFT JOIN
        diacono d ON m.mbrid = d.iddiacono
    LEFT JOIN
        porteiro pt ON m.mbrid = pt.idporteiro
    LEFT JOIN
        musico msc ON m.mbrid = msc.idmusico
    LEFT JOIN
        corallouvor cl ON m.mbrid = cl.idcoral
    LEFT JOIN
        orcacaointercessao oi ON m.mbrid = oi.idoracao
    LEFT JOIN
        sonoplastia sn ON m.mbrid = sn.idsonoplastia
    INNER JOIN
        filial ON m.mbrfilid = idfilial
    WHERE
        (p_grupo = 'Pastor' AND p.idpastor IS NOT NULL) OR
        (p_grupo = 'Presbítero' AND pr.idpresbitero IS NOT NULL) OR
        (p_grupo = 'Secretaria' AND s.idsecretaria IS NOT NULL) OR
        (p_grupo = 'Diácono' AND d.iddiacono IS NOT NULL) OR
        (p_grupo = 'Porteiro' AND pt.idporteiro IS NOT NULL) OR
        (p_grupo = 'Músico' AND msc.idmusico IS NOT NULL) OR
        (p_grupo = 'Coral de Louvor' AND cl.idcoral IS NOT NULL) OR
        (p_grupo = 'Oração e Intercessão' AND oi.idoracao IS NOT NULL) OR
        (p_grupo = 'Sonoplastia' AND sn.idsonoplastia IS NOT NULL) OR
        (p_grupo = 'Comum' AND p.idpastor IS NULL AND pr.idpresbitero IS NULL AND 
        s.idsecretaria IS NULL AND d.iddiacono IS NULL AND pt.idporteiro IS NULL AND 
        msc.idmusico IS NULL AND cl.idcoral IS NULL AND oi.idoracao IS NULL AND sn.idsonoplastia IS NULL) 
        AND m.mbrativo = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inserir_tarefa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_inserir_tarefa`(p_trftitulo VARCHAR(255),
									p_trffilial INT,
									p_trfdescricao VARCHAR(255),
                                    p_trfmbrid INT,
                                    p_trfdata DATE,
                                    p_trfhora TIME,
                                    p_trfstatus ENUM('Agendado','Concluido','Cancelado'))
BEGIN

	INSERT INTO tarefa(trftitulo, trffilial, trfdescricao, trfmbrid, trfdata, trfhora, trfstatus)
	VALUES (p_trftitulo, p_trffilial, p_trfdescricao, p_trfmbrid, p_trfdata, p_trfhora, p_trfstatus);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_evento_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_listar_evento_card`()
begin
		SELECT evetitulo, evedata, evehora FROM EVENTO where evestatus ='Agendado' order by evedata limit 3 ;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_tarefa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_listar_tarefa`()
begin
SELECT trftitulo, filnome, trfdescricao,  CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus not in ('Concluido', 'Cancelado')
order by trfdata, trfhora;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_tarefa_cancelada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_listar_tarefa_cancelada`()
begin
SELECT trftitulo, filnome, trfdescricao, CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus= 'Cancelado';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_tarefa_concluido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_listar_tarefa_concluido`()
begin
SELECT trftitulo, filnome, trfdescricao, CONCAT(SUBSTRING(mbrnome, 1, LOCATE(' ', mbrnome) - 1), ' ',
    SUBSTRING(mbrnome, LOCATE(' ', mbrnome) + 1, LOCATE(' ', mbrnome, LOCATE(' ', mbrnome) + 1) - LOCATE(' ', mbrnome) - 1)) AS NOME, trfdata, trfhora, trfstatus, trfid
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus= 'Concluido';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_tarefa_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_listar_tarefa_por_id`(p_tarefaid int)
begin
SELECT trfid, trftitulo, filnome, trfdescricao, trfmbrid, trfdata, trfhora, trfstatus
from tarefa inner join filial on trffilial = idfilial
inner join membro on trfmbrid = mbrid where trfstatus not in ('Concluido', 'Cancelado') and trfid = p_tarefaid ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_login`(p_email varchar(80), p_senha varchar(80))
begin
			select mbrnome,  SUBSTRING_INDEX(mbrfoto, '\\', -1) AS nome_arquivo, mbracesso from membro where mbremail = p_email and mbrsenha = p_senha and mbrativo =1;
		end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_membro_dados_nome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_membro_dados_nome`(p_nome VARCHAR(255), p_status Int)
BEGIN
    DECLARE v_achou_membro INT DEFAULT 0;
    SET v_achou_membro = (SELECT COUNT(*) FROM membro WHERE mbrnome LIKE CONCAT('%', p_nome, '%'));
    
    IF v_achou_membro <> 0 THEN 
        SELECT
            m.mbrid,
            m.mbrnome,
            m.mbrcpf,
            m.mbremail,
            sednome,
            sup.mbrnome,
            CASE
                WHEN p.idpastor IS NOT NULL THEN 'Pastor'
                WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
                WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
                WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
                WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
                WHEN msc.idmusico IS NOT NULL THEN 'Músico'
                WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
                WHEN oi.idoracao IS NOT NULL THEN 'Oração e Intercessão'
                WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
                ELSE 'Comum'
            END AS cargo,
		filnome
        FROM
            membro m
        INNER JOIN
            sedetemplo ON m.mbrsedeid = sedid
        INNER JOIN
            estadocivil ON m.mbrcivilid = estid
        LEFT JOIN
            membro sup ON m.mbrsuperior = sup.mbrid
        LEFT JOIN
            endereco e ON m.mbrid = e.endmbrid
        LEFT JOIN
            pastor p ON m.mbrid = p.idpastor
        LEFT JOIN
            presbitero pr ON m.mbrid = pr.idpresbitero
        LEFT JOIN
            secretaria s ON m.mbrid = s.idsecretaria
        LEFT JOIN
            diacono d ON m.mbrid = d.iddiacono
        LEFT JOIN
            porteiro pt ON m.mbrid = pt.idporteiro
        LEFT JOIN
            musico msc ON m.mbrid = msc.idmusico
        LEFT JOIN
            corallouvor cl ON m.mbrid = cl.idcoral
        LEFT JOIN
            orcacaointercessao oi ON m.mbrid = oi.idoracao
        LEFT JOIN
            sonoplastia sn ON m.mbrid = sn.idsonoplastia
		inner join filial on m.mbrfilid = idfilial
        WHERE
            m.mbrnome LIKE CONCAT('%', p_nome, '%') And m.mbrativo = p_status;
    ELSE
        SELECT 'SEM MEMBROS' AS RESPOSTA;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_membro_endereco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_membro_endereco`(
										p_mbrsedeid INT,
										p_mbrnome VARCHAR(255),
										p_mbrcpf VARCHAR(20),
										p_mbrsuperior INT,
										p_mbrnumero_identidade VARCHAR(20),
										p_mbremail VARCHAR(30),
										p_mbrsenha VARCHAR(32),
										p_mbrtelefone VARCHAR(20),
										p_mbrata_nascimento DATE,
										p_mbrcivilid INT,
										p_mbrfoto varchar(255),
										p_mbrativo boolean,
										p_mbracesso ENUM('Administrador','Usuario'),
										p_endrua VARCHAR(100),
										p_endnumero VARCHAR(11),
										p_endbairro VARCHAR(100),
										p_endcep VARCHAR(10),
										p_endcidade VARCHAR(50),
										p_endestado VARCHAR(50),
                                        p_cargoSelecao INT,
                                        p_filial int)
BEGIN
	DECLARE mbr_id INT;
    
    IF p_mbrsuperior = 0 THEN
     INSERT INTO membro (
        mbrsedeid, mbrnome, mbrcpf, mbrsuperior,
        mbrnumero_identidade, mbremail, mbrsenha,
        mbrtelefone, mbrata_nascimento, mbrcivilid,
        mbrfoto, mbrativo, mbracesso, mbrfilid
		)VALUES(p_mbrsedeid, p_mbrnome,  p_mbrcpf, NULL, p_mbrnumero_identidade, 
				p_mbremail, p_mbrsenha, p_mbrtelefone, p_mbrata_nascimento, p_mbrcivilid,
                p_mbrfoto, p_mbrativo, p_mbracesso,p_filial);
	ELSE
     INSERT INTO membro (
        mbrsedeid, mbrnome, mbrcpf, mbrsuperior,
        mbrnumero_identidade, mbremail, mbrsenha,
        mbrtelefone, mbrata_nascimento, mbrcivilid,
        mbrfoto, mbrativo, mbracesso, mbrfilid
		)VALUES(p_mbrsedeid, p_mbrnome,  p_mbrcpf, p_mbrsuperior, p_mbrnumero_identidade, 
				p_mbremail, p_mbrsenha, p_mbrtelefone, p_mbrata_nascimento, p_mbrcivilid,
                p_mbrfoto, p_mbrativo, p_mbracesso,p_filial);
		END IF;
		SET mbr_id = LAST_INSERT_ID();
        
        INSERT INTO endereco (
        endmbrid, endrua, endnumero, endbairro,
        endcep, endcidade, endestado
    ) VALUES (mbr_id, p_endrua, p_endnumero, p_endbairro,
				p_endcep, p_endcidade, p_endestado);
                
	CALL sp_escolhe_cargo(mbr_id, p_cargoSelecao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_membro_e_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_membro_e_cargo`()
BEGIN
    SELECT
        m.mbrid,
        sednome,
        m.mbrnome,
        m.mbrcpf,
        sup.mbrnome,
        m.mbrnumero_identidade,
        m.mbremail,
        m.mbrsenha,
        m.mbrtelefone,
        m.mbrata_nascimento,
        estdescricao,
        SUBSTRING_INDEX(m.mbrfoto, '\\', -1) AS nome_arquivo,
        m.mbrativo,
        m.mbracesso,
        e.endrua,
        e.endnumero,
        e.endbairro,
        e.endcep,
        e.endcidade,
        e.endestado,
        
        
        CASE
            WHEN p.idpastor IS NOT NULL THEN 'Pastor'
            WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
            WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
            WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
            WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
            WHEN msc.idmusico IS NOT NULL THEN 'Músico'
            WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
            WHEN oi.idoracao IS NOT NULL THEN 'Oracao e Intercessão'
            WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
            ELSE 'Comum'
        END AS cargo,
	m.mbrsuperior
   FROM
        membro as m
	INNER JOIN
		sedetemplo ON m.mbrsedeid = sedid
	INNER JOIN
		estadocivil on m.mbrcivilid = estid
	LEFT JOIN
		membro sup ON m.mbrsuperior = sup.mbrid
    LEFT JOIN
        endereco e ON m.mbrid = e.endmbrid
    LEFT JOIN
        pastor p ON m.mbrid = p.idpastor
    LEFT JOIN
        presbitero pr ON m.mbrid = pr.idpresbitero
    LEFT JOIN
        secretaria s ON m.mbrid = s.idsecretaria
    LEFT JOIN
        diacono d ON m.mbrid = d.iddiacono
    LEFT JOIN
        porteiro pt ON m.mbrid = pt.idporteiro
    LEFT JOIN
        musico msc ON m.mbrid = msc.idmusico
    LEFT JOIN
        corallouvor cl ON m.mbrid = cl.idcoral
    LEFT JOIN
        orcacaointercessao oi ON m.mbrid = oi.idoracao
    LEFT JOIN
        sonoplastia sn ON m.mbrid = sn.idsonoplastia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_membro_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_membro_por_id`(p_membroid INT)
BEGIN
    SELECT
        m.mbrid,
        sednome,
        m.mbrnome,
        m.mbrcpf,
        sup.mbrnome,
        m.mbrnumero_identidade,
        m.mbremail,
        m.mbrsenha,
        m.mbrtelefone,
        m.mbrata_nascimento,
        estdescricao,
       SUBSTRING_INDEX(m.mbrfoto, '\\', -1) AS nome_arquivo,
        m.mbrativo,
        m.mbracesso,
        e.endrua,
        e.endnumero,
        e.endbairro,
        e.endcep,
        e.endcidade,
        e.endestado,
        
        CASE
            WHEN p.idpastor IS NOT NULL THEN 'Pastor'
            WHEN pr.idpresbitero IS NOT NULL THEN 'Presbítero'
            WHEN s.idsecretaria IS NOT NULL THEN 'Secretaria'
            WHEN d.iddiacono IS NOT NULL THEN 'Diácono'
            WHEN pt.idporteiro IS NOT NULL THEN 'Porteiro'
            WHEN msc.idmusico IS NOT NULL THEN 'Músico'
            WHEN cl.idcoral IS NOT NULL THEN 'Coral de Louvor'
            WHEN oi.idoracao IS NOT NULL THEN 'Oracao e Intercessão'
            WHEN sn.idsonoplastia IS NOT NULL THEN 'Sonoplastia'
            ELSE 'Comum'
        END AS cargo,
        m.mbrsuperior ,
        filnome,
        m.mbrfoto
    FROM
        membro m
	INNER JOIN
		sedetemplo ON m.mbrsedeid = sedid
	INNER JOIN
		estadocivil on m.mbrcivilid = estid
	INNER JOIN
		filial on mbrfilid = idfilial
	LEFT JOIN
		membro sup ON m.mbrsuperior = sup.mbrid
    LEFT JOIN
        endereco e ON m.mbrid = e.endmbrid
    LEFT JOIN
        pastor p ON m.mbrid = p.idpastor
    LEFT JOIN
        presbitero pr ON m.mbrid = pr.idpresbitero
    LEFT JOIN
        secretaria s ON m.mbrid = s.idsecretaria
    LEFT JOIN
        diacono d ON m.mbrid = d.iddiacono
    LEFT JOIN
        porteiro pt ON m.mbrid = pt.idporteiro
    LEFT JOIN
        musico msc ON m.mbrid = msc.idmusico
    LEFT JOIN
        corallouvor cl ON m.mbrid = cl.idcoral
    LEFT JOIN
        orcacaointercessao oi ON m.mbrid = oi.idoracao
    LEFT JOIN
        sonoplastia sn ON m.mbrid = sn.idsonoplastia

	WHERE m.mbrid = p_membroid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_remove_membro_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE    PROCEDURE `sp_remove_membro_cargo`(
    IN p_mbr_id INT
)
BEGIN
    DECLARE cargo_id INT;

    -- Verifica se o membro está em algum cargo e obtém o cargo_id
    SELECT
        CASE
            WHEN EXISTS (SELECT 1 FROM pastor WHERE idpastor = p_mbr_id) THEN 1
            WHEN EXISTS (SELECT 1 FROM presbitero WHERE idpresbitero = p_mbr_id) THEN 2
            WHEN EXISTS (SELECT 1 FROM secretaria WHERE idsecretaria = p_mbr_id) THEN 3
            WHEN EXISTS (SELECT 1 FROM diacono WHERE iddiacono = p_mbr_id) THEN 4
            WHEN EXISTS (SELECT 1 FROM porteiro WHERE idporteiro = p_mbr_id) THEN 5
            WHEN EXISTS (SELECT 1 FROM musico WHERE idmusico = p_mbr_id) THEN 6
            WHEN EXISTS (SELECT 1 FROM corallouvor WHERE idcoral = p_mbr_id) THEN 7
            WHEN EXISTS (SELECT 1 FROM orcacaointercessao WHERE idoracao = p_mbr_id) THEN 8
            WHEN EXISTS (SELECT 1 FROM sonoplastia WHERE idsonoplastia = p_mbr_id) THEN 9
            ELSE NULL
        END INTO cargo_id;

    -- Remove o membro do cargo
    CASE cargo_id
        WHEN 1 THEN
            DELETE FROM pastor WHERE idpastor = p_mbr_id;
        WHEN 2 THEN
            DELETE FROM presbitero WHERE idpresbitero = p_mbr_id;
        WHEN 3 THEN
            DELETE FROM secretaria WHERE idsecretaria = p_mbr_id;
        WHEN 4 THEN
            DELETE FROM diacono WHERE iddiacono = p_mbr_id;
        WHEN 5 THEN
            DELETE FROM porteiro WHERE idporteiro = p_mbr_id;
        WHEN 6 THEN
            DELETE FROM musico WHERE idmusico = p_mbr_id;
        WHEN 7 THEN
            DELETE FROM corallouvor WHERE idcoral = p_mbr_id;
        WHEN 8 THEN
            DELETE FROM orcacaointercessao WHERE idoracao = p_mbr_id;
        WHEN 9 THEN
            DELETE FROM sonoplastia WHERE idsonoplastia = p_mbr_id;
        ELSE
        SELECT 'NENHUM CARGO ENCONTRADO' AS RESPOSTA;

    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_total_dizimo_oferta_mesano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_total_dizimo_oferta_mesano`(p_mes int, p_ano int, p_tipo varchar(20))
begin
		select sum(dzovalor) from dizimosofertas where MONTH(dzodtcontribuicao) = p_mes and year(dzodtcontribuicao) = p_ano and dzotipo = p_tipo;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_trocar_a_senha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE   PROCEDURE `sp_trocar_a_senha`(p_nova_senha varchar(32), p_membroid int)
begin
		update membro set mbrsenha = p_nova_senha where mbrid = p_membroid;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_filial`
--

/*!50001 DROP VIEW IF EXISTS `vw_filial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `vw_filial` AS select `filial`.`idfilial` AS `idfilial`,`filial`.`filsedeid` AS `filsedeid`,`filial`.`filnome` AS `filnome`,`filial`.`filtelefone` AS `filtelefone`,`filial`.`filemail` AS `filemail` from `filial` where (`filial`.`idfilial` <> 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_membros`
--

/*!50001 DROP VIEW IF EXISTS `vw_membros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013   SQL SECURITY DEFINER */
/*!50001 VIEW `vw_membros` AS select `membro`.`mbrid` AS `mbrid`,`membro`.`mbrnome` AS `mbrnome` from `membro` where (`membro`.`mbrid` not in (1,0)) order by `membro`.`mbrnome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 13:17:21
