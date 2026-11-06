--CONSULTAS

--todas as colunas
SELECT *
FROM co2_emissions_pc;


--algumas colunas
SELECT co2_pc, country
FROM co2_emissions_pc;


--filtrando linhas
SELECT *
FROM co2_emissions_pc
WHERE country = 'Brazil';


--selecionando linhas e colunas
SELECT ref_year, co2_pc
FROM co2_emissions_pc
WHERE country = 'Brazil';


--uso de operador relacional
SELECT *
FROM population 
WHERE tot_pop > 1000000000;