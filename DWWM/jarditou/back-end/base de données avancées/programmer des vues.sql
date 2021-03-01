/* Afficher la liste des hôtels avec leur station. */ 
--
DROP VIEW IF EXISTS vue1;
CREATE VIEW vue1
AS
SELECT *
FROM hotel
INNER JOIN station
ON hotel.hot_sta_id = station.sta_id;

--


/* Afficher la liste des chambres et leur hôtel */
--
DROP VIEW IF EXISTS vue2;
CREATE VIEW vue2
AS
SELECT *
FROM chambre
INNER JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id
--


/* Afficher la liste des réservations avec le nom des clients*/
--
DROP VIEW IF EXISTS vue3;
CREATE VIEW vue3
AS
SELECT res_id, res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, CONCAT(cli_nom, ' ', cli_prenom)
FROM reservation
INNER JOIN client
ON reservation.res_cli_id = client.cli_id
ORDER BY client.cli_id ASC;
--


/* Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station */
--
DROP VIEW IF EXISTS vue4;
CREATE VIEW vue4
AS
SELECT cha_id, cha_hot_id, cha_numero, cha_capacite, cha_type, hot_nom, sta_nom
FROM chambre
INNER JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id
INNER JOIN station
ON hotel.hot_sta_id = station.sta_id
--


/* Afficher les réservations avec le nom du client et le nom de l'hôtel */
--
DROP VIEW IF EXISTS vue5;
CREATE VIEW vue5
AS
SELECT res_id, res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes, CONCAT(cli_nom, ' ', cli_prenom) AS 'nom du client', hot_nom
FROM reservation
INNER JOIN client
ON reservation.res_cli_id = client.cli_id
INNER JOIN chambre
ON reservation.res_cha_id = chambre.cha_id
INNER JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id
--

/* v_Details correspondant à la requête : _A partir de la table orders_details, afficher par code produit, la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot. */
--
DROP VIEW IF EXISTS v_Details;
CREATE VIEW v_Details
AS
SELECT pro_ref AS 'code produit', SUM(ode_quantity) AS 'QteTot', TRUNCATE(SUM((ode_quantity * ode_unit_price) * (100 - ode_discount)/100 ),2) AS 'PrixTot'
FROM orders_details
INNER JOIN products
ON orders_details.ode_pro_id = products.pro_id
GROUP BY `code produit`
--



/* v_Ventes_Zoom correspondant à la requête : Afficher les ventes dont le code produit est ZOOM (affichage de toutes les colonnes de la table orders_details). */
--
DROP VIEW IF EXISTS v_Ventes_Zoom;
CREATE VIEW v_Ventes_Zoom
AS
SELECT orders_details.*
FROM orders_details
INNER JOIN productsz
ON orders_details.ode_pro_id = products.pro_id
WHERE pro_ref = 'ZOOM'
--


-- lundi 28 septembre, atelier cv