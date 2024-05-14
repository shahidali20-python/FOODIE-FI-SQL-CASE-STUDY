# Foodie-Fi SQL Case Study

Welcome to the Foodie-Fi SQL Case Study! This repository contains SQL queries and a PDF report analyzing subscription data for Foodie-Fi, a streaming platform specializing in food-related content.

## Introduction
Subscription-based businesses, like Foodie-Fi, rely on data-driven insights to make informed decisions. This case study explores various aspects of Foodie-Fi's subscription data to answer key business questions.

## Dataset
The dataset includes two tables: `plans` and `subscriptions`. These tables provide information on customer plans, start dates, and plan types.

### Table 1: plans
Customers can choose from different subscription plans when joining Foodie-Fi. The `plans` table includes the following columns:
- `plan_id`: Unique identifier for each plan.
- `plan_name`: Name of the plan (e.g., basic monthly, pro annual).
- `price`: Price of the plan.

### Table 2: subscriptions
The `subscriptions` table tracks customer subscriptions and their start dates. It includes the following columns:
- `customer_id`: Unique identifier for each customer.
- `plan_id`: ID of the plan the customer subscribed to.
- `start_date`: Start date of the subscription.

## Case Study Questions
1. **How many customers has Foodie-Fi ever had?**
2. **What is the monthly distribution of trial plan start_date values?**
3. **What plan start_date values occur after the year 2020?**
4. **What is the customer count and percentage of churned customers?**
5. **How many customers churned straight after their initial free trial?**
6. **What is the number and percentage of customer plans after their initial free trial?**
7. **What is the customer count and percentage breakdown of all plan_name values at 2020-12-31?**
8. **How many customers upgraded to an annual plan in 2020?**
9. **How many days on average does it take for a customer to upgrade to an annual plan?**
10. **Can you further breakdown the average upgrade time into 30-day periods?**
11. **How many customers downgraded from a pro monthly to a basic monthly plan in 2020?**

## SQL Queries
Find SQL queries for each question in the `SQL Queries` folder.

## PDF Report
Refer to the `PDF Report` folder for detailed answers to the case study questions.

Feel free to explore the SQL queries and PDF report to gain insights into Foodie-Fi's subscription data!
