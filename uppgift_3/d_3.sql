prompt 
prompt D.1 - Vilka län  har högst beviljandegrad, och hur många ansökningar ligger bakom?

select upper(trim(LÄN)) as Län,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar", COUNT(CASE WHEN beslut = 'Beviljad' then 1 end) as "Antal beviljade"
from data_lab
Group by Län
--having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt 
prompt D.2 - Vilka kommuner  har högst beviljandegrad, och hur många ansökningar ligger bakom?

select upper(trim(KOMMUN)) as Kommun,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar",COUNT(CASE WHEN beslut = 'Beviljad' then 1 end) as "Antal beviljade"
from data_lab
Group by Kommun
--having round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) >= 80
order by "Beviljandegrad" desc, "Antal ansökningar" desc
;

prompt
prompt D.3 - Andel beviljade distans- och bundna utbildningar inom respektive län

select upper(trim(LÄN)) as Län, studieform,
round(COUNT(CASE WHEN beslut = 'Beviljad' THEN 1 END) * 100.0 / COUNT(*),2) AS "Beviljandegrad",
count(*) as "Antal ansökningar", COUNT(CASE WHEN beslut = 'Beviljad' then 1 end) as "Antal beviljade"
from data_lab
Group by Län, Studieform
order by Län, studieform
;

prompt
prompt D.4 - Antal sökta och beviljade platser inom respektive län för beviljade utbildningar

select upper(trim(LÄN)) as Län, sum(SÖKTA_PLATSER_TOTALT) as "Sökta platser", 
	sum(BEVILJADE_PLATSER_TOTALT) as "Beviljade platser", 
round(
	sum(BEVILJADE_PLATSER_TOTALT) * 100.0 
	/ sum(SÖKTA_PLATSER_TOTALT), 2) as Procent
from data_lab
where beslut = 'Beviljad'
Group by Län
order by  procent desc
;


EXIT
