# Write your MySQL query statement below
SELECT
    books.book_id,
    name
FROM
    (SELECT
        book_id,
        SUM(quantity) as tot_copies
    FROM
        orders
    WHERE
        dispatch_date>'2018-06-23'
    GROUP BY
        1) AS t1
RIGHT JOIN
    books USING(book_id)
WHERE
    COALESCE(tot_copies,0)<10
    and available_from<'2019-05-23'

# SELECT book_id, 
#        name
# FROM Books
# WHERE available_from < '2019-05-23'
# AND book_id NOT IN
#             (SELECT book_id
#              FROM Orders
#              WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
#              GROUP BY book_id
#              Having sum(quantity) >= 10) 
