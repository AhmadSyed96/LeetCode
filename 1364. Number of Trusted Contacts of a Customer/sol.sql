# Write your MySQL query statement below
# WITH contacts_plus_trusted as
#     (SELECT
#         contacts.*,
#         case when t1.user_id then 1 else 0 end as trusted
#     FROM    
#         (SELECT
#             *
#         FROM
#             contacts
#         WHERE
#             (contact_name, contact_email) in (SELECT customer_name, email FROM customers)) AS t1
#     RIGHT JOIN
#         contacts USING(user_id,contact_name, contact_email))
# SELECT
#     invoice_id, customer_name, price, contacts_cnt, trusted_contacts_cnt
# FROM
#     (SELECT
#         customer_id,
#         customer_name,
#         count(contacts_plus_trusted.user_id) as contacts_cnt,
#         COALESCE(sum(trusted),0) as trusted_contacts_cnt
#     FROM
#         customers
#     LEFT JOIN
#         contacts_plus_trusted ON customers.customer_id=contacts_plus_trusted.user_id
#     GROUP BY
#         customer_name) AS t1
# RIGHT JOIN
#     invoices ON t1.customer_id=invoices.user_id
# ORDER BY
#     invoice_id


SELECT
    I.invoice_id,
    Cust.customer_name,
    I.price,
    COUNT(DISTINCT C.contact_name) AS contacts_cnt,
    sum(case when c.contact_name in (select customer_name from customers) then 1 else 0 end) as trusted_contacts_cnt

FROM Invoices I
LEFT JOIN Customers Cust
    ON I.user_id = Cust.customer_id
LEFT JOIN Contacts C
    ON C.user_id = Cust.customer_id

GROUP BY 1, 2