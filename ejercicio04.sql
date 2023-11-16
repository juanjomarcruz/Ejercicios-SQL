/*Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY NOT NULL,
id_usuario INT NOT NULL,
CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
id_producto INT NOT NULL,
CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id))
/*Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos.*/
INSERT INTO public.pedidos(id_usuario,id_producto)
VALUES(1,5),(2,2),(4,1);
/*Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/
SELECT
u.nombre as Nombre_usuario,
pr.nombre as Producto
FROM public.usuarios u
INNER JOIN public.pedidos p
ON u.id=p.id_usuario
INNER JOIN public.productos pr
ON pr.id=p.id_producto
/*Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/
SELECT
u.nombre as Nombre_usuario
FROM public.usuarios u
LEFT JOIN public.pedidos p
ON u.id=p.id_usuario
/*Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/
ALTER TABLE public.pedidos
ADD cantidad INT;

UPDATE public.pedidos
SET cantidad=1
WHERE cantidad IS NULL
