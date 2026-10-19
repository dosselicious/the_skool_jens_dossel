select utbildningsområde, count(*) as antal 
from data_lab 
where Beslut = 'Beviljad'
group by utbildningsområde 
order by antal desc;

exit
