-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: formativahogwarts
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventoFk` bigint NOT NULL,
  `usuarioFk` bigint NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `eventoFk` (`eventoFk`),
  KEY `usuarioFk` (`usuarioFk`),
  CONSTRAINT `checkIn_ibfk_1` FOREIGN KEY (`eventoFk`) REFERENCES `eventos` (`id`),
  CONSTRAINT `checkIn_ibfk_2` FOREIGN KEY (`usuarioFk`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES (1,1,1,'2023-05-23 00:21:13'),(2,1,2,'2023-05-23 00:21:13'),(3,1,5,'2023-05-23 00:21:13'),(4,2,2,'2023-05-23 00:21:13'),(5,2,4,'2023-05-23 00:21:13'),(6,2,5,'2023-05-23 00:21:13'),(7,2,6,'2023-05-23 00:21:13'),(8,3,1,'2023-05-23 00:21:13'),(9,3,6,'2023-05-23 00:21:13'),(10,4,3,'2023-05-23 00:21:13'),(11,4,4,'2023-05-23 00:21:13'),(12,4,5,'2023-05-23 00:21:13'),(13,1,5,'2023-05-23 01:40:58'),(14,1,6,'2023-05-23 01:40:58');
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `localFk` bigint NOT NULL,
  `itemFk` bigint NOT NULL,
  `qtd` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  KEY `itemFk` (`itemFk`),
  CONSTRAINT `checkList_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`),
  CONSTRAINT `checkList_ibfk_2` FOREIGN KEY (`itemFk`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
INSERT INTO `checklist` VALUES (1,1,1,1),(2,1,2,1),(3,1,5,1),(4,2,1,1),(5,2,5,1),(6,3,3,1),(7,3,2,1),(8,4,1,1),(9,4,2,1),(10,4,3,1),(11,4,5,1);
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `tarefaFK` bigint NOT NULL,
  `statusFK` bigint NOT NULL,
  `horaEnvio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tarefaFK` (`tarefaFK`),
  KEY `statusFK` (`statusFK`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`tarefaFK`) REFERENCES `tarefa` (`id`),
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`statusFK`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Tarefa será realizada assim que possível',1,1,'2023-06-03 18:01:18'),(2,'Tarefa está sendo realizada',2,2,'2023-06-03 18:01:18'),(3,'Tarefa finalizada',2,3,'2023-06-03 18:01:18'),(4,'Ocorreu um problema',3,4,'2023-06-03 18:01:18');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `localFk` bigint NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `inicioCheckIn` datetime NOT NULL,
  `fimCheckIn` datetime NOT NULL,
  `vagas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFk` (`localFk`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`localFk`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Workshop Cloud Básico',5,'2023-07-07 18:45:00','2023-07-07 23:10:00','2023-06-07 18:45:00','2023-07-07 18:45:00',32),(2,'Desenho Técnico SolidWorks',5,'2023-08-01 18:45:00','2023-08-02 23:10:00','2023-06-08 18:45:00','2023-08-01 18:45:00',32),(3,'Ensaios Mecânicos Avançados',4,'2023-12-01 18:45:00','2023-12-02 23:10:00','2023-12-08 18:45:00','2023-12-01 18:45:00',30),(4,'Conquistando o primeiro milhão',2,'2023-12-12 18:45:00','2023-12-12 23:10:00','2023-12-12 18:45:00','2023-12-12 18:45:00',100),(5,'Como fazer ovo de pascoa',1,'2023-01-01 18:45:00','2023-01-01 23:10:00','2023-01-01 18:45:00','2023-01-01 18:45:00',16);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicotarefas`
--

