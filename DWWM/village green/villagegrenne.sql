-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: villagegreen3
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

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
-- Current Database: `villagegreen3`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `villagegreen3` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `villagegreen3`;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `refClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(50) NOT NULL,
  `prenomClient` varchar(50) NOT NULL,
  `adresseClient` varchar(200) NOT NULL,
  `numeroTelClient` int(11) NOT NULL,
  `statutClient` varchar(10) NOT NULL,
  `refCommercial` int(11) NOT NULL,
  PRIMARY KEY (`refClient`),
  KEY `client_commercial_FK` (`refCommercial`),
  KEY `vue` (`refClient`),
  CONSTRAINT `client_commercial_FK` FOREIGN KEY (`refCommercial`) REFERENCES `commercial` (`refCommercial`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'DUMONT','JOEL','130 rue poulainville amiens',672000001,'oui',101),(2,'DUPOND','ERIC','301 rue de paix paris',705121313,'oui',102),(3,'JARDIN','VINCENT','15 rue du puit lille',604211524,'non',103),(4,'DUJARDIN','NICOLAS','122 rue verte toulouse',609217325,'oui',104),(5,'ROUX','JEAN','127 rue blue nimes',603215321,'oui',105),(6,'LEPROUX','ALAIN','233 rue verte toulouse',602213323,'non',106),(7,'CHALLAND','JACKY','283 rue ZODIAC strazbourg',644210327,'oui',107),(8,'MARTIN','BRUNO','250 rue vannes strazbourg',625270322,'oui',108),(9,'LEGROS','JACQUES','58 rue ferier bordeau',692210321,'non',109),(10,'MALLY','PIERRE','123 rue canard nantere',774210325,'non',110),(11,'VEGROS','JACQUES','58 rue ferier bordeau',692210321,'non',109),(12,'ZALLY','PIERRE','123 rue canard nantere',774210325,'non',110);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `refCommande` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `dateExpedition` date NOT NULL,
  `adresseLivraisonClient` varchar(200) NOT NULL,
  `adresseDeFacturation` varchar(50) NOT NULL,
  `qtecdeclient` int(11) NOT NULL,
  `pvht` int(11) NOT NULL,
  `reduction` double NOT NULL,
  `ttva` double NOT NULL,
  `pttc` int(11) NOT NULL,
  `bonDeLivraison` varchar(10) NOT NULL,
  `datefacturation` date NOT NULL,
  `refClient` int(11) NOT NULL,
  PRIMARY KEY (`refCommande`),
  KEY `commande_client_FK` (`refClient`),
  KEY `voir` (`refCommande`),
  CONSTRAINT `commande_client_FK` FOREIGN KEY (`refClient`) REFERENCES `client` (`refClient`)
) ENGINE=InnoDB AUTO_INCREMENT=141030 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (141018,'2015-10-01','2015-10-02','100 rue afpa amiens','100 rue afpa amiens',2,150,0,0.2,360,'BL25426','2015-10-02',1),(141019,'2015-10-01','2015-10-02','100 rue afpa amiens','100 rue afpa amiens',4,500,0,0.1,2200,'BL25427','2015-10-02',1),(141020,'2018-02-01','2018-03-02','130 rue poulainville amiens','130 rue poulainville amiens',800,130,0.1,0.2,112320,'BL130','2018-02-25',1),(141021,'2018-04-03','2018-05-17','301 rue de paix paris','301 rue de paix paris',1200,90,0.1,0.2,116640,'BL134','2018-04-25',2),(141022,'2018-05-03','2018-06-09','15 rue du puit lille','15 rue du puit lille',1000,790,0.1,0.2,853200,'BL136','2018-06-07',3),(141023,'2018-02-07','2018-03-15','122 rue verte toulouse','122 rue verte toulouse',1000,90,0.1,0.2,97200,'BL131','2018-02-25',4),(141024,'2018-07-27','2018-08-04','127 rue blue nimes','127 rue blue nimes',1200,800,0.1,0.2,1036000,'BL137','2018-08-01',5),(141025,'2018-11-14','2018-10-10','233 rue verte toulouse','233 rue verte toulouse',1500,195,0.1,0.2,315900,'BL139','2018-10-15',6),(141026,'2018-09-12','2018-10-05','283 rue DIALLO strazbourg','283 rue DIALLO strazbourg',2200,2900,0.2,0.1,5614400,'BL140','2018-11-15',7),(141027,'2018-02-17','2018-03-12','250 rue vannes strazbourg','250 rue vannes strazbourg',2000,6200,0.25,0.1,10230000,'BL132','2018-03-05',8),(141028,'2018-04-01','2018-05-16','58 rue ferier bordeau','58 rue ferier bordeau',2500,710,0.1,0.2,1917000,'BL135','2018-04-30',9),(141029,'2018-12-21','2018-09-25','123 rue canard nantere','123 rue canard nantere',2200,120,0.1,0.2,285120,'BL138','2018-09-19',10);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commercial`
--

