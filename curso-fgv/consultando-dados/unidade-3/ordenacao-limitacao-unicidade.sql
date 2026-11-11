/* ORDER BY: ordena os resultados; 
LIMIT: limita a quantidade de registros exibidos; 
DISTINCT: elimina resultados duplicados */

--ordem crescente
SELECT country, tot_pop
FROM population 
WHERE ref_year = 2000
ORDER BY tot_pop;

--ordem decrescente
SELECT country, tot_pop
FROM population 
WHERE ref_year = 2000
ORDER BY tot_pop DESC;

--ordem por mais de uma coluna
SELECT country, ref_year, tot_pop
FROM population 
WHERE tot_pop > 1000000000
ORDER BY country , ref_year;

--limitando os resultados
SELECT country, tot_pop
FROM population 
WHERE ref_year = 2000
ORDER BY tot_pop DESC
LIMIT 10;

--olhando as primeiras linhas de uma tabela grande
SELECT *
FROM petrobras 
LIMIT 5;

--tira a repetição dos resultados
SELECT DISTINCT eight_regions
FROM country
ORDER BY eight_regions;

--DISTINCT por mais de um campo
--A comparação é feita pela linha inteira, e não campo a campo
SELECT DISTINCT eight_regions, wb_regions
FROM country
ORDER BY eight_regions, wb_regions;











