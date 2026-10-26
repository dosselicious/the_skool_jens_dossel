WITH 
utbildningar AS (
    SELECT
        UPPER(TRIM(utbildningsnamn)) AS utbildning,
        COUNT(*) AS antal_ansokningar,
        ROUND(
            COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END)
            * 100.0 / COUNT(*), 2
        ) AS beviljandegrad
    FROM data_lab
    WHERE studieform = 'Bunden'
    GROUP BY UPPER(TRIM(utbildningsnamn))
    HAVING COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END)
           * 100.0 / COUNT(*) = 100 and count(*) > 2
),
lan AS (
    SELECT DISTINCT län
    FROM data_lab
    WHERE län IS NOT NULL
)
SELECT
    u.utbildning,
    u.antal_ansokningar,
    u.beviljandegrad,
    l.län
FROM utbildningar u
CROSS JOIN lan l
WHERE NOT EXISTS (
    SELECT 1
    FROM data_lab d
    WHERE UPPER(TRIM(d.utbildningsnamn)) = u.utbildning
      AND d.län = l.län
      AND d.studieform = 'Bunden'
)
ORDER BY u.beviljandegrad DESC,
         u.antal_ansokningar DESC,
         u.utbildning,
         l.län;
Exit
