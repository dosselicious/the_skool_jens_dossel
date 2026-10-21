prompt D - Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT
select utbildningsnamn, count(*) as antal 
from data_lab 
where Beslut = 'Beviljad' 
and utbildningsområde = 'Data/IT' 
group by utbildningsnamn 
order by antal desc;

exit
