@echo off
REM Define the SA password and other variables
SET SA_PASSWORD=Password+123
SET SSQL_PORT=1433
SET CONTAINER_NAME=SQL19

call :init-all
goto end

:pull-image
echo Pulling Docker image...
docker pull mcr.microsoft.com/mssql/server:2019-latest
goto :eof

:run-container
echo Running Docker container...
docker rm -f %CONTAINER_NAME% 2> NUL
docker run --name %CONTAINER_NAME% -p %SSQL_PORT%:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=%SA_PASSWORD%" -d mcr.microsoft.com/mssql/server:2019-latest
goto :eof

:setup-backup
echo Setting up backup...
docker exec -it SQL19 mkdir /var/opt/mssql/backup 2> NUL
docker cp databases/Quelle_OLTP_System.bak SQL19:/var/opt/mssql/backup
goto :eof

:wait-for-db
echo Waiting for SQL Server to be ready...
:wait-loop
docker exec %CONTAINER_NAME% /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "%SA_PASSWORD%" -Q "SELECT 1" > NUL 2>&1
if errorlevel 1 (
    echo Waiting for database...
    timeout /t 5 > NUL
    goto wait-loop
)
echo SQL Server is ready.
goto :eof

:restore-db
echo Restoring database...
docker exec -it SQL19 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "%SA_PASSWORD%" -Q "RESTORE DATABASE Quelle_OLTP FROM DISK = '/var/opt/mssql/backup/Quelle_OLTP_System.bak' WITH MOVE 'Quelle_OLTP_System' TO '/var/opt/mssql/data/Quelle_OLTP_System', MOVE 'Quelle_OLTP_System_log' TO '/var/opt/mssql/data/Quelle_OLTP_System_log'"
goto :eof

:info
echo Displaying connection information...
echo You can connect to the SQL Server using the following information:
echo Username: SA
echo Password: %SA_PASSWORD%
echo Port: %SSQL_PORT%
goto :eof

:stop
echo Stopping container...
docker stop %CONTAINER_NAME%
goto :eof

:start
echo Starting container...
docker start %CONTAINER_NAME%
goto :eof

:init-all
echo Initializing all...
call :pull-image
call :run-container
call :setup-backup
call :wait-for-db
call :restore-db
call :info
goto :eof

:end
echo Script execution completed.