Overview
This project focuses on the analysis and reporting of customer purchase behavior including product categories total spending and sales data analysis It creates a structured database with three primary tables Sales_Data Product_Details and Customer_Details which contain essential information about orders products and customers The project includes SQL queries to extract valuable insights such as identifying the top spenders bestseller products and customer purchasing trends

Key Features
Sales Data Management The Sales_Data table holds information on orders products purchased pricing discounts and customer details

Product Information The Product_Details table contains details on each product including the SKU product name and MRP Maximum Retail Price

Customer Data The Customer_Details table provides personal details such as customer ID name phone number and email

Data Analysis and Reporting SQL queries that:

Identify customers who have placed multiple orders and purchased a ceramic item at least once
Find the most expensive bestseller
Calculate the average offline purchase frequency for first-time online buyers
Identify the top 7 spenders in a specific city Y
Custom Queries User input-based queries allow filtering and generating insights based on specific conditions such as the city or product category

Tools Used
MySQL The primary tool used for creating the database populating the tables and writing queries for data analysis

SQL Standard SQL queries are used to manage the data and generate the required insights

Database Design Structured tables and relationships via customer_id and order_id to store and manage large datasets effectively

Data Analysis Aggregations and filtering techniques to generate meaningful reports such as top spenders bestseller analysis and customer purchase patterns

Key Insights
Customer Purchasing Patterns You can identify trends such as customers who buy more than once and those who are interested in ceramic products

Bestselling Products By aggregating sales data we can determine which products are the highest sellers helping businesses make data-driven decisions on inventory and marketing

Purchasing Frequency Analyzing first-time online buyers and their subsequent offline purchase frequency offers insights into customer behavior and channel preferences

Top Spenders by City The query that calculates the top spenders in a specific city helps businesses identify and target high-value customers

Files in Repository
Sales_Data Table Contains data about each order including order_id SKUs_bought price discount order_date customer_id order_city and channel_type

Product_Details Table Contains product-related information such as SKU MRP and product_name

Customer_Details Table Stores information about customers like customer_id name phone_number and email

Sample Data Insert Scripts SQL queries to populate the tables with sample data for testing and demonstration purposes

Query Files SQL scripts for querying the database to answer specific questions e.g identifying top spenders bestselling products etc

How to Use
Set Up Database

Create a MySQL database e.g salesanalytics
Run the SQL scripts to create the tables Sales_Data Product_Details Customer_Details
Insert the sample data using the provided SQL INSERT statements
Modify City or Product Information

For queries that require user input e.g top spenders in a city change the @city variable to the desired city in the query
Run Queries

Use the provided SQL queries to extract insights from the database
Queries can be executed in a MySQL client like MySQL Workbench or the command line
Analyze Results

Review the output of each query to gain insights into customer purchasing behavior product performance and spending patterns
Customize for Your Needs

You can adjust the tables or queries to accommodate additional business requirements such as adding new product categories or analyzing new customer segments
