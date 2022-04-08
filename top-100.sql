-- (1)Crear base de datos llamada películas
CREATE DATABASE peliculas_db;
-- Ingresar a la base de datos llamada películas
\c peliculas_db;
-- Crear tabla llamada películas
CREATE TABLE peliculas (
  id SERIAL PRIMARY KEY NOT NULL,
  titulo VARCHAR(255) NOT NULL,
  anio INTEGER NOT NULL,
  director VARCHAR(255) NOT NULL
);
-- Crear tabla llamada reparto
CREATE TABLE reparto (
  id_pk BIGINT NOT NULL,
  actor VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_pk) REFERENCES peliculas(id)
);
-- (2)Cargar ambos archivos a su tabla correspondiente
\copy peliculas (id, titulo, anio, director) FROM 'C:\Users\Lenovo i5\Desktop\sourse\M-5\top100\peliculas.csv' csv header;
\copy reparto (id_pk, actor) FROM 'C:\Users\Lenovo i5\Desktop\sourse\M-5\top100\reparto.csv' csv header;
-- Verificar tablas
SELECT * FROM peliculas;
SELECT * FROM reparto;
-- (3)Obtener el ID de la película 'titanic'
SELECT id FROM peliculas WHERE titulo = 'Titanic';
-- (4)Listar a todos los actores que aparecen en la película 'titanic'
SELECT actor FROM reparto WHERE id_pk = '2';
-- (5)Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT(actor) FROM reparto WHERE actor = 'Harrison Ford';
-- (6)Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
SELECT titulo FROM peliculas WHERE anio BETWEEN 1990 AND 1999 ORDER BY titulo ASC;
-- (7) Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como 'longitud_titulo'
SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas;
-- (8)Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT MAX (LENGTH(titulo)) AS longitud_titulo, FROM peliculas;