--Creation des vues du fragments EU du sud
--Clients
CREATE VIEW CLIENTS AS (
SELECT * FROM clients_eu_s
UNION ALL
SELECT * FROM cjaverliat.CLIENTS_EU_N@linkToDBEN
UNION ALL
SELECT * FROM cjaverliat.CLIENTS_AUTRES@linkToDBEN
UNION ALL
SELECT * FROM tberthier.CLIENTS_AM@linkToDBA
);
--Commandes

CREATE VIEW COMMANDES AS
SELECT * FROM COMMANDES_EU_S
UNION
SELECT * FROM cjaverliat.commandes_eu_n@linkToDBEN
UNION
SELECT * FROM cjaverliat.commandes_autres@linkToDBEN
UNION
SELECT * FROM tberthier.commandes_am@linktodba;



--Détails commandes

CREATE VIEW DETAILS_COMMANDES AS
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM cjaverliat.details_commandes_eu_n@linkToDBEN
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM cjaverliat.details_commandes_autres@linkToDBEN
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM details_commandes_eu_s
UNION
SELECT REF_PRODUIT, NO_COMMANDE, PRIX_UNITAIRE, QUANTITE, REMISE 
FROM tberthier.details_commandes_am@linktodba;

--Stock

CREATE VIEW STOCK AS
SELECT * FROM STOCK_EU_S
UNION
SELECT * FROM cjaverliat.STOCK_EU_N@linkToDBEN
UNION
SELECT * FROM cjaverliat.STOCK_ALLEMAGNE@linkToDBEN
UNION
SELECT * FROM cjaverliat.STOCK_AUTRES@linkToDBEN
UNION
SELECT * FROM tberthier.stock_am@linktodba;

--Employes

CREATE VIEW EMPLOYES AS
SELECT * FROM tberthier.employes_am@linktodba;

--fournisseurs

Create view FOURNISSEURS AS
SELECT * FROM cjaverliat.fournisseurs@linkToDBEN

