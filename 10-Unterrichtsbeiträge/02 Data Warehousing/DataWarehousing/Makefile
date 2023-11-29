# Define the SA password as a variable for ease of change
SA_PASSWORD=Password+123
SSQL_PORT=1433
CONTAINER_NAME=SQL19

# Pull the Docker image
pull-image:
	docker pull mcr.microsoft.com/mssql/server:2019-latest

# Run the Docker container
run-container:
# remove container if exists
	docker rm -f $(CONTAINER_NAME) || true
	docker run --name $(CONTAINER_NAME) -p $(SSQL_PORT):1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$(SA_PASSWORD)" -d mcr.microsoft.com/mssql/server:2019-latest

# Create backup directory and copy backup files
setup-backup:
	docker exec -it SQL19 mkdir /var/opt/mssql/backup || true
	docker cp databases/Quelle_OLTP_System.bak SQL19:/var/opt/mssql/backup


db-wait:
	@echo "Waiting for SQL Server to be ready..."
	@while ! docker exec $(CONTAINER_NAME) /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$(SA_PASSWORD)" -Q "SELECT 1" > /dev/null 2>&1; do \
		echo "Waiting for database..."; \
		sleep 5; \
	done
	@echo "SQL Server is ready."

# Restore database
restore-db:
	docker exec -it SQL19 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '$(SA_PASSWORD)' -Q 'RESTORE DATABASE Quelle_OLTP FROM DISK = "/var/opt/mssql/backup/Quelle_OLTP_System.bak" WITH MOVE "Quelle_OLTP_System" TO "/var/opt/mssql/data/Quelle_OLTP_System", MOVE "Quelle_OLTP_System_log" TO "/var/opt/mssql/data/Quelle_OLTP_System_log"'


info:
# output information about username, password and port
	@echo "You can connect to the SQL Server using the following information:"
	@echo "Username: SA"
	@echo "Password: $(SA_PASSWORD)"
	@echo "Port: $(SSQL_PORT)"

stop:
	docker stop $(CONTAINER_NAME)

start:
	docker start $(CONTAINER_NAME)

# Main task to perform all steps for initializing
init-all: run-container setup-backup db-wait restore-db info