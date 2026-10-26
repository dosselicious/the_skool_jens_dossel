prompt
prompt A - Antal ansökningar per utbildningsområde, sorterat på flest ansökningar
SELECT
    o.utbildningsomrade_name,
    COUNT(*) AS antal
FROM ansokan a
JOIN sun5_inriktning s
    ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o
    ON o.utbildningsomrade_id = s.utbildningsomrade_id
GROUP BY o.utbildningsomrade_name
ORDER BY antal DESC;

prompt B - Antal BEVILJADE ansökningar per utbildningsområde
SELECT
    o.utbildningsomrade_name,
    COUNT(*) AS antal
FROM ansokan a
JOIN sun5_inriktning s
    ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o
    ON o.utbildningsomrade_id = s.utbildningsomrade_id
Where a.beslut = 'Beviljad'
GROUP BY o.utbildningsomrade_name
ORDER BY antal DESC;

prompt C - Antal AVSLAGNA ansökningar per utbildningsområde
SELECT
    o.utbildningsomrade_name,
    COUNT(*) AS antal
FROM ansokan a
JOIN sun5_inriktning s
    ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o
    ON o.utbildningsomrade_id = s.utbildningsomrade_id
Where a.beslut = 'Avslag'
GROUP BY o.utbildningsomrade_name
ORDER BY antal DESC;

prompt D - Antal beviljade ansökningar per utbildningsnamn inom Data/IT
SELECT
    a.utbildningsnamn,
    COUNT(*) AS antal
FROM ansokan a
JOIN sun5_inriktning s
    ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o
    ON o.utbildningsomrade_id = s.utbildningsomrade_id
where a.beslut = 'Beviljad'
  AND o.utbildningsomrade_name = 'Data/IT'
GROUP BY a.utbildningsnamn
ORDER BY antal DESC;

PROMPT E - Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
SELECT
    UPPER(TRIM(a.utbildningsnamn)) AS utbildning,
    COUNT(*) AS antal
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade o
    ON s.utbildningsomrade_id = o.utbildningsomrade_id
WHERE a.beslut = 'Avslag'
  AND o.utbildningsomrade_name = 'Data/IT'
GROUP BY UPPER(TRIM(a.utbildningsnamn))
ORDER BY antal DESC;

PROMPT F - Antal BEVILJADE ansökningar per anordnare och utbildningsnamn inom Data/IT
SELECT
    UPPER(TRIM(a.utbildningsnamn)) AS utbildning,
    UPPER(TRIM(u.name)) AS anordnare,
    COUNT(*) AS antal
FROM ansokan a
JOIN utbildningsanordnare u
    ON a.anordnare_id = u.anordnare_id
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade o
    ON s.utbildningsomrade_id = o.utbildningsomrade_id
WHERE a.beslut = 'Beviljad'
  AND o.utbildningsomrade_name = 'Data/IT'
GROUP BY
    UPPER(TRIM(a.utbildningsnamn)),
    UPPER(TRIM(u.name))
ORDER BY antal DESC;

PROMPT G - Topp 5 län efter antal beviljade ansökningar
SELECT
    UPPER(TRIM(l.lan_name)) AS lan,
    COUNT(*) AS "Beviljade Kurser"
FROM ansokan a
JOIN ansokan_kommun ak
    ON a.diarienummer = ak.diarienummer
JOIN kommun k
    ON ak.kommun_id = k.kommun_id
JOIN lan l
    ON k.lan_id = l.lan_id
WHERE a.beslut = 'Beviljad'
GROUP BY UPPER(TRIM(l.lan_name))
ORDER BY "Beviljade Kurser" DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT H - Andel distans och bundna utbildningar per utbildningsområde
SELECT
    UPPER(TRIM(o.utbildningsomrade_name)) AS omrade,
    ROUND(
        COUNT(CASE WHEN a.studieform = 'Bunden' THEN 1 END)
        * 100.0 / COUNT(*), 2
    ) AS "Andel Bundna",
    ROUND(
        COUNT(CASE WHEN a.studieform = 'Distans' THEN 1 END)
        * 100.0 / COUNT(*), 2
    ) AS "Andel Distans"
FROM ansokan a
JOIN sun5_inriktning s
    ON a.sun5_kod = s.sun5_kod
JOIN utbildningsomrade o
    ON s.utbildningsomrade_id = o.utbildningsomrade_id
GROUP BY UPPER(TRIM(o.utbildningsomrade_name))
ORDER BY omrade;


PROMPT I - Antal utbildningar som innehåller ordet AI
SELECT COUNT(*) AS antal
FROM ansokan
WHERE utbildningsnamn LIKE '%AI%';

PROMPT Alla utbildningar med AI i namnet
SELECT utbildningsnamn
FROM ansokan
WHERE utbildningsnamn LIKE '%AI%';

EXIT;
