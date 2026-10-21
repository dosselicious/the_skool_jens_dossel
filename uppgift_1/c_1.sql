select utbildningsområde, count(*) as antal 
from data_lab 
where Beslut = 'Avslag'
group by utbildningsområde 
order by antal desc;

exit
