--1)Inicie uma transação, delete todas as linhas da tabela men_years_at_school cujo país é Brasil e os anos de referência vão de 2009 a 2020. Faça um SELECT* para o Brasil de 2000 a 2009 para conferir o resultado. No entanto, o ano de 2009 não era para ser apagado! Então faça um ROLLBACK e desfaça a transação. Faça o SELECT novamente para ver se a transação foi desfeita e as linhas apagadas voltaram.
BEGIN TRANSACTION;

DELETE
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
  AND country = 'Brazil';

SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
  AND country = 'Brazil';

ROLLBACK;

SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2009
  AND country = 'Brazil';

--2)Inicie uma transação, delete todas as linhas da tabela men_years_at_school cujo país é Argentina e os anos de referência vão de 2000 a 2008. Faça um SELECT* para o Brasil de 2000 a 2009 para conferir o resultado. Agora deletamos o período correto. Então, faça um COMMIT e efetive a transação. Faça o SELECT novamente para ver que a transação foi efetivada e as linhas apagadas não voltaram.
BEGIN TRANSACTION;

DELETE
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2008
  AND country = 'Brazil';

SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2009 AND 2009
  AND country = 'Brazil';

COMMIT;

SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2000 AND 2008
  AND country = 'Brazil';
