## 📘 Full Project Description: Netflix Content Analysis Using SQL


This project presents a comprehensive exploratory data analysis (EDA) on Netflix content using SQL. It leverages a publicly available dataset sourced from Kaggle, containing metadata of Netflix’s catalog of Movies and TV Shows. The analysis includes content classification, rating trends, genre popularity, and content contribution by country, to uncover meaningful insights for business and content strategy.

## 🧾 Table of Contents

- [Project Objective](#project-objective)
- [File Structure](#file-structure) 
- [Dataset Description](#dataset-description)
- [SQL Features Used](#sql-features-used)
- [Business Questions Answered](#business-questions-answered)
- [Technical Stack](#Technical-Stack)
- [How to Use](#how-to-use)
- [Data Source](#Data-Source)
- [License](#license)

## 🧠 Overview

The Netflix dataset includes metadata for movies and TV shows available on the platform. The goal is to explore the dataset using SQL and answer various business-relevant questions like:

- How many movies vs TV shows are available?
- What are the top countries producing content?
- Which actor or director appears most frequently?
- How many shows include violence or killing in their descriptions?

## 📁 Repository Structure 
pgsql
netflix-sql-analysis/
├── README.md
└── netflix_analysis.sql

---

## 📂 Dataset Description

| Column         | Description                                 |
|----------------|---------------------------------------------|
| show_id        | Unique ID for each show                     |
| type           | Movie or TV Show                            |
| title          | Title of the show/movie                     |
| director       | Director(s) of the content                  |
| casts          | Cast members                                |
| country        | Country of origin                           |
| date_added     | When content was added to Netflix           |
| release_year   | Year content was originally released        |
| rating         | Age rating (e.g., TV-MA, PG, etc.)          |
| duration       | Runtime (minutes for movies, seasons for TV shows) |
| listed_in      | Genre(s)                                    |
| description    | Brief description or summary                |

---

## 💼 Business Questions & SQL Solutions

The following are included in the project SQL:

1. Total number of contents
2. Types of content (Movie or TV Show)
3. Movie vs TV Show count
4. Most common ratings by content type
5. Movies released in a specific year (e.g., 2020)
6. Top 5 countries with the most Netflix content
7. Longest movie
8. All content by director Rajiv Chilaka
9. TV shows with more than 5 seasons
10. Content count by genre
11. Content released by year in India with average % share
12. All documentaries
13. Content with missing directors
14. Movies featuring 'Salman Khan' in the last 10 years
15. Top actors in Indian content
16. Content categorization based on keywords like 'kill' or 'violence'

---

🔧 Technical Stack
SQL (PostgreSQL Syntax)

PostgreSQL functions used: UNNEST, STRING_TO_ARRAY, SPLIT_PART, ILIKE, CAST, CTEs (WITH), and window functions (RANK()).

Database client: pgAdmin, DBeaver, or any PostgreSQL-supported interface.

## 🧑‍💻 How to Use

1. Clone the repository:

```bash
git clone https://github.com/your-username/netflix-sql-analysis.git cd netflix-sql-analysis.
```
2. Open netflix_analysis.sql in your SQL environment (PostgreSQL preferred).

3. Run the script section-by-section or as a whole for insight generation.


💾 SQL Script
See the full SQL script in netflix_analysis.sql. It includes:
```bash

-- DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix (
    show_id VARCHAR(7),
    type VARCHAR(10),
    title VARCHAR(160),
    director VARCHAR(210),
    casts VARCHAR(1000),
    country VARCHAR(160),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(12),
    duration VARCHAR(18),
    listed_in VARCHAR(100),
    description VARCHAR(300)
);

-- Sample Query: Number of Movies vs TV Shows
SELECT type, COUNT(*) FROM netflix GROUP BY type;

-- Sample Query: Most Common Rating
WITH RatingCounts AS (
    SELECT type, rating, COUNT(*) AS rating_count
    FROM netflix
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT type, rating, rating_count,
           RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT type, rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;
````
-- More queries continue in the script file...

✅ Note: The full code with 20+ queries is saved in the netflix_analysis.sql file.

🏷️ Data Source
📥 Kaggle Dataset: Netflix Movies and TV Shows

📌 License: This dataset is publicly available on Kaggle for educational and non-commercial use.

### Acknowledgment:
Special thanks to Shivam Bansal for making this dataset available on Kaggle.

## 👤 Contact
**Name:** Adio Muizz Adeniyi  
📧 [Muizzadio@gmail.com](mailto:Muizzadio@gmail.com)  
🌍 [LinkedIn Profile](https://www.linkedin.com/in/adio-muizz-adeniyi/)


