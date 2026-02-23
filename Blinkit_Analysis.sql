--Select the table 

use Blinkitdb

select * from blinkit_data

select COUNT(*) from BlinkIt_data

-- Data cleaning

update BlinkIt_data
set Item_Fat_Content ='Regular'
where Item_Fat_Content ='reg'


update BlinkIt_data
set Item_Fat_Content ='Low Fat'
where Item_Fat_Content ='LF'

update BlinkIt_data
set Item_Fat_Content ='Low Fat'
where Item_Fat_Content ='low fat'

select distinct(item_fat_content) from BlinkIt_data

select cast(SUM(sales)/1000000 as decimal(10,2)) Total_Sales_Millions
from BlinkIt_data

select CAST(avg(sales) as int) as Average_Sales
from BlinkIt_data

select COUNT(*) as No_of_orders
from BlinkIt_data

select cast(AVG(rating) as decimal(10,1)) as Avg_rating
from BlinkIt_data

select item_fat_content, 
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating
from BlinkIt_data
group by Item_Fat_Content

select Item_Type,
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating	
from BlinkIt_data
group by item_type
order by Total_sales desc


select Outlet_Location_Type,item_fat_content,
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating	
from BlinkIt_data
group by Outlet_Location_Type,item_fat_content
order by Total_sales desc


SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


select Outlet_establishment_year,
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating	
from BlinkIt_data
group by Outlet_establishment_year
order by Outlet_establishment_year asc


SELECT Outlet_Size, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


select Outlet_Location_Type,
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating	
from BlinkIt_data
group by Outlet_Location_Type
order by Total_sales desc


select Outlet_Type,
	cast(SUM(sales) as decimal(10,2)) as Total_sales,
	CAST(avg(sales) as int) as Avg_Sales,
	COUNT(*) as No_of_orders,
	cast(AVG(rating) as decimal(10,1)) as Avg_rating	
from BlinkIt_data
group by Outlet_Type
order by Total_sales desc


select * from BlinkIt_data
