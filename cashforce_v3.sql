-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.11-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para cashforce_v3
CREATE DATABASE IF NOT EXISTS `cashforce_v3` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cashforce_v3`;

-- Copiando estrutura para tabela cashforce_v3.buyers
CREATE TABLE IF NOT EXISTS `buyers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tradingName` varchar(255) DEFAULT NULL,
  `cashforceTax` varchar(255) DEFAULT NULL,
  `responsibleName` varchar(255) DEFAULT NULL,
  `responsibleEmail` varchar(255) DEFAULT NULL,
  `responsiblePosition` varchar(255) DEFAULT NULL,
  `responsiblePhone` varchar(255) DEFAULT NULL,
  `responsibleMobile` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `situationDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cnpjId` int(11) DEFAULT NULL,
  `confirm` tinyint(1) DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cnpjId` (`cnpjId`),
  CONSTRAINT `buyers_ibfk_1` FOREIGN KEY (`cnpjId`) REFERENCES `cnpjs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.buyers: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `buyers` DISABLE KEYS */;
INSERT INTO `buyers` (`id`, `name`, `tradingName`, `cashforceTax`, `responsibleName`, `responsibleEmail`, `responsiblePosition`, `responsiblePhone`, `responsibleMobile`, `website`, `postalCode`, `address`, `number`, `complement`, `neighborhood`, `city`, `state`, `phoneNumber`, `situation`, `situationDate`, `createdAt`, `updatedAt`, `cnpjId`, `confirm`, `email`) VALUES
	(1, 'SACADO 001', 'SACADO 001 LTDA', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-29 21:20:33', '2020-10-29 21:20:34', 1, 1, NULL);
/*!40000 ALTER TABLE `buyers` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.cnpjs
CREATE TABLE IF NOT EXISTS `cnpjs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(255) NOT NULL,
  `companyType` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.cnpjs: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cnpjs` DISABLE KEYS */;
INSERT INTO `cnpjs` (`id`, `cnpj`, `companyType`, `createdAt`, `updatedAt`) VALUES
	(1, '00000000000001', '2', '2020-10-29 21:20:33', '2020-10-29 21:20:33'),
	(2, '00000000000002', '1', '2020-10-29 21:20:33', '2020-10-29 21:20:33');
/*!40000 ALTER TABLE `cnpjs` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.offers
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax` varchar(255) NOT NULL,
  `tariff` varchar(255) NOT NULL,
  `adValorem` varchar(255) NOT NULL,
  `float` varchar(255) NOT NULL,
  `iof` varchar(255) NOT NULL,
  `expiresIn` datetime NOT NULL,
  `paymentStatusSponsor` tinyint(1) DEFAULT 0,
  `paymentStatusProvider` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `sponsorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `sponsorId` (`sponsorId`),
  CONSTRAINT `offers_ibfk_61` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `offers_ibfk_62` FOREIGN KEY (`sponsorId`) REFERENCES `sponsors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.offers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.orderportions
