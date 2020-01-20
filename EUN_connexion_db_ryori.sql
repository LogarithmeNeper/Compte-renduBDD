CREATE DATABASE LINK DBLCentrale
CONNECT TO cjaverliat
IDENTIFIED BY ****
USING 'DB11';

-- On peut tester le bon établissement de la connexion avec une requête SFW
select * from Ryori.clients@DBLCentrale;
