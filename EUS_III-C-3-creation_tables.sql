
--Creation du fragment Europe du SUD

--creation les tables pour le fragment EU du sud

--Categories :
    create table Categories as (
    select *
    from Ryori.categories@linkToDBCentrale);
--Produits :
    create table produits as (
    select *
    from Ryori.produits@linkToDBCentrale);
--Stock :
   create table stock_eu_s as select *
    from Ryori.stock@linkToDBCentrale
	--permet de selectionner les tuples dont le pays est en Eu du sud
    where pays in('Espagne', 'Portugal', 'Andorre',  
		'France', 'Gibraltar', 'Italie','Saint-Marin', 'Vatican',
		'Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 
		'Grece', 'Macedoine','Montenegro', 'Serbie', 'Slovenie', 'Bulgarie');



--Commandes :
 create table Commandes_eu_s as (
    select  Ryori.COMMANDES.NO_COMMANDE@linkToDBCentrale,
    Ryori.COMMANDES.CODE_CLIENT@linkToDBCentrale,
    Ryori.COMMANDES.NO_EMPLOYE@linkToDBCentrale,
    Ryori.COMMANDES.DATE_COMMANDE@linkToDBCentrale,
    Ryori.COMMANDES.DATE_ENVOI@linkToDBCentrale,
    Ryori.COMMANDES.PORT@linkToDBCentrale
    from Ryori.commandes@linkToDBCentrale,Clients_eu_s
    where Clients_eu_s.CODE_CLIENT = Ryori.commandes.CODE_CLIENT@linkToDBCentrale);
  
--Details_Commandes :
    create table details_commandes_eu_s as(
    select Ryori.details_commandes.no_commande@linkToDBCentrale,
    Ryori.details_commandes.ref_produit@linkToDBCentrale,
    Ryori.details_commandes.prix_unitaire@linkToDBCentrale,
    Ryori.details_commandes.quantite@linkToDBCentrale,
    Ryori.details_commandes.remise@linkToDBCentrale
    from Ryori.details_commandes@linkToDBCentrale,Produits,Commandes_EU_S
    where Produits.ref_produit=Ryori.details_commandes.ref_produit@linkToDBCentrale
    and Commandes_EU_S.no_commande=Ryori.details_commandes.no_commande@linkToDBCentrale);

--Clients :
    create table clients_eu_s as select *
    from Ryori.clients@linkToDBCentrale
    where pays in('Espagne', 'Portugal', 'Andorre', 'France', 'Gibraltar', 'Italie',
	'Saint-Marin', 'Vatican','Malte', 'Albanie', 'Bosnie-Herzegovine', 'Croatie', 'Grece',
	'Macedoine', 'Montenegro', 'Serbie', 'Slovenie', 'Bulgarie');

