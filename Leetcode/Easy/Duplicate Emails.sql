-- https://leetcode.com/problems/duplicate-emails/
/*Table: Person
 
 +-------------+---------+
 | Column Name | Type    |
 +-------------+---------+
 | id          | int     |
 | email       | varchar |
 +-------------+---------+
 id is the primary key column for this table.
 Each row of this table contains an email. The emails will not contain uppercase letters.
 
 Write an SQL query to report all the duplicate emails.
 
 Return the result table in any order.
 
 The query result format is in the following example.
 
 Example 1:
 
 Input: 
 Person table:
 +----+---------+
 | id | email   |
 +----+---------+
 | 1  | a@b.com |
 | 2  | c@d.com |
 | 3  | a@b.com |
 +----+---------+
 Output: 
 +---------+
 | Email   |
 +---------+
 | a@b.com |
 +---------+
 Explanation: a@b.com is repeated two times.
 
 */
-- Write your MySQL query statement below
select distinct p1.email
from person p1,
    person p2
where p1.email = p2.email
    and p1.id != p2.id;
-- Approach #1
SELECT email
from person
group by email
having count(email) > 1;
-- Approach #2