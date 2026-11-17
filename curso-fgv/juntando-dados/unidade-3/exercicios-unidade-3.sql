--1)Em uma única consulta, traga os dados de tempo na escola de homens e mulheres nos BRICS (Brazil, Russia, India, China e South Africa) no ano de 2000. Use as tabelas men_years_at_school e woman_years_at_school. Lembre-se de criar uma coluna para distinguir cada um dos gêneros e utilize a cláusula UNION. Indique quem passa mais e menos tempo na escola.
SELECT m.country, m.mean_years, 'male' as gender
FROM men_years_at_school m
WHERE m.country IN ( 'Brazil', 'Russia', 'China', 'India', 'South Africa')
	AND m.ref_year= 2009	
UNION
SELECT w.country, w.mean_years, 'female' as gender
FROM women_years_at_school w
WHERE w.country IN ( 'Brazil', 'Russia', 'China', 'India', 'South Africa')
	AND w.ref_year= 2009;

--2)Indique quais são os países presentes na tabela child_mortality que NÃO estão na tabela fertility.
SELECT cm.country
FROM child_mortality cm
EXCEPT
SELECT f.country
FROM fertility f;

--3)Compare as tabelas population e child_mortality e indique se há alguma diferença nos países presentes em cada uma delas.
SELECT p.country
FROM population p
EXCEPT
SELECT cm.country
FROM child_mortality cm;

--4)Indique se há algum país na tabela population que NÃO existe na tabela country.
SELECT p.country
FROM population p
EXCEPT
SELECT c.country
FROM country c;

--5)Utilizando as tabelas co2_emissions_pc e men_years_at_school, verifique se há diferenças na combinação de país e ano para o Brasil a partir de 2000 (inclusive).
SELECT cep.country, cep.ref_year
FROM co2_emissions_pc cep
WHERE cep.country = 'Brazil'
	AND cep.ref_year> 2000	
EXCEPT
SELECT myas.country, myas.ref_year
FROM men_years_at_school myas
WHERE myas.country = 'Brazil'
	AND myas.ref_year> 2000;

--6)Indique quais são as linhas comuns entre as tabelas co2_emissions_pc e men_years_at_school.
SELECT cep.country, cep.ref_year
FROM co2_emissions_pc cep
WHERE cep.country = 'Brazil'
	AND cep.ref_year >= 2000	
INTERSECT
SELECT myas.country, myas.ref_year
FROM men_years_at_school myas
WHERE myas.country = 'Brazil'
	AND myas.ref_year >= 2000;