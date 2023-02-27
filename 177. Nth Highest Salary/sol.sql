CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    # Write your MySQL query statement below.
    SELECT
        DISTINCT salary
    FROM
        (SELECT
            salary,
            RANK() OVER(ORDER BY salary DESC) AS rnk
        FROM
            employee) as ranks
    WHERE rnk = N
  );
END

#alternate solution
# CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
# BEGIN
# SET N = N-1;
#   RETURN (
#       SELECT DISTINCT(salary) from Employee order by salary DESC LIMIT N, 1
      
#   );
# END

# CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
# BEGIN
#     set N = N - 1;
#     RETURN (
#         # Write your MySQL query statement below.
#         select distinct salary from Employee order by salary desc limit N, 1
#     );
# END