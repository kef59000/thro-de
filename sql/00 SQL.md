
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