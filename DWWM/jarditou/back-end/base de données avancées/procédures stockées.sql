/*
+------------+
| EXERCICE 1 |
+------------+

Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée.
Exécutez la pour vérifier qu'elle fonctionne conformément à votre attente.
Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée : */
--
DELIMITER $$

DROP PROCEDURE IF EXISTS Lst_Suppliers $$

CREATE PROCEDURE Lst_Suppliers()

BEGIN 

SELECT sup_name
FROM suppliers
INNER JOIN products
ON suppliers.sup_id = products.pro_sup_id
INNER JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
WHERE pro_sup_id not in 
    (SELECT ode_pro_id FROM orders_details)
GROUP BY sup_name;

END $$

DELIMITER ; 
--



/*
+------------+
| EXERCICE 2 |
+------------+

Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente". */

--
DELIMITER $$

DROP PROCEDURE IF EXISTS Lst_Rush_Orders $$

CREATE PROCEDURE Lst_Rush_Orders()

BEGIN

SELECT orders.*
FROM orders
WHERE ord_status = 'Commande urgente';

END $$

DELIMITER ;
--



/*
+------------+
| EXERCICE 3 |
+------------+

Créer la procédure stockée CA_Supplier, qui a un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.

On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table suppliers.

Testez cette procédure avec différentes valeurs des paramètres.*/
--
DELIMITER $$

DROP PROCEDURE IF EXISTS CA_Supplier $$

CREATE PROCEDURE CA_Supplier(IN sup_id_p INT(10),
                             IN annees INT(4))
BEGIN

DECLARE sup_exist VARCHAR(10);
SET sup_exist = (SELECT sup_id FROM suppliers WHERE sup_id = sup_id_p);

IF ISNULL(sup_exist)
THEN 
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "le fournisseur renseigner n'existe pas ";

ELSE

SELECT sup_id, annees, TRUNCATE(SUM((ode_unit_price * ode_quantity) * (100 - ode_discount)/100 ), 2) AS "chiffre d'affaire"
FROM  suppliers
INNER JOIN products
ON suppliers.sup_id = products.pro_sup_id
INNER JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id 
WHERE year(ord_order_date) = annees
AND sup_id = sup_id_p;

END IF;

END $$

DELIMITER ;
--