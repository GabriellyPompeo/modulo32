-- exercício 1

-- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes. 
SELECT m.title AS movie_title, c.category_name
FROM movies AS m
JOIN categories AS c ON m.category_id = c.category_id;


-- Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. 
-- Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram. 
SELECT actors.name AS actor_name, COUNT(*) AS num_movies
FROM actors
JOIN actor_movie ON actors.actor_id = actor_movie.actor_id
GROUP BY actors.actor_id
ORDER BY num_movies DESC;


-- Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). 
-- Ordene a lista pelo numero de filmes que cada ator participou. 
SELECT actors.name AS actor_name, COUNT(*) AS num_movies
FROM actors
JOIN actor_movie ON actors.actor_id = actor_movie.actor_id
JOIN movies ON actor_movie.movie_id = movies.movie_id
WHERE movies.pageCount > 120
GROUP BY actors.actor_id
ORDER BY num_movies DESC;
