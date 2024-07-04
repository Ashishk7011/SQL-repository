select * from amazon_sales;

-- total sales by size
select Size, sum(sales) from amazon_sales
group by Size
order by 2 desc;

-- total sales by size and category
select Size, Category, sum(sales) from amazon_sales
group by Size, Category
order by 3 desc;

select Size, `ship-state`, sum(sales) from amazon_sales
group by Size, `ship-state`
order by 3 desc;

select `Date`, str_to_date(`Date`, '%m/%d/%Y') from amazon_sales;

-- change the datatype of `date` column text to date(m/d/Y); 
update amazon_sales
set `Date`= str_to_date(`Date`, '%m/%d/%Y');   

-- total sales by date(day and month) and category
select day(`Date`) `day`, monthname(`Date`) `month`, Category, sum(sales) from amazon_sales
group by Category, `day`, `month`
order by 4 desc;

select distinct `Courier Status` from amazon_sales;

-- total sales by courier status
select `Courier Status`, avg(Amount), sum(sales) from amazon_sales
group by `Courier Status`
order by `Courier Status`;

-- using having clause for condition of courier status which is unshipped 
select Category, `Courier Status`, sum(sales) total from amazon_sales
group by Category, `Courier Status`
having `Courier Status` = 'Unshipped';

select Category, `Courier Status`, sum(sales) as total from amazon_sales
group by Category, `Courier Status`
having `Courier Status` = 'Unshipped'
and total>1000000;

select `ship-state` from (select `ship-state`, sum(sales) from amazon_sales group by `ship-state` order by 2 desc ) as table2;

select * from amazon_sales
order by sales desc
limit 10;


















