prompt
prompt I - Antal utbildningar som innehåller ordet AI

Select count(*) as Antal
from data_lab
where utbildningsnamn like '%AI%'
;


prompt
prompt Alla utbildningar med AI i namnet.

select utbildningsnamn
from data_lab
where utbildningsnamn like '%AI%'
;


exit
