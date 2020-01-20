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
