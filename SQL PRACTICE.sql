CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);


INSERT INTO Customers VALUES
(1,'Rahul','Male',25,'Kochi','Kerala','2024-01-01'),
(2,'Anjali','Female',23,'Trivandrum','Kerala','2024-01-10'),
(3,'Arjun','Male',30,'Bangalore','Karnataka','2024-02-05'),
(4,'Meera','Female',28,'Chennai','Tamil Nadu','2024-02-15'),
(5,'Vikram','Male',35,'Hyderabad','Telangana','2024-03-01'),
(6,'Neha','Female',27,'Mumbai','Maharashtra','2024-03-05'),
(7,'Kiran','Male',31,'Pune','Maharashtra','2024-03-10'),
(8,'Aisha','Female',26,'Delhi','Delhi','2024-03-15'),
(9,'Rohan','Male',29,'Kolkata','West Bengal','2024-03-20'),
(10,'Priya','Female',24,'Ahmedabad','Gujarat','2024-03-25'),
(11,'Sanjay','Male',33,'Jaipur','Rajasthan','2024-04-01'),
(12,'Lakshmi','Female',22,'Kochi','Kerala','2024-04-03'),
(13,'Manoj','Male',37,'Coimbatore','Tamil Nadu','2024-04-06'),
(14,'Pooja','Female',28,'Mysore','Karnataka','2024-04-08'),
(15,'Ajith','Male',32,'Kozhikode','Kerala','2024-04-12');


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);


INSERT INTO Products VALUES
(101,'Laptop','Electronics','Dell',65000,50),
(102,'Smartphone','Electronics','Samsung',30000,100),
(103,'Headphones','Accessories','Boat',2000,150),
(104,'Smart Watch','Wearables','Noise',5000,80),
(105,'Tablet','Electronics','Apple',45000,40),
(106,'Bluetooth Speaker','Accessories','JBL',3500,70),
(107,'Gaming Mouse','Accessories','Logitech',2500,90),
(108,'Keyboard','Accessories','HP',1800,120),
(109,'Monitor','Electronics','LG',12000,40),
(110,'Printer','Electronics','Canon',9000,35),
(111,'Camera','Electronics','Sony',55000,20),
(112,'Power Bank','Accessories','Mi',1500,200),
(113,'Router','Networking','TP-Link',3000,65),
(114,'External Hard Disk','Storage','Seagate',6000,55),
(115,'USB Drive','Storage','Sandisk',800,300);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    delivery_date DATE,
    order_status VARCHAR(30),
    payment_method VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1001,1,'2024-04-01','2024-04-04','Delivered','UPI'),
(1002,2,'2024-04-03','2024-04-06','Delivered','Card'),
(1003,3,'2024-04-05','2024-04-09','Delivered','Cash on Delivery'),
(1004,1,'2024-04-07','2024-04-10','Delivered','UPI'),
(1005,4,'2024-04-10','2024-04-13','Cancelled','Card'),
(1006,5,'2024-04-12','2024-04-16','Delivered','UPI'),
(1007,6,'2024-04-13','2024-04-17','Delivered','Card'),
(1008,7,'2024-04-14','2024-04-18','Delivered','UPI'),
(1009,8,'2024-04-15','2024-04-20','Delivered','Net Banking'),
(1010,9,'2024-04-16','2024-04-21','Processing','UPI'),
(1011,10,'2024-04-17','2024-04-22','Delivered','Card'),
(1012,11,'2024-04-18','2024-04-23','Cancelled','Cash on Delivery'),
(1013,12,'2024-04-19','2024-04-24','Delivered','UPI'),
(1014,13,'2024-04-20','2024-04-25','Delivered','Card'),
(1015,14,'2024-04-21','2024-04-26','Shipped','UPI');


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);


INSERT INTO Order_Items VALUES
(1,1001,101,1,65000),
(2,1001,103,2,4000),
(3,1002,102,1,30000),
(4,1003,104,1,5000),
(5,1004,105,1,45000),
(6,1004,103,1,2000),
(7,1006,106,1,3500),
(8,1006,112,2,3000),
(9,1007,107,1,2500),
(10,1008,109,1,12000),
(11,1008,115,3,2400),
(12,1009,111,1,55000),
(13,1010,110,1,9000),
(14,1011,108,2,3600),
(15,1012,114,1,6000),
(16,1013,102,1,30000),
(17,1013,112,1,1500),
(18,1014,113,2,6000),
(19,1015,105,1,45000),
(20,1015,106,1,3500);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text TEXT,
    review_date DATE,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

