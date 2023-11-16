/*Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS public.productos(
id SERIAL PRIMARY KEY NOT NULL,
nombre VARCHAR(255) NOT NULL,
precio DECIMAL NOT NULL)
/*Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO public.productos(nombre,precio)
VALUES('Iphone',599.99),
('Ipad',755.95),
('Iwatch',299.99),
('AppleTV',1199.99),
('AirPods', 79.99);
/*Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE public.productos
SET precio=70.00
WHERE nombre='AirPods'
/*Elimina un producto de la tabla "Productos".*/
DELETE FROM public.productos
WHERE nombre='AppleTV'
/*Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY NOT NULL,
id_usuario INT NOT NULL,
CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
id_producto INT NOT NULL,
CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id))

SELECT
u.nombre as Nombre_usuario,
pr.nombre as Producto
FROM public.usuarios u
INNER JOIN public.pedidos p
ON u.id=p.id_usuario
INNER JOIN public.productos pr
ON pr.id=p.id_producto


