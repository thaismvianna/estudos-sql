--SUBQUERIES (SUBCONSULTAS)
--É uma consulta SQL dentro de outra consulta. A consulta interna é executada para fornecer um resultado que será utilizado pela consulta externa.
-- Uma subquery deve ficar entre parênteses.

-- Exemplo: selecionar países com PIB per capita acima da média.
SELECT country, gdp_pc
FROM gdp_pc
WHERE gdp_pc > (
    -- Consulta interna: calcula a média do PIB per capita.
    SELECT AVG(gdp_pc)
    FROM gdp_pc
);

-- A subquery pode ser utilizada com operadores como:
-- =, >, <, >=, <= e IN.

-- IN: verifica se o valor está dentro dos resultados da subquery.
-- Exemplo: selecionar países que aparecem na consulta interna.
SELECT country
FROM country
WHERE country IN (
    SELECT country
    FROM gdp_pc
    WHERE ref_year = 2020
);

-- NOT IN: seleciona valores que NÃO aparecem nos resultados
-- da subquery.

-- Uma subquery também pode ser usada com EXISTS.
-- EXISTS verifica se a consulta interna retorna pelo menos um registro.
-- NOT EXISTS verifica se não retorna nenhum registro.

-- A subquery pode retornar:
-- 1 valor: pode ser comparado com =, >, < etc.
-- Vários valores: pode ser utilizada com IN.
-- A subquery também pode retornar uma tabela de resultados, dependendo de como é utilizada.

-- IMPORTANTE:
-- A consulta interna fica dentro dos parênteses.
-- A consulta externa utiliza o resultado dela.
-- Subqueries ajudam a fazer consultas mais complexas sem precisar dividir o trabalho em várias consultas.

--Duas subqueries
SELECT le.country,
	   le.ref_year,
	   le.tot_years
FROM life_expectancy le
WHERE le.ref_year = 2000
AND (
		le.tot_years = (
		SELECT MIN(le2.tot_years)
		FROM life_expectancy le2
		WHERE le2.ref_year = 2000
)
OR le.tot_years = (
		SELECT MAX(le3.tot_years)
		FROM life_expectancy le3
		WHERE le3.ref_year = 2000
	)
);

--Subqueries usando visões (views)
SELECT tab.country,
	   tab.gender,
	   ROUND(AVG(tab.mean_years), 2) as avg_mean_years
FROM (
		SELECT m.country,
		m.ref_year,
		'male' as gender,
		m.mean_years
		FROM men_years_at_school m
		UNION ALL
		SELECT w.country,
		w.ref_year,
		'female' as gender,
		w.mean_years
		FROM women_years_at_school w
) AS tab
JOIN country c ON tab.country = c.country
AND c.four_regions = 'africa'
AND tab.ref_year BETWEEN 2000 AND 2009
GROUP BY tab.country, tab.gender
ORDER BY tab.gender, avg_mean_years;

--Cláusula EXISTS
SELECT *
FROM co2_emissions_pc cep
WHERE cep.ref_year = 2000
	AND EXISTS
		(SELECT *
		FROM co2_emissions_pc cep2
		WHERE cep2.country = 'USA'
		AND cep2.ref_year = 2000
		AND cep.co2_pc > cep2.co2_pc
		);

--Negando o EXISTS
SELECT *
FROM co2_emissions_pc cep
WHERE cep.ref_year = 2000
	AND NOT EXISTS
		(SELECT *
		FROM co2_emissions_pc cep2
		WHERE cep2.country = 'USA'
			AND cep2.ref_year = 2000
			AND cep.co2_pc > cep2.co2_pc
		);