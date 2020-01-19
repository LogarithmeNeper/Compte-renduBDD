--Migration de Fournisseurs
CREATE TABLE Fournisseurs AS (SELECT * FROM Ryori.fournisseurs@DBLCentrale);

--Stock de l'Europe du Nord hors Allemagne
CREATE TABLE Stock_EU_N AS (
SELECT * FROM Ryori.Stock@DBLCentrale WHERE Pays IN (
  'Norvege','Suede','Danemark','Islande','Finlande','Royaume-Uni','Irlande',
  'Belgique','Luxembourg','Pays-Bas','Pologne'
  ));
  
--Stock de l'Allemagne
CREATE TABLE Stock_Allemagne AS (
SELECT * FROM Ryori.Stock@DBLCentrale WHERE Pays = 'Allemagne'
);

--Stock des autres regions que Eur. N., Eur. S., Amerique
CREATE TABLE Stock_Autres AS (
SELECT * FROM Ryori.Stock@DBLCentrale WHERE Pays NOT IN (
  --Europe du Nord
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 
  'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne', 'Allemagne',
  --Europe du Sud
  'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 
  'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 
  'Croatie', 'Grece', 'Macedoine',
  'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie',
  --Amerique
  'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 
  'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba',
  'Republique dominicaine', 'Dominique',
  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti',
  'Honduras', 'Jamaique',
  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 
  'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 
  'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 
  'Trinite-et-Tobago', 'Uruguay', 'Venezuela'
  ));

--Clients de l'Europe du Nord
CREATE TABLE Clients_EU_N AS(
SELECT * FROM Ryori.Clients@DBLCentrale WHERE Pays IN (
  'Norvege','Suede','Danemark','Islande','Finlande','Royaume-Uni',
  'Irlande','Belgique','Luxembourg','Pays-Bas','Pologne', 'Allemagne'
));
  
--Clients des autres regions que Eur. N., Eur. S., Amerique
CREATE TABLE Clients_Autres AS(
SELECT * FROM Ryori.Clients@DBLCentrale WHERE Pays NOT IN (
  --Europe du Nord
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni',
  'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne', 'Allemagne',
  --Europe du Sud
  'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 
  'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 
  'Croatie', 'Grece', 'Macedoine',
  'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie',
  --Amerique
  'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 
  'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 
  'Cuba', 'Republique dominicaine', 'Dominique',
  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 
  'Haiti', 'Honduras', 'Jamaique',
  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 
  'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 
  'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 
  'Trinite-et-Tobago', 'Uruguay', 'Venezuela'
));

--Semi jointure sur les commandes Eur. N.
CREATE TABLE Commandes_EU_N AS(
SELECT * FROM Ryori.Commandes@DBLCentrale WHERE CODE_CLIENT 
IN (SELECT DISTINCT CODE_CLIENT FROM Clients_EU_N)
);
--SELECT * FROM Clients_EU_N; 
-- On verifie que les commandes ne proviennent que de ces clients

--Semi jointure sur les commandes des autres regions
CREATE TABLE Commandes_Autres AS(
SELECT * FROM Ryori.Commandes@DBLCentrale WHERE CODE_CLIENT 
IN (SELECT DISTINCT CODE_CLIENT FROM Clients_AUTRES)
);
--SELECT * FROM Clients_AUTRES; 
--On verifie que les commandes ne proviennent que de ces clients

--Semi jointure sur les details des commandes Eur. N.
CREATE TABLE Details_Commandes_EU_N AS(
SELECT * FROM Ryori.Details_Commandes@DBLCentrale 
WHERE NO_COMMANDE 
IN (SELECT DISTINCT NO_COMMANDE FROM Commandes_EU_N
));
--SELECT * FROM Details_Commandes_EU_N;
--SELECT * FROM Commandes_EU_N; 
--On verifie que les num de commandes ne proviennent que de ces commandes

CREATE TABLE Details_Commandes_Autres AS(
SELECT * FROM Ryori.Details_Commandes@DBLCentrale 
WHERE NO_COMMANDE 
IN (SELECT DISTINCT NO_COMMANDE FROM Commandes_Autres
));
--SELECT * FROM Details_Commandes_Autres;
--SELECT * FROM Commandes_Autres; 
--On verifie que les num de commandes ne proviennent que de ces commandes