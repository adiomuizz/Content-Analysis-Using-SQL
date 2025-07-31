## 📘 Full Project Description: Netflix Content Analysis Using SQL


This project focuses on performing exploratory data analysis (EDA) on a Netflix dataset using SQL. The dataset contains detailed information about movies and TV shows available on Netflix, including metadata such as show ID, title, director, cast, release year, rating, genre, and descriptions.

## 🧾 Table of Contents

- [Project Objective](#project-objective)
- [File Structure](#file-structure) 
- [Dataset Description](#dataset-description)
- [SQL Features Used](#sql-features-used)
- [Business Questions Answered](#business-questions-answered)
- [Technical Stack](#Technical-Stack)
- [How to Use](#how-to-use)
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
git clone https://github.com/your-username/netflix-sql-analysis.git cd netflix-sql-analysis. ''''

