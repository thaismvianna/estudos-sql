--1)A tabela men_years_at_school do nosso banco possui dados apenas até 2009. No entanto, ao pesquisar na base Our World in Data, você encontrou informações mais recentes. Assim, decidiu completar os dados, pelo menos para o Brasil e a Argentina, inserindo as informações da tabela a seguir, incluindo as colunas que não possuem valores. Faça a inserção utilizando apenas um comando INSERT.
INSERT INTO men_years_at_school (country, ref_year, mean_years)
VALUES ('Brazil', 2010, 6.7),
       ('Brazil', 2011, 6.8),
       ('Brazil', 2012, 7.0),
       ('Brazil', 2013, 7.1),
       ('Brazil', 2014, 7.2),
       ('Brazil', 2015, 7.3),
       ('Brazil', 2016, 7.5),
       ('Brazil', 2017, 7.6),
       ('Brazil', 2018, 7.8),
       ('Brazil', 2019, NULL),
       ('Brazil', 2020, NULL),
       ('Argentina', 2010, 10.5),
       ('Argentina', 2011, 10.6),
       ('Argentina', 2012, 10.6),
       ('Argentina', 2013, 10.8),
       ('Argentina', 2014, 10.7),
       ('Argentina', 2015, 10.7),
       ('Argentina', 2016, 10.8),
       ('Argentina', 2017, NULL),
       ('Argentina', 2018, 10.9),
       ('Argentina', 2019, NULL),
       ('Argentina', 2020, 10.9);
--checando
SELECT *
FROM men_years_at_school
WHERE ref_year	BETWEEN 2009 AND 2020
AND country IN ('Argentina', 'Brazil')
ORDER BY country, ref_year;

--2)Atualize os valores nulos do Brasil na tabela men_years_at_school, definindo o mesmo valor de 2018 (7,8) para os anos de 2019 e 2020. Certifique-se de especificar o país na cláusula WHERE para evitar a atualização dos dados da Argentina. Em seguida, execute um SELECT * para o Brasil entre 2009 e 2020 para verificar o resultado.
UPDATE men_years_at_school
SET mean_years = 7.8
WHERE country = 'Brazil'
AND ref_year IN (2019, 2020);
--checando
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2018 AND 2020
AND country = 'Brazil'; 

--3)Atualize os valores nulos da Argentina na tabela men_years_at_school com a média dos valores de 2011 a 2020. Neste caso, utilize uma subquery para calcular a média, abrangendo o período de 2017 a 2020, e assegure-se de que apenas os valores nulos sejam atualizados. Em seguida, execute um SELECT * para a Argentina no intervalo de 2016 a 2020 para verificar o resultado.
UPDATE men_years_at_school
SET mean_years = ( 
    SELECT AVG (mean_years)
    FROM men_years_at_school
    WHERE country = 'Argentina'
    AND ref_year BETWEEN 2011 AND 2020
        )
    WHERE country = 'Argentina'
    AND ref_year BETWEEN 2017 AND 2018
    AND mean_years IS NULL;
--checando
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2016 AND 2020
AND country = 'Argentina'; 

--4)Remova as linhas do Brasil na tabela men_years_at_school em que a data seja maior ou igual a 2019. Em seguida, execute um SELECT * para o Brasil nos anos de 2018 a 2020 para verificar o resultado.
DELETE
FROM men_years_at_school
WHERE ref_year >= 2019
AND country = 'Brazil';
--checando
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2018 AND 2020
AND country = 'Brazil';

--5)Remova as linhas do Brasil na tabela men_years_at_school que têm datas entre 2010 e 2018. Em seguida, realize um SELECT * para o Brasil, abrangendo os anos de 2009 a 2020, para verificar o resultado.
DELETE
FROM men_years_at_school
WHERE ref_year BETWEEN 2010 AND 2018
AND country = 'Brazil';
--checando
SELECT *
FROM men_years_at_school
WHERE ref_year BETWEEN 2009 AND 2020
AND country = 'Brazil';