CREATE TABLE IF NOT EXISTS `orderportions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nDup` varchar(255) NOT NULL,
  `dVenc` varchar(255) NOT NULL,
  `vDup` varchar(255) NOT NULL,
  `availableToMarket` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `orderPortions_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.orderportions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `orderportions` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderportions` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNfId` varchar(255) NOT NULL,
  `orderNumber` varchar(255) NOT NULL,
  `orderPath` varchar(255) DEFAULT NULL,
  `orderFileName` varchar(255) DEFAULT NULL,
  `orderOriginalName` varchar(255) DEFAULT NULL,
  `emissionDate` varchar(255) DEFAULT NULL,
  `pdfFile` varchar(255) DEFAULT NULL,
  `emitedTo` varchar(255) NOT NULL,
  `nNf` varchar(255) DEFAULT NULL,
  `CTE` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cnpjId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `providerId` int(11) DEFAULT NULL,
  `orderStatusBuyer` varchar(255) DEFAULT '0',
  `orderStatusProvider` varchar(255) DEFAULT '0',
  `deliveryReceipt` varchar(255) DEFAULT NULL,
  `cargoPackingList` varchar(255) DEFAULT NULL,
  `deliveryCtrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNfId` (`orderNfId`),
  UNIQUE KEY `orderPath` (`orderPath`),
  UNIQUE KEY `orderFileName` (`orderFileName`),
  UNIQUE KEY `orderOriginalName` (`orderOriginalName`),
  KEY `userId` (`userId`),
  KEY `buyerId` (`buyerId`),
  KEY `providerId` (`providerId`),
  KEY `cnpjId` (`cnpjId`),
  CONSTRAINT `orders_ibfk_139` FOREIGN KEY (`buyerId`) REFERENCES `buyers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_140` FOREIGN KEY (`providerId`) REFERENCES `providers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_141` FOREIGN KEY (`cnpjId`) REFERENCES `cnpjs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_142` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.orders: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `orderNfId`, `orderNumber`, `orderPath`, `orderFileName`, `orderOriginalName`, `emissionDate`, `pdfFile`, `emitedTo`, `nNf`, `CTE`, `value`, `createdAt`, `updatedAt`, `cnpjId`, `userId`, `buyerId`, `providerId`, `orderStatusBuyer`, `orderStatusProvider`, `deliveryReceipt`, `cargoPackingList`, `deliveryCtrc`) VALUES
	(1, '1605181324132', '18153', NULL, NULL, NULL, '2020-10-30T11:00:00-03:00', NULL, '22843980000127', '18153', '', '198450', '2020-10-30 17:54:18', '2020-10-30 17:54:18', 1, 1, 1, 1, '0', '0', NULL, NULL, NULL),
	(2, '160518132413', '18157', NULL, NULL, NULL, '2020-11-04T15:32:35-02:00', NULL, '35705180000272', '18157', '', '168850', '2020-11-10 18:33:46', '2020-11-10 18:33:46', 1, 1, 1, 1, '0', '0', NULL, NULL, NULL),
	(3, '1605181324130', '18184', NULL, NULL, NULL, '2020-11-10', NULL, '00418477002640', '18184', '', '222795', '2020-11-12 11:42:06', '2020-11-18 12:22:14', 1, 1, 1, 1, '7', '3', NULL, NULL, NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.providers
CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tradingName` varchar(255) DEFAULT NULL,
  `cashforceTax` varchar(255) DEFAULT NULL,
  `responsibleName` varchar(255) DEFAULT NULL,
  `responsibleEmail` varchar(255) DEFAULT NULL,
  `responsiblePosition` varchar(255) DEFAULT NULL,
  `responsiblePhone` varchar(255) DEFAULT NULL,
  `responsibleMobile` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bankAgency` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `situationDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cnpjId` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cnpjId` (`cnpjId`),
  CONSTRAINT `providers_ibfk_1` FOREIGN KEY (`cnpjId`) REFERENCES `cnpjs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.providers: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` (`id`, `name`, `tradingName`, `cashforceTax`, `responsibleName`, `responsibleEmail`, `responsiblePosition`, `responsiblePhone`, `responsibleMobile`, `website`, `postalCode`, `address`, `number`, `complement`, `neighborhood`, `city`, `state`, `bank`, `bankAgency`, `account`, `documents`, `phoneNumber`, `situation`, `situationDate`, `createdAt`, `updatedAt`, `cnpjId`, `email`) VALUES
	(1, 'CEDENTE 002', 'CEDENTE 002 LTDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-10-29 21:22:21', '2020-10-29 21:22:22', 2, NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.sponsors
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tradingName` varchar(255) DEFAULT NULL,
  `cashforceTax` varchar(255) DEFAULT NULL,
  `responsibleName` varchar(255) DEFAULT NULL,
  `responsibleEmail` varchar(255) DEFAULT NULL,
  `responsiblePosition` varchar(255) DEFAULT NULL,
  `responsiblePhone` varchar(255) DEFAULT NULL,
  `responsibleMobile` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `complement` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `bankAgency` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `situationDate` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cnpjId` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cnpjId` (`cnpjId`),
  CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`cnpjId`) REFERENCES `cnpjs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.sponsors: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;

-- Copiando estrutura para tabela cashforce_v3.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `departament` varchar(255) DEFAULT NULL,
  `verificationCode` varchar(255) DEFAULT NULL,
  `emailChecked` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cashforceAdm` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela cashforce_v3.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `phoneNumber`, `mobile`, `departament`, `verificationCode`, `emailChecked`, `createdAt`, `updatedAt`, `cashforceAdm`) VALUES
	(1, 'ALLAN SOUZA', 'allan@cashforce.com.br', NULL, NULL, NULL, '', 1, '2020-10-01 21:31:37', '2020-10-01 22:41:23', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
