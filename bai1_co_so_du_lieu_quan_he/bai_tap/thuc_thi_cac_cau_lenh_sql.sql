SELECT * FROM customers;
select customerName, phone, city, country from customers;
select * from customers where customerName = 'Atelier Graphique';
select * from customers where customerName like '%A%';
select * from customers where city IN('Nantes', 'Las Vegas', 'Warszawa', 'NYC');