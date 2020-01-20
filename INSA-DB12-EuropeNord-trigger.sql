--------------------------------------------------------
--  Trigger sur la suppression d'un fournisseur
--------------------------------------------------------

--Si le fournisseur est utilise dans une table distante, on empeche sa suppression

--Du cote de la BDD Europe du Sud on s'attend donc a trouver le second trigger qui
--verifiera en insertion/mise a jour que le Fournisseur existe bien sur notre BDD

CREATE OR REPLACE TRIGGER TRIGGER_DELETE_FOURNISSEURS
BEFORE DELETE ON FOURNISSEURS
FOR EACH ROW
DECLARE
  
  cpt integer;
  
BEGIN
  
  SELECT DISTINCT COUNT(*) INTO cpt 
  FROM aouldhamou.produits@DBEuropeSud 
  WHERE NO_FOURNISSEUR = :NEW.NO_FOURNISSEUR;
  
  IF (cpt <> 0) THEN
      RAISE_APPLICATION_ERROR(-20004, 'Fournisseur utilise, impossible de le supprimer');
  END IF;
  
END;
/

--------------------------------------------------------
--  Trigger sur l'insertion/mise a jour d'une commande 
--------------------------------------------------------

--On verifie que l'employe realisant la commande existe
--bien dans la table distante (située en Amérique) des employes

--Du cote de la BDD Amerique on s'attend donc a trouver le second trigger qui
--verifiera en suppression que personne n'utilise l'employe a supprimer

CREATE OR REPLACE TRIGGER TRIGGER_FK_COMMANDES_AUTRES
BEFORE INSERT OR UPDATE ON COMMANDES_AUTRES
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) 
	INTO cpt FROM tberthier.employes_am@DBAmerique 
	WHERE NO_EMPLOYE = :NEW.NO_EMPLOYE;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20003, 'Employe inexistant');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER TRIGGER_FK_COMMANDES_EU_N
BEFORE INSERT OR UPDATE ON COMMANDES_EU_N
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) 
	INTO cpt FROM tberthier.employes_am@DBAmerique 
	WHERE NO_EMPLOYE = :NEW.NO_EMPLOYE;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20003, 'Employe inexistant');
    END IF;

END;
/

--------------------------------------------------------
--  Trigger sur l'insertion/mise a jour des details d'une commande
--------------------------------------------------------

--On verifie que le produit existe bien dans la table distante
--(située en Eu.S.) des produits

--Du cote de la BDD Europe du Sud on s'attend donc a trouver le second trigger qui
--verifiera en suppression que personne n'utilise le produit a supprimer

CREATE OR REPLACE TRIGGER TRIGGER_FK_DETAILS_COM_AUTRES
BEFORE INSERT OR UPDATE ON DETAILS_COMMANDES_AUTRES
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) 
	INTO cpt FROM aouldhamou.produits@DBEuropeSud
	WHERE REF_PRODUIT = :NEW.REF_PRODUIT;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Produit inexistant');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER TRIGGER_FK_DETAILS_COM_EU_N
BEFORE INSERT OR UPDATE ON DETAILS_COMMANDES_EU_N
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) 
	INTO cpt FROM aouldhamou.produits@DBEuropeSud 
	WHERE REF_PRODUIT = :NEW.REF_PRODUIT;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Produit inexistant');
    END IF;

END;
/

--------------------------------------------------------
--  Trigger sur l'insertion/mise a jour du stock
--------------------------------------------------------

--On verifie que le produit existe bien dans la table distante
--(située en Eu.S.) des produits

--Du cote de la BDD Europe du Sud on s'attend donc a trouver le second trigger qui
--verifiera en suppression que personne n'utilise le produit a supprimer

CREATE OR REPLACE TRIGGER TRIGGER_FK_STOCK_ALLEMAGNE
BEFORE INSERT OR UPDATE ON STOCK_ALLEMAGNE
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) 
	INTO cpt FROM aouldhamou.produits@DBEuropeSud
	WHERE REF_PRODUIT = :NEW.REF_PRODUIT;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Produit inexistant');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER TRIGGER_FK_STOCK_AUTRES
BEFORE INSERT OR UPDATE ON STOCK_AUTRES
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*)
	INTO cpt FROM aouldhamou.produits@DBEuropeSud 
	WHERE REF_PRODUIT = :NEW.REF_PRODUIT;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Produit inexistant');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER TRIGGER_FK_STOCK_EU_N
BEFORE INSERT OR UPDATE ON STOCK_EU_N
FOR EACH ROW

DECLARE

  cpt integer;

BEGIN

    SELECT DISTINCT COUNT(*) INTO cpt 
	FROM aouldhamou.produits@DBEuropeSud 
	WHERE REF_PRODUIT = :NEW.REF_PRODUIT;
    
    IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20002, 'Produit inexistant');
    END IF;

END;
/
