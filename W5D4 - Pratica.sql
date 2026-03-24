-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: filieraw5da
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `aziendaagricola`
--

DROP TABLE IF EXISTS `aziendaagricola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aziendaagricola` (
  `ID_Azienda` int NOT NULL,
  `NomeAzienda` varchar(100) NOT NULL,
  `Provincia` varchar(50) NOT NULL,
  `PIVA` char(11) NOT NULL,
  PRIMARY KEY (`ID_Azienda`),
  UNIQUE KEY `PIVA` (`PIVA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aziendaagricola`
--

LOCK TABLES `aziendaagricola` WRITE;
/*!40000 ALTER TABLE `aziendaagricola` DISABLE KEYS */;
INSERT INTO `aziendaagricola` VALUES (1,'Azienda Agricola Frantoiani','Taranto','01234567890'),(2,'Oliveti del Sud','Brindisi','09876543210');
/*!40000 ALTER TABLE `aziendaagricola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificazione`
--

DROP TABLE IF EXISTS `certificazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificazione` (
  `ID_Certificazione` int NOT NULL,
  `ID_Organismo` int NOT NULL,
  `ID_Lotto` int NOT NULL,
  `DataCertificazione` date NOT NULL,
  `Esito` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Certificazione`),
  UNIQUE KEY `ID_Lotto` (`ID_Lotto`),
  KEY `ID_Organismo` (`ID_Organismo`),
  CONSTRAINT `certificazione_ibfk_1` FOREIGN KEY (`ID_Organismo`) REFERENCES `organismocontrollo` (`ID_Organismo`),
  CONSTRAINT `certificazione_ibfk_2` FOREIGN KEY (`ID_Lotto`) REFERENCES `lottodop` (`ID_Lotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificazione`
--

LOCK TABLES `certificazione` WRITE;
/*!40000 ALTER TABLE `certificazione` DISABLE KEYS */;
INSERT INTO `certificazione` VALUES (3001,1,9001,'2025-12-10',1),(3002,1,9002,'2025-12-11',1),(3003,2,9003,'2025-12-10',0);
/*!40000 ALTER TABLE `certificazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL,
  `NomeRagioneSociale` varchar(150) NOT NULL,
  `Indirizzo` varchar(200) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1001,'Ristorante Il Trullo','Via Mercato 12, Martina Franca','0801234567'),(1002,'Gourmet Italia Srl','Via Roma 88, Bari','0807654321');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confezionamento`
--

DROP TABLE IF EXISTS `confezionamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confezionamento` (
  `ID_Confezionamento` int NOT NULL,
  `ID_Lotto` int NOT NULL,
  `DataConfezionamento` date NOT NULL,
  `FormatoLitri` decimal(3,2) NOT NULL,
  `NumeroBottiglie` int NOT NULL,
  `EtichettaDOP` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Confezionamento`),
  KEY `ID_Lotto` (`ID_Lotto`),
  CONSTRAINT `confezionamento_ibfk_1` FOREIGN KEY (`ID_Lotto`) REFERENCES `lottodop` (`ID_Lotto`),
  CONSTRAINT `confezionamento_chk_1` CHECK ((`FormatoLitri` in (0.5,0.75,1.0,3.0,5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confezionamento`
--

LOCK TABLES `confezionamento` WRITE;
/*!40000 ALTER TABLE `confezionamento` DISABLE KEYS */;
INSERT INTO `confezionamento` VALUES (4001,9001,'2025-12-12',0.75,300,1),(4002,9002,'2025-12-13',0.50,500,1);
/*!40000 ALTER TABLE `confezionamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frangitura`
--

DROP TABLE IF EXISTS `frangitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frangitura` (
  `ID_Frangitura` int NOT NULL,
  `ID_Raccolta` int NOT NULL,
  `ID_Frantoio` int NOT NULL,
  `DataFrangitura` date NOT NULL,
  `ResaPercento` decimal(5,2) NOT NULL,
  `QuantitaLitri` decimal(10,2) NOT NULL,
  `TemperaturaEstrattiva` decimal(4,1) NOT NULL,
  PRIMARY KEY (`ID_Frangitura`),
  KEY `ID_Raccolta` (`ID_Raccolta`),
  KEY `ID_Frantoio` (`ID_Frantoio`),
  CONSTRAINT `frangitura_ibfk_1` FOREIGN KEY (`ID_Raccolta`) REFERENCES `raccolta` (`ID_Raccolta`),
  CONSTRAINT `frangitura_ibfk_2` FOREIGN KEY (`ID_Frantoio`) REFERENCES `frantoio` (`ID_Frantoio`),
  CONSTRAINT `frangitura_chk_1` CHECK ((`TemperaturaEstrattiva` < 27))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frangitura`
--

LOCK TABLES `frangitura` WRITE;
/*!40000 ALTER TABLE `frangitura` DISABLE KEYS */;
INSERT INTO `frangitura` VALUES (7001,5001,10,'2025-12-06',14.50,260.00,25.0),(7002,5002,10,'2025-12-08',15.00,330.00,24.5),(7003,6001,11,'2025-12-07',16.20,405.00,26.0);
/*!40000 ALTER TABLE `frangitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frantoio`
--

DROP TABLE IF EXISTS `frantoio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frantoio` (
  `ID_Frantoio` int NOT NULL,
  `Provincia` varchar(50) NOT NULL,
  `NumeroRegistrazione` varchar(50) NOT NULL,
  `CertificatoDOP` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Frantoio`),
  UNIQUE KEY `NumeroRegistrazione` (`NumeroRegistrazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frantoio`
--

LOCK TABLES `frantoio` WRITE;
/*!40000 ALTER TABLE `frantoio` DISABLE KEYS */;
INSERT INTO `frantoio` VALUES (10,'Taranto','FR-TA-001',1),(11,'Brindisi','FR-BR-014',1);
/*!40000 ALTER TABLE `frantoio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lottodop`
--

DROP TABLE IF EXISTS `lottodop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lottodop` (
  `ID_Lotto` int NOT NULL,
  `ID_Frangitura` int NOT NULL,
  `DataProduzione` date NOT NULL,
  `Acidita` decimal(4,2) NOT NULL,
  `Perossidi` decimal(5,2) NOT NULL,
  `PanelTestIdoneo` tinyint(1) NOT NULL,
  `QuantitaLitri` decimal(10,2) NOT NULL,
  `CertificazioneConformita` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Lotto`),
  KEY `ID_Frangitura` (`ID_Frangitura`),
  CONSTRAINT `lottodop_ibfk_1` FOREIGN KEY (`ID_Frangitura`) REFERENCES `frangitura` (`ID_Frangitura`),
  CONSTRAINT `lottodop_chk_1` CHECK ((`Acidita` < 0.8)),
  CONSTRAINT `lottodop_chk_2` CHECK ((`Perossidi` < 20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lottodop`
--

LOCK TABLES `lottodop` WRITE;
/*!40000 ALTER TABLE `lottodop` DISABLE KEYS */;
INSERT INTO `lottodop` VALUES (9001,7001,'2025-12-06',0.35,12.00,1,260.00,1),(9002,7002,'2025-12-08',0.40,15.00,1,330.00,1),(9003,7003,'2025-12-07',0.75,18.00,1,405.00,0);
/*!40000 ALTER TABLE `lottodop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `ID_Ordine` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  `ID_Confezionamento` int NOT NULL,
  `DataOrdine` date NOT NULL,
  `QuantitaBottiglie` int NOT NULL,
  `PrezzoTotale` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Ordine`),
  KEY `ID_Cliente` (`ID_Cliente`),
  KEY `ID_Confezionamento` (`ID_Confezionamento`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  CONSTRAINT `ordine_ibfk_2` FOREIGN KEY (`ID_Confezionamento`) REFERENCES `confezionamento` (`ID_Confezionamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (8001,1001,4001,'2025-12-15',50,650.00),(8002,1002,4002,'2025-12-16',120,900.00);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organismocontrollo`
--

DROP TABLE IF EXISTS `organismocontrollo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organismocontrollo` (
  `ID_Organismo` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CodiceAccreditamento` varchar(50) NOT NULL,
  `Sede` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Organismo`),
  UNIQUE KEY `CodiceAccreditamento` (`CodiceAccreditamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organismocontrollo`
--

LOCK TABLES `organismocontrollo` WRITE;
/*!40000 ALTER TABLE `organismocontrollo` DISABLE KEYS */;
INSERT INTO `organismocontrollo` VALUES (1,'Organismo DOP Puglia','ACC-001','Bari'),(2,'Consorzio Qualità Olivicola','ACC-045','Lecce');
/*!40000 ALTER TABLE `organismocontrollo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raccolta`
--

DROP TABLE IF EXISTS `raccolta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raccolta` (
  `ID_Raccolta` int NOT NULL,
  `ID_Uliveto` int NOT NULL,
  `DataRaccolta` date NOT NULL,
  `MetodoRaccolta` varchar(100) DEFAULT NULL,
  `QuantitaKg` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Raccolta`),
  KEY `ID_Uliveto` (`ID_Uliveto`),
  CONSTRAINT `raccolta_ibfk_1` FOREIGN KEY (`ID_Uliveto`) REFERENCES `uliveto` (`ID_Uliveto`),
  CONSTRAINT `raccolta_chk_1` CHECK (((month(`DataRaccolta`) = 12) and (dayofmonth(`DataRaccolta`) between 3 and 12)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raccolta`
--

LOCK TABLES `raccolta` WRITE;
/*!40000 ALTER TABLE `raccolta` DISABLE KEYS */;
INSERT INTO `raccolta` VALUES (5001,101,'2025-12-05','Brucatura',1800.00),(5002,102,'2025-12-07','Agevolata',2200.00),(6001,201,'2025-12-06','Brucatura',2500.00);
/*!40000 ALTER TABLE `raccolta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uliveto`
--

DROP TABLE IF EXISTS `uliveto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uliveto` (
  `ID_Uliveto` int NOT NULL,
  `ID_Azienda` int NOT NULL,
  `Localita` varchar(100) NOT NULL,
  `Varieta` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Uliveto`),
  KEY `ID_Azienda` (`ID_Azienda`),
  CONSTRAINT `uliveto_ibfk_1` FOREIGN KEY (`ID_Azienda`) REFERENCES `aziendaagricola` (`ID_Azienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uliveto`
--

LOCK TABLES `uliveto` WRITE;
/*!40000 ALTER TABLE `uliveto` DISABLE KEYS */;
INSERT INTO `uliveto` VALUES (101,1,'Contrada San Paolo','Ogliarola'),(102,1,'Monte Fellone','Leccino'),(201,2,'Piana degli Ulivi','Coratina');
/*!40000 ALTER TABLE `uliveto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 20:49:24
