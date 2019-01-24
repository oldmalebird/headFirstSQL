/*
DDL(Data Definition Languages) 数据定义语言
定义了不同的数据段、数据库、表、列、索引等数据库对象。
常用的语句关键字: create、drop、alter
*/

-- 防止乱码
CREATE DATABASE my_test_db CHARACTER SET utf8

SHOW DATABASES;
USE DATABASE abc;
SHOW TABLES;
DESC abc;
SHOW CREATE TABLE abd;

CREATE TABLE students(id INT, name VARCHAR(25), age INT, email VARCHAR(255));

ALTER TABLE students ADD score INT;
ALTER TABLE students MODIFY id BIGINT;
ALTER TABLE students DROP abc；

CREATE TABLE emplyees(id INT, name VARCHAR(50));
RENAME TABLE emplyees to employees;
ALTER TABLE employees CHARACTER SET gbk;

ALTER TABLE employees CHANGE name new_name VARCHAR(50);

DROP TABLE abc;

EXIT

/*
DML(Data Manipulation Languages) 数据操纵语句
用于添加、删除、更新和查询数据库记录，并检查数据完整性。
常用的语句关键字主: insert、delete、update和select
*/

SELECT * FROM students\G

INSERT INTO students (id, name ,age, email, score) VALUES (002, 'lisi', 18, 'lisi@163.com', null);
INSERT INTO students (id, name ,age, email, score) VALUES (003, 'wangwu', 18, 'wangwu@163.com', 60), (004, 'zhaoliu', 18, 'zhaoliu@qq.com', 88);

UPDATE students SET score=90;
UPDATE students SET score=60 WHERE name = 'zhangsan';
UPDATE students SET age = 30, score=60 WHERE name = 'lisi';
UPDATE students SET age = age + 1 WHERE name = 'lisi';

mysqladmin -u root -p password 12356 --密码改成123456

DELETE FROM students WHERE name = 'wangwu';
DELETE FROM students --删除students表内的所有数据，表结构还在，删除后可找回
TRUNCATE TABLE students --把表drop掉，再创建个同样的新表，删除的数据不能找回，速度比DELETE快

/*
DQL(Data Query Languages) 数据操纵语句
用于添加、删除、更新和查询数据库记录，并检查数据完整性。
常用的语句关键字主: select
*/
SELECT * FROM students
WHERE date BETWEEN '2019-01-02' AND '2019-01-11'; --包含01-02和001-11两天

--模糊查询
SELECT * FROM students where name like 'l____' or name like '%a%';
SELECT * FROM students where name like 'l____' or '%a%'; --这句只能查出'l____'

SELECT name, age, score, IFNULL(score, 0) AS new_score FROM students;

SELECT * FROM employee ORDER BY salary DESC, id ASC;




















/*
DCL（Data Control Language） 数据控制语句
用于控制不同数据段直接的许可和访问级别的语句，这些语句定义了数据库、表、字段、用户的访问权限和安全级别.
主要的语句关键字包括grant、revoke等。
*/
