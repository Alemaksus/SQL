/* Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
задав в нем логин и пароль, который указывался при установке.*/

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: ******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.23 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.01 sec)

C:\Program Files\MySQL\MySQL Server 8.0>copy con my.cnf
Login: root
Overwrite my.cnf? (Yes/No/All): Login: root Password: 123123
Overwrite my.cnf? (Yes/No/All): y
        1 file(s) copied.

C:\Program Files\MySQL\MySQL Server 8.0>dir
 Volume in drive C is OS
 Volume Serial Number is 8A85-8D49

 Directory of C:\Program Files\MySQL\MySQL Server 8.0

03/10/2021  05:18 PM    <DIR>          .
03/10/2021  05:18 PM    <DIR>          ..
03/09/2021  10:20 AM    <DIR>          bin
03/09/2021  10:20 AM    <DIR>          docs
03/09/2021  10:20 AM    <DIR>          etc
03/09/2021  10:20 AM    <DIR>          include
03/09/2021  10:20 AM    <DIR>          lib
12/11/2020  07:42 AM           382,369 LICENSE
12/11/2020  07:42 AM            45,336 LICENSE.router
03/10/2021  01:19 PM                13 my.cnf
12/11/2020  07:42 AM               666 README
12/11/2020  07:42 AM               679 README.router
03/09/2021  10:20 AM    <DIR>          share
               5 File(s)        429,063 bytes
               8 Dir(s)  737,291,816,960 bytes free
               
Выдается такая ошибка:

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql
mysql: [ERROR] Found option without preceding group in config file C:\Program Files\MySQL\MySQL Server 8.0\my.cnf at line 1.
mysql: [ERROR] Fatal error in defaults handling. Program aborted!

C:\Program Files\MySQL\MySQL Server 8.0\bin>

То есть нужно как-то изменить или добавить группу в файл my.cnf, но я не знаю как это сделать :) 
Пока просто удалил этот файл

               
/* Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов,
числового id и строкового name.*/

Выполнено в cmd:

mysql> create database example;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;

+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.00 sec)

*/

Выполнено в DBeaver:

USE example;

create TABLE users(
	id INT,
	name VARCHAR(100)
);

Проверяем в cmd: 

mysql> use example;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_example |
+-------------------+
| users             |
+-------------------+
1 row in set (0.01 sec) 

mysql> desc users;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(100) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

/* Создайте дамп базы данных example из предыдущего задания,
 в разверните содержимое дампа в новую базу данных sample.*/

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -uroot -p example > sample.sql
Access is denied.

C:\Program Files\MySQL\MySQL Server 8.0\bin>cd ..

C:\Program Files\MySQL\MySQL Server 8.0>mysqldump example > sample.sql
Access is denied.

Доступ отклонен, но почему то БД sample была создана, хотя и с ошибкой. Странно как то:

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sample             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> describe sample;
ERROR 1046 (3D000): No database selected

Больше не знаю что предпринять. Google ответов также не дал.




               
               