

	/*SELECT & SHAPE snowflake's sample data to create a test Users_Extract dataset */

SELECT 
	
	 C_CustKey as id 
	 ,C_ADDRESS as Customer_postcode 

FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1000"."CUSTOMER"