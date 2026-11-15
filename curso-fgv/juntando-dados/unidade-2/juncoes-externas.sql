--junções externas

--LEFT JOIN: traz todos os dados da tabela da esquerda, independentemente se há ou não correspondência na tabela da direita. As linhas da esquerda que tiverem correspondência com as da direita serão juntadas. As linhas da esquerda sem correspondência na direita irão trazer valores nulos nos campos pertencentes à tabela da direita
SELECT f.ref_year,
	   f.mean_babies,
	   wy.mean_years
FROM fertility f
LEFT JOIN women_years_at_school wy ON wy.country = f.country AND wy.ref_year = f.ref_year
WHERE f.country = 'Brazil'
	AND f.ref_year BETWEEN 2001 AND 2020
ORDER BY f.ref_year;

--RIGHT JOIN: As da tabela da esquerda que tiverem correspondência com as da direita virão com valores preenchidos. Já as da esquerda sem correspondência virão com valores nulos
SELECT gp.ref_year,
       cep.co2_pc,
       gp.gdp_pc
FROM co2_emissions_pc cep 
RIGHT JOIN gdp_pc gp ON gp.country = cep.country AND gp.ref_year  = cep.ref_year 
WHERE gp.country = 'Brazil'
	AND gp.ref_year BETWEEN 2014 AND 2023
ORDER BY gp.ref_year;

--FULL JOIN: é uma mistura do LEFT JOIN e do RIGHT JOIN. Útil para trazer todos os dados da tabela da esquerda e da tabela da direita, fazendo a junção onde há correspondência e trazendo nulo onde não há
SELECT f.country, f.ref_year, f.mean_babies, wy.mean_years
FROM fertility f
FULL JOIN women_years_at_school wy ON f.country = wy.country AND f.ref_year = wy.ref_year;