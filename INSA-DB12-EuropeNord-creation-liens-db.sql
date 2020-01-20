CREATE DATABASE LINK DBEuropeSud
CONNECT TO cjaverliat
IDENTIFIED BY ****
USING 'DB13';

CREATE DATABASE LINK DBAmerique
CONNECT TO cjaverliat
IDENTIFIED BY ****
USING 'DB14';

-- On peut tester le bon établissement des connexions avec une requête SFW
select * from aouldhamou.clients_eu_s@DBEuropeSud;
select * from tberthier.clients_am@DBAmerique;
