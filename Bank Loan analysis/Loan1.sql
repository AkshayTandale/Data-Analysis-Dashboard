use database;
select* from loan;
select count(*)
from loan;

-- 1. Total Loan Amount Funded--
select concat(round(sum(`loan amount`)/1000000,2),'M')Total_Loan_Amount
from loan;

-- 2. Total Loans--
select concat(round(count(`account id`)/1000,2),'K')Total_Loans
from loan;

-- 3. Total Collection--
select concat(round(sum(`total pymnt`)/1000000,2),'M')Total_Collection
from loan;

-- 4. Total Interest--
select concat(round(sum(`total rrec int`)/1000000,2),'M')Total_Interest
from loan;

-- 5. Branch-Wise (Interest, Fees, Total Revenue)--
select `branch name`Branch,round(sum(`total rrec int`))Interest,round(sum(`total fees`))Fees,round(sum(`total rrec int`)+sum(`total fees`))Total_Fees
from loan
group by 1 order by 3 desc;

-- 6. State-Wise Loan--
select `State name`State,sum(`loan amount`)Loan
from loan
group by 1;

-- 7. Religion-Wise Loan--
select Religion,sum(`Loan amount`)Loan
from loan
group by 1;

-- 8. Product Group-Wise Loan--
select `Purpose Category`,sum(`loan amount`)Loan
from loan
group by 1;

-- 9. Disbursement Trend--
select year(`Disbursement Date`)Year,sum(`Loan Amount`)Loan
from loan
group by year order by year;

 -- 10. Grade-Wise Loan--
 select grrade as Grade, sum(`loan amount`)Loan
 from loan
 group by grrade;
 
 -- 11. Count of Default Loan--
 select count(*)Default_Loan
 from Loan
 where `is default loan`='Y';
 
-- 12. Count of Delinquent Clients--
 select count(*)Delinquent_Loan
 from Loan
 where `is delinquent loan`='Y';
 
 -- 13. Delinquent Loans Rate--
select
concat(round((select count(*) from loan where `Is Delinquent Loan` = 'y') * 100.0 /
(select count(*) from loan),2),'%')Delin_Loan_Rate;
 
 -- 14. Default Loan Rate--
 select
concat(round((select count(*) from loan where `Is Default Loan` = 'y') * 100.0 /
(select count(*) from loan),2),'%')Default_Loan_Rate;
 
 -- 15. Loan Status-Wise Loan--
 select `Loan Status`,COUNT(*) Loan
 from loan
 group by `Loan Status`;
 
 -- 16. Age Group-Wise Loan--
 select Age,sum(`loan amount`)Loan
 from loan
 group by  age;
 
 -- 17. Loan Maturity--
 SELECT year(date_add(`Disbursement Date`, interval left(trim(term),2)month)) AS maturity_year,
       COUNT(*) AS loans_due,
       concat(round(SUM(`loan amount`)/1000000,2),'M') AS total_due
FROM loan
GROUP BY maturity_year
ORDER BY maturity_year;

 -- 18. No Verified Loan
--
select `Verification Status`,count(*)Loans
 from loan
 where `Verification Status`='not verified';

 

