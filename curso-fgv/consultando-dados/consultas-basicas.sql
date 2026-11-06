--CONSULTAS

--todas as colunas
SELECT *
FROM co2_emissions_pc;

--algumas colunas
SELECT co2_pc, country
FROM co2_emissions_pc;

--tabela population
SELECT *
FROM population 
WHERE tot_pop > 1000000000;

--tabela population
SELECT country,
	   ref_year,
	   tot_pop
FROM population;

--filtrando linhas
SELECT *
FROM co2_emissions_pc
WHERE country = 'Brazil';

--selecionando linhas e colunas
SELECT ref_year, co2_pc
FROM co2_emissions_pc
WHERE country = 'Brazil';