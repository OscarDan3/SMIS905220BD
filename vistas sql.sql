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