DROP TABLE IF EXISTS `commercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commercial` (
  `refCommercial` int(11) NOT NULL AUTO_INCREMENT,
  `nomCommercial` varchar(50) NOT NULL,
  `prenomCommercial` varchar(50) NOT NULL,
  `adresseCommercial` varchar(200) NOT NULL,
  `telephoneCommercial` varchar(200) NOT NULL,
  `magasinCommercial` varchar(200) NOT NULL,
  PRIMARY KEY (`refCommercial`),
  KEY `comme` (`refCommercial`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commercial`
--

LOCK TABLES `commercial` WRITE;
/*!40000 ALTER TABLE `commercial` DISABLE KEYS */;
INSERT INTO `commercial` VALUES (101,'PIERROT','MARTIN','150 rue poitier amiens','621302121','CARREFOURLEMANS'),(102,'KERWAN','SANDRINE','122 rue de la gloire amiens','789456144','CARREFOURLEMANS'),(103,'KUPPER','ERIC','115 rue de la beaute metz','723148570','AUCHANNANTES'),(104,'DUCRO','THOMAS','13 rue de la mer calais','723148570','LECLERCANGERS'),(105,'DUVERT','CHARLES','174 rue creuz dunkerque','723148570','AUCHANLAVAL'),(106,'DESBORDS','MARIE','141 rue de la ville douai','723148570','CARREFOURRENNES'),(107,'TURPIN','ALAIN','128 rue marc chaval bourg','723148570','LECLERCSABLE'),(108,'GUILLOU','thierry','114 rue victor hugo nantes','723147850','CARREFOURLILLE'),(109,'KANTE','KUNTZ','127 rue carnot lyon ','797546801','CASINELYON'),(110,'GUSTAVO','MAXIME','155 rue des paires toulouse','724612477','CARREFOURMARSEILLE');
/*!40000 ALTER TABLE `commercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compose`
--

DROP TABLE IF EXISTS `compose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compose` (
  `refProduit` int(11) NOT NULL,
  `refCommande` int(11) NOT NULL,
  PRIMARY KEY (`refProduit`,`refCommande`),
  KEY `compose_commande0_FK` (`refCommande`),
  CONSTRAINT `compose_commande0_FK` FOREIGN KEY (`refCommande`) REFERENCES `commande` (`refCommande`),
  CONSTRAINT `compose_produit_FK` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose`
--

LOCK TABLES `compose` WRITE;
/*!40000 ALTER TABLE `compose` DISABLE KEYS */;
INSERT INTO `compose` VALUES (101008,141018),(101009,141019),(101010,141020),(101011,141021),(101012,141022),(101013,141023),(101014,141024),(101015,141025),(101016,141026),(101017,141027),(101018,141028),(101019,141029);
/*!40000 ALTER TABLE `compose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concerner`
--

DROP TABLE IF EXISTS `concerner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concerner` (
  `numeroLivraison` int(11) NOT NULL,
  `refProduit` int(11) NOT NULL,
  PRIMARY KEY (`numeroLivraison`,`refProduit`),
  KEY `Concerner_produit0_FK` (`refProduit`),
  CONSTRAINT `Concerner_livraison_FK` FOREIGN KEY (`numeroLivraison`) REFERENCES `livraison` (`numeroLivraison`),
  CONSTRAINT `Concerner_produit0_FK` FOREIGN KEY (`refProduit`) REFERENCES `produit` (`refProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerner`
--

LOCK TABLES `concerner` WRITE;
/*!40000 ALTER TABLE `concerner` DISABLE KEYS */;
INSERT INTO `concerner` VALUES (123118,101008),(123119,101009),(123120,101010),(123121,101011),(123122,101012),(123123,101013),(123124,101014),(123125,101015),(123126,101016),(123127,101017),(123128,101018),(123129,101019);
/*!40000 ALTER TABLE `concerner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `refFournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nomFournisseur` varchar(200) NOT NULL,
  `adresseFournisseur` varchar(200) NOT NULL,
  `photoProduitFournisseur` varchar(50) NOT NULL,
  PRIMARY KEY (`refFournisseur`),
  KEY `fourn` (`refFournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=9005 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (9001,'adoxalp','215 avenue guimer saint denis','avenir'),(9002,'loxamal','401 avenue gloire milleville ','avenir'),(9003,'baxamil','123 avenue egalite hauts de seine','avenir'),(9004,'doxam','255 avenue de la yon ','avenir');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livraison` (
  `numeroLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `dateDeLivraison` date NOT NULL,
  `refCommande` int(11) NOT NULL,
  PRIMARY KEY (`numeroLivraison`),
  KEY `livraison_commande_FK` (`refCommande`),
  CONSTRAINT `livraison_commande_FK` FOREIGN KEY (`refCommande`) REFERENCES `commande` (`refCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=123130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES (123118,'2015-10-02',141018),(123119,'2015-10-02',141019),(123120,'2018-03-15',141020),(123121,'2018-05-27',141021),(123122,'2018-06-30',141022),(123123,'2018-03-30',141023),(123124,'2018-08-15',141024),(123125,'2018-12-30',141025),(123126,'2018-10-25',141026),(123127,'2018-03-27',141027),(123128,'2018-06-02',141028),(123129,'2018-10-20',141029);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `refProduit` int(11) NOT NULL AUTO_INCREMENT,
  `nomProduit` varchar(50) NOT NULL,
  `descriptionProduit` varchar(200) NOT NULL,
  `qte` int(11) NOT NULL,
  `paht` int(11) NOT NULL,
  `reduction` double NOT NULL,
  `ttva` double NOT NULL,
  `pttc` int(11) NOT NULL,
  `pvht` int(11) NOT NULL,
  `stockAJour` int(11) NOT NULL,
  `stkale` int(11) NOT NULL,
  `refFournisseur` int(11) NOT NULL,
  `numeroRubrique` int(11) NOT NULL,
  PRIMARY KEY (`refProduit`),
  KEY `produit_fournisseur_FK` (`refFournisseur`),
  KEY `produit_rubrique0_FK` (`numeroRubrique`),
  KEY `prod` (`refProduit`),
  CONSTRAINT `produit_fournisseur_FK` FOREIGN KEY (`refFournisseur`) REFERENCES `fournisseur` (`refFournisseur`),
  CONSTRAINT `produit_rubrique0_FK` FOREIGN KEY (`numeroRubrique`) REFERENCES `rubrique` (`numeroRubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=101020 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (101008,'guitare qui sonne','guitare',100,300,0,0.1,33000,500,150,50,9001,10),(101009,'clavier midi','clavier',100,50,0,0.2,6000,150,150,50,9001,20),(101010,'fanta','jus de fruit',10000,50,0.1,0.2,775800,130,1500,1000,9001,30),(101011,'tropical','jus de fruit',20000,40,0.1,0.2,864000,90,2000,1500,9002,30),(101012,'ordinateur','electronic',20000,400,0.2,0.1,7040000,790,3500,2000,9001,40),(101013,'cocacola','jus de qualite',35000,40,0.1,0.2,1512000,90,3200,2000,9001,30),(101014,'guitare','instrument',35000,400,0.2,0.2,13440000,800,2800,1200,9003,50),(101015,'iphone','telephone Alcatel',10000,150,0.1,0.2,1620000,195,2500,1400,9002,40),(101016,'pianoV','INSTRUMENT MUS',13500,1400,0.1,0.1,18711000,2900,1500,500,9003,50),(101017,'rcz200','peugeot sport',35000,4000,0.2,0.2,134400000,6200,2500,1200,9004,60),(101018,'moto','peugeotSpider',25000,300,0.1,0.1,7425000,710,3000,1500,9004,60),(101019,'ice tea','jus de fruit',35000,40,0.1,0.1,1386000,120,3000,1500,9001,30);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `produitsfournisseurs`
--

DROP TABLE IF EXISTS `produitsfournisseurs`;
/*!50001 DROP VIEW IF EXISTS `produitsfournisseurs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `produitsfournisseurs` (
  `REFERENCES` tinyint NOT NULL,
  `PRODUITS` tinyint NOT NULL,
  `FOURNISEUR` tinyint NOT NULL,
  `NOM FOURNISSEUR` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrique` (
  `numeroRubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nomRubrique` varchar(50) NOT NULL,
  `nomSousRubrique` varchar(50) NOT NULL,
  PRIMARY KEY (`numeroRubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (10,'electronic','jeux'),(20,'electro','relais'),(30,'alimentaire','boisson'),(40,'technologie','informatique'),(50,'musique','instrument'),(60,'voiture','automobile');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `villagegreen3`
--

USE `villagegreen3`;

--
-- Final view structure for view `produitsfournisseurs`
--

/*!50001 DROP TABLE IF EXISTS `produitsfournisseurs`*/;
/*!50001 DROP VIEW IF EXISTS `produitsfournisseurs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produitsfournisseurs` AS select `produit`.`refProduit` AS `REFERENCES`,`produit`.`nomProduit` AS `PRODUITS`,`fournisseur`.`refFournisseur` AS `FOURNISEUR`,`fournisseur`.`nomFournisseur` AS `NOM FOURNISSEUR` from (`produit` join `fournisseur` on(`produit`.`refFournisseur` = `fournisseur`.`refFournisseur`)) */;
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

-- Dump completed on 2018-10-09  8:44:05
