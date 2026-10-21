prompt 
prompt H - Andel distans och andel bundna utbildningar inom respektive utbildingsområde

select upper(trim(utbildningsområde)) as Område, 
round(COUNT(CASE WHEN studieform = 'Bunden' THEN 1 END) * 100.0 / COUNT(*),2) AS "Andel Bundna", 
round(COUNT(CASE WHEN studieform = 'Distans' THEN 1 END) * 100.0 / COUNT(*),2) AS "Andel Distans"
from data_lab
Group by Område
order by Område
;
exit
