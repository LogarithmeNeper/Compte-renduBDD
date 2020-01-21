--avoir acces a DB11 en etant connecte sur DB14
create database link DBL_principale
connect to pgevraud
identified by mdporacle
using 'DB11';

drop database link dba_eu_nord;

--donner acces aux tables qu’on crees
grant select, update, insert, delete 
on X to pgevraud;
-- avoir acces aux tables creees par tberthier sur DB14 
CREATE SYNONYM X FOR tberthier.X;
--supprimer le synonym
drop synonym X;

--creation des tables
create table Stock_AM as 
(select * from Ryori.stock@DBL_principale 
where pays in (--Amerique
  'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 
  'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 
  'Dominique', 'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 
  'Honduras', 'Jamaique', 'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 
  'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 
  'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela');


CREATE TABLE Commandes_AM AS(
SELECT * FROM Ryori.Commandes@DBL_principale
WHERE CODE_CLIENT IN (SELECT DISTINCT CODE_CLIENT FROM Clients)
);

CREATE TABLE Details_Commandes_AM AS(
SELECT * FROM Ryori.Details_Commandes@DBL_principale WHERE NO_COMMANDE IN 
(SELECT DISTINCT NO_COMMANDE FROM Commandes_AM
));

--foreign key pour employes
alter table employes_am
add constraint FKEYemployes foreign key (REND_COMPTE) references employes_am(NO_EMPLOYE);

--trigger qui modelise la foreign key de details_commandes
CREATE OR REPLACE TRIGGER TRIGGER_FK_DETAILS_COMMANDES
BEFORE INSERT OR UPDATE ON DETAILS_COMMANDES_AM
FOR EACH ROW 
DECLARE 
   cpt integer;
BEGIN
	select count(*) into cpt from produits where :NEW.REF_PRODUIT=produits.REF_PRODUIT;
	IF(cpt=0) then
		RAISE_APPLICATION_ERROR(-20001,'Aucun produit correspondant a cette reference');
  END IF;                      
END;


--trigger qui modelise la foreign key de stock
CREATE OR REPLACE TRIGGER TRIGGER_FK_STOCK
BEFORE INSERT OR UPDATE ON STOCK_AM
FOR EACH ROW 
DECLARE 
   cpt integer;
BEGIN
	select count(*) into cpt from produits where :NEW.REF_PRODUIT=produits.REF_PRODUIT;
	IF(cpt=0) then
		RAISE_APPLICATION_ERROR(-20001,'Aucun produit correspondant a cette reference');
  END IF;                      
END;




CREATE OR REPLACE TRIGGER TRIGGER_FK_EMPLOYES
BEFORE delete ON employes_am
FOR EACH ROW 
DECLARE 
   cpt integer;
BEGIN
	select count(*) into cpt from (commandes_eur_n union commandes_eur_s) 
	where (:NEW.no_employe=commandes_eur_s.no_employe 
		or :NEW.no_employe=commandes_eur_n.no_employe);
	IF(cpt<>0) then
		RAISE_APPLICATION_ERROR(-20003,'Cet employe est enrole dans une commande');
  END IF;                      
END;