INSERT INTO Reviews VALUES
(1,1,101,5,'Excellent laptop performance','2024-04-18'),
(2,2,102,4,'Smartphone camera quality is good','2024-04-19'),
(3,3,103,5,'Headphones sound quality is excellent','2024-04-20'),
(4,4,104,5,'Smart watch features are very useful','2024-04-21'),
(5,5,105,3,'Tablet battery backup could improve','2024-04-22'),
(6,6,106,4,'Bluetooth speaker sound is clear','2024-04-23'),
(7,7,107,5,'Gaming mouse works smoothly','2024-04-24'),
(8,8,108,4,'Keyboard typing experience is comfortable','2024-04-25'),
(9,9,109,5,'Monitor display quality is impressive','2024-04-26'),
(10,10,110,5,'Printer performance is reliable','2024-04-27'),
(11,11,111,4,'Camera quality is very professional','2024-04-28'),
(12,12,112,5,'Power bank charging speed is fast','2024-04-29'),
(13,13,113,4,'Router connectivity is stable','2024-04-30'),
(14,14,114,5,'Hard disk storage capacity is excellent','2024-05-01'),
(15,15,115,5,'USB drive transfer speed is impressive','2024-05-02');

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO Employees VALUES
(1,'Akhil','Sales',45000,'2023-01-10'),
(2,'Sneha','Customer Support',40000,'2023-03-15'),
(3,'Rohit','Warehouse',38000,'2023-05-20'),
(4,'Divya','Marketing',50000,'2023-07-01'),
(5,'Nithin','Finance',52000,'2023-08-15'),
(6,'Anu','Sales',47000,'2023-09-01'),
(7,'Fahad','IT Support',55000,'2023-10-10'),
(8,'Reshma','HR',48000,'2023-11-05'),
(9,'Abhishek','Warehouse',39000,'2023-12-12'),
(10,'Keerthana','Marketing',53000,'2024-01-08'),
(11,'Aravind','Finance',51000,'2024-01-15'),
(12,'Gayathri','Sales',46000,'2024-02-01'),
(13,'Midhun','IT Support',57000,'2024-02-18'),
(14,'Anjana','HR',49000,'2024-03-05'),
(15,'Vishnu','Marketing',54000,'2024-03-20');

/*
Question 1:
What is the total revenue generated by the business?
*/

SELECT 
    SUM(total_price) AS Total_Revenue
FROM Order_Items;



/*
Question 2:
Which products generate the highest sales volume?
*/

SELECT 
    Products.product_name,
    SUM(Order_Items.quantity) AS Total_Units_Sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.product_name
ORDER BY Total_Units_Sold DESC;


/*
Question 3:
Which customers contribute the most revenue?
*/

SELECT 
    Customers.customer_name,
    SUM(Order_Items.total_price) AS Total_Amount_Spent
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
GROUP BY Customers.customer_name
ORDER BY Total_Amount_Spent DESC;


/*
Question 4:
Which product categories generate the highest revenue?
*/

SELECT 
    Products.category,
    SUM(Order_Items.total_price) AS Category_Revenue
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.category
ORDER BY Category_Revenue DESC;


/*
Question 5:
What are the monthly sales trends?
*/

SELECT 
    MONTH(Orders.order_date) AS Sales_Month,
    COUNT(Orders.order_id) AS Total_Number_Of_Orders
FROM Orders
GROUP BY MONTH(Orders.order_date)
ORDER BY Sales_Month;



/*
Question 6:
Which payment method is most preferred by customers?
*/

SELECT 
    Orders.payment_method,
    COUNT(Orders.order_id) AS Total_Number_Of_Transactions
FROM Orders
GROUP BY Orders.payment_method
ORDER BY Total_Number_Of_Transactions DESC;


/*
Question 7:
Which products have the highest customer ratings?
*/

SELECT 
    Products.product_name,
    max(Reviews.rating) AS highest_Product_Rating
FROM Products
JOIN Reviews
ON Products.product_id = Reviews.product_id
GROUP BY Products.product_name
ORDER BY highest_Product_Rating DESC;


/*
Question 8:
Which states have the highest number of customers?
*/

SELECT 
    Customers.state,
    COUNT(Customers.customer_id) AS Total_Number_Of_Customers
FROM Customers
GROUP BY Customers.state
ORDER BY Total_Number_Of_Customers DESC;


/*
Question 9:
What is the average order delivery time?
*/

SELECT 
    AVG(DATEDIFF(Orders.delivery_date, Orders.order_date)) AS Average_Delivery_Time_In_Days
FROM Orders;


/*
Question 10:
Which customers are repeat buyers?
*/

SELECT 
    Customers.customer_name,
    COUNT(Orders.order_id) AS Total_Number_Of_Orders
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name
HAVING COUNT(Orders.order_id) > 1
ORDER BY Total_Number_Of_Orders DESC;


/*
Question 11:
Which products are low in stock and require replenishment?
*/

SELECT 
    Products.product_name,
    Products.stock_quantity
FROM Products
WHERE Products.stock_quantity < 50
ORDER BY Products.stock_quantity;


/*
Question 12:
Rank products based on generated revenue.
*/

SELECT 
    Products.product_name,
    SUM(Order_Items.total_price) AS Total_Product_Revenue,
    
    RANK() OVER (
        ORDER BY SUM(Order_Items.total_price) DESC
    ) AS Product_Revenue_Rank

FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id

GROUP BY Products.product_name;


/*
Question 13:
Which orders were cancelled?
*/

SELECT *
FROM Orders
WHERE Orders.order_status = 'Cancelled';


