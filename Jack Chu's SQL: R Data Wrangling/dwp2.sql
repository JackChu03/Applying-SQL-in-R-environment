SELECT 100 * sum(soh.SubTotal)/
(SELECT SUM(SubTotal)
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product pp
ON sod.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubCategoryID = ps.ProductSubCategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
) 
Revenue
    , COALESCE(pc.Name, 'TOTAL') Category
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product pp
ON sod.ProductID = pp.ProductID
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubCategoryID = ps.ProductSubCategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY Category