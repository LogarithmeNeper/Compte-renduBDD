--Contraintes d'integrite pour le fragment Europe du Sud
--a-cles primaires

alter table categories ADD PRIMARY KEY (code_categorie);
alter table clients_eu_s ADD PRIMARY KEY (code_client);
alter table commandes_eu_s ADD PRIMARY KEY (no_commande);
alter table produits ADD PRIMARY KEY (ref_produit);
alter table stock_eu_s ADD PRIMARY KEY (pays, ref_produit);
alter table details_commandes_eu_s ADD PRIMARY KEY (no_commande,ref_produit);

