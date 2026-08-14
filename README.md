# Client Management System – SQL

## 📌 Project Overview

This is a beginner-level **SQL Data Analysis project** built using **MySQL**.

The project simulates a client management system for an immigration consultancy. It stores and analyzes information related to clients, consultants, visa applications, consultation fees, countries, programs, and application status.

The main objective of this project is to practice SQL concepts on a realistic business-style dataset and answer useful business questions using SQL queries.

> **Note:** All data used in this project is synthetic and created only for learning and portfolio purposes.

---

## 🎯 Project Objectives

This project demonstrates how SQL can be used to:

* Store and manage structured business data
* Connect related tables using Primary Keys and Foreign Keys
* Filter and sort client records
* Analyze consultation and processing fees
* Calculate totals, averages, minimums and maximums
* Perform consultant-wise and country-wise analysis
* Combine information from multiple tables using JOINs
* Use subqueries and CTEs for multi-step analysis
* Categorize data using CASE WHEN
* Work with text and date values
* Perform conditional aggregation
* Use introductory Window Functions without losing row-level detail

---

## 🗂️ Database Structure

The project contains three main tables:

### 1. `clients`

Stores client information such as:

* Client ID
* First Name
* Last Name
* Email
* Phone
* Date of Birth
* Target Country
* Immigration Program
* Consultant ID
* Consultation Fee

### 2. `consultants`

Stores consultant information such as:

* Consultant ID
* First Name
* Last Name
* Email
* Phone
* Specialization

### 3. `visa_applications`

Stores visa application information such as:

* Application ID
* Client ID
* Application Date
* Visa Type
* Application Status
* Country
* Processing Fee
* Decision Date

---

## 🔗 Database Relationships

The tables are connected using Primary Keys and Foreign Keys.

* One consultant can handle multiple clients.
* Each client is assigned to a consultant.
* A client can have one or more visa applications.

This structure allows information from different tables to be combined for analysis.

---

## 🛠️ SQL Concepts Used

The project includes practice and implementation of:

### SQL Fundamentals

* `SELECT`
* `WHERE`
* `DISTINCT`
* `ORDER BY`
* `LIMIT`
* `IN` / `NOT IN`
* `BETWEEN`
* `LIKE`

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

### Grouping

* `GROUP BY`
* `HAVING`

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`

### Combining Results

* `UNION`
* `UNION ALL`

### String Functions

* `CONCAT()`
* `LOWER()`
* `TRIM()`
* `SUBSTRING_INDEX()`

### Date Functions

* `CURDATE()`
* `YEAR()`
* `MONTHNAME()`
* `DATEDIFF()`
* `TIMESTAMPDIFF()`
* `QUARTER()`

### Conditional Logic

* `CASE WHEN`
* Conditional Aggregation

### Advanced SQL Concepts

* Subqueries
* `EXISTS`
* `NOT EXISTS`
* Common Table Expressions (CTEs)
* `OVER()`
* `PARTITION BY`

---

## 📊 Business Questions Answered

Some of the questions explored in this project include:

* How many total clients are in the database?
* Which clients are targeting Germany or Canada?
* How many clients are handled by each consultant?
* Which consultants handle more than two clients?
* What is the total and average consultation fee?
* Which clients have consultation fees above the overall average?
* How many applications are received for each country?
* How many applications are received in each quarter?
* How long did completed visa applications take to process?
* Which consultants currently have clients assigned to them?
* Which clients do not have a visa application?
* How can clients be classified into fee categories?
* How can country-wise client counts be calculated in a single query?
* How can group averages be displayed while keeping individual client records?

---

## 📁 Project Files

| File                        | Description                                          |
| --------------------------- | ---------------------------------------------------- |
| `01_schema.sql`             | Creates the database, tables, keys and relationships |
| `02_sample_data.sql`        | Inserts synthetic sample data                        |
| `03_analysis_queries.sql`   | Contains SQL queries used for business analysis      |
| `04_practice_questions.sql` | Contains SQL questions for independent practice      |
| `DATA_DICTIONARY.md`        | Explains the database columns and their purpose      |
| `PROJECT_INSIGHTS.md`       | Summarizes business insights from the analysis       |
| `README.md`                 | Project documentation                                |

---

## ▶️ How to Run the Project

1. Open **MySQL Workbench**.
2. Run `01_schema.sql` to create the database and tables.
3. Run `02_sample_data.sql` to insert the sample records.
4. Open `03_analysis_queries.sql`.
5. Execute the queries individually to explore the analysis.
6. Use `04_practice_questions.sql` to practice solving the business questions independently.

---

## 💡 Key Learning Outcomes

Through this project, I practiced how to move from basic SQL queries toward business-oriented data analysis.

I learned how to:

* Design a simple relational database
* Work with multiple related tables
* Use JOINs to combine information
* Summarize data with aggregate functions
* Apply conditions to aggregated data
* Work with strings and dates
* Write subqueries and CTEs
* Build conditional reports using CASE WHEN
* Perform conditional aggregation
* Use basic Window Functions for group-level calculations while preserving individual rows

---

## 🚀 Future Improvements

As I continue learning Data Analytics, I plan to extend this project with:

* More Window Functions
* Advanced SQL analysis
* Data cleaning scenarios
* Additional business KPIs
* Excel analysis
* Power BI dashboards and visualizations

---

## 👤 Project Level

**Beginner Data Analytics / SQL Portfolio Project**

**Database:** MySQL
**Tool:** MySQL Workbench
**Focus:** SQL, Data Analysis, Business Reporting
