--Mise en place du replicat du fragment Employes
--Opérations réalisées localement

CREATE MATERIALIZED VIEW DMV_EMPLOYES
REFRESH FAST
NEXT SYSDATE +(1/24/60)
AS
SELECT * FROM tberthier.employes_am@linktodba;