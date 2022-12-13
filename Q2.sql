select titulo,'Documental' as "TIPO",añoestreno,temporadas,g.nombre as "GENERO",artista.nombre||' '||artista.apellido as "DIRECTOR(A)"
from documental
join pais on(documental.idpais=pais.idpais)
join repartodocumental rD on(documental.iddocumental=rD.iddocumental)
join artista on (rD.idartista=artista.idartista)
join genero_documental gD on(documental.iddocumental=gD.iddocumental)
join genero g on(gD.idgenero=g.idgenero)
where rD.rol='director'
UNION all
select titulo,'Serie' as "TIPO",añoestreno,temporadas,g.nombre as "GENERO",artista.nombre||' '||artista.apellido as "DIRECTOR(A)"
from serie 
join pais on(serie.idpais=pais.idpais)
join repartoserie rS on(serie.idserie=rS.idserie)
join artista on (rS.idartista=artista.idartista)
join genero_serie gS on(serie.idserie=gS.idserie)
join genero g on(gS.idgenero=g.idgenero)
where rs.rol='director'
order by "GENERO","TIPO",titulo;


