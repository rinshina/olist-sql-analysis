# Olist E-Commerce SQL Analysis

PostgreSQL analysis of the Olist Brazilian e-commerce dataset (~99k orders, 2016-2018):
revenue reporting, customer behaviour and payments.

**Tools:** PostgreSQL, pgAdmin. **Skills shown:** joins, aggregations, CTEs, window functions (LAG, percent-of-total), CASE.

## Metric definitions
- **Revenue** = sum of item price for delivered orders (excludes freight)
- **Repeat customer** = customer_unique_id with 2+ delivered orders
- **Payment value** includes freight, so it does not match revenue

## Queries and findings
| # | Question | File | Finding |
|---|---|---|---|
| 1 | Monthly revenue | 01_monthly_revenue.sql | ______ |
| 2 | Month-over-month growth | 02_mom_growth.sql | ______ |
| 3 | Top 10 categories by revenue | 03_top_categories.sql | ______ |
| 4 | Average order value by month | 04_aov_by_month.sql | ______ |
| 5 | Orders by status | 05_orders_by_status.sql | ______ |
| 6 | Revenue by state | 06_revenue_by_state.sql | ______ |
| 7 | Repeat vs one-time customers | 07_repeat_customers.sql | ______ |
| 8 | Payment types | 08_payment_types.sql | ______ |

## Data notes
- Early 2016 months have very low volume and Nov 2016 has no delivered orders, so growth % there is not meaningful
- Data ends in Aug 2018
- ______ (add one more thing you noticed)
