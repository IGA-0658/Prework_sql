/*
>>>>>> Ejercicio 1 
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto).

CREATE TABLE IF NOT EXISTS Clientes(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255)
)

2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".

INSERT INTO public.Clientes(nombre, email)
VALUES ('Juan', 'juan@example.com')

3. Actualizar el email del cliente con id=1 a "juan@gmail.com".

UPDATE public.Clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

4. Eliminar el cliente con id=1 de la tabla "Clientes".

DELETE FROM public.Clientes
WHERE id = 1;

5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).

CREATE TABLE IF NOT EXISTS Pedidos(
	id SERIAL PRIMARY KEY, 
	cliente_id INT NOT NULL,
	producto VARCHAR(255),
	cantidad INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)

6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.

--- creo nuevamente cliente en tabla clientes

INSERT INTO public.Clientes(nombre, email)
VALUES ('Juan', 'juan@gmail.com')

----- luego creo pedidos

INSERT INTO public.Pedidos(cliente_id, producto, cantidad)
VALUES (1, 'Camiseta', 2)
	
7. Actualizar la cantidad del pedido con id=1 a 3.

UPDATE public.Pedidos
SET cantidad = 3
WHERE id = 1;

8. Eliminar el pedido con id=1 de la tabla "Pedidos".

DELETE FROM public.Pedidos
WHERE id = 1;

9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).

CREATE TABLE IF NOT EXISTS Productos(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(255) NOT NULL,
	precio DECIMAL NOT NULL
)

10. Insertar varios productos en la tabla "Productos" con diferentes valores.

INSERT INTO public.Productos(nombre, precio)
VALUES ('Camiseta', 15)
INSERT INTO public.Productos(nombre, precio)
VALUES ('Pantalon', 45.50)
INSERT INTO public.Productos(nombre, precio)
VALUES ('Jersey', 25.80)
INSERT INTO public.Productos(nombre, precio)
VALUES ('Camisa', 39.99)
INSERT INTO public.Productos(nombre, precio)
VALUES ('Zapatilla', 45)
INSERT INTO public.Productos(nombre, precio)
VALUES ('Abrigo', 75)

11. Consultar todos los clientes de la tabla "Clientes".

SELECT * FROM public.clientes

12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.

SELECT * FROM public.pedidos
LEFT JOIN public.clientes
ON public.pedidos.cliente_id = public.clientes.id

13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.

SELECT * FROM public.productos
WHERE precio > 50

14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.

SELECT * FROM public.pedidos
WHERE cantidad > 5

15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".

SELECT * FROM public.clientes
WHERE nombre LIKE 'A%'

16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.

SELECT * FROM public.clientes
LEFT JOIN public.pedidos
ON public.clientes.id = public.pedidos.cliente_id

17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.

SELECT * FROM public.productos
LEFT JOIN public.pedidos
ON public.productos.id = public.pedidos.id
WHERE nombre = 'Camiseta'

18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.

ALTER TABLE public.pedidos
ADD COLUMN fecha timestamp

19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".
20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
*/