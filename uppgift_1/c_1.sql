prompt C - Antal AVSLAGNA ansökningar per utbildningsområde
select utbildningsområde, count(*) as antal 
from data_lab 
where Beslut = 'Avslag'
group by utbildningsområde 
order by antal desc;

exit
