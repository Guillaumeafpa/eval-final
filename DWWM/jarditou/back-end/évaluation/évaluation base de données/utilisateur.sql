-- utilisateur 1 --
CREATE USER IF NOT EXISTS 'utilisateur 1'@'%' IDENTIFIED by 'MDP1';

GRANT ALL PRIVILEGES
ON *.*
TO 'utilisateur 1';
--


-- utilisateur 2 --
CREATE USER IF NOT EXISTS 'utilisateur 2'@'%' IDENTIFIED by 'MDP2';

GRANT SELECT
ON gescom.*
TO 'utilisateur 2';
--


-- utilisateur 3 --
CREATE USER IF NOT EXISTS 'utilisateur 3'@'%' IDENTIFIED by 'MDP3';

GRANT select 
ON gescom.suppliers
TO 'utilisateur 3';
--



-- utilisateur 4
CREATE USER IF NOT EXISTS 'utilisateur 4'@'%' IDENTIFIED by 'MDP4';
--


-- création du rôle marketing
CREATE ROLE IF NOT EXISTS 'marketing';
--


-- attribution des privileges sur le role marketing
GRANT select, insert, update, delete
ON gescom.products
TO marketing;


GRANT select, insert, update, delete
ON gescom.categories
TO marketing;


GRANT select
ON gescom.orders
TO marketing;


GRANT select
ON gescom.orders_details
TO marketing;


GRANT select
ON gescom.custommers
TO marketing;
--


-- attribution du rôles a l'utilisateur 4
GRANT marketing
TO 'utilisateur 4';
SET DEFAULT ROLE marketing TO 'utilisateur 4';
--





-- pour a commance de backup 


/*  cd C:\wamp\bin\mysql\mysql8.0.18\bin  */ /* chemin vers le mysqldump.exe */

/*  mysqldump --user=root --password= --port=3308 --databases gescom > C:\Backup\backup_afpa_gescom.sql  */

-- j'ai du rajouter le --port=3308  car j'ai était confronter a un message d'erreur "mysqldump: Got error: 2003: Can't connect to MySQL server on 'localhost' (10061) when trying to connect"

/*  et pour le dump on doit faire :              mysql --user=root --password= --port=3308 < C:\Backup\backup_afpa_gescom.sql  */