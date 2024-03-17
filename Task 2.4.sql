-- `Task 2.4: Check which products has  shortage in iventory level compared to order or salesamount.`
SELECT 
    productCode,
    productName,
    quantityInStock,
    totalOrdered,
    (quantityInStock - totalOrdered) AS InventoryShortage,
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
    (quantityInStock - totalOrdered) < 0
ORDER BY InventoryToTotalOrdereRatio ASC LIMIT 25;