
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

    create table if not exists cities(
json_extract_path_text(_airbyte_data,'Id') Id FROM raw_account_seed varchar(255),
    json_extract_path_text(_airbyte_data,'Name') name FROM raw_account_seed varchar(255),
    json_extract_path_text(_airbyte_data,'IsDeleted') IsDeleted FROM raw_account_seed boolean

);    

   /* SELECT
    json_extract_path_text(_airbyte_data,'Id') Id,
    json_extract_path_text(_airbyte_data,'Name') name,
    json_extract_path_text(_airbyte_data,'IsDeleted') IsDeleted,
    json_extract_path_text(_airbyte_data,'MasterRecordId') MasterRecordId,
    json_extract_path_text(_airbyte_data,'Type') Typea,
    json_extract_path_text(_airbyte_data,'ParentId') ParentId,
    json_extract_path_text(_airbyte_data,'BillingStreet') BillingStreet,
    json_extract_path_text(_airbyte_data,'BillingCity') BillingCity,
    json_extract_path_text(_airbyte_data,'BillingState') BillingState,
    json_extract_path_text(_airbyte_data,'BillingPostalCode') BillingPostalCode,
    json_extract_path_text(_airbyte_data,'BillingCountry') BillingCountry,
    json_extract_path_text(_airbyte_data,'BillingLatitude') BillingLatitude,
    json_extract_path_text(_airbyte_data,'BillingLongitude') BillingLongitude,
    json_extract_path_text(_airbyte_data,'BillingGeocodeAccuracy') BillingGeocodeAccuracy,
    json_extract_path_text(_airbyte_data,'ShippingStreet') ShippingStreet,
    json_extract_path_text(_airbyte_data,'ShippingCity') ShippingCity,
    json_extract_path_text(_airbyte_data,'ShippingState') ShippingState,
    json_extract_path_text(_airbyte_data,'ShippingPostalCode') ShippingPostalCode,
    json_extract_path_text(_airbyte_data,'ShippingCountry') ShippingCountry,
    json_extract_path_text(_airbyte_data,'ShippingLatitude') ShippingLatitude,
    json_extract_path_text(_airbyte_data,'ShippingLongitude') ShippingLongitude,
    json_extract_path_text(_airbyte_data,'ShippingGeocodeAccuracy') ShippingGeocodeAccuracy,
    json_extract_path_text(_airbyte_data,'Phone') Phone,
    json_extract_path_text(_airbyte_data,'Fax') Fax,
    json_extract_path_text(_airbyte_data,'AccountNumber') AccountNumber,
    json_extract_path_text(_airbyte_data,'Website') Website,
    json_extract_path_text(_airbyte_data,'PhotoUrl') PhotoUrl,
    json_extract_path_text(_airbyte_data,'Sic') Sic,
    json_extract_path_text(_airbyte_data,'Industry') Industry,
    json_extract_path_text(_airbyte_data,'AnnualRevenue') AnnualRevenue,
    json_extract_path_text(_airbyte_data,'NumberOfEmployees') NumberOfEmployees,
    json_extract_path_text(_airbyte_data,'Ownership') Ownership,
    json_extract_path_text(_airbyte_data,'TickerSymbol') TickerSymbol,
    json_extract_path_text(_airbyte_data,'Description') Description,
    json_extract_path_text(_airbyte_data,'Rating') Rating,
    json_extract_path_text(_airbyte_data,'Site') Site,
    json_extract_path_text(_airbyte_data,'OwnerId') OwnerId,
    json_extract_path_text(_airbyte_data,'CreatedDate') CreatedDate,
    json_extract_path_text(_airbyte_data,'CreatedById') CreatedById,
    json_extract_path_text(_airbyte_data,'LastModifiedDate') LastModifiedDate,
    json_extract_path_text(_airbyte_data,'LastModifiedById') LastModifiedById,
    json_extract_path_text(_airbyte_data,'SystemModstamp') SystemModstamp,
    json_extract_path_text(_airbyte_data,'LastActivityDate') LastActivityDate,
    json_extract_path_text(_airbyte_data,'LastViewedDate') LastViewedDate,
    json_extract_path_text(_airbyte_data,'LastReferencedDate') LastReferencedDate,
    json_extract_path_text(_airbyte_data,'Jigsaw') Jigsaw,
    json_extract_path_text(_airbyte_data,'JigsawCompanyId') JigsawCompanyId,
    json_extract_path_text(_airbyte_data,'AccountSource') AccountSource,
    json_extract_path_text(_airbyte_data,'DunsNumber') DunsNumber,
    json_extract_path_text(_airbyte_data,'Tradestyle') Tradestyle,
    json_extract_path_text(_airbyte_data,'NaicsCode') NaicsCode,
    json_extract_path_text(_airbyte_data,'NaicsDesc') NaicsDesc,
    json_extract_path_text(_airbyte_data,'YearStarted') YearStarted,
    json_extract_path_text(_airbyte_data,'SicDesc') SicDesc,
    json_extract_path_text(_airbyte_data,'DandbCompanyId') DandbCompanyId,
    json_extract_path_text(_airbyte_data,'ProjectHub__IsInternal__c') ProjectHub_IsInternal,
    json_extract_path_text(_airbyte_data,'ProjectHub__Discount__c') ProjectHub_Discount,
    json_extract_path_text(_airbyte_data,'ProjectHub__DiscountSchedule__c') ProjectHub_DiscountSchedule
    FROM raw_account_seed
     )*/
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

