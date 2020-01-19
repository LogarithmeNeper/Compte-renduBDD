--Pas besoin de rajouter les checks, deja importes

-----------------------------
--
--        PRIMARY KEYS
--
-----------------------------

--PK Clients

ALTER TABLE CLIENTS_EU_N
ADD CONSTRAINT PK_Clients_EU_N PRIMARY KEY (CODE_CLIENT);

ALTER TABLE CLIENTS_AUTRES
ADD CONSTRAINT PK_Clients_Autres PRIMARY KEY (CODE_CLIENT);

--PK Commandes

ALTER TABLE COMMANDES_EU_N
ADD CONSTRAINT PK_Commandes_EU_N PRIMARY KEY (NO_COMMANDE);

ALTER TABLE COMMANDES_AUTRES
ADD CONSTRAINT PK_Commandes_Autres PRIMARY KEY (NO_COMMANDE);

--PK Details commandes

ALTER TABLE DETAILS_COMMANDES_EU_N
ADD CONSTRAINT PK_Details_Commandes_EU_N PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

ALTER TABLE DETAILS_COMMANDES_AUTRES
ADD CONSTRAINT PK_Details_Commandes_Autres PRIMARY KEY (NO_COMMANDE, REF_PRODUIT);

--PK Fournisseurs

ALTER TABLE FOURNISSEURS
ADD CONSTRAINT PK_Fournisseurs PRIMARY KEY (NO_FOURNISSEUR);

--PK Stocks

ALTER TABLE STOCK_EU_N
ADD CONSTRAINT PK_Stock_EU_N PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE STOCK_ALLEMAGNE
ADD CONSTRAINT PK_Stock_Allemagne PRIMARY KEY (REF_PRODUIT, PAYS);

ALTER TABLE STOCK_AUTRES
ADD CONSTRAINT PK_Stock_Autres PRIMARY KEY (REF_PRODUIT, PAYS);

-----------------------------
--
--        FOREIGN KEYS LOCALES
--
-----------------------------

--Cle etrangere des commandes vers leurs clients respectifs
ALTER TABLE COMMANDES_EU_N
ADD CONSTRAINT FK_Client_Commandes_EU_N FOREIGN KEY (CODE_CLIENT) REFERENCES CLIENTS_EU_N(CODE_CLIENT);

--Cle etrangere des commandes vers leurs clients respectifs
ALTER TABLE COMMANDES_AUTRES
ADD CONSTRAINT FK_Client_Commandes_Autres FOREIGN KEY (CODE_CLIENT) REFERENCES CLIENTS_AUTRES(CODE_CLIENT);

--Cle etrangere des details des commandes vers leurs commandes respectives
ALTER TABLE DETAILS_COMMANDES_EU_N
ADD CONSTRAINT FK_Commande_Details_Commandes_EU_N FOREIGN KEY (NO_COMMANDE) REFERENCES COMMANDES_EU_N(NO_COMMANDE);

--Cle etrangere des details des commandes vers leurs commandes respectives
ALTER TABLE DETAILS_COMMANDES_AUTRES
ADD CONSTRAINT FK_Commande_Details_Commandes_Autres FOREIGN KEY (NO_COMMANDE) REFERENCES COMMANDES_AUTRES(NO_COMMANDE);

-----------------------------
--
--        FOREIGN KEYS EXTERNES (TRIGGERS)
--
-----------------------------

-- Cf declencheurs

-----------------------------
--
--        Contraintes d'integrite
--
-----------------------------

ALTER TABLE CLIENTS_EU_N
ADD CONSTRAINT CHECK_Pays_Clients_EU_N CHECK (Pays IN (
  --Europe du Nord
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne', 'Allemagne'
));

ALTER TABLE CLIENTS_AUTRES
ADD CONSTRAINT CHECK_Pays_Clients_Autres CHECK (Pays NOT IN (
  --Europe du Nord
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne', 'Allemagne',
  --Europe du Sud
  'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine',
  'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie',
  --Amerique
  'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique',
  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique',
  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela'
));

ALTER TABLE STOCK_EU_N
ADD CONSTRAINT CHECK_Pays_Stock_EU_N CHECK (Pays IN (
  --Europe du Nord hors Allemagne
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne'
));

ALTER TABLE STOCK_ALLEMAGNE
ADD CONSTRAINT CHECK_Pays_Stock_Allemagne CHECK (Pays = 'Allemagne');

ALTER TABLE STOCK_AUTRES
ADD CONSTRAINT CHECK_Pays_Stock_Autres CHECK (Pays NOT IN (
  --Europe du Nord
  'Norvege', 'Suede', 'Danemark', 'Islande', 'Finlande', 'Royaume-Uni', 'Irlande', 'Belgique', 'Luxembourg', 'Pays-Bas', 'Pologne', 'Allemagne',
  --Europe du Sud
  'Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican', 'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece', 'Macedoine',
  'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie',
  --Amerique
  'Antigua-et-Barbuda', 'Argentine', 'Bahamas', 'Barbade', 'Belize', 'Bolivie', 'Bresil', 'Canada', 'Chili', 'Colombie', 'Costa Rica', 'Cuba', 'Republique dominicaine', 'Dominique',
  'Equateur', 'Etats-Unis', 'Grenade', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaique',
  'Mexique', 'Nicaragua', 'Panama', 'Paraguay', 'Perou', 'Saint-Christophe-et-Nieves', 'Sainte-Lucie', 'Saint-Vincent-et-les Grenadines', 'Salvador', 'Suriname', 'Trinite-et-Tobago', 'Uruguay', 'Venezuela'
));


