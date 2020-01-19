--check
--permet de s'assurer que seulement des tuples concernant les pays 
--d'europe du sud sont ajoutés aux tables client_eu_s
-- et stocks_eu_s

alter table clients_eu_s
add constraint check_pays_clients_eu_s 
check (pays  in('Espagne', 'Portugal', 'Andorre', 'France', 
				'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican',
				'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece',
				'Macedoine','Montenegro', 'Serbie', 'Slovenie', 'Bulgarie'));

alter table stock_eu_s
add constraint check_pays_stock_eu_s 
check (pays  in('Espagne', 'Portugal', 'Andorre', 'France', 
				'Gibraltar', 'Italie', 'Saint-Marin', 'Vatican',
				'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece',
				'Macedoine','Montenegro', 'Serbie', 'Slovenie', 'Bulgarie'));

