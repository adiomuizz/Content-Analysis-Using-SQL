-----Netflix Project
--DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix 
(
	show_id	VARCHAR(7),
	type	VARCHAR(10),
	title	VARCHAR(160),
	director VARCHAR(210),
	casts	VARCHAR(1000),
	country	VARCHAR(160),
	date_added	VARCHAR(50),
	release_year INT,
	rating	VARCHAR(12),
	duration	VARCHAR(18),
	listed_in	VARCHAR(100),
	description  VARCHAR(300)
);

select * from netflix;

--To know the row count in the data sets
Select count(*) As total_content
from netflix;

---To know the different type of movies in the data sets
select Distinct type As types_of_Movies
from netflix;


----Business Problems and Solutions
----1. Count the Number of Movies vs TV Shows
SELECT 
    type,
    COUNT(*)
FROM netflix
GROUP BY type;

---2. Find the Most Common Rating for Movies and TV Shows
WITH RatingCounts AS (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
    FROM netflix
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT 
        type,
        rating,
        rating_count,
        RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;	


---3. List All Movies Released in a Specific Year (e.g., 2020)
SELECT *
FROM netflix where release_year = 2020;

----4. Find the Top 5 Countries with the Most Content on Netflix
SELECT * 
FROM
(
    SELECT 
        UNNEST(STRING_TO_ARRAY(country, ',')) AS country,
        COUNT(*) AS total_content
    FROM netflix
    GROUP BY 1
) AS t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5;


----5. Identify the Longest Movie
SELECT *
FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1):: INT DESC;


----7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'
SELECT * 
	FROM netflix
where director = 'Rajiv Chilaka';



SELECT *
FROM (
    SELECT 
        *,
        UNNEST(STRING_TO_ARRAY(director, ',')) AS director_name
    FROM netflix
) AS t
WHERE director_name = 'Rajiv Chilaka';


---- 8.List All TV Shows with More Than 5 Seasons
SELECT *
FROM netflix
WHERE type = 'TV Show'
  AND SPLIT_PART(duration, ' ', 1)::INT > 5;


----9.Count the Number of Content Items in Each Genre
SELECT listed_in As genre, 
Count(*) As total_content
FROM netflix
GROUP BY 1;

SELECT 
    UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
    COUNT(*) AS total_content
FROM netflix
GROUP BY 1;

---10. Find each year and the average numbers of content release in India on netflix.
SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release
	FROM netflix
	where country = 'India'
	GROUP BY country, release_year;



SELECT 
    country,
    release_year,
    COUNT(show_id) AS total_release,
    ROUND(
        COUNT(show_id)::numeric / 
        (SELECT COUNT(show_id) FROM netflix WHERE country LIKE '%India%')::numeric * 100, 2
    ) AS avg_release
FROM netflix
WHERE country LIKE '%India%' AND release_year IS NOT NULL
GROUP BY country, release_year
ORDER BY avg_release DESC, release_year DESC
LIMIT 5;


-----11. List All Movies that are Documentaries
SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';

-----12. Find All Content Without a Director
SELECT * 
FROM netflix
WHERE director IS NULL;

---13. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
SELECT * 
FROM netflix
WHERE casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;


SELECT COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
  AND casts IS NOT NULL
  AND casts LIKE '%Salman Khan%'
  AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;


----14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
SELECT 
    UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
    COUNT(*)
FROM netflix
WHERE country = 'India' 
GROUP BY actor
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT 
    UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor,
	type,
    COUNT(*) As total_movies
FROM netflix
WHERE country IN('India', 'Mexico')
GROUP BY actor,type
ORDER BY total_movies  DESC
LIMIT 10;



--Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords
SELECT 
    category,
    COUNT(*) AS content_count
FROM (
    SELECT 
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category;
