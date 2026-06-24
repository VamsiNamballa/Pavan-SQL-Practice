-- Day 1 of SQL Practice 

-- Question 1: Consecutive Numbers

-- Create Logs Table 

Create table If Not Exists Logs (id int, num int);
Truncate table Logs;
insert into Logs (id, num) values ('1', '1');
insert into Logs (id, num) values ('2', '1');
insert into Logs (id, num) values ('3', '1');
insert into Logs (id, num) values ('4', '2');
insert into Logs (id, num) values ('5', '1');
insert into Logs (id, num) values ('6', '2');
insert into Logs (id, num) values ('7', '2');

-- Below Line of Code is for testing 1
WITH GROUPED AS(
    SELECT id, num,
    id - ROW_NUMBER() OVER (PARTITION BY num order by id) as GRP
    from logs;
),
COUNTED AS(
    SELECT num, grp, COUNT(*) as consecutive_count
    from GROUPED 
    GROUP BY num, grp
)


-- Immediate Food Delivery

# Write your MySQL query statement below
WITH t1 as(SELECT AVG(IF(d1.order_date=d1.customer_pref_delivery_date,1,0)) as immediate
FROM delivery d1
GROUP BY d1.ORDER_DATE
ORDER BY d1.delivery_id)
SELECT avg(immediate)*100 as immediate_percentage from t1;

-- Algorithm: 
-- Step 1. Created a CTE to retrieve immediate as 1 and scheduled as 0
-- Step 2. avg(immediate)*100

-- Game Play Analysis 4