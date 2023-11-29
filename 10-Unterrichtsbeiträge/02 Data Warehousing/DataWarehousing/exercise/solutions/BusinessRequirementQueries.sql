--Queries for Select Business Requirements


use  Quelle_OLTP
-- #1 – Customer Names and Person IDs 
SELECT Per_ID, Cust_FName, Cust_LName FROM PERSON 

-- #2 – Accounts Linked to Person ID 
SELECT Per_ID, Acct_ID FROM ACCOUNT  WHERE Per_ID = '4555555555' 


-- #3 – Total Accounts Receiving Paper or Paperless Bills  
 SELECT count(Acct_ID) as Total_Accounts, Bill_Type FROM ACCOUNT GROUP BY Bill_Type 

  
 -- #4 – Accounts with Past Due Balances  
 SELECT Acct_ID, Past_Due_Amt FROM BILL WHERE Past_Due_Amt > '0.00' 


 -- #5 – Pending, Completed, or Cancelled Appointments  
 SELECT Appt_ID, Acct_ID, Appt_Date, Appt_Type, Spec_Instr, Appt_Status FROM APPOINTMENT WHERE Appt_Status = 'Completed'


 -- #6 – Payment for Accounts by Payment Type for Given Dates  
  SELECT BILL.Acct_ID, PAYMENT.Pay_ID, PAYMENT.Pay_Date, PAYMENT.Pay_Method FROM BILL 
  INNER JOIN PAYMENT ON BILL.BILL_ID = PAYMENT.BILL_ID WHERE PAYMENT.Pay_Method = 'checking' AND PAYMENT.Pay_Date > '2014-10-01'


 -- #7 – Website User IDs with Customer Names 
 SELECT SS_WEBSITE_USER.User_ID, PERSON.Cust_FName, PERSON.Cust_LName FROM SS_WEBSITE_USER 
 INNER JOIN PERSON ON SS_WEBSITE_USER.PER_ID = PERSON.Per_ID


 -- #8 – Addresses with Pending Appointments  
 SELECT A.House_Num, A.Street_Nm, A.City, A.State, A.ZIP, B.Appt_Date, B.Appt_Type FROM ACCOUNT A
 INNER JOIN APPOINTMENT B ON A.Acct_ID = B.Acct_ID WHERE B.Appt_Status = 'pending'


 -- #9 – Customer Names with Past Due Balance History  
 SELECT A.Cust_FName, A.Cust_LName, C.Past_Due_Amt FROM PERSON A 
 INNER JOIN ACCOUNT B ON A.Per_ID = B.Per_ID 
 INNER JOIN BILL C ON B.Acct_ID = C.Acct_ID WHERE C.Past_Due_Amt > '0.00'


 -- #10 – Bill Type For a Given Payment  
 SELECT A.Pay_ID, A.Pay_Amt, A.Pay_Date, A.Pay_Method, C.Bill_Type FROM PAYMENT A 
 INNER JOIN BILL B ON A.Bill_ID = B.Bill_ID 
 INNER JOIN ACCOUNT C ON B.Acct_ID = C.Acct_ID WHERE A.Pay_ID = '343434343434343'
