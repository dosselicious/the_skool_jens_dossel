prompt
prompt D.1 Beviljandegrad fördelad på utbildningens längd

SELECT
    CASE
        WHEN yh_poäng < 100 THEN 'Under 100'
        WHEN yh_poäng < 200 THEN '100-199'
        WHEN yh_poäng < 300 THEN '200-299'
        WHEN yh_poäng < 400 THEN '300-399'
        WHEN yh_poäng < 500 THEN '400-499'
        WHEN yh_poäng < 600 THEN '500-599'
        ELSE '600+'
    END AS "poängintervall", count(*) as Antal, 
	round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / 
		COUNT(*),2) AS "Beviljandegrad",
	COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS "Antal beviljade"
FROM data_lab
group by "poängintervall" 
order by "Beviljandegrad" desc
;

prompt D.2 Beviljandegrad per sökta omgångar

select SÖKTA_UTBILDNINGSOMGÅNGAR as "Sökta utbildningsomgångar" ,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar",
COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) AS "Antal beviljade"
from data_lab
Group by SÖKTA_UTBILDNINGSOMGÅNGAR
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt D.3 Hur många ansökningar fick det antal omgångar som söktes?

select SÖKTA_UTBILDNINGSOMGÅNGAR as "Sökta utbildningsomgångar",
BEVILJADE_UTBILDNINGSOMGÅNGAR as "Beviljade utbildningsimgångar",
count(*) as "Antal ansökningar"
from data_lab
where beslut = 'Beviljad'
Group by SÖKTA_UTBILDNINGSOMGÅNGAR, BEVILJADE_UTBILDNINGSOMGÅNGAR
order by SÖKTA_UTBILDNINGSOMGÅNGAR, BEVILJADE_UTBILDNINGSOMGÅNGAR desc
;

prompt D.4 Topplista över de mest beviljade antalet omgångar

SELECT
    BEVILJADE_UTBILDNINGSOMGÅNGAR,
    COUNT(*) AS "Antal ansökningar"
FROM data_lab
WHERE beslut = 'Beviljad'
GROUP BY BEVILJADE_UTBILDNINGSOMGÅNGAR
ORDER BY "Antal ansökningar" DESC;

Exit
