-- `Task 2.3: Check which products has high iventory compared to salesamount, query the most 10 products.`
SELECT 
    productCode,
    productName,
    quantityInStock,
    totalOrdered,
    (quantityInStock - totalOrdered) AS SurplusInventory,
    round((quantityInStock/totalOrdered), 2) AS InventoryToTotalOrdereRatio
FROM
    (SELECT 
        pro.productCode,
		pro.productName,
		pro.quantityInStock,
		SUM(ord.quantityOrdered) AS totalOrdered
    FROM
        mintclassics.products AS pro
    LEFT JOIN mintclassics.orderdetails AS ord ON pro.productCode = ord.productCode
    GROUP BY 
        pro.productCode, 
        pro.productName, 
        pro.quantityInStock) AS InventoryLevel
WHERE
    (quantityInStock - totalOrdered) > 0
ORDER BY InventoryToTotalOrdereRatio DESC LIMIT 15;
