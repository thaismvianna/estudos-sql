--1)Utilizando a tabela country, o campo four_regions igual a asia e a tabela man_years_at_school, encontre os cinco países asiáticos cujos homens de 25 anos passaram menos tempo na escola em 2009.
SELECT my.country, 
	my.mean_years
FROM men_years_at_school my
JOIN country c ON my.country = c.country 
WHERE my.ref_year = 2009
	AND c.four_regions= 'asia'
ORDER BY my.mean_years
LIMIT 5;

--2)Utilizando o campo wb3income e o campo wb_regions da tabela country, além da tabela avg_income, liste os 10 países de maior renda per capita diária no ano de 1985, além da região e da classificação de três rendas, ambos do Banco Mundial.
SELECT ai.country, 
	c.wb_regions, 
	c.wb3income, 
	ai.mean_usd
FROM avg_income ai
JOIN country c ON ai.country= c.country
WHERE ai.ref_year = 1985
ORDER BY ai.mean_usd DESC
LIMIT 10;

--3)Selecione, apenas para o Brasil, os dados de renda per capita diária, PIB, população, mortalidade infantil, fertilidade e expectativa de vida, abrangendo o período de 1900 a 2020, a cada 10 anos (1900, 1910, 1920, ..., 2020).
SELECT ai.ref_year, 
	ai.mean_usd, 
	p.tot_pop, 
	cm.tot_deaths, 
	f.mean_babies, 
	le.tot_years
FROM avg_income ai
JOIN gdp_pc gp ON ai.country = gp.country 
	AND ai.ref_year = gp.ref_year
JOIN population p ON ai.country = p.country 
	AND ai.ref_year = p.ref_year
JOIN child_mortality cm ON ai.country = cm.country 
	AND ai.ref_year = cm.ref_year
JOIN fertility f ON ai.country = f.country 
	AND ai.ref_year = f.ref_year
JOIN life_expectancy le ON ai.country = le.country 
	AND ai.ref_year = le.ref_year
WHERE ai.country = 'Brazil'
AND ai.ref_year in (1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010,2020)
ORDER BY ai.ref_year;

--4)A partir da tabela country, com o campo four_regions igual a asia, e da tabela man_years_at_school, encontre os cinco países asiáticos cujos homens de 25 anos passaram menos tempo na escola em 2009, utilizando a cláusula NATURAL JOIN. Confira se os resultados foram iguais aos obtidos na questão 1.
SELECT my.country, 
	my.mean_years
FROM men_years_at_school my
NATURAL JOIN country c 
WHERE my.ref_year = 2009
	AND c.four_regions = 'asia'
ORDER BY my.mean_years
LIMIT 5;

--5)Selecione, apenas para o Brasil, os dados de renda per capita diária, PIB, população, mortalidade infantil, fertilidade e expectativa de vida, abrangendo o período de 1900 a 2020, a cada 10 anos (1900, 1910, 1920, ..., 2020), utilizando a cláusula NATURAL JOIN. Confira se os resultados foram iguais aos obtidos na questão 3.
SELECT ai.ref_year, 
	ai.mean_usd, 
	gp.gdp_pc, 
	p.tot_pop, 
	cm.tot_deaths, 
	f.mean_babies , 
	le.tot_years 
FROM avg_income ai
NATURAL JOIN gdp_pc gp
NATURAL JOIN population p
NATURAL JOIN child_mortality cm
NATURAL JOIN fertility f
NATURAL JOIN life_expectancy le
WHERE ai.country = 'Brazil'
	AND ai.ref_year in (1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010,2020)
ORDER BY ai.ref_year;