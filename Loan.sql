use akshay;
select* from loan;

-- 1--
select concat(round(sum(`loan amount`)/1000000,2),'M')Total_Loan_Amount
from loan;

-- 2--
select concat(round(count(`account id`)/1000,2),'K')Total_Loans
from loan;

-- 3--
select concat(round(sum(`total pymnt`)/1000000,2),'M')Total_Collection
from loan;

-- 4--
select concat(round(sum(`total rrec int`)/1000000,2),'M')Total_Interest
from loan;

-- 5--
select `branch name`Branch,round(sum(`total rrec int`))Interest,round(sum(`total fees`))Fees,round(sum(`total rrec int`)+sum(`total fees`))Total_Fees
from loan
group by 1;

-- 6--
select `State name`State,sum(`loan amount`)Loan
from loan
group by 1;

-- 7--
select Religion,sum(`Loan amount`)Loan
from loan
group by 1;

-- 8--
select `Purpose Category`,sum(`loan amount`)Loan
from loan
group by 1;

-- 9--
select year(`Disbursement Date`)Year,sum(`Loan Amount`)Loan
from loan
group by year order by year;

 -- 10--
 select grrade as Grade, sum(`loan amount`)Loan
 from loan
 group by grrade;
 
 -- 11--
 select count(*)Default_Loan
 from Loan
 where `is default loan`='Y';
 
-- 12--
 select count(*)Delinquent_Loan
 from Loan
 where `is delinquent loan`='Y';
 
 -- 13--
select
concat(round((select count(*) from loan where `Is Delinquent Loan` = 'y') * 100.0 /
(select count(*) from loan),2),'%')Delin_Loan_Rate;
 
 -- 14--
 select
concat(round((select count(*) from loan where `Is Default Loan` = 'y') * 100.0 /
(select count(*) from loan),2),'%')Default_Loan_Rate;
 
 -- 15--
 select `Loan Status`,COUNT(*) Loan
 from loan
 group by `Loan Status`;
 
 -- 16--
 select Age,sum(`loan amount`)Loan
 from loan
 group by  age;
 
 -- 17--
 select `Verification Status`,count(*)Loans
 from loan
 where `Verification Status`='not verified';
 
 -- 18--
 select year(`Disbursement Date`)Year, sum(maturity_payment) from(select `Account ID`,`Loan Amount`,`Disbursement Date`, date_add(`Disbursement Date`, interval left(trim(term),2)month)Maturity_Date,term,
 `Loan Amount` + (`Loan Amount` * `Int Rate` / left(trim(term),2)) AS maturity_payment
 from loan)ab group by 1;
 
 use akshay;
 

