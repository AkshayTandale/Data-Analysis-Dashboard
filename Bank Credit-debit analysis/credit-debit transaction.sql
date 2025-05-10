
select * from credit;
select * from loan;

-- 1--
select concat(round(sum(`amount`)/1000000,2),'M')Total_Credit_Amount
from credit
where  `Transaction Type` ='credit';

-- 2--
select concat(round(sum(`amount`)/1000000,2),'M')Total_Dedit_Amount
from credit
where  `Transaction Type` ='debit';

-- 3--
select sum(`credit amount`) / sum(`debit amount`) as Ratio
from credit;

-- 4 --
select sum(`credit amount`)-sum(`debit amount`)Net_Transaction
from Credit;

-- 5--
select (count(*)/avg(balance))Account_Activity_Ratio
from credit;

-- 6--
select Month, Transaction from(select monthname(`transaction date`)Month,month(`transaction date`)monthno,count(*)Transaction
from credit
group by 1,2
order by 2)ab ;

-- 7--
select branch,concat(round(sum(`amount`)/1000000,2),'M')Transaction_Amount
from credit
group by 1;

-- 8--
select `Bank Name`,concat(round(sum(`amount`)/1000000,2),'M')Transaction_Amount 
from credit
group by 1;

-- 9--
select `Transaction method` ,concat(round( count(*)/1000,2),'%')total
from credit
group by 1;

-- 10--
select branch,cy,py,concat(round((py-cy)/py *100,2),'%')as Growth_Transaction from (select branch,sum(amount)CY,lag(sum(amount)) over(order by (`Branch`) asc)PY
 from credit 
group by Branch order by 1)ab;

-- 11--
select  `customer name`,`transaction type`,Transactions from(select `customer name`,`transaction type`,sum(amount)Transactions,row_number() over( order BY sum(amount) desc)Rno
from credit
group by 1,2)ab;

-- 12--
select monthname(`Transaction Date`)Month,`Customer Name`,count(*)Transactions
from credit
group by 1,2 order by 3 desc;