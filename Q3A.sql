select nombre||' '||apellido as "CLIENTE", 
case when cantP.peliculas is not null then cantP.peliculas else 0 end as "C. PELICULAS",
case when cantS.series is not null then cantS.series else 0 end as "C. SERIES",
case when cantD.documentales is not null then cantD.documentales else 0 end as "C. DOCUMENTALES"
from cliente
full outer join (select rp.idcliente, count(1) as peliculas
        from pelicula
        join reproduccionpelicula rp on (pelicula.idpelicula=rp.idpelicula)
        group by rp.idcliente
        order by 2 desc )cantP on cliente.idcliente=cantp.idcliente
full outer join (select rs.idcliente, count(1) as series
        from serie
        join reproduccionserie rs on (serie.idserie=rs.idserie)
        group by rs.idcliente
        order by 2 desc )cantS on cliente.idcliente=cantS.idcliente
full outer join (select rd.idcliente, count(1) as documentales
        from documental
        join reproducciondocumental rd on (documental.iddocumental=rd.iddocumental)
        group by rd.idcliente
        order by 2 desc )cantD on cliente.idcliente=cantD.idcliente
where cantP.peliculas >0 or cantS.series >0 or cantD.documentales > 0


