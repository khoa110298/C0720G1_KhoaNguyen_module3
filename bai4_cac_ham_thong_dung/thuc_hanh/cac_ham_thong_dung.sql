select count(*) from classicmodels.customers;
select avg(buyPrice) from classicmodels.products;
select count(productcode) from classicmodels.products;
select max(buyprice) from classicmodels.products;
select min(buyprice) from classicmodels.products;
select sum(quantityInStock) from classicmodels.products;
select sum(quantityInStock) from classicmodels.products where productline = 'Motorcycles';
select ucase(productName) from classicmodels.products;
select lcase(productName) from classicmodels.products;
SELECT NOW() FROM classicmodels.products;
select classicmodels.products.productVendor, count(productcode) from products
where productline = 'Motorcycles'
group by productVendor
order by productVendor;
select length(productname) from classicmodels.products where productcode = 'S10_1678';
select productVendor, count(productcode) from classicmodels.products
where productline = 'Motorcycles'
group by productVendor
having count(productCode) > 10
order by productVendor;