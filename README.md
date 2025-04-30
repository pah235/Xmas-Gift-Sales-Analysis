# Xmas-Gift-Sales-Analysis
Xmas Gift Sales Analysis using SQL &amp; Power BI – Interactive dashboard to track revenue, profit, and trends by season, country, and product hierarchy.

---

# 🎄 Xmas Gift Sales Analysis | Business Intelligence Portfolio Project

## 📌 A. Project Overview

### 1. Scope of Tools & Skills Applied

#### 🔹 SQL
- Connected to SQL Server using **Azure Data Studio**.
- Performed basic queries using `WHERE`, logical operators, and arithmetic expressions.
- Aggregated data using `GROUP BY`, `HAVING`, and `CASE WHEN`.
- Queried across multiple tables with various types of `JOIN`.
- Optimized and modularized queries using `Subqueries`, `Common Table Expressions (CTEs)`, and `Views`.
- Solved a real-world business problem using SQL: **Analyzing Christmas Gift Sales**.

#### 🔹 Power BI
- Cleaned and transformed data using **Power Query Editor**.
- Built a relational **data model** to support robust visual analytics.
- Created complex **DAX measures** for KPIs and year-over-year comparisons.
- Designed interactive visual reports with various **Power BI visualizations** (bar charts, donut charts, matrix tables, etc.).
- Integrated **advanced reporting features**: Drill-down, Tooltips, Drill-through, Bookmarks, and Parameters.
- Delivered a complete **dashboard presentation** tailored to executive-level decision-making.

---

### 2. Case Study Context

#### 📁 Dataset Description
The dataset used for this project was provided by [FP20 Analytics – Challenge 12](https://fp20analytics.com). It includes:

- `Xmas Sales`: Transactional sales data during the Christmas season.
- `Country`: Geographical details including countries and cities.
- `Purchase Type`: Sales channels (e.g., Online, In-store).
- A custom-built `dim_date` table was added for time-based analysis.

#### 📊 Business Problem
You are a Business Intelligence Analyst working for the IT department. You are tasked with delivering Power BI dashboards that analyze and present sales performance for company leadership and department heads.

---

## 📊 B. Analytical Workflow

### 1. Data Collection & Understanding
- Downloaded the dataset from FP20 Analytics.
- Imported it into **SQL Server** for data exploration.

### 2. Data Preparation
- Used Power Query to clean and transform data.
- Standardized column names, data types, and handled missing values.
- Built a `dim_date` table to enable daily/monthly time intelligence.
- Established proper relationships between fact and dimension tables.

### 3. KPI Creation Using DAX
- Total Revenue
- Total Orders
- Total Products Sold
- Total Profit
- Year-over-Year Growth Metrics by Product Group

### 4. Data Visualization & Dashboard Design
- Developed a structured layout in Power BI with multiple report pages.
- Created:
  - Time trend charts
  - Donut and bar charts for regional and product breakdowns
  - Matrix tables for drill-down analysis by product group
- Enabled dynamic filtering through slicers, drill-through pages, and bookmarks.

---

## 📌 C. Project Deliverables

### 🔍 Key Business Insights

1. **Germany** generated the highest total revenue at **€939K**, accounting for approximately **13%** of overall holiday sales.
2. The **In-store** purchase channel dominated the season, outperforming online channels.
3. Sales volume and revenue peaked dramatically in **December**, particularly in the final week before Christmas.
4. The **Toys** category brought in the highest revenue; however, its **year-over-year growth declined**, signaling possible market saturation.
5. Cities like **Malmo** and **Stockholm** emerged as key revenue contributors within their regions.

---

## 📦 Files Included

| File Name                        | Description                                 |
|----------------------------------|---------------------------------------------|
| `Xmas Gift Sales Analysis.pbix` | Power BI dashboard project                  |
| `Xmas Gift Sales Analysis.sql`  | SQL scripts used for data exploration       |
| `README.md`                     | Project documentation and case overview     |

---

## 📚 References

- 📊 Dataset: [FP20 Analytics – Xmas Gift Sales Challenge 12](https://fp20analytics.com)
- 🛠 Tools Used: Microsoft SQL Server, Power BI, Azure Data Studio

---

