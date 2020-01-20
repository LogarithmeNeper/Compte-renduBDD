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
