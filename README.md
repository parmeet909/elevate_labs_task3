# 📊 Task 3 - SQL for Data Analysis | Data Analyst Internship

This repository contains my submission for **Task 3: SQL for Data Analysis** as part of the Data Analyst Internship program.

---

## 🧠 Objective

To use **SQL** for querying and analyzing structured data, demonstrating proficiency with:
- SELECT, WHERE, ORDER BY, GROUP BY
- JOINS (INNER, LEFT, RIGHT)
- Subqueries
- Aggregate Functions (SUM, AVG, COUNT, etc.)
- Views
- Indexes (query optimization)

---

## 🛠 Tools Used

- **MySQL Workbench**
- **MySQL Server**
- Dataset: `Task 3_Final Content Data set.csv` (imported into MySQL)

---

## 📁 Dataset Overview

The dataset contains user reactions to online content.  
It includes columns such as:
- `content_id` – Unique identifier for the content
- `reaction_type` – Type of reaction (like, disgust, happy, etc.)
- `datetime_str` – Timestamp of the reaction
- `content_type` – Type of content (e.g., photo)
- `category`, `sentiment`, and `score` – Metadata for each reaction

---

## 🧾 Files Included

- `content_reactions_sample.sql` – SQL script to create the table
- `sql_queries.sql` – All queries used for data analysis (GROUP BY, JOINs, Views, etc.)
- `screenshots/` – Screenshots of executed queries and results
- `README.md` – This file

---

## 📊 Sample Queries

```sql
-- 1. Total reactions per sentiment
SELECT sentiment, COUNT(*) FROM content_reactions GROUP BY sentiment;

-- 2. Average score per category
SELECT category, AVG(score) FROM content_reactions GROUP BY category;

-- 3. Subquery: Reactions above average score
SELECT * FROM content_reactions WHERE score > (SELECT AVG(score) FROM content_reactions);
