--mise en place des logs
CREATE MATERIALIZED VIEW LOG ON CATEGORIES;

--mise en place des droits d’acces
GRANT SELECT ON MLOG$_CATEGORIES TO CJAVERLIAT;
GRANT SELECT ON MLOG$_CATEGORIES TO TBERTHIER;
