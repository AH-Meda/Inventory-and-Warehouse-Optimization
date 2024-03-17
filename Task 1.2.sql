-- `Task 2.1: Extract key information accross the tables and present it in table.`
SELECT 
    products.productCode,
    products.productName,
    products.productLine,
    warehouses.warehouseName,
    products.buyPrice AS 'ProductCost',
    products.quantityInStock,
    orderdetails.quantityOrdered,
    orderdetails.priceEach AS 'Product_Price',
    orders.orderNumber,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS 'TotalOrderIn$',
    payments.paymentDate,
    orders.shippedDate,
    TIMESTAMPDIFF(DAY,
        orders.orderDate,
        orders.shippedDate) AS 'Lead_Time',
    CONCAT(employees.firstName,
            ' ',
            employees.lastName) AS 'Sales_Rep_Name',
    employees.jobTitle AS 'SalesRepTitle',
    offices.city AS 'RetaiL_Location'
FROM
    products
        JOIN warehouses ON products.warehouseCode = warehouses.warehouseCode
        JOIN orderdetails ON products.productCode = orderdetails.productCode
        JOIN orders ON orders.orderNumber = orderdetails.orderNumber
        JOIN customers ON customers.customerNumber = orders.customerNumber
        JOIN payments ON customers.customerNumber = payments.customerNumber
        JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
        JOIN offices ON offices.officeCode = employee.officeCode
ORDER BY orders.orderNumber ASC;
   
 
 

		

   
    
    
	
    
    
    
    
	


