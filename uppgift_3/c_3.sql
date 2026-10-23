prompt 
prompt C.1 - Vilka utbildningsområden har högst beviljandegrad, och hur många ansökningar ligger bakom?

select upper(trim(UTBILDNINGSOMRÅDE)) as Område,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
Group by Område
--having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt C.2 - Vilka var bundna?
  
select upper(trim(UTBILDNINGSOMRÅDE)) as Område,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Bunden'	
Group by Område
--having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt C.3 Vilka var på distans?
select upper(trim(UTBILDNINGSOMRÅDE)) as Område,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Distans'	
Group by Område
--having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;


exit
