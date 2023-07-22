
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

    docker cp C:\Users\F.Kellner\Desktop\Uni\thro-de\thro_shpm_csv\. postgres-db:/csv_data

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
Note:
- **PARTITION BY** does not reduce the number of rows - as **GROUP BY** does.

Solution proposals can be found [here](<./04 SQL Plus - 02 Partition.sql>).

## Spatial Data
tbd

## Time Series Data
tbd

## Stored Procedures and Functions
tbd

## CTE (Common Table Expressions)
tbd

## Temp Tables
tbd

## String Functions
tbd

## Case
tbd

## Unions
tbd


# References
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)