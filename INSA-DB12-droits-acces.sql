SET HEADING OFF;
SET PAGESIZE 0;
SET FEEDBACK OFF;
SET ECHO OFF;
SET VERIFY OFF;

SPOOL droits_acces.sql

SELECT 'GRANT SELECT ON ' || table_name || ' TO aouldhamou, tberthier;' 
FROM user_tables;

SPOOL OFF;

@droits_acces.sql