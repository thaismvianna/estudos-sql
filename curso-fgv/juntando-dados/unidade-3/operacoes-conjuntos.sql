-- OPERAÇÕES DE CONJUNTOS: combinam resultados de duas consultas SQL.

-- IMPORTANTE: as consultas precisam ter a mesma quantidade de colunas e os tipos de dados das colunas correspondentes devem ser compatíveis.

-- UNION: junta os resultados e remove as linhas duplicadas.
SELECT m.country,
	   m.ref_year,
	   'male' as gender,
	   m.mean_years
FROM men_years_at_school m
UNION 
SELECT w.country,
	   w.ref_year,
	   'female' as gender,
	   w.mean_years
FROM women_years_at_school w;

--UNION com filtro de linhas
SELECT m.country, m.ref_year, m.mean_years, 'male' as gender
FROM men_years_at_school m
WHERE m.country = 'Brazil'
AND m.ref_year = 2005
UNION
SELECT w.country, w.ref_year, w.mean_years, 'female' as gender
FROM women_years_at_school w
WHERE w.country = 'Brazil'
AND w.ref_year = 2005;

--UNION que remove linhas duplicadas
SELECT m.country, m.ref_year
FROM men_years_at_school m
WHERE m.country = 'Brazil'
UNION
SELECT w.country, w.ref_year
FROM women_years_at_school w
WHERE w.country = 'Brazil';

--UNION ALL: junta os resultados mantendo as duplicatas
SELECT m.country, m.ref_year
FROM men_years_at_school m
WHERE m.country = 'Brazil'
UNION ALL
SELECT w.country, w.ref_year
FROM women_years_at_school w
WHERE w.country = 'Brazil';

--EXCEPT: mostra os registros da primeira consulta que não aparecem na segunda
SELECT p.country
FROM population p
EXCEPT
SELECT f.country
FROM fertility f;

--INTERSECT: mostra apenas os registros que aparecem nas duas consultas
SELECT p.country
FROM population p
INTERSECT
SELECT f.country
FROM fertility f;






