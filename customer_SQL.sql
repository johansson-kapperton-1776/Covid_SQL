SELECT * FROM Parent.Customer;
SELECT count(*) FROM Parent.Customer;
SELECT country, Customer, name, Order_number FROM Parent.Customer WHERE country = 'Nigeria';
SELECT country, count(*) FROM Parent.Customer 
GROUP BY country;

SELECT C.Customer, C.Order_number, O.Item_ID, O.quantity, C.country
FROM Parent.Customer AS C, Parent.Orders AS O
WHERE C.Customer = O.Customer;






