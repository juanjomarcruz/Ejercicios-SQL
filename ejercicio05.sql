/*Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto).*/
CREATE TABLE IF NOT EXISTS clientes(
id SERIAL PRIMARY KEY NOT NULL,
nombre VARCHAR(255) NOT NULL)
/*Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/
INSERT INTO public.clientes(nombre)
VALUES('John')
/*Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".*/
UPDATE public.clientes
SET nombre='John Doe'
WHERE id=1
/*Elimina el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE id=1
/*Lee todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero).*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY NOT NULL,
cliente_id INT NOT NULL)
/*Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/
INSERT INTO public.pedidos(cliente_id)
VALUES(1)
/*Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".*/
UPDATE public.pedidos
SET cliente_id=2
WHERE id=1
/*Elimina el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE id=1
/*Lee todos los pedidos de la tabla "Pedidos".*/
SELECT * FROM public.pedidos
/*Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto).*/
CREATE TABLE IF NOT EXISTS productos(
id SERIAL PRIMARY KEY NOT NULL,
nombre VARCHAR(255) NOT NULL)
/*Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/
INSERT INTO public.productos(nombre)
VALUES('Camisa')
/*Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/
UPDATE public.productos
SET nombre='Pantalón'
WHERE id=1
/*Elimina el producto con id=1 de la tabla "Productos".*/
DELETE FROM public.productos
WHERE id=1
/*Lee todos los productos de la tabla "Productos".*/
SELECT * FROM public.productos
/*Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero).*/
/*Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero).*/
CREATE TABLE IF NOT EXISTS DetallesPedido(
pedido_id INT NOT NULL,
CONSTRAINT FK_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
producto_id INT NOT NULL,
CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos(id))
/*Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido".*/
INSERT INTO public.DetallesPedido(pedido_id,producto_id)
VALUES(1,1)
/*Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido".*/
UPDATE public.DetallesPedido
SET producto_id=2
WHERE pedido_id=1
/*Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/
DELETE FROM public.DetallesPedido
WHERE pedido_id=1
/*Lee todos los detalles de pedido de la tabla "DetallesPedido".*/
SELECT * FROM public.DetallesPedido
/*Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join.*/
SELECT
c.nombre as Nombre_cliente,
p.id as ID_pedido
FROM public.clientes c
INNER JOIN public.pedidos p
ON c.id=p.cliente_id
/*Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join.*/
SELECT
c.nombre as Nombre_cliente,
p.id as ID_pedido
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id=p.cliente_id
/*Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join.*/
SELECT
pr.nombre as Nombre_producto,
dp.producto_id as ID_producto,
dp.pedido_id as ID_pedido
FROM public.productos pr
INNER JOIN public.DetallesPedido dp
ON pr.id=dp.producto_id
/*Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join.*/
SELECT
pr.nombre as Nombre_producto,
dp.producto_id as ID_producto,
dp.pedido_id as ID_pedido
FROM public.productos pr
LEFT JOIN public.DetallesPedido dp
ON pr.id=dp.producto_id
/*Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes".*/
ALTER TABLE public.clientes
ADD Teléfono VARCHAR(255)
/*Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero.*/
ALTER TABLE public.clientes
ALTER COLUMN Teléfono TYPE INT USING "teléfono"::integer
/*Elimina la columna "telefono" de la tabla "Clientes".*/
ALTER TABLE public.clientes
DROP COLUMN Teléfono
/*Cambia el nombre de la tabla "Clientes" a "Usuarios".*/
ALTER TABLE public.clientes
RENAME TO usuarios
/*Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a
"nombre_completo".*/
ALTER TABLE public.usuarios
RENAME COLUMN nombre TO nombre_completo
/*Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/
ALTER TABLE public.usuarios
ADD CONSTRAINT PK_id PRIMARY KEY (id)
