CREATE SCHEMA new_schema ;

SELECT * FROM new_schema.netflix_titles;

-- ¿Qué títulos de Netflix se estrenaron en el año 2018?

SELECT * FROM new_schema.netflix_titles
WHERE release_year = 2018;

-- ¿Cuál es el título más antiguo de Netflix?

SELECT title, release_year
FROM new_schema.netflix_titles
ORDER BY release_year ASC;

-- ¿Cuál es el número medio de temporadas de una serie de televisión (no de películas) en Netflix?

SELECT AVG(duration) AS ‘average_show_duration’
FROM new_schema.netflix_titles
WHERE type = 'TV Show';

-- ¿Cuál es el tiempo total de pantalla de cada director en Netflix?

SELECT
director,
SUM(duration) AS total_screen_time_length
FROM new_schema.netflix_titles
WHERE type = 'Movie'
GROUP BY director;

-- ¿Cuál es la distribución del año de estreno de los títulos de Netflix?

SELECT
release_year,
COUNT(show_id) number_of_titles AS ‘number_of_titles’
FROM new_schema.netflix_titles
GROUP BY release_year
ORDER BY release_year ASC;
