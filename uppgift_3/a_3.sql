prompt 
prompt A.1 - Vilka utbildningar har högst beviljandegrad, och hur många ansökningar ligger bakom?

select upper(trim(utbildningsnamn)) as Utbildning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
Group by Utbildning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt A.2 - Vilka var bundna?
  
select upper(trim(utbildningsnamn)) as Utbildning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Bunden'	
Group by Utbildning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt A.3 Vilka var på distans?
select upper(trim(utbildningsnamn)) as Utbildning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Distans'	
Group by Utbildning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt 
prompt A.4 - Beviljandegrad per studieform

select upper(trim(studieform)) as Studieform,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
Group by Studieform
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

exit


