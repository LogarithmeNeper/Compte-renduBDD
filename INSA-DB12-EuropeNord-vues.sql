--On verifie qu'on a les memes resultats avec Ryori.clients@DBCentrale

--Clients
CREATE VIEW CLIENTS AS
SELECT * FROM CLIENTS_EU_N
UNION
SELECT * FROM CLIENTS_AUTRES
UNION
SELECT * FROM aouldhamou.clients_eu_s@DBEuropeSud
UNION
SELECT * FROM tberthier.clients_am@DBAmerique;

--Commandes
CREATE VIEW COMMANDES AS
SELECT * FROM COMMANDES_EU_N
UNION
SELECT * FROM COMMANDES_AUTRES
UNION
SELECT * FROM aouldhamou.commandes_eu_s@DBEuropeSud
UNION
SELECT * FROM tberthier.commandes_am@DBAmerique;

--Details commandes
CREATE VIEW DETAILS_COMMANDES AS
SELECT * FROM DETAILS_COMMANDES_EU_N
UNION
SELECT * FROM DETAILS_COMMANDES_AUTRES
UNION
SELECT * FROM aouldhamou.details_commandes_eu_s@DBEuropeSud
UNION
SELECT * FROM tberthier.details_commandes_am@DBAmerique;

--Stock
CREATE VIEW STOCK AS
SELECT * FROM STOCK_EU_N
UNION
SELECT * FROM STOCK_ALLEMAGNE
UNION
SELECT * FROM STOCK_AUTRES
UNION
SELECT * FROM aouldhamou.stock_eu_s@DBEuropeSud
UNION
SELECT * FROM tberthier.stock_am@DBAmerique;

--Employes
CREATE VIEW EMPLOYES AS
SELECT * FROM tberthier.employes_am@DBAmerique;

--Produits
CREATE VIEW PRODUITS AS
SELECT * FROM aouldhamou.produits@DBEuropeSud;

--Categories
CREATE VIEW CATEGORIES AS
SELECT * FROM aouldhamou.categories@DBEuropeSud;
