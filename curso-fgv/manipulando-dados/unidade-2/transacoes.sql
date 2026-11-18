-- TRANSAÇÕES (TRANSACTIONS)
-- São operações que permitem executar um conjunto de comandos SQL como uma única unidade de trabalho.
-- Servem para garantir que as alterações sejam concluídas corretamente ou desfeitas em caso de erro.

-- BEGIN TRANSACTION = inicia uma transação.
-- COMMIT = confirma as alterações.
-- ROLLBACK = desfaz as alterações não confirmadas.
-- SAVEPOINT = cria um ponto de salvamento.
-- ROLLBACK TO = retorna a um ponto de salvamento.

BEGIN TRANSACTION

SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
AND country = 'Brazil';

ROLLBACK;

--Alterando dados depois de iniciada a transação
DELETE
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
AND country = 'Brazil';

--Verificando a alteração
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
AND country = 'Brazil';

ROLLBACK;

--Verificando novamente, os dados voltaram
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
AND country = 'Brazil';



