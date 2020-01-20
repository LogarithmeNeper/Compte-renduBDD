--Fournisseurs
CREATE MATERIALIZED VIEW mvrFournisseurs
REFRESH complete
NEXT sysdate + (1/24/60) 
AS
SELECT * FROM cjaverliat.fournisseurs@dbl_eu_n;

--Produits
CREATE MATERIALIZED VIEW mvrPRODUITS 
REFRESH fast
NEXT sysdate + (1/24/60)
as
select * from produits;

--Categories
CREATE MATERIALIZED VIEW mvrCATEGORIES 
REFRESH FAST
NEXT sysdate + (1/24/60)
AS
SELECT * FROM aouldhamou.categories@DBl_eu_s;

--On verifie qu'on a les mêmes resultats avec Ryori.clients@DBCentrale

--Verifications, si la ligne est vide, c'est ok
SELECT * FROM CLIENTS MINUS (SELECT * FROM Ryori.clients@DBL_principale);
SELECT * FROM COMMANDES MINUS (SELECT * FROM Ryori.COMMANDES@DBL_principale);

--Soucis avec l'ordre des attributs
SELECT * FROM DETAILS_COMMANDES MINUS 
(SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM Ryori.DETAILS_COMMANDES@DBL_principale);

SELECT * FROM EMPLOYES MINUS (SELECT * FROM Ryori.EMPLOYES@DBL_principale);
SELECT * FROM STOCK MINUS (SELECT * FROM Ryori.STOCK@DBL_principale);
SELECT * FROM PRODUITS MINUS (SELECT * FROM Ryori.PRODUITS@DBL_principale);
SELECT * FROM CATEGORIES MINUS (SELECT * FROM Ryori.CATEGORIES@DBL_principale);
SELECT * FROM FOURNISSEURS MINUS (SELECT * FROM Ryori.FOURNISSEURS@DBL_principale);

--suppression des vues materiels pour ne pas que cela tourne dans le vide
drop materialized view mvrproduits;
