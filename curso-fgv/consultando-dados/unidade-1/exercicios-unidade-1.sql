/* Para relembrar:
SELECT: seleciona as colunas que queremos consultar.
FROM: indica a tabela de onde vêm os dados.
WHERE: filtra os registros conforme a condição especificada. */

--1)Consulta todos os países e anos em que a emissão de CO2 por pessoa seja igual a 0,2 e guatemala e lituania tem que estar na lista.
SELECT country, ref_year, co2_pc
FROM co2_emissions_pc
WHERE co2_pc = 0.2; 

--2)Consultar, na tabela country, a classificação do Brasil nas quatro e oito regiões e nas quatro categorias de renda do Banco Mundial.
SELECT four_regions, eight_regions, wb4income 
FROM country
WHERE country = 'Brazil';

--3)Consultar na tabela country o nome de todos os países com a classificação de renda do Banco Mundial em três níveis igual a Middle income e verificar se China, Indonésia e Malásia aparecem na lista.
SELECT country
FROM country
WHERE wb3income = 'Middle income';

--4)Selecione da tabela gdp_pc o PIB per capita dos países no ano de 2017. Indique qual o valor de Mônaco.
SELECT country, gdp_pc 
FROM gdp_pc
WHERE ref_year = 2017;

--5)Selecione, da tabela life_expectancy, os países e anos de referência cuja expectativa de vida ao nascer era de 36.5 anos. Indique quais foram os anos em que os nascidos no Chile tinham esta expectativa de vida. 
SELECT country, ref_year 
FROM life_expectancy
WHERE tot_years = 36.5;

--6)Utilizando a tabela petrobras e o campo Close para fazer a sua pesquisa, indique qual o preço de fechamento das ações da Petrobras no dia 8 de dezembro de 2022.
SELECT close 
FROM petrobras
WHERE date = '2022-12-08';

--7)Utilizando a tabela gdp_pc, indique qual país tem PIB per capita menor do que 400 dólares.

SELECT DISTINCT country -- DISTINCT: elimina valores duplicados do resultado, exibindo cada país apenas uma vez.
FROM gdp_pc
WHERE gdp_pc < 400;

--8)Utilizando a tabela life_expectancy, indique os dois países que têm projeção de expectativa de vida acima de 94 anos.
SELECT DISTINCT country
FROM life_expectancy
WHERE tot_years > 94;

--9)Selecione todas as linhas da tabela petrobras com o valor de Close diferente de Adj Close. Indique se este evento aconteceu no dia 16 de agosto de 2000.
SELECT * 
FROM petrobras
WHERE 'Close' <> 'Adj Close'; -- Operador de diferença: <> (padrão SQL) ou != (também aceito pelo SQLite).











