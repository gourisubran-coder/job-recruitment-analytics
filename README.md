# Job Recruitment Analytics & Hiring Insights Dashboard

## 📌 Project Overview

This project focuses on analyzing recruitment and hiring data to uncover insights into candidate profiles, job postings, applications, recruiter performance, interview outcomes, salary offers, and hiring trends.

The project follows an end-to-end data analytics workflow, starting with dataset generation using Claude AI, data preparation in Microsoft Excel, database management and analysis using SQL Server, and interactive dashboard development using Microsoft Power BI and DAX.

## 🎯 Project Objectives

- Analyze recruitment and hiring performance using structured data.
- Clean, organize, and manage data using Excel and SQL Server.
- Perform SQL analysis to identify recruitment trends and patterns.
- Develop interactive dashboards to monitor recruitment KPIs.
- Evaluate candidate skills, experience, salary offers, and interview outcomes.
- Provide insights into recruitment funnel performance and hiring efficiency.

## 🛠️ Tools & Technologies

- **Claude AI:** Generated the synthetic job recruitment dataset.
- **Microsoft Excel:** Data review, cleaning, and preparation.
- **Microsoft SQL Server & SSMS:** Data storage, relational data management, and SQL analysis.
- **SQL:** Data querying, filtering, aggregation, JOINs, subqueries, CTEs, CASE statements, and window functions.
- **Microsoft Power BI:** Interactive dashboard development and data visualization.
- **DAX:** Measures, KPIs, and recruitment performance calculations.
- **GitHub:** Project documentation and portfolio presentation.

## 📂 Dataset Description

The dataset was generated using Claude AI and organized into nine related Excel tables:

| Table | Description |
|---|---|
| Candidates | Candidate profiles, education, experience, and resume scores |
| Companies | Company details, industries, and company sizes |
| Jobs | Job postings, departments, experience requirements, and salary ranges |
| Applications | Candidate applications, application dates, sources, and statuses |
| Recruiters | Recruiter details and company associations |
| Interviews | Interview dates, rounds, scores, feedback, and statuses |
| JobOffers | Salary offers, offer dates, and offer statuses |
| Skills | Skill names and categories |
| CandidateSkills | Candidate skills, proficiency levels, and years of experience |

The dataset contains **5,770 records across nine tables** and represents synthetic recruitment data for analytical and educational purposes.

## 🔄 Project Workflow

### 1. Data Collection
Generated a structured, synthetic recruitment dataset using Claude AI and organized the information into related Excel sheets.

### 2. Data Cleaning and Preparation
Reviewed and prepared the Excel data for database import by checking data consistency, duplicate records, missing values, column data types, date formats, and relationships between tables.

### 3. SQL Server Database Management
Imported the prepared tables into Microsoft SQL Server and organized them into a relational database named `JobRecruitmentDB`.

### 4. SQL Querying and Analysis
Performed data analysis using SQL queries, including:

- SELECT, WHERE, ORDER BY, and DISTINCT
- Aggregate functions and GROUP BY
- INNER JOIN and LEFT JOIN
- Subqueries and EXISTS
- Common Table Expressions (CTEs)
- CASE statements and conditional logic
- Window functions and ranking
- Recruitment KPI calculations and analytical queries

### 5. Power BI Data Modeling
Connected SQL Server to Power BI and established relationships between the recruitment tables to support cross-table analysis and interactive filtering.

### 6. DAX Measures and KPI Development
Created DAX measures to calculate recruitment metrics such as:

- Total Candidates
- Total Companies and Job Postings
- Total Applications and Interviews
- Total Offers and Accepted Offers
- Hiring Rate and Offer Acceptance Rate
- Average Experience and Resume Score
- Average Interview Score
- Average Salary Offered
- Average Days to Offer

### 7. Interactive Dashboard Development
Designed a multi-page Power BI dashboard using KPI cards, bar charts, column charts, donut charts, treemaps, funnel charts, line charts, scatter plots, slicers, and drill-through analysis.

## 💡 Key Analytical Areas

- Recruitment funnel and hiring outcomes
- Applications by source, department, company, and job type
- Candidate experience, education, and resume scores
- Candidate skill distribution and proficiency
- Salary offers and offer acceptance
- Recruiter activity and interview performance
- Recruitment trends and hiring efficiency

## 📸 Dashboard Preview

Dashboard screenshots are available in the `SCREENSHOTS` folder. They showcase the five Power BI dashboard pages and their interactive visualizations.

## 📈 Learning Outcomes

Through this project, I gained practical experience in data preparation, relational database management, SQL-based analysis, Power BI data modeling, DAX measure development, dashboard design, and communicating business insights through data visualization.



## 📊 Power BI Dashboard Pages

The project includes five main analytical dashboard pages and an additional company-level drill-through page.

### 1. Executive Overview
- Total candidates, companies, jobs, applications, interviews, offers, and hiring KPIs.
- Recruitment funnel analysis.
- Application trends and application source distribution.
- Department-wise application analysis.

### 2. Company & Job Analysis
- Job postings by company, department, industry, and job type.
- Company hiring performance and application metrics.
- Top-performing companies based on hiring outcomes.
- Interactive filters for detailed comparisons.

### 3. Company Details — Drill-Through Analysis
- Company-specific KPI cards for total jobs, applications, hires, and hire rate.
- Detailed job listing with department, job type, job status, minimum salary, and maximum salary.
- Drill-through navigation from the Company & Job Analysis page.
- Context-sensitive analysis that updates according to the selected company.

### 4. Salary & Offers Analysis
- Average salary offered and job salary ranges.
- Offer status distribution and offer acceptance rate.
- Candidate experience versus salary offered.
- Interactive salary and offer analysis.

### 5. Candidate & Skills Analysis
- Candidate distribution by education and current job title.
- Average candidate experience and resume score.
- Top skills and skill proficiency distribution.
- Candidate profile analysis using interactive slicers.

### 6. Recruiter & Interview Performance
- Total interviews and average interview scores.
- Interview outcomes and interview type distribution.
- Interview trends over time.
- Recruiter-level interview activity and performance.

## 🔍 Power BI Features

- Interactive slicers and cross-filtering.
- DAX measures for recruitment KPIs and performance calculations.
- Relational data modeling across recruitment tables.
- Drill-through navigation for company-level details.
- Multiple visualizations, including KPI cards, bar charts, column charts, donut charts, treemaps, funnel charts, line charts, and scatter plots.


## 👩‍💻 Author

**Gouri Subrahmanian**

Aspiring Data Analyst | SQL | Microsoft Excel | Power BI | DAX | Python

