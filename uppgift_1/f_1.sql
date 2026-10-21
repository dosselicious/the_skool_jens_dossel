prompt
prompt F - Antal BEVILJADE ansökningar per utbildningsanordnare
prompt administrativ enhet och utbildningsnamn, inom Data/IT
select upper(trim(utbildningsnamn)) as Utbildning, upper(trim(UTBILDNINGSANORDNARE_ADMINISTR)) as Anordnare, count(*) as antal 
from data_lab 
where Beslut = 'Beviljad' 
and utbildningsområde = 'Data/IT' 
group by upper(trim(utbildningsnamn)), upper(trim(UTBILDNINGSANORDNARE_ADMINISTR))
order by antal desc;

exit
