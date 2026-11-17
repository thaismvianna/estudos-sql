--AGRUPANDO DADOS

--Agrupando com GROUP BY
SELECT gp.ref_year,
AVG(gp.gdp_pc) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
AND c.four_regions = 'americas'
GROUP BY gp.ref_year;

--Agrupando por mais de uma coluna
SELECT c.four_regions,
       gp.ref_year,
ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, gp.ref_year
ORDER BY c.four_regions, gp.ref_year;

--Selecionando por valor agrupado com HAVING
SELECT c.four_regions,
       gp.ref_year,
ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, gp.ref_year
HAVING avg_gdp_pc > 17000
ORDER BY c.four_regions, gp.ref_year;

--HAVING por faixa de valores
SELECT c.four_regions,
       gp.ref_year,
ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, gp.ref_year
HAVING avg_gdp_pc BETWEEN 17000 AND 20000
ORDER BY c.four_regions, gp.ref_year;

--Negando o HAVING
SELECT c.four_regions,
	   gp.ref_year,
ROUND(AVG(gp.gdp_pc), 2) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year BETWEEN 2018 AND 2022
GROUP BY c.four_regions, gp.ref_year
HAVING NOT avg_gdp_pc > 17000
ORDER BY c.four_regions, gp.ref_year;

--Contando as linhas de uma tabela com COUNT()
SELECT count(*)
FROM women_years_at_school;

--Contando valores distintos com COUNT(DISTINCT)
SELECT count(DISTINCT country)
FROM women_years_at_school;

--Usando outras funções com o COUNT(DISTINCT)
SELECT count(DISTINCT ref_year),
min(ref_year),
max(ref_year)
FROM women_years_at_school;

--Contando com GROUP BY
SELECT country,
count(*)
FROM women_years_at_school
GROUP BY country;

--Contando com GROUP BY – outro enfoque
SELECT ref_year,
count(*)
FROM women_years_at_school
GROUP BY ref_year;

--Contando valores nulos
SELECT count(*)
FROM women_years_at_school
WHERE mean_years IS NULL;

