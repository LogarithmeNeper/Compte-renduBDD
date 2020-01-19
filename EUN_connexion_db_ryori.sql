CREATE DATABASE LINK DBLCentrale 
CONNECT TO cjaverliat 
IDENTIFIED BY mdporacle 
USING 'DB11';

-- ligne de test
select * from Ryori.clients@DBLCentrale;