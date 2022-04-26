
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}
with raw_account_seed as (
    select * from {{ref('raw_account')}}
),

account_model as (

   
--insert into temp_account
    SELECT
    CAST(json_extract_path_text(_airbyte_data,'Id') AS VARCHAR(64)) AS Id,
    CAST(json_extract_path_text(_airbyte_data,'Name') as varchar(64)) as name,
    CAST(json_extract_path_text(_airbyte_data,'CreatedDate') as timestamp) as  CreatedDate,
    CAST(Case when json_extract_path_text(_airbyte_data,'IsDeleted')='true' Then 1 else 0 end as boolean) as IsDeleted,
    CAST(Case when json_extract_path_text(_airbyte_data,'ProjectHub__IsInternal__c')='true' Then 1 else 0 end as boolean) as ProjectHub_IsInternal,
    GETDATE() as dataiq_extracted_date,    
    CAST('' as varchar(255)) as dataiq_extracted_by_id,   
    GETDATE() as gedataiq_uploaded_date,    
    CAST('' as varchar(255)) as dataiq_uploaded_by_id,  
    GETDATE() as asdataiq_modified_date,    
   CAST('' as varchar(255)) as dataiq_modified_by_id,    
   CAST(0 as boolean) as dataiq_is_deleted,    
   CAST('' as varchar(255)) as dataiq_deleted_by_id,   
   CAST('' as varchar(255)) as dataiq_source_id,    
   CAST('' as varchar(255)) as dataiq_tenant_id,    
   CAST('' as varchar(255)) as dataiq_owner_id,    
  CAST('' as varchar(255)) as dataiq_external_id,    
   CAST('' as varchar(255)) as dataiq_metadata_version
    --CAST(coalesce(json_extract_path_text(_airbyte_data,'AnnualRevenue')::decimal,'') as decimal(8,6)) as AnnualRevenue
    FROM raw_account_seed
     )
SELECT *
FROM account_model

/*
    Uncomment the line below to remove records with null `id` values
    dataiq_extracted_date timestamp,    
dataiq_extracted_by_id varchar(255),    
dataiq_uploaded_date timestamp,    
dataiq_uploaded_by_id varchar(255)    
dataiq_modified_date timestamp,    
dataiq_modified_by_id varchar(255),    
dataiq_is_deleted boolean,    
dataiq_deleted_by_id varchar(255),    
dataiq_source_id varchar(255),    
dataiq_tenant_id varchar(255),    
dataiq_owner_id varchar(255),    
dataiq_external_id varchar(255),    
dataiq_metadata_version varchar(255)
*/

-- where id is not null