DROP TABLE IF EXISTS `historicotarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicotarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tarefaFK` bigint NOT NULL,
  `statusFK` bigint NOT NULL,
  `inicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tarefaFK` (`tarefaFK`),
  KEY `statusFK` (`statusFK`),
  CONSTRAINT `historicotarefas_ibfk_1` FOREIGN KEY (`tarefaFK`) REFERENCES `tarefa` (`id`),
  CONSTRAINT `historicotarefas_ibfk_2` FOREIGN KEY (`statusFK`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicotarefas`
--

LOCK TABLES `historicotarefas` WRITE;
/*!40000 ALTER TABLE `historicotarefas` DISABLE KEYS */;
INSERT INTO `historicotarefas` VALUES (1,1,2,'2023-06-03 00:00:00'),(2,2,3,'2023-03-01 00:00:00'),(3,3,4,'2023-05-29 00:00:00'),(4,1,1,'2023-06-03 00:00:00');
/*!40000 ALTER TABLE `historicotarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Projetor'),(2,'Ar condicionado'),(3,'Lousa digital'),(4,'Home Theater'),(5,'Ipad'),(6,'Ferro de Solda');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locais`
--

DROP TABLE IF EXISTS `locais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locais` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `bloco` enum('A','B','C','D') NOT NULL,
  `lotacao` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locais`
--

LOCK TABLES `locais` WRITE;
/*!40000 ALTER TABLE `locais` DISABLE KEYS */;
INSERT INTO `locais` VALUES (1,'Laboratório Eletrônica 01','A',16),(2,'Auditório','C',100),(3,'Laboratório Eletrônica 02','B',16),(4,'Laboratório Mecânica 01','A',30),(5,'Laboratório Informática 01','D',32);
/*!40000 ALTER TABLE `locais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelacesso`
--

DROP TABLE IF EXISTS `nivelacesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelacesso` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nivel` varchar(100) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelacesso`
--

LOCK TABLES `nivelacesso` WRITE;
/*!40000 ALTER TABLE `nivelacesso` DISABLE KEYS */;
INSERT INTO `nivelacesso` VALUES (1,'Admin','blablá'),(2,'Gestor','blablá'),(3,'Usuário','blablá'),(4,'Visitante','blablá');
/*!40000 ALTER TABLE `nivelacesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacao`
--

DROP TABLE IF EXISTS `ocupacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `nivelAcessoFk` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nivelAcessoFk` (`nivelAcessoFk`),
  CONSTRAINT `ocupacao_ibfk_1` FOREIGN KEY (`nivelAcessoFk`) REFERENCES `nivelacesso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacao`
--

LOCK TABLES `ocupacao` WRITE;
/*!40000 ALTER TABLE `ocupacao` DISABLE KEYS */;
INSERT INTO `ocupacao` VALUES (1,'Professor',3),(2,'Secretaria',3),(3,'Coordenador',2),(4,'Orientador',2),(5,'Aluno',4),(6,'TI',1);
/*!40000 ALTER TABLE `ocupacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tarefaFK` bigint NOT NULL,
  `responsavelFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tarefaFK` (`tarefaFK`),
  KEY `responsavelFK` (`responsavelFK`),
  CONSTRAINT `responsaveis_ibfk_1` FOREIGN KEY (`tarefaFK`) REFERENCES `tarefa` (`id`),
  CONSTRAINT `responsaveis_ibfk_2` FOREIGN KEY (`responsavelFK`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveis`
--

LOCK TABLES `responsaveis` WRITE;
/*!40000 ALTER TABLE `responsaveis` DISABLE KEYS */;
INSERT INTO `responsaveis` VALUES (1,1,3),(2,1,4),(3,2,1),(4,2,2),(5,2,4),(6,3,4);
/*!40000 ALTER TABLE `responsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Não iniciada'),(2,'Em andamento'),(3,'Concluída'),(4,'Erro');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(400) NOT NULL,
  `prazoExecDias` int NOT NULL,
  `dataAbert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataFim` datetime DEFAULT NULL,
  `localFK` bigint NOT NULL,
  `usuarioFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFK` (`localFK`),
  KEY `usuarioFK` (`usuarioFK`),
  CONSTRAINT `tarefa_ibfk_1` FOREIGN KEY (`localFK`) REFERENCES `locais` (`id`),
  CONSTRAINT `tarefa_ibfk_2` FOREIGN KEY (`usuarioFK`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (1,'Conserto computador','Computador não está ligando',3,'2023-06-03 17:23:26',NULL,2,4),(2,'Verificar ar condicionado','Os alunos estão reclamando que o ar condicionado não refrigera a sala',5,'2023-06-03 17:23:26',NULL,1,4),(3,'Tablet riscado','A tela do tablet está riscada e interfere no uso',2,'2023-06-03 17:23:26',NULL,1,1),(4,'Conserto ventilador','Ventilador não gira',3,'2023-06-04 00:01:07',NULL,2,2),(5,'Teclado do PC','Teclas Enter e Space do teclado do pc 1 não funcionam',2,'2023-06-04 00:01:07',NULL,3,4),(6,'Conserto computador','Computador não tem internet',1,'2023-06-04 00:02:38',NULL,2,1);
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `dataNascimento` date NOT NULL,
  `senha` varchar(30) NOT NULL,
  `dataCadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ocupacaoFk` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ocupacaoFk` (`ocupacaoFk`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ocupacaoFk`) REFERENCES `ocupacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (7,'João','joao@gmail.com','2000-01-01','55s888ff','2023-05-22 23:56:10',1,1),(8,'Mara','mara@gmail.com','1986-01-03','554333','2023-05-22 23:56:10',2,1),(9,'Clarice','clarice@gmail.com','1999-03-01','54455s888ff','2023-05-22 23:56:10',3,1),(10,'Roberto','roberto@gmail.com','2001-01-21','6666444','2023-05-22 23:56:10',4,1),(11,'Miguel','miguel@gmail.com','1995-03-03','3354','2023-05-22 23:56:10',1,1),(12,'Lúcia','lucia@gmail.com','1970-05-25','abbbcdd','2023-05-22 23:56:10',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'formativahogwarts'
--

--
-- Dumping routines for database 'formativahogwarts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04 19:27:54
