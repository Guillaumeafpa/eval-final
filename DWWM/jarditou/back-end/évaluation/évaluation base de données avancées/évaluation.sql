/*
+------------+
| EXERCICE 1 |
+------------+
Créez une vue qui affiche le catalogue produits. L'id, la référence et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.
*/
--
DROP VIEW IF EXISTS vue_eval;
CREATE VIEW vue_eval
AS
SELECT pro_id, pro_ref, pro_name, cat_id, cat_name
FROM products
INNER JOIN categories
ON products.pro_cat_id = categories.cat_id;
--



/*
+------------+
| EXERCICE 2 |
+------------+
Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.
*/
--
DELIMITER $$

DROP PROCEDURE IF EXISTS facture $$

CREATE PROCEDURE facture(IN id_renseigner INT(10))

BEGIN

SELECT ord_order_date AS 'date de commande', 
ode_id AS 'numero de facture', 
ord_payment_date AS 'date de vente', 
concat(cus_lastname, ' ', cus_firstname) AS 'client', 
ord_id AS 'numero de commande',
pro_name AS 'nom du produit', 
pro_ref AS 'référence du produit',
ode_unit_price AS 'prix unitaire', 
ode_quantity AS 'quantité commandé', 
ode_discount AS 'réduction',
total.tot AS 'prix total'
FROM orders
INNER JOIN orders_details
ON orders.ord_id = orders_details.ode_ord_id
INNER JOIN customers
ON orders.ord_cus_id = customers.cus_id
INNER JOIN products
ON orders_details.ode_pro_id = products.pro_id,
(SELECT TRUNCATE(SUM((ode_unit_price * ode_quantity) * (100 - ode_discount)/100 ), 2) AS tot FROM  orders_details WHERE ode_ord_id = id_renseigner) total  /* le total apres la sous requête permet de nommé la sous requête comme les alliaces */
WHERE ord_id = id_renseigner;

END $$

DELIMITER ;
--



/*
+------------+
| exercice 3 |
+------------+
Créer une table commander_articles constituées de colonnes :

codart : id du produit
qte : quantité à commander
date : date du jour
Créer un déclencheur after_products_update sur la table products : lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.

Pour le jeu de test de votre déclencheur, on prendra le produit 8 (barbecue 'Athos') auquel on mettra pour valeur de départ :

pro_stock_alert = 5
*/
--
DELIMITER $$

DROP TRIGGER IF EXISTS after_products_update $$
CREATE TRIGGER after_products_update

AFTER UPDATE ON `products` /* apres chaque update dans la table products */
FOR EACH ROW 


BEGIN /* on rentre dans le begin et on vérifie si le nouveau stock est inférieur au stock alerte */

DECLARE verify BOOLEAN;
SET verify = (new.pro_stock < new.pro_stock_alert);


IF verify /* si le pro_stock est supérieur du stock_Alerte alors on ne rentre pas ici */
THEN

    IF (new.pro_id IN (SELECT codart FROM commander_article))/* on vérifie que le new.pro_stock n'existe pas dans la table commander_article */
    THEN
    UPDATE `commander_article` 
    SET qte = (new.pro_stock_alert - new.pro_stock) WHERE codart = new.pro_id;


    else
    INSERT INTO  `commander_article` (`codart`, `qte`) VALUES
    (new.pro_id, (new.pro_stock_alert - new.pro_stock));

    END IF ;
ELSE

    DELETE FROM `commander_article`
    WHERE codart = new.pro_id;

END IF ;

END $$

DELIMITER ;
--

-- crétion de la table commander_article
DROP TABLE IF EXISTS `commander_article`;
CREATE TABLE `commander_article` (
    `codart` INT(10) UNSIGNED NOT NULL,
    `qte` INT(11) DEFAULT NULL,
    `date` DATE DEFAULT (CURRENT_TIMESTAMP),
    PRIMARY KEY (`codart`),
    FOREIGN KEY (`codart`) REFERENCES `products`(`pro_id`)
)ENGINE=InnoDB CHARSET=utf8;

/*
+------------+
| EXERCICE 4 |
+------------+

quand date de reception est remplieelors changer le statut de la table et marqué 'commande reçue'

nb : enlever des dates de reception dans la bdd.
*/