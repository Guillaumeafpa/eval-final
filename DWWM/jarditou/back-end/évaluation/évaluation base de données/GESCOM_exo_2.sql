/*  
déstruction de la base si elle existe déja
création d'une nouvelle base de données
utilisation de la base de données
*/
DROP DATABASE IF EXISTS jardiriendutout;
CREATE DATABASE jardiriendutout;
USE jardiriendutout;


/* structure de la table `categories` */
--
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
KEY `cat_parent_id` (`cat_parent_id`)
);
--



/* structure de la table `countries` */
--
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) NOT NULL,
  `cou_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cou_id`)
);
--



/* structure de la table `customers` */
--
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) NOT NULL AUTO_INCREMENT,
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
  `cus_update_date` datetime default NULL,
  PRIMARY KEY (`cus_id`),
CONSTRAINT `customers_ibfk` FOREIGN KEY (`cus_countries_id`) REFERENCES `countries` (`cou_id`)
);
--



/* structure de la table `suppliers` */
--
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5) NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10) NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  PRIMARY KEY (`sup_id`),
  CONSTRAINT `countries_ibfk_` FOREIGN KEY (`sup_countries_id`) REFERENCES `countries` (`cou_id`)
);
--



/* structure de la table `orders` */
--
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NULL,
  `ord_cus_id` int(10) NOT NULL,
  PRIMARY KEY (`ord_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`)
);
--



/* structure de la table `products` */
--
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) NOT NULL,
  `pro_stock` int(5) NOT NULL,
  `pro_stock_alert` int(5) NOT NULL,
  `pro_color` varchar(30) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_desc` text NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`pro_sup_id`) REFERENCES `suppliers` (`sup_id`),
  CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`pro_cat_id`) REFERENCES `categories` (`cat_id`)
);
--



/* structure de la table `orders_details` */
--
DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) NOT NULL,
  `ode_pro_id` int(10) NOT NULL,
  PRIMARY KEY (`ode_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ode_ord_id`) REFERENCES `orders` (`ord_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`ode_pro_id`) REFERENCES `products` (`pro_id`)
);
--



/* structure de la table `shops` */
--
DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `sho_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `sho_name` varchar(26) NOT NULL,
  `sho_address` varchar(100) NOT NULL,
  `sho_city` varchar(26) NOT NULL,
  PRIMARY KEY (`sho_id`)
);
--



/* structure de la table `departments` */
--
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `dep_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dep_id`)
);
--



/* structure de la table `posts` */
--
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(10) NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`pos_id`)
);
--



/* structure de la table `employees` */
--
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) DEFAULT NULL,
  `emp_pos_id` int(10) NOT NULL,
  `emp_lastname` varchar(50) NOT NULL,
  `emp_firstname` varchar(50) NOT NULL,
  `emp_address` varchar(150) NOT NULL,
  `emp_city` varchar(50) NOT NULL,
  `emp_mail` varchar(255) NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_salary` decimal(8,2) NOT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  `emp_sho_id` tinyint(3) NOT NULL,
  `emp_dep_id` tinyint(3) NOT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `superior_ibfk_1` FOREIGN KEY (`emp_superior_id`) REFERENCES `employees` (`emp_id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`emp_pos_id`) REFERENCES `posts` (`pos_id`),
  CONSTRAINT `shops_ibfk_3` FOREIGN KEY (`emp_sho_id`) REFERENCES `shops` (`sho_id`),
  CONSTRAINT `departments_ibfk_4` FOREIGN KEY (`emp_dep_id`) REFERENCES `departments` (`dep_id`)
);
--
