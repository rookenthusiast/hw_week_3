SELECT c.* from customers c
INNER JOIN tickets t
ON c.id = t.customer_id
