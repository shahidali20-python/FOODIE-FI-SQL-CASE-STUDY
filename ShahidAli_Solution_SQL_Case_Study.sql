/*
                                  SQL Case Study (Shahid Ali)

Using the dataset provided answer the following Questions:

1. How many customers has Foodie-Fi ever had? 
*/
  
select 
    count(distinct customer_id) as total_customers
from
    foodie_fi.subscriptions;

-- ---------------------------------------------------------------------------------------------------------------
-- 2. What is the monthly distribution of trial plan start_date values for our dataset - use the start  of the 
-- month as the group by value?

select 
    date_format(start_date, '%Y-%m-01') as start_of_month,
    count(*) as trial_start_count
from
    foodie_fi.subscriptions
where
    plan_id = 0
group by date_format(start_date, '%Y-%m-01')
order by start_of_month;

-- ---------------------------------------------------------------------------------------------------------------
-- 3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown  by count of 
-- events for each plan_name?

select 
    p.plan_name, count(*) as event_count
from
    foodie_fi.subscriptions s
        join
    foodie_fi.plans p on s.plan_id = p.plan_id
where
    extract(year from start_date) > 2020
group by p.plan_name;

-- ---------------------------------------------------------------------------------------------------------------
-- 4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place? 

select 
    count(distinct customer_id) as churned_customer_count,
    round(count(distinct customer_id) * 100.0 / (select 
                    count(distinct customer_id)
                from
                    foodie_fi.subscriptions),
            1) as churned_percentage
from
    foodie_fi.subscriptions
where
    plan_id = 4;

-- ---------------------------------------------------------------------------------------------------------------
-- 5. How many customers have churned straight after their initial free trial - what percentage is this rounded 
-- to the nearest whole number? 
    
select 
    count(distinct customer_id) as churned_after_trial_count,
    round(count(distinct customer_id) * 100.0 / (select 
                    count(distinct customer_id)
                from
                    foodie_fi.subscriptions
                where
                    plan_id = 0),
            0) as churned_after_trial_percentage
from
    foodie_fi.subscriptions
where
    plan_id = 4;

-- ---------------------------------------------------------------------------------------------------------------
-- 6. What is the number and percentage of customer plans after their initial free trial?     

select 
    count(distinct customer_id) as total_customers,
    round(count(distinct s.customer_id) * 100.0 / (select 
                    count(distinct customer_id)
                from
                    foodie_fi.subscriptions
                where
                    plan_id != 0),
            1) as plan_percentage
from
    foodie_fi.subscriptions s
where
    s.plan_id != 0;

-- ---------------------------------------------------------------------------------------------------------------
-- 7. What is the customer count and percentage breakdown of all 5 plan_name values at 2020- 12-31? 
    
select 
    p.plan_name,
    count(s.customer_id) as customer_count,
    round(count(s.customer_id) * 100.0 / (select 
                    count(customer_id)
                from
                    foodie_fi.subscriptions
                where
                    start_date = '2020-12-31')) as percentage
from
    foodie_fi.plans p
        left join
    foodie_fi.subscriptions s on p.plan_id = s.plan_id
        and s.start_date = '2020-12-31'
group by p.plan_name;

-- ---------------------------------------------------------------------------------------------------------------
-- 8. How many customers have upgraded to an annual plan in 2020? 

select 
    count(distinct customer_id) as upgraded_to_annual
from
    foodie_fi.subscriptions
where
    plan_id = 3 and year(start_date) = 2020;

-- ---------------------------------------------------------------------------------------------------------------
-- 9. How many days on average does it take for a customer to an annual plan from the day they  join Foodie-Fi? 

select 
    avg(datediff(sub_annual.start_date,
            sub_initial.start_date)) as avg_days_to_upgrade
from
    (select 
        customer_id, min(start_date) as start_date
    from
        foodie_fi.subscriptions
    where
        plan_id = 3
    group by customer_id) as sub_annual
        join
    (select 
        customer_id, min(start_date) as start_date
    from
        foodie_fi.subscriptions
    where
        plan_id != 0
    group by customer_id) as sub_initial on sub_annual.customer_id = sub_initial.customer_id;

-- ---------------------------------------------------------------------------------------------------------------
-- 10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)?

select 
    concat((floor(avg_days_to_upgrade / 30) * 30) + 1,
            '-',
            floor(avg_days_to_upgrade / 30) * 30 + 30) as days_range,
    count(customer_id) as count_customers
from
    (select 
        sub_annual.customer_id,
            avg(datediff(sub_annual.start_date, sub_initial.start_date)) as avg_days_to_upgrade
    from
        (select 
        customer_id, min(start_date) as start_date
    from
        foodie_fi.subscriptions
    where
        plan_id = 3
    group by customer_id) as sub_annual
    join (select 
        customer_id, min(start_date) as start_date
    from
        foodie_fi.subscriptions
    where
        plan_id != 0
    group by customer_id) as sub_initial on sub_annual.customer_id = sub_initial.customer_id
    group by sub_annual.customer_id) as avg_days_subscriptions
group by floor(avg_days_subscriptions.avg_days_to_upgrade / 30)
order by floor(avg_days_subscriptions.avg_days_to_upgrade / 30);

-- ---------------------------------------------------------------------------------------------------------------
-- 11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?

select 
    count(distinct customer_id) as downgrade_count
from
    foodie_fi.subscriptions
where
    plan_id = 1
        and customer_id in (select distinct
            customer_id
        from
            foodie_fi.subscriptions
        where
            plan_id = 2 and year(start_date) = 2020);
            
-- ---------------------------------------------------------------------------------------------------------------            

    

    
select * from foodie_fi.plans
    




