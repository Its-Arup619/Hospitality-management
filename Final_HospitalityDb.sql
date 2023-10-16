create database project;
-- create table hospitality;
create table hospitality (
	Brand varchar(255), City varchar(255), Country varchar(255), Date date, Dimension varchar(255),
       EBITDA_Label varchar(255), gross_Operating_Income_Label varchar(255),
       gross_Operating_Profit_Label varchar(255), measure_type varchar(255),
       net_operating_income_label varchar(255), Property varchar(255), State varchar(255), timetable int,
       dept_expences_e int, ff_and_e_rev_e int, management_fees_e int,
       non_ops_expenses int, revenue_e int, indicator int, measure int,
       net_op_income int, dept_expn int, ff_and_e_reserves int, management_fees int,
       non_operate_expenses int, total_revenue int, rooms_available int,
       rooms_revenue int, rooms_sold int, undistributed_expenses int, gross_income int,
       gross_profit int, management_fees_and_nonOps_exp int, EBITDA int,
       netops_income2 int
);

Select * from hospitality;

-- KPI 1- Total_departmental_expences:--
Select concat(sum(dept_expn)," $") as Total_departmental_expences from hospitality;

-- KPI 2- Total_FF& E_Reserves:--
Select concat(sum(ff_and_e_reserves)," $") as Total_FF_E_reserves from hospitality;

-- KPI 3- Total_Management_fees:--
Select concat(sum(management_fees), " $") as Total_Management_fees from hospitality;

-- KPI 4-Non_operating_expences:--
Select concat(sum(non_operate_expenses), " $") as Non_operating_expences from hospitality;

-- KPI 5- Total_Revenue:--
Select concat (sum(total_revenue), " $") as Total_Revenue from hospitality;

-- KPI 6- Total_Rooms_Available:--
Select sum(rooms_available) as Total_Rooms_Available from hospitality;

-- KPI 7- Total_Rooms_revenue:--
Select concat(sum(rooms_revenue)," $") as Total_Rooms_revenue from hospitality;

-- KPI 8- Total_Room_Sold:--
Select sum(rooms_sold) as Total_Room_Sold from hospitality;

-- KPI 9- Total_undistributed_expenses:--
Select concat(sum(undistributed_expenses)," $") as Total_undistributed_expenses from hospitality;

-- KPI 10- Average Daily Rate:--
select sum(rooms_revenue)/sum(rooms_sold) as ADR from hospitality;

-- KPI 11--EBIDTA:-
select concat((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))-(sum(management_fees)+sum(non_operate_expenses))," $") As Ebidta from hospitality;

-- KPI-12--EBIDTA %:--
Select concat(((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))-(sum(management_fees)+sum(non_operate_expenses)))/sum(total_revenue)*100," %")  as Ebidta_Percentage from hospitality;

-- KPI 13 & 14-- Gross_Operating_Income & Gross_Operating_Income % :--
select concat(sum(total_revenue)-sum(dept_expn)," $") as Gross_Operating_Income, concat(((sum(total_revenue)-sum(dept_expn))/sum(total_revenue)) * 100," %") as Gross_Operating_Income_Percentage from hospitality;

-- KPI 15--Gross_operating_profit:--
select concat((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))," $") as Gross_operating_profit from hospitality;

-- KPI 16-- Gross_operating_profit %
Select concat(((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses)))/ sum(total_revenue)*100, " %")  as Gross_operating_profit_Percentage from hospitality;

-- KPI 17-- Management_and_NonOperating_Expences:--
select Concat(sum(management_fees)+sum(non_operate_expenses)," $") as Management_and_NonOperating_Expences from hospitality;

-- KPI 18--Net Operating Income:--
select concat((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))-(sum(management_fees)+sum(non_operate_expenses)) -sum(ff_and_e_reserves)," $") as Net_Operating_Income from hospitality;

-- KPI 19--Net Operating Income%:--
select ((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))-(sum(management_fees)+sum(non_operate_expenses))-sum(ff_and_e_reserves))/sum(total_revenue)*100 as Net_Operating_Income_percentage from hospitality;

-- KPI 20--Occupancy Rate:--
SELECT concat(sum(rooms_sold)/sum(rooms_available)*100," %") as OCC_Percentage from hospitality;

-- KPI 21 --REVPER:--
select sum(rooms_revenue)/sum(rooms_available) as RevPer from hospitality;



-- Extra KPI's--
-- 1. Brand wise total revnue

Select Brand, concat(sum(total_revenue),"$") as Revenue from hospitality
group by Brand;

-- State wise total revenue:--
Select State, concat(sum(total_revenue),"$") as Revenue from hospitality
group by State;

-- Country wise Ebidta:--
Select Country,concat((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))-(sum(management_fees)+sum(non_operate_expenses))," $") As Ebidta from hospitality
group by country;


-- Hotel & year wise total gross profit:--

Select Dimension as HotelNo_,timetable as year,concat((sum(total_revenue)-sum(dept_expn))-(sum(undistributed_expenses))," $") as Gross_profit from hospitality
group by Dimension,timetable
order by timetable;

-- Year wise expenses:--
Select timetable as year,sum(dept_expn) as Departmental_Expences,sum(non_ops_expenses) as Non_Operating_expences,sum(undistributed_expenses) as Undistributed_expenses from hospitality
group by timetable;


Select State,sum(rooms_available) Available_Rooms from hospitality
group by State;


-- Select sum(dept_expn) + sum(non_ops_expenses) + sum(undistributed_expenses) from hospitality;
-- group by timetable;