
--Clients
CREATE VIEW CLIENTS AS
SELECT * FROM cjaverliat.CLIENTS_EU_N@dbl_eu_n
UNION
SELECT * FROM cjaverliat.CLIENTS_AUTRES@dbl_eu_n
UNION
SELECT * FROM aouldhamou.clients_eu_s@DBl_eu_s
UNION
SELECT * FROM clients_am;

--Commandes
CREATE VIEW COMMANDES AS
SELECT * FROM cjaverliat.COMMANDES_EU_N@dbl_eu_n
UNION
SELECT * FROM  cjaverliat.COMMANDES_AUTRES@dbl_eu_n
UNION
SELECT * FROM aouldhamou.commandes_eu_s@DBl_eu_s
UNION
SELECT * FROM commandes_am;

--Details commandes
CREATE VIEW DETAILS_COMMANDES AS

SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM cjaverliat.DETAILS_COMMANDES_EU_N@dbl_eu_n
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM  cjaverliat.DETAILS_COMMANDES_AUTRES@dbl_eu_n
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM aouldhamou.details_commandes_eu_s@DBl_eu_s
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM details_commandes_am;

-- Test
SELECT * FROM cjaverliat.DETAILS_COMMANDES_EU_n@dbl_eu_n;


--Stock
CREATE VIEW STOCK AS
SELECT * FROM cjaverliat.STOCK_EU_N@dbl_eu_n
UNION
SELECT * FROM  cjaverliat.STOCK_ALLEMAGNE@dbl_eu_n
UNION
SELECT * FROM  cjaverliat.STOCK_AUTRES@dbl_eu_n
UNION
SELECT * FROM aouldhamou.stock_eu_s@dbl_eu_s
UNION
SELECT * FROM stock_am;


--Produits
CREATE VIEW PROD AS
SELECT * from produits; --ici produits est un synonyme
