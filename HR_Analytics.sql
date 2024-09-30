Create Database HR_Analytics;
use HR_Analytics;

Select * from HR_1;
Select * from HR_2;

#-------------------- KPI_1  Average Attrition rate for all Departments

SELECT Department,	
	   CONCAT(ROUND((sum(case Attrition when 'Yes' then 1 else 0 end)/count(*))*100, 2),' %') AS `Avg. Attrition Rate`
FROM HR_1
GROUP BY 1
ORDER BY 1;
    
#------------------- KPI_2  Average Hourly rate of Male Research Scientist

SELECT Jobrole, Gender, AVG(HourlyRate) as `Avg. Hourly Rate for Male Research Scientist`
FROM HR_1
WHERE Gender = "male" AND JobRole = 'Research Scientist';

#------------------ KPI_3   Attrition rate Vs Monthly income stats

SELECT Department,
	   CONCAT("₹ ",FORMAT(AVG(b.monthlyincome),2)) `Avg. monthly income`,
	   CONCAT("₹ ",MAX(b.monthlyincome)) `Highest Monthly income`,
	   CONCAT("₹ ",MIN(b.monthlyincome)) `Lowest Monthtly income`,
	   CONCAT(ROUND((sum(case Attrition when 'yes' then 1 else 0 end)/count(*))*100, 2),' %') AS `Avg. Attrition Rate`
FROM hr_1 AS a JOIN hr_2 AS b
ON a.EmployeeNumber = b.`Employee ID`
GROUP BY 1
ORDER BY 1;
    
#----------------- KPI_4   Average working years for each Department

SELECT a.Department, CONCAT(ROUND(AVG(b.TotalWorkingYears),1)," Years") as `Avg. Working Years`
FROM hr_1 AS a JOIN hr_2 as b
ON a.EmployeeNumber = b.`Employee ID`
GROUP BY 1
ORDER BY 1;

#---------------- KPI_5   Job Role Vs Work life balance

SELECT a.Jobrole, 
ROUND(AVG(b.worklifebalance),2) `Work Life Balance`
FROM hr_1 AS a JOIN hr_2 AS b
ON a.EmployeeNumber = b.`Employee ID`
GROUP BY 1;

#---------------  KPI_6   Attrition rate Vs Year since last promotion relation

SELECT a.Jobrole,
	   CONCAT(ROUND(AVG(b.yearsSinceLastPromotion),1)," Years") `Years Since Last Promotion`,
       CONCAT(ROUND((sum(case Attrition when 'yes' then 1 else 0 end)/count(*))*100, 2),' %') AS `Avg. Attrition Rate`
FROM hr_1 as a JOIN hr_2 as b
ON a.EmployeeNumber = b.`Employee ID`
GROUP BY 1;