-- Mise en place du réplicat du fragment Fournisseurs 
-- Opérations réalisées localement

CREATE MATERIALIZED VIEW DMV_FOURNISSEURS
REFRESH COMPLETE
NEXT SYSDATE +(1/24/60)
AS
SELECT * FROM cjaverliat.fournisseurs@linktodben;

