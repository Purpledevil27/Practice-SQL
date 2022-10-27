-- https://leetcode.com/problems/nth-highest-salary/
/*
 Table: Employee
 
 +-------------+------+
 | Column Name | Type |
 +-------------+------+
 | id          | int  |
 | salary      | int  |
 +-------------+------+
 id is the primary key column for this table.
 Each row of this table contains information about the salary of an employee.
 
 
 Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.
 
 The query result format is in the following example.
 
 
 
 Example 1:
 
 Input: 
 Employee table:
 +----+--------+
 | id | salary |
 +----+--------+
 | 1  | 100    |
 | 2  | 200    |
 | 3  | 300    |
 +----+--------+
 n = 2
 Output: 
 +------------------------+
 | getNthHighestSalary(2) |
 +------------------------+
 | 200                    |
 +------------------------+
 Example 2:
 
 Input: 
 Employee table:
 +----+--------+
 | id | salary |
 +----+--------+
 | 1  | 100    |
 +----+--------+
 n = 2
 Output: 
 +------------------------+
 | getNthHighestSalary(2) |
 +------------------------+
 | null                   |
 +------------------------+
 */
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN
DECLARE M INT;
SET M = N -1;
RETURN (
    SELECT DISTINCT salary
    from employee as e1
    where N -1 =(
            SELECT count(DISTINCT salary)
            from employee as e2
            where e2.salary > e1.salary
        )
);
END -- FUNCTION
select IFNULL(
        null,
        (
            select distinct salary
            from employee as e1
            where 1 = (
                    select count(distinct(salary))
                    from employee as e2
                    where e1.salary < e2.salary
                )
        )
    ) as SecondHighestSalary -- THIS QUERY ALSO HANDLES THE NULL VALUE