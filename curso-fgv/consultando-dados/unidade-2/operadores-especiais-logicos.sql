--NULL: nao existe um valor preenchido naquele campo
SELECT *
FROM population
WHERE tot_pop = NULL; 

--IS NULL: verifica se o campo esta vazio (sem valor)
SELECT *
FROM population
WHERE tot_pop IS NULL; 

--IS NOT NULL: verifica se o campo esta preenchido (tem algum valor)
SELECT *
FROM population
WHERE tot_pop IS NOT NULL; 

--BETWEEN: filtra valores dentro de um intervalo 
SELECT country, ref_year, tot_deaths
FROM child_mortality cm 
WHERE tot_deaths BETWEEN 570 AND 630;

--BETWEEN entre datas
SELECT *
FROM petrobras
WHERE date BETWEEN '2020-02-20' AND '2020-03-20';

/*operadores logicos
AND: e 
OR: ou
NOT: negação */

--tabela verdade
--AND: Se ambas expressoes forem verdadeiras, o and é verdadeiro. Se uma delas for falsa, o resultado é falso. E se ambas forem falsas, o resultado tambem é falso  
SELECT country, co2_pc
FROM co2_emissions_pc cep 
WHERE ref_year = 2020 AND co2_pc > 20.0;

--tabela verdade
--OR: Se ambas forem verdadeiras, sera verdadeiro. Se uma delas for verdade, o resultado tambem sera verdade. Sera falso quando as duas forem falsas
SELECT country, wb_regions
FROM country 
WHERE wb_regions = 'North America' OR wb_regions = 'Latin America & Caribbean';

--tabela verdade
--NOT: Inverte o resultado da expressão logica. Se retorna verdadeiro, vira falso e se retorna falso, vira verdadeiro
--Os parênteses servem para indicar exatamente qual condição o NOT deve inverter.
SELECT country, wb_regions
FROM country 
WHERE NOT (wb_regions = 'North America' OR wb_regions = 'Latin America & Caribbean');

--sql avalia o resultado da esquerda para direita, por isso usa parenteses para mudar a ordem da execução
SELECT country, ref_year, tot_deaths 
FROM child_mortality cm 
WHERE tot_deaths BETWEEN 57 AND 63
	AND (country = 'China' OR country = 'Brazil');

/*operador IN: serve para verificar se uma coluna possui um dos valores de uma lista. Em vez de escrever várias condições usando OR, pode usar apenas IN.
IN → verifica se o valor está entre os valores informados.
NOT IN → verifica se o valor não está entre os valores informados.
Os valores da lista ficam entre parênteses e, quando são textos, entre aspas simples. */
SELECT country, ref_year, tot_deaths 
FROM child_mortality cm 
WHERE tot_deaths BETWEEN 57 AND 63
	AND country IN ('China', 'Brazil');

/*operador LIKE: serve para buscar textos que seguem determinado padrão, mesmo quando não se sabe o texto completo. Utiliza dois símbolos principais:
% → representa qualquer quantidade de caracteres (inclusive nenhum).
_ → representa apenas um caractere 

Ex: LIKE 'Bra%' → começa com Bra.
LIKE '%land' → termina com land.
LIKE '%zil%' → contém zil.
LIKE '_a%' → tem a na segunda posição.*/

SELECT country, mean_babies  
FROM fertility f 
WHERE ref_year = 2021
	AND country LIKE 'Congo%';

SELECT country, mean_babies  
FROM fertility f 
WHERE ref_year = 2021
	AND country LIKE '%land';

SELECT country, mean_babies  
FROM fertility f 
WHERE ref_year = 2021
	AND country LIKE '%Guinea%';
