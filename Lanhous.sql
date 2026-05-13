-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lan_house
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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `idaudit_log` int NOT NULL AUTO_INCREMENT,
  `tipo_acao` varchar(45) DEFAULT NULL,
  `detalhes_acao` text,
  `data_acao` datetime DEFAULT NULL,
  `usuario_acao` varchar(45) DEFAULT NULL,
  `tabela_afetada` varchar(45) DEFAULT NULL,
  `id_registros` int DEFAULT NULL,
  PRIMARY KEY (`idaudit_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idcompra` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `CLIENTE_id_cliente` int NOT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `CLIENTE_id_cliente` (`CLIENTE_id_cliente`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`CLIENTE_id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computador` (
  `idcomputadores` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`idcomputadores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo` (
  `idCONSUMO` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `PRODUTOS_idproduto` int NOT NULL,
  `SESSAO_idsessao` int NOT NULL,
  PRIMARY KEY (`idCONSUMO`),
  KEY `PRODUTOS_idproduto` (`PRODUTOS_idproduto`),
  KEY `SESSAO_idsessao` (`SESSAO_idsessao`),
  CONSTRAINT `consumo_ibfk_1` FOREIGN KEY (`PRODUTOS_idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `consumo_ibfk_2` FOREIGN KEY (`SESSAO_idsessao`) REFERENCES `sessao` (`idsessao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscricao` (
  `idinscricao` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  `data_inscricao` date DEFAULT NULL,
  `CLIENTE_id_cliente` int NOT NULL,
  `TORNEIO_idtorneio` int NOT NULL,
  PRIMARY KEY (`idinscricao`),
  KEY `CLIENTE_id_cliente` (`CLIENTE_id_cliente`),
  KEY `TORNEIO_idtorneio` (`TORNEIO_idtorneio`),
  CONSTRAINT `inscricao_ibfk_1` FOREIGN KEY (`CLIENTE_id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `inscricao_ibfk_2` FOREIGN KEY (`TORNEIO_idtorneio`) REFERENCES `torneio` (`idtorneio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_produto`
--

DROP TABLE IF EXISTS `item_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_produto` (
  `quantidade` int NOT NULL,
  `PRODUTOS_idproduto` int NOT NULL,
  `COMPRA_idcompra` int NOT NULL,
  PRIMARY KEY (`PRODUTOS_idproduto`,`COMPRA_idcompra`),
  KEY `COMPRA_idcompra` (`COMPRA_idcompra`),
  CONSTRAINT `item_produto_ibfk_1` FOREIGN KEY (`PRODUTOS_idproduto`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `item_produto_ibfk_2` FOREIGN KEY (`COMPRA_idcompra`) REFERENCES `compra` (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessao` (
  `idsessao` int NOT NULL AUTO_INCREMENT,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `CLIENTE_id_cliente` int NOT NULL,
  `COMPUTADORES_idcomputadores` int NOT NULL,
  PRIMARY KEY (`idsessao`),
  KEY `CLIENTE_id_cliente` (`CLIENTE_id_cliente`),
  KEY `COMPUTADORES_idcomputadores` (`COMPUTADORES_idcomputadores`),
  CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`CLIENTE_id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`COMPUTADORES_idcomputadores`) REFERENCES `computador` (`idcomputadores`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `torneio`
--

DROP TABLE IF EXISTS `torneio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneio` (
  `idtorneio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `premiacao` varchar(45) DEFAULT NULL,
  `jogo` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtorneio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 23:30:22
