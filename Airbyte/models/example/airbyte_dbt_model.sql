
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}
with opportunity_seed as (
    select * from {{ref('Opportunity')}}
),

airbyte_dbt_model as (
    SELECT *
           FROM opportunity_seed
           
)
select *
from airbyte_dbt_model

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
