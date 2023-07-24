
# Setup
## Intalling Docker
Install Docker Desktop on your local machine. Then, run the following code block: 

    docker run --name postgres-db -p 5432:5432 -e POSTGRES_USER=thro_stud -e POSTGRES_PASSWORD=thro_pw -e POSTGRES_DB=thro_db -d postgres

## Connecting DBeaver to your Database
Connect DBeaver to your database using the following parameters:

| Parameter             | Value             |
| --------              | -------           |
| Connected by          | Host              |
| Host                  | localhost         |
| Port                  | 5432              |
| Database              | thro_db           |
| Authentication        | Database Native   |
| Username              | thro_stud         |
| Password              | thro_pw           |
| Save password locally | TRUE              |

When asked, allow DBeaver to download the required driver files.

# Exercise 1: Creating Tables
## Step 1: Inspecting the Data
Inspect the three CSV files available [here](https://learning-campus.th-rosenheim.de/course/view.php?id=7181).

## Step 2: Creating the Tables
Create the corresponding database tables. A proposal for a solution is [here](<./01 Create.sql>).

## Step 3: Loading the Data
Import the CSV data into the new database tables. To do this, first, copy the CSV files to the container

    docker cp src/. container_id:/target

For instance:

    docker cp C:\Users\F.Kellner\Desktop\Uni\thro-de\02-Computer-Languages\thro_shpm_csv\. postgres-db:/csv_data

Finally, run the COPY command.

# Exercise 2: Basic SQL Commands
Use SQL to answer the following questions:
1. Show all plants
2. Show all custome names, street addresses, zip cides, and locations
3. Show all outlet customers
4. Order Query 3 as a function of the zip code
5. What is the overall volume delivered (in tons)?
6. What is the overall tonnage delivered by the single plants?
7. What was the minimum, average and maximum shipment weight per plant and tariff group?
8. On which days was it delivered?
9. On how many days was it delivered?
10. To which postal code were the individual shipments delivered?
11. How many tons of FMCG were delivered to each postal code?
12. How many tons of FMCG were delivered from which postal code to which postal code?
13. How many KG FMCG were delivered to customer 10099192 on each day?

Solution proposals can be found [here](<./03 SQL Basics.sql>).

# Exercise 3: Advanced SQL Commands
## Materialized Views
Use SQL to answer the following questions:
1. Aggregation of tonnages by customer zip code
2. Refresh
3. Transport volumes from postal code to postal code

Solution proposals can be found [here](<./04 SQL Plus - 01 MV.sql>).

## Partition By
Try to execute the SQL statements [here](<./04 SQL Plus - 02 Window Funcs.sql>). What are they doing?

Note:
- **PARTITION BY** does not reduce the number of rows - as **GROUP BY** does.

## Unions
SQL joins allow you to combine two datasets side-by-side, but UNION allows you to stack one dataset on top of the other. Put differently, UNION allows you to write two separate SELECT statements, and to have the results of one statement display in the same table as the results from the other statement. Note that UNION only appends distinct values. More specifically, when you use UNION, the dataset is appended, and any rows in the appended table that are exactly identical to rows in the first table are dropped. If you'd like to append all the values from the second table, use UNION ALL. You'll likely use UNION ALL far more often than UNION.

See the following [example](<./04 SQL Plus - 03 Union.sql>). What happens?

## Case
The PostgreSQL CASE expression is the same as IF/ELSE statement in other programming languages. It allows you to add if-else logic to the query to form a powerful query.

Since CASE is an expression, you can use it in any places where an expression can be used e.g.,SELECT, WHERE, GROUP BY, and HAVING clause.

There are two basic forms:

Form 1

    CASE 
        WHEN condition_1  THEN result_1
        WHEN condition_2  THEN result_2
        [WHEN ...]
        [ELSE else_result]
    END

Form 2

    CASE expression
        WHEN value_1 THEN result_1
        WHEN value_2 THEN result_2 
        [WHEN ...]
    ELSE
        else_result
    END

See the following [example](<./04 SQL Plus - 04 Case.sql>). What happens?


## CTE (Common Table Expressions)
A common table expression is a temporary result set which you can reference within another SQL statement including SELECT, INSERT, UPDATE or DELETE.

Common Table Expressions are temporary in the sense that they only exist during the execution of the query.

The following shows the syntax of creating a CTE:

    WITH cte_name (column_list) AS (
        CTE_query_definition 
    )
    statement;

In this syntax:

- First, specify the name of the CTE following by an optional column list.
- Second, inside the body of the WITH clause, specify a query that returns a result set. If you do not explicitly specify the column list after the CTE name, the select list of the CTE_query_definition will become the column list of the CTE.
- Third, use the CTE like a table or view in the statement which can be a SELECT, INSERT, UPDATE, or DELETE.

Common Table Expressions or CTEs are typically used to simplify complex joins and subqueries in PostgreSQL.

See this [example](<./04 SQL Plus - 05 CTE.sql>).

## String Functions to Clean Data
- LEFT: You can use LEFT to pull a certain number of characters from the left side of a string and present them as a separate string. The syntax is LEFT(string, number of characters).
- RIGHT: RIGHT does the same thing, but from the right side.
- LENGTH: The LENGTH function returns the length of a string.
- TRIM: The TRIM function is used to remove spaces or set of characters from the leading or trailing or both side from a string.
- SUBSTR: The SUBSTR function is used to extract a specific number of characters from a particular position of a string.
- CONCAT: The CONCAT function is used to concatenate two or more strings except NULL specified in the arguments.
- UPPER: The UPPER function is used to convert a string from lower case to upper case.
- LOWER: The LOWER function is used to convert a string from upper case to lower case.

Try the following statements:

    SELECT LEFT('TH Rosenheim', 2);
    SELECT RIGHT('TH Rosenheim', 9);
    SELECT LENGTH('TH Rosenheim');
    SELECT TRIM(' TH Rosenheim   ');
    SELECT SUBSTR('TH Rosenheim', 4, 4);
    SELECT CONCAT('TH', ' ', 'Rosenheim');
    SELECT UPPER('TH Rosenheim'),
    SELECT LOWER('TH Rosenheim')

### Turning strings into dates
Try to understand the following [code](<./04 SQL Plus - 06 Strings + Dates.sql>).


## Stored Procedures and Functions
### Functions
The create function statement allows you to define a new user-defined function. The following illustrates the syntax of the create function statement:

    create [or replace] function function_name(param_list)
        returns return_type 
        language plpgsql
        as
    $$
        declare 
        -- variable declaration
        begin
        -- logic
        end;
    $$

Try to understand the following [code](<./04 SQL Plus - 07 Funcs + Proceds.sql>).

So far, you have learned how to define user-defined functions using the create function statement.

A drawback of user-defined functions is that they cannot execute transactions. In other words, inside a user-defined function, you cannot start a transaction, and commit or rollback it.

PostgreSQL 11 introduced stored procedures that support transactions.

To define a new stored procedure, you use the create procedure statement. The following illustrates the basic syntax of the create procedure statement:

    create [or replace] procedure procedure_name(parameter_list)
        language plpgsql
        as
    $$
        declare
        -- variable declaration
        begin
        -- stored procedure body
        end;
    $$

Example:

    create or replace procedure transfer(
    sender int,
    receiver int, 
    amount dec
    )
    language plpgsql    
    as $$
    begin
        -- subtracting the amount from the sender's account 
        update accounts 
        set balance = balance - amount 
        where id = sender;

        -- adding the amount to the receiver's account
        update accounts 
        set balance = balance + amount 
        where id = receiver;

        commit;
    end;$$

    call transfer(1,2,1000);

## Spatial Data
tbd (cf. PostGIS)


# References
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Welcome to the SQL Tutorial](https://mode.com/sql-tutorial/)
- [PostgreSQL Tutorial](https://www.w3resource.com/PostgreSQL/tutorial.php)