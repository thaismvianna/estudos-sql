--1)Indique se há linhas com valores nulos no campo gdp_pc na tabela gdp_pc
SELECT *
FROM gdp_pc
WHERE gdp_pc IS NULL;

--2)Na tabela child_mortality, indique se há linhas com valores nulos no campo tot_deaths
SELECT *
FROM child_mortality
WHERE tot_deaths IS NULL;

--3)Segundo o Ministério da Saúde, as taxas de mortalidade infantil (TMI) são classificadas em altas (50 ou mais), médias (20-49) e baixas (menos de 20). Utilizando a tabela child_mortality e o campo tot_deaths, encontre todos os países que alcançaram taxas de mortalidade baixas com uma variação de 5%, ou seja, com valor de 20±5%. Indique em que ano o Brasil atingiu essa TMI.
SELECT *
FROM child_mortality cm 
WHERE tot_deaths BETWEEN 19 AND 21;

--4)Utilizando a tabela life_expectancy e o campo tot_years, indique qual a expectativa de vida do brasileiro nos anos de 2019 a 2023. Liste os valores, observe o que ocorreu e comente as prováveis causas
SELECT country, tot_years, ref_year 
FROM life_expectancy
WHERE ref_year BETWEEN 2019 AND 2023
	AND country = 'Brazil';

--5)Utilizando a tabela population, selecione os países cuja população ultrapassou 200 milhões de habitantes em 2023. Use notação científica para representar a população na consulta e indique a população de cada país selecionado nos resultados
SELECT country, tot_pop
FROM population
WHERE tot_pop > 0.2e9 --notação científica: 0,2E9 equivale a 0,2x109. Mas também podia usar 200000000.
	AND ref_year = 2023; 

--6)Utilizando a tabela co2_emissions_pc, indique as emissões de CO2 no Brasil, na China e nos Estados Unidos, de 2019 a 2021. Compartilhe as suas observações sobre a pesquisa
SELECT country, ref_year, co2_pc
FROM co2_emissions_pc
WHERE (country = 'Brazil'
	OR country = 'China'
	OR country = 'USA')
	AND ref_year BETWEEN 2019 AND 2021;

--7)Utilizando a tabela country, selecione os países europeus de renda média baixa. Use a classificação Gapminder de oito regiões geográficas (campo eight_regions com valor europe_east e europe_west), para verificar os países, e a classificação de quatro faixas de renda do Banco Mundial (campo wb4income com o valor Lower middle income), para verificar a renda. Indique se todos os países são do leste europeu
SELECT country, eight_regions
FROM country
WHERE (eight_regions = 'europe_east'
    OR eight_regions = 'europe_west')
    AND wb4income = 'Lower middle income';

--8)Utilizando a tabela co2_emissions_pc e o operador IN, indique as emissões de CO2 no Brasil, na China e nos Estados Unidos, de 2019 a 2021. Compartilhe as suas observações sobre a pesquisa
SELECT country, ref_year, co2_pc
FROM co2_emissions_pc
WHERE country IN ( 'Brazil', 'China','USA')
	AND ref_year BETWEEN 2019 AND 2021;

--9)Utilizando a tabela country e o operador IN, selecione os países europeus de renda média baixa. Use a classificação Gapminder de 8 regiões geográficas (campo eight_regions com valor europe_east e europe_west), para verificar os países, e a classificação de 4 faixas de renda do Banco Mundial (campo wb4income com o valor Lower middle income), para verificar a renda. Indique se todos os países são do leste europeu
SELECT country, eight_regions
FROM country
WHERE eight_regions IN ('europe_east', 'europe_west')
	AND wb4income = 'Lower middle income';

--10)Utilizando a tabela country, selecione os países do continente asiático segundo a classificação de oito regiões (coluna eight_regions). Além da coluna country, traga as colunas eight_regions e wb_regions para comparação
SELECT country, eight_regions, wb_regions
FROM country
WHERE eight_regions LIKE '%asia%';

--11)Pesquise os países das Américas, segundo a classificação do Banco Mundial (coluna wb_regions), utilizando o operador LIKE
SELECT country, wb_regions
FROM country
WHERE wb_regions LIKE '%America%';