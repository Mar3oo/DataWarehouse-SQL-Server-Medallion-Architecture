USE master 

IF DB_ID(N'DataWarehouse') IS NULL
BEGIN
	CREATE DATABASE DataWarehouse
END;
GO 

USE DataWarehouse; 
GO 

IF SCHEMA_ID(N'bronze') IS NULL 
	EXEC('CREATE SCHEMA bronze');
GO 

IF SCHEMA_ID(N'silver') IS NULL 
	EXEC('CREATE SCHEMA silver'); 
GO 

IF SCHEMA_ID(N'gold') IS NULL 
	EXEC('CREATE SCHEMA gold'); 
GO 
