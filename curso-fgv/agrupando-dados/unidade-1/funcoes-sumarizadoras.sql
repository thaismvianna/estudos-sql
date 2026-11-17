-- FUNÇÕES SUMARIZADORAS: realizam cálculos sobre vários registros.

-- COUNT(): conta a quantidade de registros.
-- AVG(): calcula a média.
-- SUM(): soma os valores.
-- MAX(): retorna o maior valor.
-- MIN(): retorna o menor valor.

-- Operadores:
-- * = multiplicação.
-- / = divisão.
-- + = adição.
-- - = subtração.
-- % = resto da divisão ou módulo.

SELECT cm.ref_year,
cm.tot_deaths,
100 * cm.tot_deaths / 1000 AS percent_deaths
FROM child_mortality cm
WHERE cm.ref_year IN (1910, 1920, 1930, 1940,
1950, 1960, 1970, 1980,
1990, 2000, 2010, 2020)
AND cm.country = 'Brazil'
ORDER BY cm.ref_year;

--operação aritmeticas entre colunas
SELECT gp.country,
gp.gdp_pc,
p.tot_pop,
(gp.gdp_pc * p.tot_pop)/1E12 AS gdp_usd_tri
FROM gdp_pc gp
JOIN population p ON gp.country = p.country
AND gp.ref_year = p.ref_year
WHERE gp.ref_year = 2022
ORDER BY gdp_usd_tri DESC
LIMIT 10;

--operações aritméticas na cláusula WHERE
SELECT cep.ref_year,
	   cep.co2_pc
FROM co2_emissions_pc cep
WHERE cep.ref_year BETWEEN 1972 AND 2016
AND cep.ref_year % 4 = 0
AND cep.country = 'Portugal'
ORDER BY cep.ref_year;

--operadores (ou funções) de sumarização
--todas as funções, exceto COUNT(), ignoram valores nulos.

-- AVG()
SELECT AVG(gp.gdp_pc) AS avg_gdp_pc
FROM gdp_pc gp
JOIN country c ON gp.country = c.country
WHERE gp.ref_year = 2020
AND c.four_regions = 'americas';

--Utilizando todas as funções sumarizadoras ao mesmo tempo
SELECT SUM(ai.mean_usd) AS "sum",
AVG(ai.mean_usd) AS mean,
MAX(ai.mean_usd),
MIN(ai.mean_usd) AS "min",
COUNT(ai.mean_usd) AS "count"
FROM avg_income ai
JOIN country c ON ai.country = c.country
WHERE ai.ref_year = 2020
AND c.four_regions = 'europe';


