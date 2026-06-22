-- Day 1 of SQL Practice 

-- Question 1: Consecutive Numbers

-- Create Logs Table 

Create table If Not Exists Logs (id int, num int)
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')

-- Below Line of Code is for testing
SELECT id, num,
id - ROW_NUMBER() OVER (PARTITION BY num order by id) as GRP
from logs;
