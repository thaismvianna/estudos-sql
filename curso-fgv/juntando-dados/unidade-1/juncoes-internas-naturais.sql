/* JOIN: une informações de tabelas diferentes.
 INNER JOIN: retorna apenas os registros que correspondem nas duas tabelas.
 ON: define quais colunas devem ser iguais para juntar os registros.
 AS: cria um apelido para a tabela, facilitando sua identificação (é opcional) */

SELECT *
FROM gdp_pc AS gp
INNER JOIN fertility AS f
ON gp.country = f.country -- junta os registros que possuem o mesmo país.
AND gp.ref_year = f.ref_year; -- e que também possuem o mesmo ano.

-- OBJETIVO: consultar o PIB por pessoa e a média de filhos por mulher
-- de cada país, juntando informações que estão em duas tabelas diferentes.

SELECT gp.country,       -- Mostra o nome do país.
       gp.gdp_pc,        -- Mostra o PIB por pessoa.
       f.mean_babies     -- Mostra a média de filhos por mulher.
FROM gdp_pc AS gp        -- Utiliza a tabela gdp_pc (apelidada de gp).
INNER JOIN fertility AS f -- Junta com a tabela fertility (apelidada de f).
ON gp.country = f.country -- Junta somente os registros do mesmo país.
AND gp.ref_year = f.ref_year -- Exige também que o ano seja igual nas duas tabelas.
WHERE gp.ref_year = 2019 -- Mostra somente os dados do ano de 2019.
ORDER BY gp.gdp_pc DESC; -- Organiza pelo PIB, do maior para o menor.



-- NATURAL JOIN: faz a junção automaticamente usando todas as colunas que possuem o mesmo nome nas duas tabelas. Se nao encontrar, não consegue fazer a junção
-- Não precisa escrever ON nem indicar as colunas manualmente.

-- OBJETIVO: consultar os 10 países com maior PIB por pessoa em 2019, mostrando também a média de filhos por mulher.
SELECT gp.country, gp.gdp_pc, f.mean_babies -- Mostra o país, o PIB por pessoa e a média de filhos por mulher.
FROM gdp_pc gp -- Utiliza a tabela gdp_pc, com o apelido gp.
NATURAL JOIN fertility f -- Junta automaticamente as tabelas pelas colunas que possuem o mesmo nome.
WHERE gp.ref_year = 2019 -- Filtra os resultados para mostrar somente o ano de 2019.
ORDER BY gp.gdp_pc DESC -- Organiza os países do maior PIB por pessoa para o menor.
LIMIT 10; -- Limita o resultado aos 10 primeiros países.
