-- Exercício 2
-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca


-- Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes e retorne o numero de registros encontrados pela busca
SELECT m.title AS movie_title, c.category_name, (
  SELECT COUNT(*)
  FROM movies AS sub_movies
  JOIN categories AS sub_categories ON sub_movies.category_id = sub_categories.category_id
) AS num_records_found
FROM movies AS m
JOIN categories AS c ON m.category_id = c.category_id;


-- Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. 
-- Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram e retorne o numero de registros encontrados pela busca
SELECT actors.name AS actor_name, COUNT(*) AS num_movies, (
  SELECT COUNT(*)
  FROM actors AS sub_actors
) AS num_records_found
FROM actors
JOIN actor_movie ON actors.actor_id = actor_movie.actor_id
GROUP BY actors.actor_id
ORDER BY num_movies DESC;


-- Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). 
-- Ordene a lista pelo numero de filmes que cada ator participou e retorne o numero de registros encontrados pela busca
SELECT actors.name AS actor_name, COUNT(*) AS num_movies, (
  SELECT COUNT(*)
  FROM actors AS sub_actors
  JOIN actor_movie AS sub_actor_movie ON sub_actors.actor_id = sub_actor_movie.actor_id
  JOIN movies AS sub_movies ON sub_actor_movie.movie_id = sub_movies.movie_id
  WHERE sub_movies.pageCount > 120
) AS num_records_found
FROM actors
JOIN actor_movie ON actors.actor_id = actor_movie.actor_id
JOIN movies ON actor_movie.movie_id = movies.movie_id
WHERE movies.pageCount > 120
GROUP BY actors.actor_id
ORDER BY num_movies DESC;
