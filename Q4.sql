select 'Pelicula' as "Tipo",titulo,añoestreno,duracion||' minutos' as duracion,cantDescarga.cantidaddescargas as "C. DESCARGA" ,max(dp.fechadescarga) as "FECHA DESCARGA"
from pelicula
join (select idpelicula, count(1)CantidadDescargas
        from descargapelicula
        group by idpelicula)cantDescarga on pelicula.idpelicula=cantDescarga.idpelicula
join descargapelicula dp on pelicula.idpelicula=dp.idpelicula 
group by 'Pelicula' ,titulo,añoestreno,duracion||' minutos' ,cantDescarga.cantidaddescargas
UNION all
select 'Serie' as "Tipo",titulo,añoestreno,'Temporada '||serie.temporadas as duracion,cantDescarga.cantidaddescargas as "C. DESCARGA" ,max(dp.fechadescarga) as "FECHA DESCARGA"
from serie
join (select idserie, count(1)CantidadDescargas
        from descargaserie
        group by idserie)cantDescarga on serie.idserie=cantDescarga.idserie
join descargaserie dp on serie.idserie=dp.idserie 
group by 'Serie',titulo,añoestreno,'Temporada '||serie.temporadas,cantDescarga.cantidaddescargas

UNION all
select 'Documental' as "Tipo",titulo,añoestreno,'Temporada '||documental.temporadas as duracion,cantDescarga.cantidaddescargas as "C. DESCARGA" ,max(dp.fechadescarga) as "FECHA DESCARGA"
from documental
join (select iddocumental, count(1)CantidadDescargas
        from descargadocumental
        group by iddocumental)cantDescarga on documental.iddocumental=cantDescarga.iddocumental
join descargadocumental dp on documental.iddocumental=dp.iddocumental
group by 'Documental',titulo,añoestreno,'Temporada '||documental.temporadas,cantDescarga.cantidaddescargas
order by 5 desc, 6 
FETCH FIRST 10 ROWS ONLY


