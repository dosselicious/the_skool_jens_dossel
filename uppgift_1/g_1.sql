prompt
prompt G - Topp 5 län efter antal beviljade ansökningar

select upper(trim(län)) as Län, count(*) as "Beviljade Kurser"
from data_lab
where beslut = 'Beviljad'
group by upper(trim(län))
order by "Beviljade Kurser" desc
fetch first 5 rows only;

exit

