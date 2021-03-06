SELECT commune.nom, commune.cp, CAST(AVG(mutation.val_fonc) AS DECIMAL(15,2)) AS "Valeur foncière moyenne"
FROM mutation

INNER JOIN bien ON bien.id = mutation.bien_id
INNER JOIN commune ON commune.code_id = bien.commune_code_id

GROUP BY commune.nom, commune.cp
ORDER BY "Valeur foncière moyenne" DESC

LIMIT 20

;