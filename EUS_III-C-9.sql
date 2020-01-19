--On execute les commande suivantes et on voit bien qu’on obtient le meme nombre 
--de tuples pour les requêtes sur les meme --tables.

select * from clients;
select * from Ryori.clients@linktodbcentrale;

select * from stock;
select * from Ryori.stock@linktodbcentrale;

select * from employes;
select * from Ryori.employes@linktodbcentrale;

select * from fournisseurs;
select * from Ryori.fournisseurs@linktodbcentrale;

select * from commandes;
select * from Ryori.commandes@linktodbcentrale;

select * from details_commandes;
select * from Ryori.details_commandes@linktodbcentrale;

select * from produits;
select * from Ryori.produits@linktodbcentrale;

select * from categories;
select * from Ryori.categories@linktodbcentrale;

