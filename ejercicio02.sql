/*Crea una base de datos llamada "MiBaseDeDatos".*/
/*Para crear la base de datos: Databases > Create > Database...> Introducimos el nombre > Save.*/
/*Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS public.usuarios(
id SERIAL PRIMARY KEY NOT NULL,
nombre VARCHAR(255) NOT NULL,
edad INT NOT NULL)
/*Inserta dos registros en la tabla "Usuarios".*/
INSERT INTO public.usuarios(nombre,edad)
VALUES('Marta', 22),('Domingo', 43);
/*Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad=25
WHERE nombre='Marta'
/*Elimina un usuario de la tabla "Usuarios".*/
DELETE FROM public.usuarios
WHERE id=2
/*Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/
CREATE TABLE IF NOT EXISTS public.ciudades(
id SERIAL PRIMARY KEY NOT NULL,
nombre VARCHAR(255) NOT NULL,
país VARCHAR(255) NOT NULL)
/*Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO public.ciudades(nombre,país)
VALUES('Andorra La Vella', 'Andorra'), ('Madrid', 'España'),('Bruselas','Bélgica');
/*Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/
ALTER TABLE public.usuarios
ADD ciudad_id INT
ALTER TABLE public.usuarios
ADD CONSTRAINT fk_ciudad_id FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
/*Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT
u.nombre as nombre,
c.nombre as ciudad,
c.país as país
FROM public.usuarios u
LEFT JOIN public.ciudades c
ON c.id=u.ciudad_id
/*Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/
SELECT
u.nombre as nombre,
c.nombre as ciudad,
c.país as país
FROM public.usuarios u
INNER JOIN public.ciudades c
ON c.id=u.ciudad_id
