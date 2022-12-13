select serie.titulo, serie.añoestreno,generos, count(serie.idserie) AS "CANTIDAD PELICULA"
from serie
join (select LISTAGG(distinct ' '||g.nombre, ', ') WITHIN GROUP(ORDER BY serie.idserie) generos,serie.idserie
        from serie
        full outer join genero_serie gS on(serie.idserie=gS.idserie)
        join genero g on(gS.idgenero=g.idgenero)
        group by serie.idserie) generos on serie.idserie=generos.idserie
join reproduccionserie rS on(serie.idserie=rS.idserie)
group by serie.titulo, serie.añoestreno,generos
order by serie.añoestreno,serie.titulo;