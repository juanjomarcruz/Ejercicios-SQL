/* una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS clientes(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(25) NOT NULL,
	email VARCHAR(25)
)
/* Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/
INSERT INTO public.clientes(name,email)
VALUES('Juan','juan@example.com')
/*Actualizar el email del cliente con id=1 a "juan@gmail.com".*/
UPDATE public.clientes
SET email='juan@gmail.com'
WHERE id=1
/*Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM public.clientes
WHERE id=1
/*Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/
CREATE TABLE IF NOT EXISTS pedidos(
id SERIAL PRIMARY KEY NOT NULL,
cliente_id INT NOT NULL,
CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id),
producto VARCHAR(255) NOT NULL,
cantidad INT NOT NULL)
/*Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos(cliente_id,producto,cantidad)
VALUES(1,'Camiseta',2)
/*Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos
SET cantidad=3
WHERE id=1
/*Eliminar el pedido con id=1 de la tabla "Pedidos".*/
DELETE FROM public.pedidos
WHERE id=1
/*Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE productos(
id SERIAL PRIMARY KEY NOT NULL,
name VARCHAR(255) NOT NULL,
price DECIMAL NOT NULL)
/*Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/
SELECT * FROM public.pedidos p
LEFT JOIN public.clientes c
ON p.cliente_id=c.id
/*Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/
SELECT * FROM public.productos
WHERE price>50
/*Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/
SELECT * FROM public.pedidos
WHERE cantidad>=5
/*Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/
SELECT * FROM public.clientes
WHERE name ILIKE 'A%'
/*Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/
SELECT c.name AS Nombre_cliente, SUM(p.cantidad) AS Total_pedidos
FROM public.clientes c
INNER JOIN public.pedidos p
ON c.id=p.cliente_id
GROUP BY c.name
/*Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.*/
ALTER TABLE public.pedidos
DROP producto,
ADD producto_id INT,
ADD CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos(id);

SELECT pr.name AS Nombre_producto, SUM(p.cantidad) AS Total_pedidos
FROM public.productos pr
INNER JOIN public.pedidos p
ON pr.id=p.producto_id
GROUP BY pr.name
/*Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE public.pedidos
ADD fecha DATE
/*Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/
ALTER TABLE public.pedidos
ADD producto_id INT

ALTER TABLE public.pedidos
ADD CONSTRAINT FK_producto FOREIGN KEY (producto_id) REFERENCES productos(id)
/*Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.*/
SELECT
c.name as name,
p.producto as producto,
p.cantidad as cantidad
FROM public.clientes c
INNER JOIN public.pedidos p
ON c.id=p.cliente_id