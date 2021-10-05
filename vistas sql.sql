USE Northwind;

SELECT
	p.ProductName producto,
	c.CategoryName categoria
FROM
	Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

---Creando vista asignada en clase 
CREATE VIEW listadoProducto
AS
SELECT
	p.ProductName Productos,
	c.CategoryName Categorias,
	s.ContactName Provedor
FROM
	Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers s
ON p.SupplierID = s.SupplierID
GROUP BY c.CategoryName, p.ProductName, s.ContactName;

SELECT * FROM listadoProducto

---Modificar la vista anterior para mostrar nombre,cateoria y oried
ALTER VIEW listadoProducto
AS
SELECT
	p.ProductName productos,
	c.CategoryName categorias,
	o.OrderID orderid
FROM [Order Details] o
LEFT JOIN Products p
ON o.ProductID =  p.ProductID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

SELECT * FROM listadoProducto;

---Modificar la  vista de nuevo con full join
ALTER VIEW listadoProducto
AS
SELECT
	p.ProductName productos,
	c.CategoryName categorias,
	o.OrderID orderid
FROM [Order Details] o
FULL JOIN Products p
ON o.ProductID =  p.ProductID
FULL JOIN Categories c
ON p.CategoryID = c.CategoryID;
SELECT * FROM listadoProducto

drop view listadoProducto

--Usando mi base de datos
use Biblioteca3

--Mostrar nombre y appellido de la tabla encargado y municipio y departamento de la tabla direccion_encargado
SELECT
	  registroBiblioteca.encargado.nombres Nombres,
	   registroBiblioteca.encargado.apellidos,
      registroBiblioteca.direccion_encargado.municipio Municipio,
	  registroBiblioteca.direccion_encargado.departamento Departamento

FROM
	registroBiblioteca.encargado
INNER JOIN registroBiblioteca.direccion_encargado
ON registroBiblioteca.direccion_encargado.cod_direccion_encargado=registroBiblioteca.encargado.idencargado;

---Creando vista usando las tablas encargado,direccion_encardo y encargado1,para mostrar nombre y appellido de la tabala encargado,y mostrar de la tabala direccion_encardo el departamento y mostrar la fecha_nacimiento de la tabala encargado1
CREATE VIEW datosencargado
AS
SELECT
       registroBiblioteca.encargado.nombres Nombres,
	   registroBiblioteca.encargado.apellidos,
	  registroBiblioteca.direccion_encargado.departamento Departamento,
	  registroBiblioteca.encargado1.fecha_nacimiento

  
FROM
    registroBiblioteca.encargado
	
INNER JOIN registroBiblioteca.direccion_encargado
ON  cod_direccion_encargado= cod_direccion_encargado
INNER JOIN registroBiblioteca.encargado1
ON  registroBiblioteca.encargado1.idencargado= registroBiblioteca.encargado1.idencargado
GROUP BY  registroBiblioteca.encargado.nombres, registroBiblioteca.encargado.apellidos,  registroBiblioteca.direccion_encargado.departamento,  registroBiblioteca.encargado1.fecha_nacimiento

SELECT * FROM datosencargado