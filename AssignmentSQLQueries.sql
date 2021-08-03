-- Assignment on SQL Queries :-
-- Submitted by: Sugandh Kumar

use pubs

--1) print the employee name and the number of titles each of them have published
select concat(fname, ' ', minit, ' ', lname) "Employee Name", count(t.pub_id) "Number of Titles"
from employee as e join titles as t on t.pub_id=e.pub_id
group by concat(fname, ' ', minit, ' ', lname);

--2) print the store name, title name, total price , quantity, price, publisher name for every book
select stor_name "Store Nmae", title "Title Name", (qty*price) "Total Price", qty "Quantity", 
price "Price", pub_name "Publisher Name" 
from stores as st join sales as sa on st.stor_id=sa.stor_id 
join titles as ti on sa.title_id=ti.title_id join publishers as pu on ti.pub_id=pu.pub_id order by 1;

--3) print every book name and  its author 's full name
select title "Book Name", concat(au_fname, ' ',au_lname) "Author Name" from titles as ti join 
titleauthor as tia on ti.title_id=tia.title_id join authors as au on tia.au_id=au.au_id order by 1;

--4) print the author's full name and number of books written by each
select concat(au_fname, ' ', au_lname) "Author Name" , count(title_id) "Number of Books" 
from titleauthor as tia join authors as au on tia.au_id=au.au_id
group by concat(au_fname, ' ', au_lname);

--5) print the author full name, publisher's name, title name, quantity sold, store name and the store address of all the books
select concat(au_fname, ' ', au_lname) "Author Name", pub_name "Publisher's Name", title "Title Name",
qty "Quantity Sold", stor_name "Store Name", stor_address "Store Address" 
from titleauthor as tia join authors as au on tia.au_id=au.au_id
join titles as ti on tia.title_id=ti.title_id
join publishers as pu on ti.pub_id=pu.pub_id
join sales as sa on ti.title_id=sa.title_id
join stores as st on sa.stor_id=st.stor_id
order by 1;

--6) select author name and the average quantity sold for every author
select concat(au_fname, ' ', au_lname) "Author Full Name", avg(qty) "Average Quantity Sold for Every Author"
from titleauthor as tia join titles as ti on tia.title_id=ti.title_id
join sales as sa on ti.title_id=sa.title_id
join authors as au on tia.au_id=au.au_id
group by concat(au_fname, ' ', au_lname);

--7) print the store name and address of all the sales for a given title
select stor_name 'Store Name', stor_address "Store Address" 
from sales as sa join stores as st on sa.stor_id=st.stor_id;

--8) what is the max quantity sold for every publisher?
select pub_name "Publisher Name", max(qty) "Max Quantiti Sold" from publishers as pu 
left outer join titles as ti on pu.pub_id=ti.pub_id
left outer join sales as sa on ti.title_id=sa.title_id
group by pub_name;

--9) print the employee names for a given publisher
select concat(fname,' ',minit,' ',lname) as "Employee Name", pub_name "Publisher Name" 
from employee as em join publishers as pu on em.pub_id=pu.pub_id
order by [Employee Name];

--10) Explore the function soundex. show an example query

--Soundex function evaluate similary of two strings and return the 4 character code based on how the string sounds when spoken

select SOUNDEX('Sugandh') 'Value1',SOUNDEX('Kumar') 'Value2';

--11) print the total sales(price*quantity) for every city in the author table
select city "City",sum(price*qty) "Total Sales" from titleauthor as tia 
join titles as ti on tia.title_id=ti.title_id
join sales as sa on ti.title_id=sa.title_id
right outer join authors as au on tia.au_id=au.au_id
group by city;

--12) sort by date and print the store name and the latest purchase done by every store
select stor_name as "Store Name", ord_date "Latest Purchase Done"
from stores as st join sales as sa on st.stor_id=sa.stor_id order by ord_date desc;
