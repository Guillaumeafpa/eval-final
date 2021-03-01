--indeed pour rechercher un stage sa peut fonctionner.

/* Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus. */
--
SELECT concat(emp_lastname, ' ', emp_firstname), emp_children
FROM employees
WHERE emp_children > 0
ORDER BY emp_children DESC, emp_lastname ASC;
--



/* Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence. */
--
SELECT cus_lastname, cus_firstname, cus_countries_id
FROM customers
WHERE cus_countries_id != 'FR';
--



/* Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.*/
--
SELECT cus_city, cus_countries_id, cou_name
FROM customers
INNER JOIN countries
ON customers.cus_countries_id = countries.cou_id
GROUP BY cus_city
ORDER BY cus_city ASC;
--



/* Q4. Afficher le nom des clients dont les fiches ont été modifiées */
--
SELECT cus_lastname, cus_update_date
FROM customers
WHERE cus_update_date IS NOT NULL;
--



/* Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ? */
--
SELECT cus_id, cus_lastname, cus_firstname, cus_city
FROM customers
WHERE cus_city LIKE '%divos%';
--



/* Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit. */
--
SELECT pro_id, pro_name, pro_price
FROM products
WHERE pro_price IN 
    (SELECT MIN(pro_price) FROM products);
--

--
SELECT pro_id, pro_name, pro_price
FROM products
ORDER BY pro_price 
LIMIT 1;
--



/* Q7. Lister les produits qui n'ont jamais été vendus. */
--
SELECT pro_id, pro_ref, pro_name
FROM products
WHERE pro_id NOT IN
    ( SELECT ode_pro_id FROM orders_details );
--



/* Q8. Afficher les produits commandés par Madame Pikatchien. */
--
SELECT concat(cus_lastname, ' ', cus_firstname) AS 'nom et prénom', pro_id, pro_ref, pro_name, cus_id, ord_id, ode_id
FROM orders_details
INNER JOIN products
ON orders_details.ode_pro_id = products.pro_id
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
INNER JOIN customers
ON orders.ord_cus_id = customers.cus_id
WHERE cus_lastname = 'PIKATCHIEN';
--



/* Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés. */
--
SELECT cat_id, cat_name, pro_name
FROM products
INNER JOIN categories
ON products.pro_cat_id = categories.cat_id
ORDER BY cat_name ASC;
--



/* Q10. Afficher l'organigramme hiérarchique (nom et prénom et poste des employés) du magasin de Compiègne, classer par ordre alphabétique. Afficher le nom et prénom des employés, éventuellement le poste (si vous y parvenez). */
--
SELECT concat(a.emp_lastname, ' ', a.emp_firstname) AS 'Employé', c.pos_libelle AS 'jobs' ,concat(b.emp_lastname, ' ', b.emp_firstname) AS 'Supérieur', d.pos_libelle AS 'jobs'
FROM employees a
INNER JOIN employees b
ON a.emp_superior_id = b.emp_id
INNER JOIN shops
ON a.emp_sho_id = shops.sho_id
INNER JOIN posts c
ON a.emp_pos_id = c.pos_id
INNER JOIN posts d
ON b.emp_pos_id = d.pos_id
WHERE sho_city = 'Compiègne';
--


/* Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande. */
--
SELECT ode_discount AS `montant de la remise`, pro_id, pro_name, ord_id, ode_id
FROM orders_details
INNER JOIN orders ON orders_details.ode_ord_id = orders.ord_id
INNER JOIN products ON orders_details.ode_pro_id = products.pro_id=
WHERE ode_discount IN
    (SELECT max(ode_discount) FROM orders_details);
--



/* Q12. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada' */
--
SELECT count(customers.cus_countries_id) AS `nombre de client Canadiens`
FROM customers
INNER JOIN countries
ON customers.cus_countries_id = countries.cou_id
WHERE countries.cou_name = 'Canada';
--



/* Q13. Afficher le détail des commandes de 2020. */
--
SELECT ode_id, ode_unit_price, ode_discount, ode_quantity, ode_ord_id, ode_pro_id, ord_order_date
FROM orders_details
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
WHERE year(ord_order_date) = '2020'
ORDER BY ode_ord_id ASC;
--



