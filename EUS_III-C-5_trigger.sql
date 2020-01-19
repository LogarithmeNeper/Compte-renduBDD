--d-Triggers
--trigger qui permet de ne pas affecter un numéro 
--d'employe qui n'existe pas à une commande

create TRIGGER  fk_employe Before
INSERT ON commandes_eu_s
for each row
declare
cpt integer;
begin
  select distinct count(*) INTO cpt from  tberthier.employes_am@linkToDBA
  WHERE no_employe= :new.no_employe;
  if(cpt=0) then
  raise_application_error(-20002,'employé inexistant');
  end if;
end;

--trigger qui permet de ne pas affecter un numéro 
--de fournisseurs qui n'existe pas à un produit

create TRIGGER  fk_no_fournisseurs Before
INSERT ON produits
for each row
declare
cpt integer;
begin
  select distinct count(*) INTO cpt from cjaverliat.fournisseurs@linkToDBEN
  WHERE no_fournisseur= :new.no_fournisseur;
  if(cpt=0) then
  raise_application_error(-20002,'fournisserus inexistant');
  end if;
end;

