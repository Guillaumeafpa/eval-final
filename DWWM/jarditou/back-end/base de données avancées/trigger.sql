/*
+------------+
| exercice 1 |
+------------+
Mettez en place ce trigger, puis ajoutez un produit dans une commande, vérifiez que le champ total est bien mis à jour.
*/
--
DELIMITER $$

DROP TRIGGER IF EXISTS maj_total $$
CREATE TRIGGER maj_total 
AFTER INSERT ON lignedecommande
FOR EACH ROW
BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c); -- on recalcul le total
    UPDATE commande SET total=tot WHERE id=id_c; -- on stock le total dans la table commande
END $$

DELIMITER ;
--



/*
+------------+
| exercice 2 |
+------------+
Ce trigger ne fonctionne que lorsque l'on ajoute des produits, les modifications ou suppressions ne permettent pas de recalculer le total. Comment pourrait-on faire ?
*/
--
DELIMITER $$

DROP TRIGGER IF EXISTS maj_total_bis $$
CREATE TRIGGER maj_total_bis
AFTER DELETE ON lignedecommande
FOR EACH ROW
BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = OLD.id_commande;
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
    UPDATE commande 
    SET 
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

CREATE TRIGGER after_products_update ;

BEFORE INSERT ON 

BEGIN




DROP TABLE IF EXISTS `commander_article`;
CREATE TABLE `commander_article` (
    `codart` INT(10) UNSIGNED NOT NULL,
    `qte` INT(11) DEFAULT NULL,
    `date` DATE DEFAULT (CURRENT_TIMESTAMP),
    PRIMARY KEY (`codart`),
    FOREIGN KEY (`codart`) REFERENCES `products`(`pro_id`)
);
END $$

DELIMITER ;
--