/* Q14. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées. */
--figma
SELECT sup_id, sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail
FROM suppliers
INNER JOIN products
ON suppliers.sup_id = products.pro_sup_id
INNER JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
WHERE pro_sup_id not in 
    (SELECT ode_pro_id FROM orders_details)
GROUP BY sup_id;
--



/* Q15. Quel est le chiffre d'affaires de 2020 ? */
--
SELECT TRUNCATE(SUM((ode_unit_price * ode_quantity) * (100 - ode_discount)/100 ), 2) AS "chiffre d'affaires de 2020"
FROM orders_details
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
WHERE year(ord_order_date) = '2020';
--



/* Q16. Quel est le panier moyen ? */
--
SELECT TRUNCATE(SUM((ode_unit_price * ode_quantity) * (100 - ode_discount)/100 )/ COUNT AS (DISTINCT ord_id),2) AS `panier moyen`
FROM orders_details
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
--



/* Q17. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client). */
--
SELECT ord_id, ord_order_date, (ode_unit_price * ode_quantity) AS 'total', concat(cus_lastname, ' ', cus_firstname) AS `nom et prénom`
FROM orders_details
INNER JOIN orders
ON orders_details.ode_ord_id = orders.ord_id
INNER JOIN customers
ON orders.ord_cus_id = customers.cus_id
ORDER BY total DESC;
--



/* Q18. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%. */
--
UPDATE products
SET  pro_name = 'Camper',
pro_price = (pro_price - (10*100))
WHERE pro_ref = 'barb004';
--


-- commande pour remettre les données initial

--
UPDATE products
SET pro_name = 'Camping',
pro_price = 100.00
WHERE pro_ref = 'barb004';
--



/* Q19. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols. */
--
UPDATE products 
INNER JOIN categories 
ON products.pro_cat_id = categories.cat_id
SET pro_price = TRUNCATE(pro_price + ((1.1 * pro_price )/100),2)
WHERE cat_name = 'parasols'


UPDATE products 
INNER JOIN categories 
ON products.pro_cat_id = categories.cat_id
SET pro_price = FORMAT(pro_price + ((1.1 * pro_price )/100),2)
WHERE cat_name = 'parasols'
--


-- commande pour remettre les données initial

--
UPDATE products
SET pro_price = 100.00
WHERE pro_id = 25;

UPDATE products
SET pro_price = 605.40
WHERE pro_id = 26;

UPDATE products
SET pro_price = 179.97
WHERE pro_id = 27;
--



/* Q20. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Ces produits sont : 36, 37 et 41 de la catégorie 9. */
--
DELETE FROM products
WHERE pro_cat_id IN 
    (SELECT cat_id FROM categories WHERE cat_name = 'Tondeuses électriques')
AND pro_id NOT IN
    (SELECT ode_pro_id FROM orders_details);


DELETE products FROM products 
    JOIN categories c ON cat_id = pro_cat_id   
    WHERE pro_id NOT IN (SELECT ode_pro_id FROM orders_details)
    AND cat_name = 'Tondeuses électriques'
--


-- commande pour remettre les données initial

--
INSERT INTO products (pro_id, pro_cat_id, pro_price, pro_ref, pro_stock, pro_stock_alert, pro_color, pro_name, pro_desc, pro_publish, pro_sup_id, pro_add_date, pro_update_date, pro_picture)
VALUES
(36, 9, 75, 'HERO', 7, 5, 'Vert', 'Hero', "", 0, 4, DATE("2018-08-13"), NULL, 'jpg'),
(37, 9, 120.5, 'SL1280', 5, 5, 'Vert', 'SL 1280', "Quisque nec nisi risus. Fusce eu est non velit mollis tristique a et magna. Proin sodales.", 0, 4, DATE("2018-08-05"), DATE("2018-08-22"), 'jpg'),
(41, 9, 49.8, 'ZOOM', 223, 5, 'Gris', 'Zoom', "Nunc magna erat, ultrices et facilisis non, viverra in turpis. Nulla orci mi, maximus eu facilisis a, pretium sit amet ex.", 0, 4, DATE("2018-08-13"), NULL, 'jpg');
--