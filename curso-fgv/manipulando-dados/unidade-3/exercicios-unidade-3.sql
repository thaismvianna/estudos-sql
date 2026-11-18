--1)Crie uma tabela chamada relatorio_focus para registrar as previsões de mercado do IPCA (ipca), o PIB (pib) e o Dólar (dolar), todos com valores numéricos de duas casas decimais. Além disso, adicione um campo ref_date do tipo data. O campo ref_date será a chave primária, e todos os campos devem ser definidos como não nulos.
CREATE TABLE relatorio_focus (
	ref_date DATE NOT NULL PRIMARY KEY,
	ipca NUMERIC(5,2) NOT NULL,
	pib NUMERIC(5,2) NOT NULL,
	dolar NUMERIC(8,2) NOT NULL
)

--2)Insira na tabela relatorio_focus os dados apresentados a seguir, extraídos dos relatórios Focus do Banco Central, que são publicados semanalmente:
INSERT INTO relatorio_focus (ref_date, ipca, pib, dolar)
VALUES ('2024-06-21', 3.98, 2.09, 5.15),
       ('2024-06-28', 4.00, 2.09, 5.20),
       ('2024-07-05', 4.02, 2.10, 5.20),
       ('2024-07-12', 4.00, 2.11, 5.22),
       ('2024-07-19', 4.05, 2.15, 5.30);
--checando
SELECT * 
FROM relatorio_focus;

--3)Adicione a taxa Selic à tabela. Primeiro, crie a coluna selic como um campo numérico com duas casas decimais e com restrição de não nulo. Se isso não for possível, crie o campo como nulo.
ALTER TABLE relatorio_focus 
ADD COLUMN selic NUMERIC(5,2) NULL;
--checando
SELECT * 
FROM relatorio_focus;

--4)Atualize o campo selic com os valores da tabela a seguir:
UPDATE relatorio_focus
SET selic = 10.5;
--checando
SELECT * 
FROM relatorio_focus;  

--5)Altere o nome da tabela para focus_report para manter o padrão de nomes em inglês no banco de dados.
ALTER TABLE relatorio_focus 
RENAME TO focus_report;
--checando
SELECT *
FROM focus_report;

--6)Remova a tabela focus_report do banco de dados.
DROP TABLE relatorio_focus;
       