/*
Question 14:
Which employees receive the highest salaries?
*/

SELECT 
    Employees.employee_name,
    Employees.department,
    Employees.salary
FROM Employees
ORDER BY Employees.salary DESC limit 4;


/*
Question 15:
Which department has the highest average salary?
*/

SELECT 
    Employees.department,
    round(AVG(Employees.salary)) AS Average_Department_Salary
FROM Employees
GROUP BY Employees.department
ORDER BY Average_Department_Salary DESC;


/*
Question 16:
Which customers placed the highest number of orders?
*/

SELECT 
    Customers.customer_name,
    COUNT(Orders.order_id) AS Total_Number_Of_Orders
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name
ORDER BY Total_Number_Of_Orders DESC;


/*
Question 17:
Which products generated the highest revenue?
*/

SELECT 
    Products.product_name,
    SUM(Order_Items.total_price) AS Total_Product_Revenue
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.product_name
ORDER BY Total_Product_Revenue DESC;


/*
Question 18:
What is the average spending per customer?
*/

SELECT 
    round(AVG(Customer_Total_Spending.Total_Spending)) AS Average_Customer_Spending
FROM
(
    SELECT 
        Customers.customer_id,
        SUM(Order_Items.total_price) AS Total_Spending
    FROM Customers
    JOIN Orders
    ON Customers.customer_id = Orders.customer_id
    JOIN Order_Items
    ON Orders.order_id = Order_Items.order_id
    GROUP BY Customers.customer_id
) AS Customer_Total_Spending;


/*
Question 19:
Which cities generate the highest revenue?
*/

SELECT 
    Customers.city,
    SUM(Order_Items.total_price) AS City_Revenue
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
GROUP BY Customers.city
ORDER BY City_Revenue DESC limit 5;


/*
Question 20:
What percentage of orders were cancelled?
*/

SELECT 
    (
        COUNT(
            CASE 
                WHEN Orders.order_status = 'Cancelled'
                THEN 1
            END
        ) * 100
    ) / COUNT(*) AS Cancelled_Order_Percentage
FROM Orders;


/*
Question 21:
Which customers gave the lowest ratings?
*/

SELECT 
    Customers.customer_name,
    Reviews.rating,
    Reviews.review_text
FROM Customers
JOIN Reviews
ON Customers.customer_id = Reviews.customer_id
WHERE Reviews.rating <= 3
ORDER BY Reviews.rating;


/*
Question 22:
Which month generated the highest revenue?
*/

SELECT 
    MONTH(Orders.order_date) AS Sales_Month,
    SUM(Order_Items.total_price) AS Monthly_Revenue
FROM Orders
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
GROUP BY MONTH(Orders.order_date)
ORDER BY Monthly_Revenue DESC;


/*
Question 23:
Which product categories have the highest average ratings?
*/

SELECT 
    Products.category,
    AVG(Reviews.rating) AS Average_Category_Rating
FROM Products
JOIN Reviews
ON Products.product_id = Reviews.product_id
GROUP BY Products.category
ORDER BY Average_Category_Rating DESC;


/*
Question 24:
Which employees joined most recently?
*/

SELECT 
    Employees.employee_name,
    Employees.department,
    Employees.joining_date
FROM Employees
ORDER BY Employees.joining_date DESC;


/*
Question 25:
Which customers ordered products from multiple categories?
*/

SELECT 
    Customers.customer_name,
    COUNT(DISTINCT Products.category) AS Total_Categories_Ordered
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
JOIN Order_Items
ON Orders.order_id = Order_Items.order_id
JOIN Products
ON Order_Items.product_id = Products.product_id
GROUP BY Customers.customer_name
HAVING COUNT(DISTINCT Products.category) > 1;


/*
Question 26:
What is the total revenue generated by each brand?
*/

SELECT 
    Products.brand,
    SUM(Order_Items.total_price) AS Brand_Revenue
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.brand
ORDER BY Brand_Revenue DESC;


/*
Question 27:
Which orders had the longest delivery time?
*/

SELECT 
    Orders.order_id,
    Customers.customer_name,
    DATEDIFF(
        Orders.delivery_date,
        Orders.order_date
    ) AS Delivery_Time_In_Days
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
ORDER BY Delivery_Time_In_Days DESC;


/*
Question 28:
Which products were ordered the least?
*/

SELECT 
    Products.product_name,
    SUM(Order_Items.quantity) AS Total_Quantity_Sold
FROM Products
JOIN Order_Items
ON Products.product_id = Order_Items.product_id
GROUP BY Products.product_name
ORDER BY Total_Quantity_Sold ASC;


/*
Question 29:
What is the average salary in the company?
*/

SELECT 
    round(AVG(Employees.salary)) AS Average_Company_Salary
FROM Employees;



/*
Question 30:
Which departments have more than one employee?
*/

SELECT 
    Employees.department,
    COUNT(Employees.employee_id) AS Total_Employees
FROM Employees
GROUP BY Employees.department
HAVING COUNT(Employees.employee_id) > 1;






