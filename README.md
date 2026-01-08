# Retail Analysis Project (MySQL)

## Objective
Analyze retail sales data to identify revenue drivers, peak demand periods, and store performance differences in order to support staffing and inventory decisions.

## Dataset
Synthetic but realistic retail transaction data representing sales from 10 stores over a three-month period (October–December 2025).

The dataset includes:
- Stores (store name and city)
- Products (food and beverage items with pricing)
- Sales transactions (date, hour, quantity)

## Tools & Technologies
- MySQL
- MySQL Workbench
- SQL (joins, aggregations, date functions)

## Key Business Questions
- Which products generate the most revenue?
- When do peak sales hours occur?
- How do sales patterns differ by store and city?
- Are there observable sales spikes during special events (e.g., New Year’s Eve)?
- How does product demand vary between morning and evening hours?

## Analysis & Insights
- Sales peak between 18:00–22:00, indicating the need for increased evening staffing.
- Medium scoop products are the most frequently sold items.
- Premium products (e.g., Dubai items) generate high revenue relative to volume.
- Stores in Haifa outperform other cities, with the Carmel branch leading sales.
- Morning sales volumes are lower, but beverage items dominate early hours.
- New Year’s Eve shows a significant increase in total sales and units per transaction.

## Conclusions & Recommendations
- Increase staffing levels during evening peak hours and special events.
- Ensure sufficient inventory of high-demand products, especially medium scoops.
- Promote premium products through targeted marketing to maximize revenue.
- Adjust staffing strategies midweek based on observed demand patterns.
- Plan for seasonal and event-driven demand fluctuations.
## How to run
1. Open MySQL Workbench
2. Run 'Schema.sql' to create tables.
3. Run 'Data.sql' to populate data.
4. Run 'Sales info.sql' to insert sales data.
5. Run 'Analysis.sql' to perform analysis.
