SELECT * FROM CLIENTS_EU_N
UNION
SELECT * FROM CLIENTS_AUTRES
UNION
SELECT * FROM aouldhamou.clients_eu_s@DBEuropeSud
UNION
SELECT * FROM tberthier.clients_am@DBAmerique;
