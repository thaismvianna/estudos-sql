--1)Calcule o preço médio das ações, nomeando este campo como mean, e a amplitude diária de variação, que será chamada de range, para o período de 20 de fevereiro de 2020 a 20 de março de 2020. Mostre apenas os dados dos dias com variação positiva. O preço médio pode ser calculado utilizando a fórmula (Close + Open)/2, enquanto a amplitude de variação é obtida por meio da diferença Close - Open.
SELECT "date" , 
	"close" - "open" as "range", 
	("close" + "open" ) / 2 as "mean"
FROM petrobras
WHERE "date" BETWEEN '2020-02-20' AND '2020-03-20'
	AND "range" > 0;	

--2)Identifique os países da África nos quais as mulheres possuem pelo menos um ano a mais de escolaridade do que os homens durante o período de 2001 a 2010. Apresente apenas os nomes dos países, sem repetições.
SELECT DISTINCT m.country
FROM men_years_at_school m
JOIN women_years_at_school w ON m.country = w.country 
	AND m.ref_year = w.ref_year
JOIN country c ON m.country = c.country 
WHERE c.four_regions = 'africa'
	AND w.mean_years - m.mean_years >= 1
	AND w.ref_year BETWEEN 2001 AND 2010;

--3)Consulte novamente a taxa de mortalidade infantil do Brasil em porcentagem, sem utilizar o operador IN para listar os anos, mas realizando um cálculo que inclua o período de 1910 a 2020 em intervalos de 10 anos.
SELECT cm.ref_year, 
	cm.tot_deaths, 
	100 * cm.tot_deaths / 1000 AS percent_deaths
FROM child_mortality cm
WHERE cm.ref_year BETWEEN 1910 AND 2020
	AND cm.ref_year %10 = 0
	AND cm.country = 'Brazil'
ORDER BY cm.ref_year;

--4)Indique a expectativa de vida mínima, média e máxima dos países da América Latina e do Caribe em 1990. Use a tabela life_expectancy para encontrar os valores e o campo wb_regions com o valor Latin America & Caribbean para definir a região.
SELECT MIN (le.tot_years) AS min_years, 
	AVG (le.tot_years) AS avg_years, 
	MAX (le.tot_years) AS max_years
FROM life_expectancy le
JOIN country c ON le.country = c.country 
WHERE le.ref_year = 1900
	AND c.wb_regions = 'Latin America & Caribbean';

--5)Calcule o PIB per capita médio e a renda per capita média dos países no ano de 2019. Utilize as tabelas avg_income e gdp_pc, e arredonde o resultado para duas casas decimais.
SELECT AVG (gp.gdp_pc) AS avg_gdp_pc, 
	AVG (ai.mean_usd) AS avg_mean_usd
FROM gdp_pc gp
JOIN avg_income ai ON gp.country = ai.country
	AND gp.ref_year = ai.ref_year 
WHERE gp.ref_year = 2019;

--6)Calcule a média de diferença de tempo na escola entre homens e mulheres no ano 2000. Utilize as tabelas men_years_at_school e women_years_at_school.
SELECT AVG (m.mean_years- w.mean_years) AS avg_diff
FROM men_years_at_school m
JOIN women_years_at_school w ON m.country = w.country 
	AND m.ref_year = w.ref_year 
WHERE w.ref_year = 2000;