DROP DATABASE IF EXISTS villagegreen;
CREATE DATABASE villagegreen;
USE villagegreen;

--
-- structure de la table suppliers
--
------------------------------------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
-- structure de la table categories
--
------------------------------------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
-- structure de la table products
--
------------------------------------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) NOT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`),
  KEY `pro_cat_id` (`pro_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
-- structure de la table orders_details
--
------------------------------------------------------
DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) UNSIGNED NOT NULL,
  `ode_pro_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ode_id`),
  KEY `ode_ord_id` (`ode_ord_id`),
  KEY `ode_pro_id` (`ode_pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
-- structure de la table orders
--
------------------------------------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) DEFAULT NULL,
  `ord_cus_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
-- structure de la table customers
--
------------------------------------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255) NOT NULL,
  `cus_phone` varchar(10) NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
--
--
------------------------------------------------------
DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `liv_id`int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`liv_id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
------------------------------------------------------


--
--
--
------------------------------------------------------

------------------------------------------------------