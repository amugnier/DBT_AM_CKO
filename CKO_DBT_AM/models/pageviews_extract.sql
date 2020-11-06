{{ config(materialized='table') }}

   	/*SELECT & SHAPE snowflake's sample data to create a test Pageviews_Extract dataset */

SELECT * 
FROM 

    (
    	SELECT 

        Round(O_CustKEY/100000.0,0)*100000 as user_id, 
        'www.website.com/'||O_CLERK as URL,
        
        	/*Create a timestamp as not available in orginal dataset*/
        (DATEADD(year,25,O_orderdate):: VARCHAR ||' '|| (TIME(cast(uniform(1, 31535999, random()) as datetime))):: VARCHAR) ::datetime as  pageview_datetime



     	FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1000"."ORDERS"


    	WHERE  
			/*Limit the number of rows*/
    	DATEADD(year,25,O_orderdate)>DATEADD(month,-1,current_Date()) AND DATEADD(year,25,O_orderdate)<DATEADD(month,1,current_Date())


    ) pageview

WHERE 
/*Limit the number of rows*/
DATEADD(hour,-100,LOCALTIMESTAMP())<pageview_Datetime AND pageview_Datetime<LOCALTIMESTAMP()