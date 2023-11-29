# SQL Server Docker Setup for DataWarehousing exercise

## Overview

This setp starts a Microsoft Server 2019 Docker container and imports the data source for subsequent DataWarehousing exercises.

## Prerequisites

- Docker must be installed and running on your machine.

## How to use the setup

#### 1. Clone the Repository:

```bash
   git clone https://github.com/tinzog/DataWarehousing.git
   cd DataWarehousingExercises
```

#### 2. Run the setup script

##### 2.1 Mac or Linux

   **Run Make Command:**
   Execute the following command to set up the SQL Server instance with the Demo databases:

```bash
   make init-all
```

##### 2.2 Windows

   **Run Bash Script:**

```bash
   bash setup.bat
```

If you encounter problems when executing the scripts, please try to run the steps (pull-image, run-container, set-backup,restore-db) separately.

You should now have a MSQL Server instance running in a Docker container with the data source required for our exercises.

*NOTE:* the container including the database is removed when you run the init script again. In order to reuse the existing container use `docker start SQL19` or `docker stop SQL19`.

#### 3. Connect to SQL Server in your DB Client

Use your favourite db client to connect to the SQL Server. It must be able to handle MSQL Server connections, e.g.:

* SQL Server Management Studio (SSMS) (Windows only)
* DBeaver (all platforms)
* SQLPro for MSSQL (Mac only)
* DB Gate (all platforms)

##### SQL Server Details

- **Username:** `SA`
- **Password:** `Password+123`
- **Port:** `1433`
- **Host:** `localhost`

## More about the AdventureWorks database

### AdventureWorks documentation

Schema visualisation:
https://dataedo.com/samples/html/AdventureWorks/doc/AdventureWorks_2/home.html

Backup files:
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

Usages:
https://jise.org/Volume26/n3/JISEv26n3p177.pdf

## Credits

This repo was initially a fork from https://github.com/SimonStride/AdventureWorksInDocker.
The setup has then been adjusted based on the following turorials:

* https://learn.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-ver16
* https://www.cathrinewilhelmsen.net/sql-server-2019-docker-container/
