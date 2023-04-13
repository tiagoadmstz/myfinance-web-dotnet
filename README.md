# myfinance-web-dotnet
MyFinance - Projeto do Curso de Pós-Graduação em Engenharia de Software da PUC-MG

## Docker base images :whale:
 - ASP.NET SDK (7.0.203): mcr.microsoft.com/dotnet/sdk:7.0
 - SQLSERVER EXPRESS 2017: mcr.microsoft.com/mssql/server:2017-latest

## SQLServer configuration
On the docker folder create 'mssql.env' file, file content:

```
ACCEPT_EULA=Y
MSSQL_PID=Express
MSSQL_SA_PASSWORD=Teste@123
```

## Create database
On the first time running docker is needed to run the script to create the database, using CLI follow the steps below:

 - docker ps
 - docker exec -it \<container-id\> bash
 - sh mssql.sh
 - exit

## Build and up system image
- first configure database
- navigate to the docker folder
- using CLI, run the commands
```
docker compose up --build
```

You can access the system at http://localhost:8080
