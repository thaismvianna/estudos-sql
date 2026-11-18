--COMANDOS DML

-- DML (DATA MANIPULATION LANGUAGE)
-- Comandos utilizados para inserir, alterar e excluir dados das tabelas do banco de dados.

-- INSERT: adiciona um novo registro em uma tabela.
-- UPDATE: modifica dados de um registro existente.
-- DELETE: exclui um registro da tabela.
-- SELECT: consulta os dados de uma tabela.
-- Tecnicamente, pertence à categoria DQL, não DML.

-- IMPORTANTE:
-- WHERE determina quais registros serão alterados ou excluídos.
-- Sem WHERE, UPDATE altera todos os registros da tabela.
-- Sem WHERE, DELETE exclui todos os registros da tabela.

--Inserindo uma linha
INSERT INTO petrobras ("Date", "Open", High, Low, "Close",
			"Adj Close", Volume)
VALUES ('2024-01-02', 16.09, 16.22, 15.92, 16.00, 14.55,
10100.0);
--Consultando o resultado
SELECT *
FROM petrobras
WHERE "Date" > '2023-12-29';

--Inserindo várias linhas em lote
INSERT INTO petrobras ("Date", "Open", High, Low, "Close",
			"Adj Close", Volume)
VALUES
('2024-01-03', NULL, NULL, NULL, NULL, NULL, NULL),
('2024-01-04', 16.54, 16.79, 16.35, 16.36, 14.87, 13954.7),
('2024-01-05', 16.57, 16.65, 16.07, 16.54, 15.04, 9872.0),
('2024-01-08', 16.23, 16.28, 15.97, 16.28, 14.80, 14011.8);
--Consultando o resultado
SELECT *
FROM petrobras
WHERE "Date" > '2023-12-29';

--Atualizando uma linha
UPDATE petrobras
SET High = 16.64
WHERE "Date" = '2024-01-03';
--Consultando o resultado
SELECT *
FROM petrobras
WHERE "Date" > '2023-12-29';

--Atualizando várias colunas
UPDATE petrobras
SET "Open" = 16.04,
	 Low = 16.00,
	 "Close" = 16.58,
	 "Adj Close" = 15.08,
	 Volume = 18366.8
WHERE "Date" = '2024-01-03'; --Não esquequer do WHERE, ou irá atualizar todas as linhas
--Consultando o resultado
SELECT *
FROM petrobras
WHERE "Date" > '2023-12-29';

-- Removendo linhas
DELETE
FROM petrobras
WHERE "Date" = '2024-01-08'; --Não esquequer do WHERE, ou irá deletar todas as linhas
--Consultando o resultado
SELECT *
FROM petrobras
WHERE "Date" > '2023-12-29';