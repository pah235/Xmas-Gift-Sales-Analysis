# Xmas-Gift-Sales-Analysis
Xmas Gift Sales Analysis using SQL &amp; Power BI – Interactive report to track revenue, profit, and trends by season, country, and product hierarchy.

---

# 🎄 Xmas Gift Sales Analysis | Business Intelligence Portfolio Project
![image](https://github.com/user-attachments/assets/3c82e6fd-20a9-4bb3-9d96-2a777f6a7719)
- 👉 You can download the interactive Power BI report (.pbix) file [here](https://github.com/pah235/Xmas-Gift-Sales-Analysis-Report/blob/main/Xmas%20Gift%20Sales%20Analysis.pbix)
- 👉 You can view the SQL script [here](https://github.com/pah235/Xmas-Gift-Sales-Analysis-Report/blob/main/Xmas%20Gift%20Sales%20Analysis.sql)
## 📌 A. Project Overview

### 1. Scope of Tools & Skills Applied

#### 🔹 SQL
- Connected to SQL Server using **Azure Data Studio**.
- Performed basic queries using `WHERE`, logical operators, and arithmetic expressions.
- Aggregated data using `GROUP BY`, `HAVING`, and `CASE WHEN`.
- Queried across multiple tables using various types of `JOIN`.
- Optimized and modularized queries using **Subqueries**, **Common Table Expressions (CTEs)**, and **Views**.
- Solved a real-world business problem using SQL: **Analyzing Christmas Gift Sales**.

#### 🔹 Power BI
- Cleaned and transformed data using **Power Query Editor**.
- Built a **data model** with proper relationships for multidimensional analysis.
- Created advanced **DAX measures** to calculate KPIs and seasonal comparisons.
- Designed interactive reports using Power BI visuals (bar charts, donut charts, matrix tables, etc.).
- Implemented key reporting features: **Drill-down**, **Drill-through**, **Tooltips**, **Bookmarks**, and **Parameters**.
- Delivered a fully interactive **report presentation** tailored for executive stakeholders.

---

### 2. Case Study Context

#### 📁 Dataset Description
The dataset was provided by [FP20 Analytics – Challenge 12](https://fp20analytics.com) and includes:

- `Xmas Sales`: Sales transactions during the Christmas season
- `Country`: Country and city details
- `Purchase Type`: Information about sales channels (e.g., Online, In-store)
- A custom `dim_date` table was added to support seasonal time intelligence

#### 📊 Business Objective
As a Business Intelligence Analyst in the IT Department, your responsibility is to deliver performance report and actionable insights for executive leadership and functional units during the Christmas campaign season.

---

## 📊 B. Analytical Workflow

### 1. Data Collection & Understanding
- Downloaded the dataset from FP20 Analytics.
- Imported data into **SQL Server** for querying and inspection.

### 2. Data Preparation
- Cleaned and transformed data using **Power Query** in Power BI.
- Standardized column names, fixed data types, and created calculated columns.
- Added a `dim_date` table to handle time-based analysis (seasonal and monthly).
- Established **relationships** between fact and dimension tables for robust analysis.
<img width="494" alt="image" src="https://github.com/user-attachments/assets/c45bb763-bbdf-427f-9af5-93cb9aba81ea" />

### 3. KPI Definition Using DAX

- 💰 **Total Sales**
- 📦 **Total Orders**
- 📊 **Total Quantity**
- 🧾 **Total Profit**
- 🔁 **Season-over-Season Growth** by Product Group and Country

### 4. Data Visualization & Report Design

- Created multiple Power BI pages with clean layout and navigation.
- Used various visuals:
  - Bar charts
  - Donut charts
  - Time trend charts (daily/monthly)
  - Matrix tables with drill-through
- Enabled report interactivity through:
  - Filters and slicers
  - Tooltip pages
  - Bookmark navigation
  - Drill-down & drill-through

---

## 📌 C. Project Deliverables

### 🔍 Key Business Insights

1. **Germany** generated the highest revenue at **€939K**, accounting for approximately **13%** of total holiday season sales.
2. The **In-store** sales channel dominated overall performance during the season.
3. Sales volume significantly spiked in **December**, particularly in the **week leading up to Christmas**.
4. While **Toys** remained the highest revenue-generating category, its **season-over-season growth declined**, suggesting market saturation or shifting customer preferences.
5. Cities such as **Malmo** and **Stockholm** emerged as key contributors to total revenue across all regions.

---

## 📦 Files Included

| File Name                        | Description                                 |
|----------------------------------|---------------------------------------------|
| `Xmas Gift Sales Analysis.pbix` | Power BI Report project                  |
| `Xmas Gift Sales Analysis.sql`  | SQL scripts used for data exploration       |
| `README.md`                     | Project documentation and case overview     |

---

## 📚 References

- 📊 Dataset: [FP20 Analytics – Xmas Gift Sales Challenge 12](https://fp20analytics.com)
- 🛠 Tools Used: Microsoft SQL Server, Power BI, Azure Data Studio

---


