select pelicula.titulo, pelicula.añoestreno,generos, count(pelicula.idpelicula)
from pelicula
join (select LISTAGG(distinct ' '||g.nombre, ', ') WITHIN GROUP(ORDER BY pelicula.idpelicula) generos,pelicula.idpelicula
        from pelicula
        full outer join genero_pelicula gP on(pelicula.idpelicula=gP.idpelicula)
        join genero g on(gp.idgenero=g.idgenero)
        group by pelicula.idpelicula) generos on pelicula.idpelicula=generos.idpelicula
join reproduccionpelicula rp on(pelicula.idpelicula=rp.idpelicula)
group by pelicula.titulo, pelicula.añoestreno,generos;