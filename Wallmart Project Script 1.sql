select SKU,SHIPPING_LOCATION,DEPARTMENT,CATEGORY,
  case when [SUBCATEGORY] is null then 'None' else [SUBCATEGORY] end as [SUBCATEGORY],BREADCRUMBS
  FROM WallmartDatas..Datas

  select SKU 
	  ,[PRODUCT_NAME]
	  ,[CATEGORY]
	  ,case when [SUBCATEGORY] is NULL then 'None' else [SUBCATEGORY] end as [SUBCATEGORY]
	  ,[DEPARTMENT]
	  ,[BREADCRUMBS]
      ,case when [BRAND] IS NULL then 'None' else [BRAND] end as [BRAND]
      ,[PRICE_CURRENT]
	  ,[PRICE_RETAIL]
      ,[RunDate]
	  ,tid
	  ,sum(PRICE_CURRENT) as PRICE_CURRENT_SUM
	  ,sum(PRICE_RETAIL) AS PRICE_RETAIL_SUM
	  from WallmartDatas..Datas
	  group by PRODUCT_NAME,BRAND,RunDate,PRICE_CURRENT,PRICE_RETAIL,SKU,tid,CATEGORY,SUBCATEGORY,BREADCRUMBS,DEPARTMENT

	  create view PRODUCT_HEADER AS
select SKU
	  ,COUNT (SKU) as COUNT_SKU
	  ,[PRODUCT_NAME]
	  ,[CATEGORY]
	  ,COUNT (CATEGORY) AS COUNT_CATEGORY
	  ,[PRICE_CURRENT]
	  ,[PRICE_RETAIL]
	  ,avg(PRICE_CURRENT) as PRICE_CURRENT_AVG
	  ,AVG(PRICE_RETAIL) AS PRICE_RETAIL_AVG
      
	  from WallmartDatas..Datas
	  group by SKU,PRODUCT_NAME,CATEGORY,PRICE_CURRENT,PRICE_RETAIL

	  SELECT [SKU]
      ,[PRODUCT_NAME]
      ,[CATEGORY]
	  ,[PRICE_RETAIL]
	  ,[PRICE_CURRENT]
	  FROM WallmartDatas..Datas
