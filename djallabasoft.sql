mysql> create database djallabasoft;
Query OK, 1 row affected (0.01 sec)

mysql> use djallabasoft;
Database changed

mysql> create table Emp(
    -> NumE int primary key,
    -> nome varchar(15),
    -> fonction varchar(15),
    -> nums int,
    -> embauche date,
    -> salaire decimal,
    -> comm decimal,
    -> numd int);
Query OK, 0 rows affected (0.04 sec)

mysql> create table dept(
    -> numd int primary key,
    -> nomd varchar(15),
    -> lieu varchar(15));
Query OK, 0 rows affected (0.03 sec)

mysql> alter table emp
    -> add foreign key(numd) references dept(numd);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO dept
    -> VALUES (1, 'Sales', 'bab doukala'),(2, 'Engineering', 'massira 1'),(3, 'Marketing', ' Azli'),(4, 'Finance', ' Azli');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Emp
    -> VALUES (101, 'saad', 'Manager', NULL, '2022-01-15', 60000, 2000, 1),(102, 'Kbbour', 'Developer', 101, '2022-03-10
', 55000, NULL, 2),(103, 'Ali', 'Analyst', 101, '2023-02-20', 48000, 1500, 1),(104, 'ahmed', 'Designer', 102, '2023-04-10', 52000, NULL, 2),(105, 'kbbour', 'Developer', 101, '2023-09-01', 55000, 1800, 2);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from emp
    -> where comm not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'null' at line 2
mysql> select * from emp
    -> where comm is not null
    -> order by comm desc;
+------+--------+-----------+------+------------+---------+------+------+
| NumE | nome   | fonction  | nums | embauche   | salaire | comm | numd |
+------+--------+-----------+------+------------+---------+------+------+
|  101 | saad   | Manager   | NULL | 2022-01-15 |   60000 | 2000 |    1 |
|  105 | kbbour | Developer |  101 | 2023-09-01 |   55000 | 1800 |    2 |
|  103 | Ali    | Analyst   |  101 | 2023-02-20 |   48000 | 1500 |    1 |
+------+--------+-----------+------+------------+---------+------+------+
3 rows in set (0.02 sec)

mysql> select * from emp
    -> where embauche = '2023-09-01';
+------+--------+-----------+------+------------+---------+------+------+
| NumE | nome   | fonction  | nums | embauche   | salaire | comm | numd |
+------+--------+-----------+------+------------+---------+------+------+
|  105 | kbbour | Developer |  101 | 2023-09-01 |   55000 | 1800 |    2 |
+------+--------+-----------+------+------------+---------+------+------+
1 row in set (0.01 sec)

mysql> select * from emp
    -> where numd in (SELECT NumD FROM Dept WHERE Lieu = ' Azli');
Empty set (0.01 sec)

mysql> select * from emp
    -> where numd in (SELECT NumD FROM Dept WHERE Lieu = 'Azli');
Empty set (0.00 sec)

mysql> INSERT INTO emp
    -> VALUES (106, 'saad', 'Manager', NULL, '2022-01-15', 60000, 2000, 3);
Query OK, 1 row affected (0.01 sec)

mysql> select * from emp
    -> where numd in (SELECT NumD FROM Dept WHERE Lieu = ' Azli');
+------+------+----------+------+------------+---------+------+------+
| NumE | nome | fonction | nums | embauche   | salaire | comm | numd |
+------+------+----------+------+------------+---------+------+------+
|  106 | saad | Manager  | NULL | 2022-01-15 |   60000 | 2000 |    3 |
+------+------+----------+------+------------+---------+------+------+
1 row in set (0.00 sec)

mysql> SELECT a.NomE AS "Nom", b.NomE AS "Subordonné"
    -> from emp a
    -> join emp b on a.NumE = b.NumS
    -> WHERE a.NomE = 'Kbbour';
+--------+-------------+
| Nom    | Subordonné  |
+--------+-------------+
| Kbbour | ahmed       |
+--------+-------------+
1 row in set (0.01 sec)

mysql> SELECT AVG(Salaire) AS "Moyenne des salaires" FROM Emp;
+----------------------+
| Moyenne des salaires |
+----------------------+
|           55000.0000 |
+----------------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(Comm) AS "Nb. Commissions non-NULL" FROM Emp
    -> WHERE Comm IS NOT NULL;
+--------------------------+
| Nb. Commissions non-NULL |
+--------------------------+
|                        4 |
+--------------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Emp
    -> WHERE Salaire > (SELECT AVG(Salaire) FROM Emp);
+------+------+----------+------+------------+---------+------+------+
| NumE | nome | fonction | nums | embauche   | salaire | comm | numd |
+------+------+----------+------+------------+---------+------+------+
|  101 | saad | Manager  | NULL | 2022-01-15 |   60000 | 2000 |    1 |
|  106 | saad | Manager  | NULL | 2022-01-15 |   60000 | 2000 |    3 |
+------+------+----------+------+------------+---------+------+------+
2 rows in set (0.00 sec)

mysql>