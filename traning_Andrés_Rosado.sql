--1
select nombre, fecha_inicio, fecha_fin, nombre_pais 
from competicion c 
NATURAL JOIN nacionalidad n 
where nombre_pais LIKE "Estados Unidos";

--2
select e.id, d.nombre, c.nombre 
from eventos e 
JOIN disciplinas d ON e.id_disciplina=d.id 
JOIN competicion c ON e.id_competicion=c.id 
where c.nombre LIKE "%2023" 
ORDER BY d.nombre DESC;

--3
select n.nombre_pais, n.codpais, a.id 
from nacionalidad n 
JOIN atletas a ON a.pais=n.codpais 
where id > 2 
order by id desc; 

--4
select d.id, d.nombre, MIN(r.resultado), MAX(r.resultado) 
from competicion c JOIN eventos e ON c.id = e.id_competicion 
JOIN disciplinas d ON e.id_disciplina = d.id 
JOIN resultados r ON e.id = r.id_evento 
where c.nombre = 'Mundial de Atletismo 2023' 
group by d.nombre 
ORDER BY MIN(r.resultado);

--5
select concat(a.nombre," ",a.apellido),c.id, r.puesto, r.resultado 
from atletas a 
JOIN resultados r ON r.id_atleta=a.id 
JOIN eventos e ON r.id_evento=e.id 
JOIN competicion c ON e.id_competicion=c.id 
where resultado is not null ;

--6
select nombre 
from disciplinas 
where es_masculina=FALSE and distancia < 600;

--7
select d.nombre, r.resultado, e.fecha, c.ubicacion 
from atletas a 
LEFT JOIN resultados r ON a.id=r.id_atleta 
LEFT JOIN eventos e ON r.id_evento=e.id 
LEFT JOIN competicion c On e.id_competicion=c.id 
LEFT JOIN disciplinas d On e.id_disciplina=d.id 
where es_masculina=TRUE;
