
--------------------------------------------------
---  DWH Beispiel Abfragen 
--------------------------------------------------
USE Ziel_DWH
--What is the sum of bill amounts due in October?

SELECT sum(BillFacts.Current_Amt_Due) as "Total Due In October"
FROM dbo.BillFacts inner join dbo.CalendarDimension
ON BillFacts.FullDate = CalendarDimension.FullDate WHERE CalendarDimension.MonthNm = 'October'

--What is the sum of payments received in October, by type?  

SELECT sum(PaymentFacts.Pay_Amt) as "Total Paid In October", PaymentDimension.Pay_Method as "Payment Method" 
FROM dbo.PaymentFacts 
inner join dbo.CalendarDimension ON PaymentFacts.FullDate = CalendarDimension.FullDate 
inner join dbo.PaymentDimension ON PaymentFacts.Pay_ID = PaymentDimension.Pay_ID
WHERE CalendarDimension.MonthNm = 'October' GROUP BY PaymentDimension.Pay_Method 

--What are the first and last names of customers that have past due balances sometime in October? 

SELECT dbo.CustomerDimension.Cust_FName as "First Name", dbo.CustomerDimension.Cust_LName 
FROM dbo.CustomerDimension 
INNER JOIN dbo.BillFacts ON dbo.CustomerDimension.Per_ID = dbo.BillFacts.Per_ID 
                                                AND dbo.CustomerDimension.Acct_ID = dbo.BillFacts.Acct_id 
INNER JOIN dbo.CalendarDimension ON dbo.BillFacts.FullDate = dbo.CalendarDimension.FullDate 
WHERE dbo.CalendarDimension.MonthNm = 'October' AND dbo.BillFacts.Past_Due_Amt > '0.00'