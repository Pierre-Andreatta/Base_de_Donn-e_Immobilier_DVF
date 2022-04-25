WITH janv AS (
	SELECT COUNT(mutation.id) AS compte
  	FROM mutation     
    WHERE mutation.date BETWEEN '2020-01-01' AND '2020-03-31'
),
avril AS (
	SELECT COUNT(mutation.id) AS compte
    FROM mutation     
    WHERE mutation.date BETWEEN '2020-04-01' AND '2020-06-30'  
    )

SELECT 
CAST(
	(ROUND((((avril.compte-janv.compte)/janv.compte)*100), 2))
AS DECIMAL(10, 2)
)
AS "Taux d'évolution"

FROM janv, avril

;

