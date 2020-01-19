--------------------------------------------------------
--  DDL for Trigger TRIGGER_DELETE_FOURNISSEURS
--------------------------------------------------------

CREATE OR REPLACE TRIGGER TRIGGER_DELETE_FOURNISSEURS
BEFORE DELETE ON FOURNISSEURS
FOR EACH ROW
DECLARE
  
  cpt integer;
  
BEGIN
  
  SELECT DISTINCT COUNT(*) INTO cpt 
  FROM aouldhamou.produits@DBEuropeSud 
  WHERE NO_FOURNISSEUR = :NEW.NO_FOURNISSEUR;
  
  IF (cpt = 0) THEN
      RAISE_APPLICATION_ERROR(-20004, 'Fournisseur utilise, impossible de le supprimer');
  END IF;
  
END;
/

--------------------------------------------------------
--  DDL for Trigger TRIGGER_FK_COMMANDES_AUTRES
--------------------------------------------------------

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

--------------------------------------------------------
--  DDL for Trigger TRIGGER_FK_COMMANDES_EU_N
--------------------------------------------------------

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
--  DDL for Trigger TRIGGER_FK_DETAILS_COM_AUTRES
--------------------------------------------------------

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

--------------------------------------------------------
--  DDL for Trigger TRIGGER_FK_DETAILS_COM_EU_N
--------------------------------------------------------

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
--  DDL for Trigger TRIGGER_FK_STOCK_ALLEMAGNE
--------------------------------------------------------

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

--------------------------------------------------------
--  DDL for Trigger TRIGGER_FK_STOCK_AUTRES
--------------------------------------------------------

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

--------------------------------------------------------
--  DDL for Trigger TRIGGER_FK_STOCK_EU_N
--------------------------------------------------------

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
