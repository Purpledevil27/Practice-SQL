-- https://leetcode.com/problems/rising-temperature/
/*
 Table: Weather
 
 +---------------+---------+
 | Column Name   | Type    |
 +---------------+---------+
 | id            | int     |
 | recordDate    | date    |
 | temperature   | int     |
 +---------------+---------+
 id is the primary key for this table.
 This table contains information about the temperature on a certain day.
 
 
 Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
 
 Return the result table in any order.
 
 The query result format is in the following example.
 
 
 
 Example 1:
 
 Input: 
 Weather table:
 +----+------------+-------------+
 | id | recordDate | temperature |
 +----+------------+-------------+
 | 1  | 2015-01-01 | 10          |
 | 2  | 2015-01-02 | 25          |
 | 3  | 2015-01-03 | 20          |
 | 4  | 2015-01-04 | 30          |
 +----+------------+-------------+
 Output: 
 +----+
 | id |
 +----+
 | 2  |
 | 4  |
 +----+
 Explanation: 
 In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
 In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
 */
-- Write your MySQL query statement below
-- USING DATEDIFF()
select w1.id
from weather as w1
where w1.temperature > (
        select w2.temperature
        from weather as w2
        where datediff(w1.recordDate, w2.recordDate) = 1
    );
-- USING SUBDATE() - substract date
select w1.id
from weather as w1
where w1.temperature > (
        select w2.temperature
        from weather as w2
        where subdate(w1.recordDate, 1) = w2.recordDate
    );