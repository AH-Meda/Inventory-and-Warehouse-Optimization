-- `Task 2.2: *Check the total inventory across whole warehouse.`
-- Total inventory
SELECT SUM(products.quantityInStock) AS 'Total Inventory';
-- Total inventory at each warehouse.
SELECT 
    wh.warehouseName,
    wh.warehouseCode,
    SUM(pro.quantityInStock) AS 'WH total inventory'
FROM
    mintclassics.warehouses AS wh
	LEFT JOIN mintclassics.products AS pro ON wh.warehouseCode = pro.warehouseCode
GROUP BY wh.warehouseName, wh.warehouseCode
ORDER BY 'Total Inventory' DESC;
	