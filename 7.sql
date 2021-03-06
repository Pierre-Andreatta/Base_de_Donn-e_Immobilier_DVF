WITH janv AS (
	SELECT commune.nom AS commune, 
	COUNT(mutation.id) AS compte
  	FROM mutation     
  	INNER JOIN bien ON bien.id = mutation.bien_id
	INNER JOIN commune ON commune.code_id = bien.commune_code_id
    WHERE mutation.date BETWEEN '2020-01-01' AND '2020-03-31'
    GROUP BY commune.nom
),
avril AS (
	SELECT commune.nom AS commune, 
	COUNT(mutation.id) AS compte
    FROM mutation     
    INNER JOIN bien ON bien.id = mutation.bien_id
	INNER JOIN commune ON commune.code_id = bien.commune_code_id
    WHERE mutation.date BETWEEN '2020-04-01' AND '2020-06-30'  
    GROUP BY commune.nom
    )

SELECT commune.nom,
CAST(
(avril.compte-janv.compte)/janv.compte*100 
AS DECIMAL(10, 2))
AS "Taux d'évolution"
FROM commune
JOIN janv ON janv.commune = commune.nom
JOIN avril ON avril.commune = commune.nom

WHERE CAST(
(avril.compte-janv.compte)/janv.compte*100 
AS DECIMAL(10, 2)) > 20

ORDER BY "Taux d'évolution" DESC

;
