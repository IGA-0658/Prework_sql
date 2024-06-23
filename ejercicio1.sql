/*
>> Ejercicio 1
 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), 
nombre (texto) y email (texto).

CREATE TABLE IF NOT EXISTS clientes(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	email VARCHAR(255)
)

 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y 
email="
 juan@example.com".

INSERT INTO public.Clientes(id, nombre, email)
VALUES (1,'Juan', 'juan@example.com')

 3. Actualizar el email del cliente con id=1 a "
 juan@gmail.com".

update public.Clientes
set email = ' juan@gmail.com'
WHERE id = 1;

 4. Eliminar el cliente con id=1 de la tabla "Clientes".

 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), 
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto 
(texto) y cantidad (entero).

CREATE TABLE IF NOT EXISTS pedidos(
	id INT PRIMARY KEY, 
	producto VARCHAR(255),
	cantidad INT,
	cliente_id INT NOT NULL,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)

 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, 
producto="Camiseta" y cantidad=2.

--- creo nuevamente cliente en tabla clientes

INSERT INTO public.Clientes(1, nombre, email)
VALUES (1, 'Juan', 'juan@gmail.com')

----- luego creo pedidos

INSERT INTO public.Pedidos(cliente_id, producto, cantidad)
VALUES (1, 'Camiseta', 2)

7. Actualizar la cantidad del pedido con id=1 a 3.

UPDATE public.Pedidos
SET cantidad = 3
WHERE id = 1;

8. Eliminar el pedido con id=1 de la tabla "Pedidos".

DELETE FROM public.pedidos
WHERE id = 1;

9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).

CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY, 
	nombre VARCHAR(255),
	precio DECIMAL
)

10. Insertar varios productos en la tabla "Productos" con diferentes valores.

INSERT INTO public.productos(id, nombre, precio)
VALUES 
(1, 'Camiseta', 5.00),
(2, 'Calcetines', 2.50),
(3, 'Pantalon,`22.00),
(4, 'Abrigo',  12.00),
(5, 'Cazadora', 43.00),
(6, 'Zapatos', 52.00)

11. Consultar todos los clientes de la tabla "Clientes".

SELECT * FROM public.clientes

12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los 
clientes correspondientes.

SELECT * FROM public.pedidos
LEFT JOIN public.clientes
ON public.pedidos.cliente_id = public.clientes.id

13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.

SELECT * FROM public.productos
where precio > 50
 
14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5.
 
SELECT * FROM public.pedidos
WHERE cantidad >= 5

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
 
CREATE TABLE pedidos (
id INT PRIMARY KEY,
FOREIGN KEY (pedidos_id) REFERENCES productos (id)
)

20. Realizar una consulta que muestre los nombres de los clientes, los nombres de 
los productos y las cantidades de los pedidos donde coincida la clave externa.

UPDATE public.pedidos
SET fecha = '20-06-24'
WHERE id = 1;

 >>Ejercicio 2
 > Nivel de dificultad: Fácil

1. Crea una base de datos llamada "MiBaseDeDatos".

2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "edad" (entero).

CREATE TABLE IF NOT EXISTS usuarios(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)


3. Inserta dos registros en la tabla "Usuarios".

INSERT INTO public.usuarios (id, nombre, edad)
VALUES
(1, 'Ignacio', 42),
(2, 'Cecilia', 40)

4. Actualiza la edad de un usuario en la tabla "Usuarios".

update public.usuarios
SET  edad = 41
where id = 2;

5. Elimina un usuario de la tabla "Usuarios".

delete from public.usuarios
where id = 2;

>> Nivel de dificultad: Moderado
1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave 
primaria), "nombre" (texto) y "pais" (texto).
 
CREATE TABLE IF NOT EXISTS ciudades(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

2. Inserta al menos tres registros en la tabla "Ciudades".


INSERT INTO public.ciudades (id, nombre, pais)
VALUES
(1, 'Rosario', 'Argentina'),
(2, 'Milan', 'Italia'),
(3, 'Barcelona', 'España')

3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".

4. Realiza una consulta que muestre los nombres de los usuarios junto con el 
nombre de su ciudad y país (utiliza un LEFT JOIN).

SELECT * FROM public.usuarios
LEFT JOIN public.ciudades
ON public.usuarios.id = public.ciudades.id

5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).

SELECT * FROM public.usuarios
INNER JOIN public.ciudades
ON usuarios.id = ciudades.id
WHERE ciudades.nombre IS NOT NULL

SELECT * FROM public.usuarios
INNER JOIN public.ciudades
ON usuarios.id = ciudades.id
WHERE ciudades.nombre ILIKE '%r%'
 
>>> Ejercicio 3
 Nivel de dificultad: Difícil
 
1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).

CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL
)

 2. Inserta al menos cinco registros en la tabla "Productos".

insert into public.productos(nombre,precio)
values
(1,'Naranjas',2.49),
(2,'Mandarina',1.90),
(3,'Tomates',1.99),
(4,'Patatas',1.49),
(5,'Lechuga',1.10)

 3. Actualiza el precio de un producto en la tabla "Productos".

UPDATE public.productos
SET precio = 2.99
WHERE ID = 3;

 4. Elimina un producto de la tabla "Productos".

DELETE FROM public.productos
WHERE ID = 4;

 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla Productos").

CREATE TABLE IF NOT EXISTS usuarios(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(255),
	producto_id INT,
	CONSTRAINT FK_producto_id FOREIGN KEY (producto_id) REFERENCES productos (id) 
)

INSERT INTO public.usuarios (id, nombre, producto_id)
VALUES
(1, 'Ignacio', 1),
(2, 'Cecilia', 2),
(3, 'Bety', 3),
(4, 'Irma', 5),
(5, 'Ricardo', null)

SELECT * FROM public.productos
INNER JOIN public.usuarios
ON productos.id = usuarios.producto_id

 >>>Ejercicio 4

 Nivel de dificultad: Experto
 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos").

CREATE TABLE IF NOT EXISTS pedidos(
	id SERIAL PRIMARY KEY, 
	id_usuario INT NOT NULL,
	id_producto INT NOT NULL,
	CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id),
	CONSTRAINT FK_id_producto FOREIGN KEY (id_producto) REFERENCES productos (id)
)

 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos.

INSERT INTO public.pedidos (id, id_usuario, id_producto)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3)

 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE).

SELECT * FROM public.usuarios
LEFT JOIN public.productos
ON producto_id = productos.id

 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN).

SELECT * FROM public.usuarios
LEFT JOIN public.pedidos
ON producto_id = pedidos.id_producto

 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)
 
ALTER TABLE public.pedidos
ADD COLUMN cantidad DECIMAL

ALTER TABLE public.pedidos 
RENAME COLUMN cantidad TO cantidad_kg;

UPDATE public.pedidos
SET cantidad = 1.10
WHERE id = 1

UPDATE public.pedidos
SET cantidad = 2.50
WHERE id = 2

UPDATE public.pedidos
SET cantidad = 1.50
WHERE id = 3

>>>> Ejercicio 5
 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre (cadena de texto).

CREATE TABLE IF NOT EXISTS clientes(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(255)
)

 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".

INSERT INTO PUBLIC.clientes (ID, NOMBRE)
VALUES (1, 'Jhon')

 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes".

UPDATE PUBLIC.clientes
SET nombre = 'Jhon Doe'
WHERE ID = 1;

4. Elimina el cliente con id=1 de la tabla "Clientes".

DELETE FROM PUBLIC.clientes
WHERE ID = 1; 

5. Lee todos los clientes de la tabla "Clientes".

SELECT * FROM PUBLIC.clientes
 
6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id (entero).

CREATE TABLE IF NOT EXISTS pedidos(
	id SERIAL PRIMARY KEY, 
	cliente_id INT
)
 
7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".

INSERT INTO public.pedidos (id, cliente_id)
VALUES (1,1)

8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos".

UPDATE PUBLIC.pedidos
SET ID = 2
WHERE ID = 1;
 
9. Elimina el pedido con id=1 de la tabla "Pedidos".

DELETE FROM PUBLIC.pedidos
WHERE ID = 1; 
 
10. Lee todos los pedidos de la tabla "Pedidos".
 
SELECT * FROM PUBLIC.pedidos
 
11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre (cadena de texto).

CREATE TABLE IF NOT EXISTS productos(
	id SERIAL PRIMARY KEY, 
	nombre VARCHAR(255)
)

 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".

INSERT INTO public.productos (id, nombre)
VALUES (1,'Camisa')
 
13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".

UPDATE public.productos
SET nombre = 'Pantalón' 
WHERE ID = 1;
 
14. Elimina el producto con id=1 de la tabla "Productos".

DELETE FROM public.productos
WHERE ID = 1;
 
15. Lee todos los productos de la tabla "Productos".

SELECT * FROM public.productos 

16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y producto_id (entero).

CREATE TABLE IF NOT EXISTS DetallesPedido(
	pedido_id SERIAL PRIMARY KEY, 
	producto_id INT
) 

17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla "DetallesPedido".
 
INSERT INTO public.DetallesPedido (pedido_id, producto_id)
VALUES (1,1)

18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla "DetallesPedido".
 
UPDATE PUBLIC.DetallesPedido
SET pedido_id = 2
WHERE pedido_id = 1;

19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".

DELETE FROM PUBLIC.DetallesPedido
WHERE pedido_id = 1;

 20. Lee todos los detalles de pedido de la tabla "DetallesPedido".

SELECT * FROM PUBLIC.DetallesPedido

 21. Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un inner join.

SELECT * FROM public.clientes
INNER JOIN public.pedidos
ON clientes.id = pedidos.cliente_id

22. Realiza una consulta para obtener todos los clientes y sus pedidos 
correspondientes utilizando un left join.

SELECT * FROM public.clientes
LEFT JOIN public.pedidos
ON clientes.id = pedidos.cliente_id
 
23. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un inner join.

SELECT * FROM public.productos
INNER JOIN public.detallespedido
ON productos.id = detallespedido.producto_id
 
24. Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un left join.

SELECT * FROM public.productos
LEFT JOIN public.detallespedido
ON productos.id = detallespedido.producto_id
 
25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla "Clientes".

ALTER TABLE public.clientes
ADD COLUMN telefono INT

 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero.

ALTER TABLE public.clientes
ALTER COLUMN telefono TYPE INT

27. Elimina la columna "telefono" de la tabla "Clientes".

ALTER TABLE public.clientes
DROP COLUMN telefono

28. Cambia el nombre de la tabla "Clientes" a "Usuarios".

ALTER TABLE public.clientes
RENAME TO usuarios;

29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo".

ALTER TABLE public.usuarios 
RENAME COLUMN nombre TO nombre_completo
 
30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".

ALTER TABLE nombre_tabla ADD CONSTRAINT nombre_restriccion PRIMARY KEY (nombre_columna);

*/