Before running application please run sql files from Sql folder.
    InitialMigration - will create database required for application
    SeedData - will populate database with some test records

Please note db connection string should be populated in BooksCatalog.Web/appsettings.json file in following way:

```
"ConnectionStrings": {
    "BooksCatalog": "ConnectionString"
  }

``` 
Application can be built by the next command sequence:

```
dotnet restore BooksCatalog.sln
dotnet publish BooksCatalog.sln -c Release -o /app/

```