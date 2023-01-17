/*1. Retorna un recompte de quants distribuidors (shippers) hi ha.*/

SELECT COUNT(S.SupplierID) AS totalSuppliers FROM Suppliers AS S;

/*2. Calcula quants proveïdors (suppliers) hi ha per ciutat.*/

SELECT COUNT(S.SupplierID) AS totalSuppliers, S.City FROM Suppliers AS S GROUP BY (S.City);

/*3. Calcula quants productes són distribuits pel shipper número 3.*/

SELECT COUNT(P.ProductID) AS totalProducts, S.CompanyName FROM Products AS P, OrderDetails AS OD, Orders AS O, Shippers AS S WHERE P.ProductID = OD.ProductID AND OD.OrderID = O.OrderID AND O.ShipVia = S.ShipperID AND S.ShipperID = 3;

/*4. Crea un informe amb el nom del distribuidor, nom del proveidor,
nom de la categoria i el recompte de productes que coincideixen.*/

SELECT Sh.CompanyName, Su.SupplierID, Sh.CompanyName, COUNT(P.ProductID) AS TotalProdcuts FROM Suppliers AS Su, Products AS P, OrderDetails AS OD, Orders AS O, Shippers AS Sh GROUP BY (Sh.CompanyName);

/*5. Mostra un informe amb el nom dels clients (customers.companyname)
que han rebut més de tres paquets provinents del shipper número 3.*/

SELECT C.CompanyName, COUNT(O.OrderID) AS totalOrders FROM Orders AS O, Customers AS C, Shippers AS S WHERE ShipperID = 3;


/*6. Mostra un recompte de les ordres que ha rebut cada customer
ordenant pel recompte de forma descendent.
*/

SELECT COUNT(O.OrderID) AS totalOrders, C.CompanyName FROM Orders AS O, Customers AS C WHERE O.CustomerID = C.CustomerID GROUP BY C.CompanyName ORDER BY COUNT(O.OrderID) DESC;

/*7. Mostra un recompte de clients (customers) per codi postal sempre i quant
n'hi hagi més d'un al mateix codi postal.*/

SELECT COUNT(C.City), City FROM Customers AS C, Orders AS O WHERE O.CustomerID = C.CustomerID GROUP BY C.City HAVING COUNT(C.City) >= 1;

/*8. Compta quants territoris diferents hi ha per cada regió. Mostra RegionDescription i el recompte.*/

SELECT COUNT(T.TerritoryID), R.RegionDescription FROM territories AS T, Region AS R WHERE R.RegionID = T.RegionID GROUP BY (R.RegionDescription);

/*9. Calcula la mitjana de comandes (orders) servides per cada shipper.*/

SELECT AVG(O.ShipVia), S.CompanyName FROM Orders AS O, Shippers AS S WHERE O.ShipVia = S.ShipperID GROUP BY (S.CompanyName);

/*10. Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte.*/

SELECT COUNT(E.EmployeeID) AS Employee, T.TerritoryDescription FROM Employees AS E, EmployeeTerritories AS ET, Territories AS T WHERE E.EmployeeID = ET.EmployeeID AND ET.TerritoryID = T.TerritoryID GROUP BY (T.TerritoryDescription);

/*11. Compta quants empleats hi ha per cada regió. Mostra RegionDescription i el recompte.*/

SELECT COUNT(E.EmployeeID), R.RegionDescription FROM Employees AS E, EmployeeTerritories AS ET, Territories AS T, Region AS R WHERE E.EmployeeID = ET.EmployeeID AND ET.TerritoryID = T.TerritoryID AND T.RegionID = R.RegionID GROUP BY (R.RegionDescription);

/*12. Retorna només el nom de la regió (region.description) que té més empleats.*/

SELECT R.RegionDescription FROM Employees AS E, EmployeeTerritories AS ET, Territories AS T, Region AS R WHERE E.EmployeeID = ET.EmployeeID AND ET.TerritoryID = T.TerritoryID AND R.RegionID = T.RegionID GROUP BY (R.RegionDescription) ORDER BY COUNT(E.EmployeeID) DESC LIMIT 1;

/13. Retorna el recompte de productes per categoria/

SELECT COUNT(P.ProductID) AS ProductCount, C.CategoryName FROM Products AS P, Categories AS C WHERE P.CategoryID = C.CategoryID GROUP BY (C.CategoryName) ORDER BY COUNT(P.ProductID);

/*14. Calcula quants productes pot servir cada distribuïdor. Mostra el CompanyName i el recompte de productes.*/

SELECT S.CompanyName, COUNT(P.ProductID) AS ProdudctsCount FROM Products AS P, OrderDetails AS OD, Orders AS O, Shippers AS S WHERE P.ProductID = OD.ProductID AND OD.OrderID = O.OrderID AND O.ShipVia = S.ShipperID GROUP BY (S.CompanyName);

/*15. Calcula quants empleats hi ha per Ciutat contractats a partir de l'any 1993.*/

SELECT COUNT(E.EmployeeID) AS Employeers, E.City, YEAR(E.HireDate) AS HireDate FROM Employees AS E WHERE YEAR(E.HireDate) >= 1993 GROUP BY E.City;