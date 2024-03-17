-- `Task 2.5: Check which products high inventory in given warehouse -check for south warehouse.`
SELECT 
    *
FROM
    (SELECT 
        pro.productCode AS Product_Code,
		pro.productName AS Product_Name,
		wh.warehouseName AS Warehouse_Name,
		SUM(pro.quantityInStock) AS Inventory_Level
    FROM
        products AS pro
    JOIN warehouses AS wh ON pro.warehouseCode = wh.warehouseCode
    GROUP BY Product_Code , Product_name , Warehouse_Name
    ORDER BY Inventory_Level DESC) AS InventoryLevel
WHERE
    Warehouse_Name = 'South';
    