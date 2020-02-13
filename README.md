# efcore-tenancy

## Docker

Docker project sets up db and api container to host the project. Install and configure Docker

## Launching containers

At a terminal/command prompt run

```
docker-compose up.
```

Connect to the db container by running the following command.

```
docker exec -it efcore-tenancy-db bash
```

Within SQL create the databases needed for the sample

```
sqlcmd -U sa -P Password123 -Q "CREATE DATABASE DellDb"
sqlcmd -U sa -P Password123 -Q "CREATE DATABASE HpDb"
sqlcmd -U sa -P Password123 -Q "CREATE DATABASE DiscriminatorDb"
sqlcmd -U sa -P Password123 -Q "CREATE DATABASE TenantPerSchemaDb"
```

Restore the databases with the following commands

```
sqlcmd -U sa -P Password123 -i /opt/scripts/DellDb.sql
sqlcmd -U sa -P Password123 -i /opt/scripts/HpDb.sql
sqlcmd -U sa -P Password123 -i /opt/scripts/DiscriminatorDb.sql
sqlcmd -U sa -P Password123 -i /opt/scripts/TenantPerSchemaDb.sql
```

## Testing

The service can be hit at the following url

[http://localhost:8080/products]
