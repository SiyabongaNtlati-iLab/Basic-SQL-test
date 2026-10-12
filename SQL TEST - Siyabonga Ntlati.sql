--1
select * from customers
select * from orders
select * from suppliers;

--2
select contactname
from customers
where contactTitle like '%manager%'
order by contactName asc;

--3
select *
from orders
where orderdate = '1997-05-19';

--4
select companyname, fax, phone, country, homepage
from suppliers
order by country desc, companyname asc

--5
select productname, unitprice, quantityperunit
from products
where unitsinstock = '0'

--question 6
select address, city, contactname
from customers
where country not in ('mexico', 'spain', 'germany');

--question 7
select min(unitprice) as minimumprice,
       max(unitprice) as maximumprice,
       avg(unitprice) as averageprice
from products;

--question 8
select lastname, firstname
from employees
where reportsto is null;

--question 9
select orderid, orderdate, requireddate, shippeddate, shipaddress, shippostalcode
from orders
where shippostalcode like '98124%';

--question 10
select firstname, lastname, city
from employees
where not (city = 'seattle');

--question 11
select companyname, contactname, contacttitle
from customers
where contacttitle not like '%sales%';

--question 12
select customerid, sum(freight) as totalfreight
from orders
group by customerid
having sum(freight) > 200;

--question 13
select sup.supplierid, sup.companyname, cat.categoryname, item.productname, item.unitprice
from products as item
inner join suppliers as sup on item.supplierid = sup.supplierid
inner join categories as cat on item.categoryid = cat.categoryid;

--question 14
select ord.orderid, emp.firstname, emp.lastname
from orders as ord
inner join employees as emp on ord.employeeid = emp.employeeid
where ord.shippeddate > ord.requireddate;

--question 15
select productid, sum(quantity) as sumquantity
from [order details]
group by productid
having sum(quantity) < 200;

--question 16
select customerid, count(*) as ordercount
from orders
where orderdate >= '1996-12-31'
group by customerid
having count(*) > 15;

--question 17
select prod.productname, sup.companyname, prod.unitprice
from products as prod
inner join suppliers as sup on prod.supplierid = sup.supplierid;

--question 18
select prod.productname,
       sum(det.unitprice * det.quantity * (1 - det.discount)) as totalcosts
from [order details] as det
inner join products as prod on det.productid = prod.productid
group by prod.productid, prod.productname
having sum(det.unitprice * det.quantity * (1 - det.discount)) > 200;

--question 19
select orderid, count(orderid) as ordercount
from [order details]
group by orderid
order by ordercount desc;

--question 20
select sup.supplierid, sup.companyname, prod.productname
from products as prod
inner join suppliers as sup on prod.supplierid = sup.supplierid
where sup.companyname in ('specialty biscuits, ltd.', 'escargots nouveaux', 'exotic liquids')
order by sup.supplierid;