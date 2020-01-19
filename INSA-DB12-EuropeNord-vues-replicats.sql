-----------------------------------------
-- On peut modifier les vues precedemment
-- creees pour utiliser les replicats
-----------------------------------------

--Employés
CREATE VIEW EMPLOYES AS
SELECT * FROM MVR_EMPLOYES;

--Produits
CREATE VIEW PRODUITS AS
SELECT * FROM MVR_PRODUITS;

--Catégories
CREATE VIEW CATEGORIES AS
SELECT * FROM MVR_CATEGORIES;