select g.nombre as "GENERO",titulo,'Pelicula' as "TIPO",añoestreno,artista.nombre||' '||artista.apellido as "DIRECTOR(A)",pais.nombre as "PAIS"
from pelicula
join pais on(pelicula.idpais=pais.idpais)
join repartopelicula rP on(pelicula.idpelicula=rP.idpelicula)
join artista on (rp.idartista=artista.idartista)
join genero_pelicula gP on(pelicula.idpelicula=gP.idpelicula)
join genero g on(gp.idgenero=g.idgenero)
where rP.rol='director'
UNION all
select g.nombre as "GENERO",titulo,'Serie' as "TIPO",añoestreno,artista.nombre||' '||artista.apellido as "DIRECTOR(A)",pais.nombre as "PAIS"
from serie 
join pais on(serie.idpais=pais.idpais)
join repartoserie rS on(serie.idserie=rS.idserie)
join artista on (rS.idartista=artista.idartista)
join genero_serie gS on(serie.idserie=gS.idserie)
join genero g on(gS.idgenero=g.idgenero)
where rs.rol='director'
order by 1,3,2;



