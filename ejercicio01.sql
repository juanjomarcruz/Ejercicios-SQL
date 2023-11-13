/* una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS clientes(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
)
/* Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/
INSERT INTO public.clientes(id,name,email)
VALUES(1,'Juan','juan@example.com')
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
	cantidad INT NOT NULL
)
