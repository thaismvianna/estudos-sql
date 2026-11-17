--1)Calcule qual é o país da África com maior PIB per capita em 2019.
SELECT gp.country 
FROM gdp_pc gp
JOIN country c ON gp.country = c.country 
WHERE gp.ref_year = 2020
AND c.four_regions = 'africa'
AND gp.gdp_pc = (
	SELECT MAX (gp2.gdp_pc)
	FROM gdp_pc gp2
	JOIN country c2 ON gp2.country = c2.country 
	WHERE gp2.ref_year = 2020
	AND c2.four_regions = 'africa');

--2)a.Calcule novamente a expectativa de vida mínima, média e máxima dos países da América Latina e do Caribe em 1990 bem como identifique o país com a menor expectativa de vida nessa região no mesmo ano.
SELECT le.country
FROM life_expectancy le
JOIN country c ON le.country = c.country
WHERE le.tot_years = (
    SELECT MIN(sle.tot_years)
    FROM life_expectancy sle
    JOIN country sc ON sle.country = sc.country
    WHERE sle.ref_year = 1990
    AND sc.wb_regions = 'Latin America & Caribbean'
)
AND le.ref_year = 1990
AND c.wb_regions = 'Latin America & Caribbean';

--b.Repita a consulta para 2010, incluindo também o valor de tot_years. Indique se o país com a menor expectativa de vida permanece o mesmo. Além disso, verifique se há alguma explicação para uma queda tão acentuada na expectativa de vida.
SELECT le.country,
       le.tot_years 
FROM life_expectancy le 
JOIN country c ON le.country = c.country 
WHERE le.tot_years = (
		SELECT MIN(sle.tot_years)
		FROM life_expectancy sle 
		JOIN country sc ON sle.country = sc.country 
		WHERE sle.ref_year = 2010
		  AND sc.wb_regions = 'Latin America & Caribbean'
		GROUP BY sle.ref_year
   )
   AND le.ref_year = 2010
   AND c.wb_regions = 'Latin America & Caribbean';

--3)Após calcular novamente a média da diferença no tempo de escolaridade entre homens e mulheres no ano 2000, segmentando por região do Banco Mundial (wb_regions), execute uma única consulta com subqueries que retorne o nome da região com a maior média de diferença no tempo de escolaridade entre os gêneros.
SELECT tab.wb_regions
FROM (
    SELECT c.wb_regions,
           AVG(m.mean_years - w.mean_years) AS avg_diff
    FROM men_years_at_school m
    JOIN women_years_at_school w
        ON m.country = w.country
        AND m.ref_year = w.ref_year
    JOIN country c
        ON m.country = c.country
    WHERE w.ref_year = 2000
    GROUP BY c.wb_regions
) tab
WHERE tab.avg_diff = (
    SELECT MAX(tab1.avg_diff1)
    FROM (
        SELECT AVG(m1.mean_years - w1.mean_years) AS avg_diff1
        FROM men_years_at_school m1
        JOIN women_years_at_school w1
            ON m1.country = w1.country
            AND m1.ref_year = w1.ref_year
        JOIN country c1
            ON m1.country = c1.country
        WHERE w1.ref_year = 2000
        GROUP BY c1.wb_regions
    ) tab1
);

--4)Liste o país com a menor renda média per capita diária da Europa em 2020. Use a tabela avg_income e o campo four_regions da tabela country igual a europe.
SELECT ai1.country 
FROM avg_income ai1
JOIN country c1 ON ai1.country = c1.country 
WHERE ai1.ref_year = 2020
AND c1.four_regions = 'europe'
AND ai1.mean_usd = (
	SELECT MIN (ai.mean_usd) AS "min"
	FROM avg_income ai
	JOIN country c ON ai.country = c.country 
	WHERE ai.ref_year = 2020
	AND c.four_regions = 'europe'
);

--5)Indique quais países da região da América Latina e do Caribe, de acordo com a classificação do Banco Mundial (campo wb_regions da tabela country), apresentaram, em 2000, uma diferença de tempo na escola entre homens e mulheres menor do que a do Brasil no mesmo ano, significando que, nesses países, as mulheres passaram mais tempo na escola do que os homens. Utilize EXISTS para realizar a consulta.
SELECT t1.country, t1.diff
FROM (
    SELECT m.country,
           m.mean_years - w.mean_years AS diff
    FROM men_years_at_school m
    JOIN women_years_at_school w
        ON m.country = w.country
        AND m.ref_year = w.ref_year
    JOIN country c
        ON m.country = c.country
    WHERE w.ref_year = 2000
    AND c.wb_regions = 'Latin America & Caribbean'
) t1
WHERE EXISTS (
    SELECT 1
    FROM men_years_at_school m2
    JOIN women_years_at_school w2
        ON m2.country = w2.country
        AND m2.ref_year = w2.ref_year
    WHERE m2.country = 'Brazil'
    AND m2.ref_year = 2000
    AND t1.diff < (m2.mean_years - w2.mean_years)
)
AND t1.country <> 'Brazil';