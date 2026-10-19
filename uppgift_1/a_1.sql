select utbildningsområde, count(*) as antal 
from data_lab 
group by utbildningsområde 
order by antal desc;

exit
