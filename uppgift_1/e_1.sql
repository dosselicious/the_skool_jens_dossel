prompt E - Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT
select upper(trim(utbildningsnamn)) as Utbildning, count(*) as Antal 
from data_lab 
where Beslut = 'Avslag' 
and utbildningsområde = 'Data/IT' 
group by upper(trim(utbildningsnamn)) 
order by antal desc;

exit
