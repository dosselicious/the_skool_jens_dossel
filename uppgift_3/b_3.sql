prompt 
prompt B.1 - Vilka SUN5-inriktningar har högst beviljandegrad, och hur många ansökningar ligger bakom?

select upper(trim(SUN5_INRIKTNING_NAMN)) as Inriktning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
Group by Inriktning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt B.2 - Vilka var bundna?
  
select upper(trim(SUN5_INRIKTNING_NAMN)) as Inriktning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Bunden'	
Group by Inriktning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt B.3 Vilka var på distans?
select upper(trim(SUN5_INRIKTNING_NAMN)) as Inriktning,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar"
from data_lab
where studieform = 'Distans'	
Group by Inriktning
having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;


exit
