# Olist E-Commerce SQL Analysis

PostgreSQL analysis of the Olist Brazilian e-commerce dataset (~99k orders, 2016-2018):
revenue reporting, customer behaviour and payments.

**Tools:** PostgreSQL, pgAdmin. **Skills shown:** joins, aggregations, CTEs, window functions (LAG, percent-of-total), CASE.

## Dataset
Olist Brazilian E-Commerce dataset (Kaggle). 5 of the 9 tables are used: customers, orders, order_items, order_payments, products. Currency is Brazilian reais (BRL).

## How to reproduce
1. Download the dataset from Kaggle
2. Run `00_create_tables.sql` in PostgreSQL
3. Import each CSV into its table (header on, UTF8)
4. Run queries 01 to 08
   
## Metric definitions
- **Revenue** = sum of item price for delivered orders (excludes freight)
- **Repeat customer** = customer_unique_id with 2+ delivered orders
- **Payment value** includes freight, so it does not match revenue

## Queries and findings
| # | Question | File | Finding |
|---|---|---|---|
| 1 | Monthly revenue | 01_monthly_revenue.sql | Revenue grew from 111,798 in Jan 2017 to 924,645 in Jan 2018 (about 8x, from a small base). Through 2018 it plateaued between roughly 826k and 978k a month. The peak month was Nov 2017 (987,765), likely Black Friday. |
| 2 | Month-over-month growth | 02_mom_growth.sql | Excluding the low-volume 2016 months, the biggest rise was +109.5% in Feb 2017 (from a small base of 111,798 to 234,223). The biggest fall was -26.5% in Dec 2017 (987,765 to 726,033), the drop after the Nov spike. In 2018, growth faded from +15.4% in Mar to +2.1% in Apr and +0.4% in May, then turned negative in Jun (-12.4%) and stayed flat to slightly down through Aug. |
| 3 | Top 10 categories by revenue | 03_top_categories.sql | Health & beauty is the top category at 1,233,132 in delivered item revenue, followed by watches & gifts (1,166,177) and bed/bath/table home textiles (1,023,435). The top 10 categories together bring in 62.4% of total revenue(13221498.11), and the top 3 about a quarter, so revenue is spread across several categories, not dependent on one. |
| 4 | Average order value by month | 04_aov_by_month.sql | From Feb 2017 on, AOV stayed steady between 124 and 148, while monthly orders grew from 1,653 (Feb 2017) to 7,289 (Nov 2017, a one-month spike) and then held around 6,000 to 7,100 through 2018. Revenue growth came mainly from more orders, not bigger baskets, and the 2018 plateau reflects orders levelling off. |
| 5 | Orders by status | 05_orders_by_status.sql | 97.0% of orders (96,478 of 99,441) were delivered. Canceled and unavailable orders together were about 1.2% (1,234), and a further 1.7% were still at an earlier stage (shipped, invoiced, processing). Since the other queries count delivered orders only, they cover about 97% of all orders. |
| 6 | Revenue by state | 06_revenue_by_state.sql | Revenue is concentrated: São Paulo alone brings in about 38% of delivered revenue (5.07M), and SP, RJ and MG together about 63%. The top 10 states account for roughly 88%. SP leads on order volume (40,501 orders) but has the lowest revenue per order of the top three (about 125 vs 137 to 142). |
| 7 | Repeat vs one-time customers | 07_repeat_customers.sql | Only 3.0% of customers (2,801 of 93,358) placed more than one delivered order. Repeat customers account for about 6% of delivered orders, so revenue growth in this data came almost entirely from new customers, not repeat buying. |
| 8 | Payment types | 08_payment_types.sql | Credit card carries 78.5% of payment value and the highest value per order (about 163, vs 144 for boleto and 93 for voucher). Payments total 15.4M against 13.2M of item revenue, and the 2.2M gap is almost exactly the 2.2M of freight. |

## Data notes
- Early 2016 months have very low volume and Nov 2016 has no delivered orders, so growth % there is not meaningful
- Data ends in Aug 2018
- Order counts by payment method add up to 98,659, above the 96,478 delivered orders, because orders paid with more than one method are counted under each.
