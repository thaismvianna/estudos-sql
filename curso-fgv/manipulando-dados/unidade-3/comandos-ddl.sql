--ALGUNS COMANDOS DDL (Data Definition Language)
--utilizados para a definição e manutenção das estruturas de dados. Eles permitem criar tabelas, modificar a estrutura delas adicionando campos ou alterando os seus nomes e remover as que não são mais necessárias.

--CREATW - utilizado para criar objetos, como tabelas e índices;
--ALTER - utilizado para modificar a estrutura de objetos existentes, como adicionar uma coluna a uma tabela;
--DROP - utilizado para remover objetos do banco de dados, como tabelas ou índices.

--IMPORTANTE: comandos DDL, como DROP TABLE, CREATE TABLE e ALTER TABLE não são passíveis de ROLLBACK. Uma vez executados não é possível desfazê-los.

--Criando uma tabela sem chave primária
CREATE TABLE "pet_mortality" (
			"country" TEXT NULL,
			"ref_year" INTEGER NULL,
			"tot_deaths" INTEGER NULL
);

--Criando uma tabela com chave primária
CREATE TABLE "uf" (
		"cd_uf" CHAR(2) NOT NULL PRIMARY KEY,
		"descr_uf" VARCHAR(50) NOT NULL
);

--Criando uma tabela com relacionamento
CREATE TABLE "cidade" (
		"cd_ibge" NUMERIC(8) NOT NULL PRIMARY KEY,
		"descr_municipio" VARCHAR(100) NOT NULL,
		"cd_uf" CHAR(2) NOT NULL,
		FOREIGN KEY ("cd_uf")
		REFERENCES "uf"("cd_uf")
);

--Alterando a estrutura de uma tabela
ALTER TABLE cidade
ADD COLUMN "nr_habitantes" INTEGER NULL;

ALTER TABLE cidade
ADD COLUMN "area_km2" NUMERIC(15,2) NULL;

--Removendo tabelas
DROP TABLE uf;

DROP TABLE cidade;

--Limpando todos os dados de uma tabela
--TRUNCATE TABLE: apaga todos os registros, mas mantém a estrutura da tabela. É usado em outros bancos, como MySQL e PostgreSQL.
--DELETE FROM: faz a exclusão dos registros no SQLite, mantendo a estrutura da tabela.
