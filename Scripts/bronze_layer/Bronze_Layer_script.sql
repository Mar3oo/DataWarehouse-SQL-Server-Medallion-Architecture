CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME2;
    DECLARE @end_time DATETIME2;
    DECLARE @duration_seconds INT;

    BEGIN TRY
        SET @start_time = GETDATE();

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );


        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );


        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );


        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );


        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );


        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\Data Analytics\_Projects\DataWarehouse\Datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ','
        );

        SET @end_time = GETDATE();
        SET @duration_seconds =
            DATEDIFF(SECOND, @start_time, @end_time);

        PRINT 'Bronze layer loaded successfully.';
        PRINT CONCAT('Start time: ', @start_time);
        PRINT CONCAT('End time: ', @end_time);
        PRINT CONCAT('Duration: ', @duration_seconds, ' seconds');

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while loading the Bronze layer.';
        PRINT CONCAT('Error message: ', ERROR_MESSAGE());
        PRINT CONCAT('Error line: ', ERROR_LINE());
    END CATCH
END;
GO