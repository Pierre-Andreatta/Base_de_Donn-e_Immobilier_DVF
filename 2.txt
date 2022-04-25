SELECT 
	bien.piece_princip_nb AS "Nombre de pièces",
		CAST(
			(ROUND(
				(COUNT(mutation.bien_id)/
				(SELECT COUNT(mutation.bien_id)
				FROM mutation
				INNER JOIN bien ON bien.id=mutation.bien_id
				WHERE bien.code_local = 2
				AND mutation.nature_id = 1)*100)
			, 2))
		AS DECIMAL(10, 2))

	AS "Vente appartements (%)"
FROM mutation
INNER JOIN bien ON bien.id=mutation.bien_id
WHERE bien.code_local = 2
AND mutation.nature_id = 1
GROUP BY piece_princip_nb
ORDER BY piece_princip_nb

;