# Sales Analysis Project

A dbt project analyzing sales data from 2022/23, with customer segmentation and order analysis.

### Dashboard
View our sales analysis dashboard [here](https://lookerstudio.google.com/reporting/7348cdd4-419e-42f2-b369-93f0395cde0b)

## How to Use

1. Clone this repository
2. Set up your profiles.yml with your BigQuery credentials
3. Run the following commands:
   - `dbt run`
   - `dbt test`
  
## Project Overview
- Customer segmentation (New, Returning, VIP)
- Monthly order volume tracking
- Product quantity analysis
- Average products per order trends

## Models

### Core Analysis Models
- `order_segments_2023`: Segments customers based on their order history (New: first order, Returning: 1-3 previous orders, VIP: 4+ orders)
- `2023_orders_with_segments`: Combines order data with customer segments and product quantities
- `avg_prods_per_order_2023`: Calculates the average number of products per order for each month
- `monthly_orders_2023`: Tracks the number of orders placed each month
- `total_orders_2023`: Provides the total order count for 2023

### Supporting Models
- `orders_with_prods`: Base model containing order and product quantity data for 2022-2023
