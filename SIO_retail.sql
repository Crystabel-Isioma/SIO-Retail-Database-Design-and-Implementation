/* ============================================================
	 Create Database
   ============================================================ */

CREATE DATABASE SIO_Retail;
GO
USE SIO_Retail;
GO


/* ============================================================
	1.	CREATE Customers TABLE
   ============================================================ */

CREATE TABLE dbo.Customers(
  customer_id  INT IDENTITY(1,1) NOT NULL,
  full_name    NVARCHAR(50)      NOT NULL,
  age          INT               NOT NULL,
  email        NVARCHAR(50)      NULL,
  phone        NVARCHAR(20)      NULL,
  deactivated_at DATE            NULL,
  preferred_payment_method_id INT NULL,  -- FK 
  CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED(customer_id),
  CONSTRAINT CK_Customers_Age CHECK (age BETWEEN 16 AND 120)
);

SELECT *
FROM Customers;

/* ============================================================
		Insert Values into Customers Table
   ============================================================ */

INSERT INTO dbo.Customers(full_name, age, email, phone, deactivated_at, preferred_payment_method_id) VALUES
(N'Oluwaseun Adesina',    34, 'oluwaseun.adesina@gmail.com',   '0803-721-4490', NULL, 10),
(N'Kelechi Nnadozie',     41, 'kelechi.nnadozie@gmail.com',    '0812-660-2211', NULL, 11),
(N'Aisha Bello',          29, 'aisha.bello@gmail.com',         '0805-111-4422', NULL, 12),
(N'Chukwudi Okorie',      45, 'chukwudi.okorie@gmail.com',     '0802-345-0011', NULL, 10),
(N'Funke Adegoke',        31, 'funke.adegoke@gmail.com',       '0809-456-1234', NULL, 11),
(N'Fisayo Ige',           38, 'fisayo.ige@gmail.com',          '0813-111-2233', NULL, 13),
(N'Seun Ajayi',           42, 'seun.ajayi@gmail.com',          '0806-007-7882', NULL, 14),
(N'Ifeoma Nkem',          27, 'ifeoma.nkem@gmail.com',         '0807-001-2233', NULL, 10),
(N'Temidayo Ogunlaja',    46, 'temidayo.ogunlaja@gmail.com',   '0810-590-3321', NULL, 10),
(N'Ridwan Lawal',         35, 'ridwan.lawal@gmail.com',        '0818-659-9004', NULL, 12),
(N'Camille Durand',       32, 'camille.durand@gmail.com',      '06-22-45-78-90', NULL, 11),
(N'Baptiste Leroy',       47, 'baptiste.leroy@gmail.com',      '07-45-90-33-21', NULL, 10),
(N'Lucie Fontaine',       41, 'lucie.fontaine@gmail.com',      '06-77-55-33-11', NULL, 15),
(N'Mathieu Lambert',      50, 'mathieu.lambert@gmail.com',     '07-61-01-23-45', NULL, 10),
(N'Claire Bonnet',        26, 'claire.bonnet@gmail.com',       '06-03-45-67-89', NULL, 11),
(N'Sunkanmi Adeoye',        37, 'sunkanmi.adeoye@gmail.com',      '0809-214-7765', NULL, 10),
(N'Nkemdilim Okeke',        28, 'nkemdilim.okeke@gmail.com',      '0812-903-1145', NULL, 12),
(N'Ibrahim Danjuma',        43, 'ibrahim.danjuma@gmail.com',      '0803-441-2207', NULL, 14),
(N'Abiola Shonibare',       33, 'abiola.shonibare@gmail.com',     '0816-772-0941', NULL, 11),
(N'Chinonso Ezenwa',        46, 'chinonso.ezenwa@gmail.com',      '0806-512-8890', NULL, 10),
(N'Mariam Sanni',           27, 'mariam.sanni@gmail.com',         '0815-300-6678', NULL, 13),
(N'Emeka Nwankwo',          39, 'emeka.nwankwo@gmail.com',        '0807-942-1163', NULL, 15),
(N'Aderonke Akande',        31, 'aderonke.akande@gmail.com',      '0802-774-5531', NULL, 11),
(N'Tobi Afolayan',          44, 'tobi.afolayan@gmail.com',        '0813-209-4412', NULL, 12),
(N'Kudirat Bakare',         36, 'kudirat.bakare@gmail.com',       '0805-880-9902', NULL, 10),
(N'Antoine Girard',         40, 'antoine.girard@gmail.com',       '06-28-44-19-72', NULL, 10),
(N'Pauline Marchand',       29, 'pauline.marchand@gmail.com',     '07-39-12-66-08', NULL, 11),
(N'Romain Dubois',          48, 'romain.dubois@gmail.com',        '06-51-73-90-12', NULL, 12),
(N'Lea Chevalier',          34, 'lea.chevalier@gmail.com',        '07-64-20-15-44', NULL, 13),
(N'Etienne Garnier',        45, 'etienne.garnier@gmail.com',      '06-17-85-43-29', NULL, 14),
(N'Anais Millet',           27, 'anais.millet@gmail.com',         '06-09-63-24-50', NULL, 15),
(N'Julien Perrin',          38, 'julien.perrin@gmail.com',        '07-80-41-33-76', NULL, 11),
(N'Sophie Renaud',          42, 'sophie.renaud@gmail.com',        '06-13-27-45-61', NULL, 12),
(N'Hugo Morel',             31, 'hugo.morel@gmail.com',           '07-58-10-72-04', NULL, 10),
(N'Chloe Martin',           26, 'chloe.martin@gmail.com',         '06-03-22-61-85', NULL, 11),
(N'Hajar El Ouardi',        33, 'hajar.elouardi@gmail.com',       '+212-661-72-45-90', NULL, 13),
(N'Amine Bakkali',          47, 'amine.bakkali@gmail.com',        '+212-662-30-19-82', NULL, 10),
(N'Tarik Bouazza',          35, 'tarik.bouazza@gmail.com',        '+212-663-58-41-27', NULL, 15),
(N'Imane El Khattabi',      28, 'imane.elkhattabi@gmail.com',     '+212-664-94-20-13', NULL, 11),
(N'Ayoub Jarir',            44, 'ayoub.jarir@gmail.com',          '+212-665-11-35-74', NULL, 12),
(N'Ghita Lahlou',           36, 'ghita.lahlou@gmail.com',         '+212-666-28-90-04', NULL, 14),
(N'Soufiane El Ghali',      41, 'soufiane.elghali@gmail.com',     '+212-667-36-52-18', NULL, 10),
(N'Nabila Ait Ali',         30, 'nabila.aitali@gmail.com',        '+212-668-49-73-22', NULL, 11),
(N'Anass Mzouak',           39, 'anass.mzouak@gmail.com',         '+212-669-17-86-05', NULL, 12),
(N'Zakaria Idrissi',        52, 'zakaria.idrissi@gmail.com',      '+212-670-55-28-63', NULL, 13),
(N'Youssef El Fassi',     37, 'youssef.elfassi@gmail.com',     '+212-661-55-89-34', NULL, 10),
(N'Salma Bouziane',       30, 'salma.bouziane@gmail.com',      '+212-662-88-10-45', NULL, 11),
(N'Othmane El Alaoui',    49, 'othmane.elalaoui@gmail.com',    '+212-662-77-88-99', NULL, 13),
(N'Rania El Haddad',      35, 'rania.elhaddad@gmail.com',      '+212-665-99-00-44', NULL, 14),
(N'Mehdi Tazi',           42, 'mehdi.tazi@gmail.com',          '+212-665-55-00-33', NULL, 15);

/* ============================================================
		UPDATE Values into Customers Table
   ============================================================ */

UPDATE Customers
SET deactivated_at = '2024-11-05'
WHERE customer_id = 1;

UPDATE Customers
SET deactivated_at = '2025-01-12'
WHERE customer_id = 4;

UPDATE Customers
SET deactivated_at = '2025-02-20'
WHERE customer_id = 7;

UPDATE Customers
SET deactivated_at = '2025-03-05'
WHERE customer_id = 10;

UPDATE Customers
SET deactivated_at = '2025-04-14'
WHERE customer_id = 13;

UPDATE Customers
SET deactivated_at = '2025-05-30'
WHERE customer_id = 16;

UPDATE Customers
SET deactivated_at = '2025-06-22'
WHERE customer_id = 19;

UPDATE Customers
SET deactivated_at = '2025-07-01'
WHERE customer_id = 22;

UPDATE Customers
SET deactivated_at = '2025-07-15'
WHERE customer_id = 25;

UPDATE Customers
SET deactivated_at = '2025-07-25'
WHERE customer_id = 28;




/* ============================================================
2.	CREATE PaymentMethods TABLE
   ============================================================ */

CREATE TABLE dbo.PaymentMethods(
  payment_method_id INT IDENTITY(10,1) NOT NULL,
  method_name NVARCHAR(30) NOT NULL,
  CONSTRAINT PK_PaymentMethods PRIMARY KEY CLUSTERED(payment_method_id),
  CONSTRAINT CK_PaymentMethods_Name CHECK (method_name IN ('Card','PayPal','ApplePay','GooglePay','Crypto','BankTransfer'))
);

/* =====================================================================================================================
		ALTER CUSTOMERS TABLE TO INCLUDE PAYMENT_METHOD_ID AS A FORIEGN KEY REFRENCING PaymentMethods TABLE
   ===================================================================================================================== */
/* Wire Customers -> PaymentMethods FK */
ALTER TABLE dbo.Customers
ADD CONSTRAINT FK_Customers_PaymentMethods
FOREIGN KEY(preferred_payment_method_id)
REFERENCES dbo.PaymentMethods(payment_method_id);


SELECT *
FROM PaymentMethods;

/* ============================================================
		Insert Values into PaymentMethods TABLE
   ============================================================ */

INSERT INTO dbo.PaymentMethods(method_name) VALUES
('Card'),('PayPal'),('ApplePay'),('GooglePay'),('Crypto'),('BankTransfer');

/* ============================================================
3.	CREATE Suppliers TABLE
   ============================================================ */
CREATE TABLE dbo.Suppliers(
  supplier_id   INT IDENTITY(401,1) NOT NULL,
  supplier_name NVARCHAR(60)        NOT NULL,
  phone         NVARCHAR(20)        NULL,
  CONSTRAINT PK_Suppliers PRIMARY KEY CLUSTERED(supplier_id)
);


/* ============================================================
		Insert Values into Suppliers TABLE
   ============================================================ */

INSERT INTO dbo.Suppliers(supplier_name, phone) VALUES
('LagosTech Distribution',      '+234-01-271-8899'),
('Electro Maroc Casablanca',    '+212-522-446-677'),
('Maison Electronique Paris',   '+33-1-44-09-8877'),
('Abuja Electro Hub',           '+234-909-880-2200'),
('Marseille Composants',        '+33-4-91-22-33-44'),
('Rabat Smart Supply',          '+212-530-11-44-77');

/* ============================================================
4.	CREATE Category TABLE
   ============================================================ */
  
CREATE TABLE dbo.Category(
  category_id   INT IDENTITY(501,1) NOT NULL,
  category_name NVARCHAR(20)        NOT NULL,
  description   NVARCHAR(100)       NULL,
  CONSTRAINT PK_Category PRIMARY KEY CLUSTERED(category_id),
  CONSTRAINT UX_Category_Name UNIQUE (category_name));

  
/* ============================================================
		Insert Values into Category TABLE
   ============================================================ */

  INSERT INTO dbo.Category(category_name, description) VALUES
('Electronics','Consumer electronics and everyday gadgets'),
('Premium','High-end / flagship products');


SELECT * 
FROM Category;


/* ============================================================
5.	CREATE Products TABLE
   ============================================================ */ 
CREATE TABLE dbo.Products(
  product_id   INT IDENTITY(1001,1) NOT NULL,
  product_name NVARCHAR(60)         NOT NULL,
  unit_price   DECIMAL(12,2)        NOT NULL,
  supplier_id  INT                  NOT NULL,
  category_id  INT                  NOT NULL,
  CONSTRAINT PK_Products PRIMARY KEY CLUSTERED(product_id),
  CONSTRAINT FK_Products_Suppliers FOREIGN KEY(supplier_id) REFERENCES dbo.Suppliers(supplier_id),
  CONSTRAINT FK_Products_Category  FOREIGN KEY(category_id)  REFERENCES dbo.Category(category_id),
  CONSTRAINT CK_Products_Price_Positive CHECK (unit_price > 0)
);

/* ============================================================
		Insert Values into Products TABLE
   ============================================================ */

INSERT INTO dbo.Products(product_name,unit_price,supplier_id,category_id) VALUES
('LEDTV55in',              679.00, 401, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('BluetoothSoundbar',       89.00, 403, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('4KActionCam',            249.00, 405, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('NoiseCancelEarbuds',     139.00, 403, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('WiFi6RouterAX5400',      149.00, 406, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('DashCam4K',              159.00, 406, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('HomeSecurityKit',        229.00, 406, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('SteamIronPro',            79.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('AirFryerXXL',            189.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('SmartwatchPro',          299.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('ConvertibleLaptop15',   1299.00, 403, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('PremiumSoundbarAtmos',   499.00, 405, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('OLEDTV65',              1399.00, 401, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('FlagshipPhoneZ',         899.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('AndroidPhoneX',          455.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('Ultrabook14',           1099.00, 403, (SELECT category_id FROM dbo.Category WHERE category_name='Premium')),
('WirelessHeadphones',     129.00, 403, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('Charger65WUSBC',          29.00, 401, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('SmartHomeHub',            89.00, 406, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('RobotVacuumBasic',       219.00, 406, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('Microwave25L',           149.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('ElectricKettle1_7L',      32.00, 402, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('PortableSSD1TB',          99.00, 405, (SELECT category_id FROM dbo.Category WHERE category_name='Electronics')),
('GamingConsolePro',       399.00, 405, (SELECT category_id FROM dbo.Category WHERE category_name='Premium'));


SELECT *
FROM Products;


/* ============================================================
6.	CREATE Stock TABLE
   ============================================================ */ 
CREATE TABLE dbo.Stock(
  product_id   INT NOT NULL,
  stock_level  INT NOT NULL,
  last_updated DATE NULL,
  CONSTRAINT PK_Stock PRIMARY KEY CLUSTERED(product_id),
  CONSTRAINT FK_Stock_Products FOREIGN KEY(product_id) REFERENCES dbo.Products(product_id),
  CONSTRAINT CK_Stock_NonNeg CHECK (stock_level >= 0)
);

/* ============================================================
		Insert Values into Stock TABLE
   ============================================================ */
INSERT INTO dbo.Stock (product_id, stock_level, last_updated)
SELECT p.product_id, s.qty, CAST(GETDATE() AS date)
FROM dbo.Products p
JOIN (VALUES
    (N'LEDTV55in',            30),
    (N'BluetoothSoundbar',    80),
    (N'AndroidPhoneX',        55),
    (N'Ultrabook14',          15),
    (N'WirelessHeadphones',  120),
    (N'Charger65WUSBC',      250),
    (N'SmartHomeHub',         40),
    (N'RobotVacuumBasic',     25),
    (N'Microwave25L',         70),
    (N'ElectricKettle1_7L',   44),
    (N'PortableSSD1TB',       95),
    (N'GamingConsolePro',     28),
    (N'4KActionCam',          35),
    (N'NoiseCancelEarbuds',  110),
    (N'WiFi6RouterAX5400',    60),
    (N'DashCam4K',            45),
    (N'HomeSecurityKit',      22),
    (N'SteamIronPro',         85),
    (N'AirFryerXXL',          33),
    (N'SmartwatchPro',        50),
    (N'ConvertibleLaptop15',  12),
    (N'PremiumSoundbarAtmos', 26),
    (N'OLEDTV65',             18),
    (N'FlagshipPhoneZ',       40)
) AS s(product_name, qty)
  ON s.product_name = p.product_name;


SELECT s.product_id, p.product_name, s.stock_level, s.last_updated
FROM dbo.Stock s
JOIN dbo.Products p ON p.product_id = s.product_id
ORDER BY p.product_name;


/* ============================================================
7.	CREATE Orders TABLE
   ============================================================ */  
CREATE TABLE dbo.Orders(
  order_id        INT IDENTITY(701,1) NOT NULL,
  customer_id     INT               NOT NULL,
  shipping_method NVARCHAR(15)      NOT NULL,
  status          NVARCHAR(15)      NOT NULL,
  order_datetime  DATETIME2         NOT NULL,
  delivered_at    DATE              NULL,
  shipped_at      DATE              NULL,
  cancelled_at    DATE              NULL,
  CONSTRAINT PK_Orders PRIMARY KEY CLUSTERED(order_id),
  CONSTRAINT FK_Orders_Customers FOREIGN KEY(customer_id) REFERENCES dbo.Customers(customer_id),
  CONSTRAINT CK_Orders_Status CHECK (status IN ('Pending','Processing','Shipped','Delivered','Cancelled')),
  CONSTRAINT CK_Orders_ShipMethod CHECK (shipping_method IN ('Air','Sea','Road','Courier','Pickup'))
);

/* ============================================================
		Insert Values into Orders TABLE
   ============================================================ */

INSERT INTO dbo.Orders(customer_id,shipping_method,status,order_datetime,delivered_at,shipped_at,cancelled_at) VALUES
(1,'Courier','Delivered','2025-09-10T09:05:00','2025-09-14','2025-09-11',NULL),
(2,'Air','Shipped','2025-09-12T08:20:00',NULL,'2025-09-13',NULL),
(3,'Road','Cancelled','2025-09-08T10:00:00',NULL,NULL,'2025-09-09'),
(4,'Courier','Delivered','2025-09-11T09:10:00','2025-09-15','2025-09-12',NULL),
(5,'Pickup','Processing','2025-09-15T13:00:00',NULL,NULL,NULL),
(6,'Sea','Pending','2025-09-16T11:45:00',NULL,NULL,NULL),
(7,'Courier','Delivered','2025-09-05T10:15:00','2025-09-09','2025-09-06',NULL),
(8,'Road','Delivered','2025-09-07T12:30:00','2025-09-12','2025-09-08',NULL),
(11,'Courier','Shipped','2025-09-18T10:05:00',NULL,'2025-09-19',NULL),
(13,'Road','Pending','2025-09-19T16:45:00',NULL,NULL,NULL);

SELECT *
FROM Orders;


/* ============================================================
8.	CREATE OrderDetails TABLE
   ============================================================ */ 

   CREATE TABLE dbo.OrderDetails(
  order_id            INT            NOT NULL,
  product_id          INT            NOT NULL,
  quantity            INT            NOT NULL,
  unit_price_at_order DECIMAL(12,2)  NOT NULL,
  CONSTRAINT PK_OrderDetails PRIMARY KEY CLUSTERED(order_id, product_id),
  CONSTRAINT FK_OrderDetails_Orders   FOREIGN KEY(order_id)   REFERENCES dbo.Orders(order_id),
  CONSTRAINT FK_OrderDetails_Products FOREIGN KEY(product_id) REFERENCES dbo.Products(product_id),
  CONSTRAINT CK_OrderDetails_Qty CHECK (quantity > 0)
);



/* ============================================================
		Insert Values into OrderDetails TABLE
   ============================================================ */

INSERT INTO dbo.OrderDetails (order_id, product_id, quantity, unit_price_at_order)
SELECT o.order_id, p.product_id, vals.qty, vals.uprice
FROM dbo.Orders AS o
JOIN (
    VALUES
    (701, N'Ultrabook14',          1, 1099.00),
    (701, N'Charger65WUSBC',       2,   29.00),
    (702, N'LEDTV55in',            1,  679.00),
    (702, N'PortableSSD1TB',       1,   99.00),
    (703, N'BluetoothSoundbar',    1,   89.00),
    (704, N'WirelessHeadphones',   1,  129.00),
    (704, N'AndroidPhoneX',        1,  455.00),
    (707, N'AndroidPhoneX',        1,  455.00),
    (707, N'Charger65WUSBC',       1,   29.00),
    (708, N'RobotVacuumBasic',     1,  219.00),
    (708, N'SmartHomeHub',         1,   89.00),
    (711, N'GamingConsolePro',     1,  399.00),
    (712, N'Microwave25L',         1,  149.00),
    (712, N'ElectricKettle1_7L',   1,   32.00),
    (713, N'4KActionCam',          1,  249.00),
    (713, N'NoiseCancelEarbuds',   1,  139.00),
    (714, N'WiFi6RouterAX5400',    1,  149.00),
    (714, N'HomeSecurityKit',      1,  229.00),
    (715, N'SteamIronPro',         1,   79.00),
    (715, N'AirFryerXXL',          1,  189.00),
    (716, N'SmartwatchPro',        1,  299.00),
    (717, N'ConvertibleLaptop15',  1, 1299.00),
    (717, N'PremiumSoundbarAtmos', 1,  499.00),
    (718, N'OLEDTV65',             1, 1399.00),
    (718, N'FlagshipPhoneZ',       1,  899.00)
) AS vals(order_id_hint, product_name, qty, uprice)
    ON o.order_id = vals.order_id_hint
JOIN dbo.Products AS p
    ON p.product_name = vals.product_name;



SELECT od.order_id, p.product_name, od.quantity, od.unit_price_at_order
FROM dbo.OrderDetails AS od
JOIN dbo.Products AS p 
    ON od.product_id = p.product_id
ORDER BY od.order_id, p.product_name;

/* ============================================================
9.	CREATE ProductReviews TABLE
   ============================================================ */ 
   CREATE TABLE dbo.ProductReviews(
  review_id   INT IDENTITY(801,1) NOT NULL,
  order_id    INT               NOT NULL,
  product_id  INT               NOT NULL,
  customer_id INT               NOT NULL,
  rating      INT               NOT NULL,
  comment     NVARCHAR(100)     NULL,
  created_at  DATE              NOT NULL,
  CONSTRAINT PK_ProductReviews PRIMARY KEY CLUSTERED(review_id),
  CONSTRAINT FK_Reviews_Orders    FOREIGN KEY(order_id)    REFERENCES dbo.Orders(order_id),
  CONSTRAINT FK_Reviews_Products  FOREIGN KEY(product_id)  REFERENCES dbo.Products(product_id),
  CONSTRAINT FK_Reviews_Customers FOREIGN KEY(customer_id) REFERENCES dbo.Customers(customer_id),
  CONSTRAINT CK_Reviews_Rating CHECK (rating BETWEEN 1 AND 5)
);


/* ============================================================
		Insert Values into ProductReviews TABLE
   ============================================================ */

INSERT INTO dbo.ProductReviews (order_id, product_id, customer_id, rating, comment, created_at)
SELECT 
    o.order_id, p.product_id, o.customer_id, pr.rating, pr.comment, pr.created_at
FROM dbo.Orders AS o
	JOIN (
    VALUES
      (701, N'Ultrabook14',         5, N'Exactly as described', '2025-09-16'),
      (701, N'Charger65WUSBC',      4, N'Works fine',           '2025-09-16'),
      (704, N'WirelessHeadphones',  4, N'Comfortable fit',      '2025-09-18'),
      (707, N'AndroidPhoneX',       5, N'Smooth and fast',      '2025-09-10'),
      (711, N'GamingConsolePro',    4, N'Great for kids',       '2025-09-20'),
      (708, N'RobotVacuumBasic',    3, N'Does the job',         '2025-09-13')
) AS pr(order_id_hint, product_name, rating, comment, created_at)
      ON pr.order_id_hint = o.order_id
JOIN dbo.Products AS p
      ON p.product_name = pr.product_name
WHERE o.status = 'Delivered'
  AND (o.delivered_at IS NULL OR pr.created_at >= o.delivered_at);  

SELECT pr.review_id, pr.order_id, p.product_name, pr.rating, pr.comment, pr.created_at
FROM dbo.ProductReviews AS pr
JOIN dbo.Products AS p ON p.product_id = pr.product_id
ORDER BY pr.order_id, pr.review_id;


/* ============================================================
10.	CREATE OrderStatusHistory TABLE
   ============================================================ */ 

CREATE TABLE dbo.OrderStatusHistory(
  history_id        INT IDENTITY(901,1) NOT NULL,
  order_id          INT               NOT NULL,
  status            NVARCHAR(15)      NOT NULL,
  status_changed_at DATETIME2         NOT NULL,
  CONSTRAINT PK_OrderStatusHistory PRIMARY KEY CLUSTERED(history_id),
  CONSTRAINT FK_OrderStatusHistory_Orders FOREIGN KEY(order_id) REFERENCES dbo.Orders(order_id),
  CONSTRAINT CK_OrderStatusHistory_Status CHECK (status IN ('Pending','Processing','Shipped','Delivered','Cancelled'))
);


/* ============================================================
		Insert Values into OrderStatusHistory TABLE
   ============================================================ */

INSERT INTO dbo.OrderStatusHistory (order_id, status, status_changed_at)
VALUES
-- 701 (Delivered)
(701, 'Pending',   '2025-09-10T09:05:00'),
(701, 'Shipped',   '2025-09-11T10:00:00'),
(701, 'Delivered', '2025-09-14T16:30:00'),

-- 702 (Shipped)
(702, 'Pending',   '2025-09-12T08:20:00'),
(702, 'Shipped',   '2025-09-13T12:45:00'),

-- 703 (Cancelled)
(703, 'Pending',   '2025-09-08T10:00:00'),
(703, 'Cancelled', '2025-09-09T11:00:00'),

-- 704 (Delivered)
(704, 'Pending',   '2025-09-11T09:10:00'),
(704, 'Shipped',   '2025-09-12T10:00:00'),
(704, 'Delivered', '2025-09-15T15:10:00'),

-- 705 (Processing – only pending so far)
(705, 'Pending',   '2025-09-15T13:00:00'),

-- 706 (Pending)
(706, 'Pending',   '2025-09-16T11:45:00'),

-- 707 (Delivered)
(707, 'Pending',   '2025-09-05T10:15:00'),
(707, 'Shipped',   '2025-09-06T10:20:00'),
(707, 'Delivered', '2025-09-09T18:00:00'),

-- 708 (Delivered)
(708, 'Pending',   '2025-09-07T12:30:00'),
(708, 'Shipped',   '2025-09-08T09:30:00'),
(708, 'Delivered', '2025-09-12T14:00:00'),

-- 709 (Shipped)
(709, 'Pending',   '2025-09-18T10:05:00'),
(709, 'Shipped',   '2025-09-19T12:10:00'),

-- 710 (Pending)
(710, 'Pending',   '2025-09-19T16:45:00');


/* ============================================================
11.	CREATE Addresses TABLE
   ============================================================ */ 

   CREATE TABLE dbo.Addresses(
  address_id   INT IDENTITY(201,1) NOT NULL,
  customer_id  INT                 NOT NULL,
  address_type NVARCHAR(10)        NOT NULL,  -- Billing/Shipping
  line1        NVARCHAR(50)        NOT NULL,
  line2        NVARCHAR(50)        NULL,
  city         NVARCHAR(30)        NOT NULL,
  state        NVARCHAR(30)        NULL,
  country      NVARCHAR(5)         NOT NULL,  -- NG/FR/MA
  postal_code  NVARCHAR(10)        NULL,
  CONSTRAINT PK_Addresses PRIMARY KEY CLUSTERED(address_id),
  CONSTRAINT FK_Addresses_Customers FOREIGN KEY(customer_id) REFERENCES dbo.Customers(customer_id),
  CONSTRAINT CK_Addresses_Type CHECK (address_type IN ('Billing','Shipping'))
);


/* ============================================================
		Insert Values into Addresses TABLE
   ============================================================ */


INSERT INTO dbo.Addresses (customer_id, address_type, line1, line2, city, state, country, postal_code)
VALUES

(1,'Billing', N'12 Adeola St',             NULL, N'Lagos',         N'LA',  N'NG', N'100001'),
(2,'Billing', N'9 Garki Crescent',          NULL, N'Abuja',         N'FC',  N'NG', N'900101'),
(3,'Billing', N'17 Bompai Rd',              NULL, N'Kano',          N'KN',  N'NG', N'700001'),
(4,'Billing', N'22 Zik Avenue',             NULL, N'Enugu',         N'EN',  N'NG', N'400001'),
(5,'Billing', N'31 Ring Road',              NULL, N'Ibadan',        N'OY',  N'NG', N'200211'),
(6,'Billing', N'14 Olu Obasanjo Rd',        NULL, N'Port Harcourt', N'RI',  N'NG', N'500102'),
(13,'Billing',N'5 Rue Paradis',             NULL, N'Marseille',     N'PACA',N'FR', N'13008'),
(14,'Billing',N'4 Place du Capitole',       NULL, N'Toulouse',      N'OCC', N'FR', N'31000'),
(15,'Billing',N'7 Promenade des Anglais',   NULL, N'Nice',          N'PACA',N'FR', N'06000'),
(16,'Billing',N'Av. Mohammed V',            NULL, N'Rabat',         N'RS',  N'MA', N'10000'),
(17,'Billing',N'Bd. Zerktouni',             NULL, N'Casablanca',    N'CAS', N'MA', N'20250'),
(18,'Billing',N'Av. Mohamed VI',            NULL, N'Marrakech',     N'MR',  N'MA', N'40000'),
(19,'Billing',N'Avenue des FAR',            NULL, N'Fès',           N'FES', N'MA', N'30000'),
(20,'Billing',N'Av. Youssef Ben Tachfine',  NULL, N'Tanger',        N'TNG', N'MA', N'90000'),
(21,'Billing',N'3 Bishop Aboyade Cole',     NULL, N'Lagos',         N'LA',  N'NG', N'100245'),
(22,'Billing',N'12 Chime Avenue',           NULL, N'Enugu',         N'EN',  N'NG', N'400212'),
(23,'Billing',N'18 Ahmadu Bello Way',       NULL, N'Kaduna',        N'KD',  N'NG', N'800212'),
(24,'Billing',N'6 Ring Road (Mobil)',       NULL, N'Ibadan',        N'OY',  N'NG', N'200312'),
(25,'Billing',N'7 Tafawa Balewa Way',       NULL, N'Abuja',         N'FC',  N'NG', N'900112'),
(26,'Billing',N'2 Unity Rd',                NULL, N'Ilorin',        N'KW',  N'NG', N'240101'),
(27,'Billing',N'15 Douglas Rd',             NULL, N'Owerri',        N'IM',  N'NG', N'460281'),
(28,'Billing',N'9 Ijigbo St',               NULL, N'Ado-Ekiti',     N'EK',  N'NG', N'360001'),
(29,'Billing',N'41 Oyemekun Rd',            NULL, N'Akure',         N'ON',  N'NG', N'340001'),
(35,'Billing',N'8 Rue Saint-Malo',          NULL, N'Rennes',        N'BRE', N'FR', N'35000'),
(36,'Billing',N'55 Rue Lecourbe',           NULL, N'Paris',         N'IDF', N'FR', N'75015'),
(37,'Billing',N'19 Rue de Marseille',       NULL, N'Lyon',          N'ARA', N'FR', N'69007'),
(38,'Billing',N'12 Rue d''Alsace Lorraine', NULL, N'Toulouse',      N'OCC', N'FR', N'31000'),
(39,'Billing',N'4 Bd. Gambetta',            NULL, N'Nice',          N'PACA',N'FR', N'06200'),
(40,'Billing',N'6 Rue de Rome',             NULL, N'Marseille',     N'PACA',N'FR', N'13005'),
(41,'Billing',N'Av. Laalou',                NULL, N'Rabat',         N'RS',  N'MA', N'10010'),
(42,'Billing',N'Av. Mohamed Diouri',        NULL, N'Kénitra',       N'KNT', N'MA', N'14000'),
(43,'Billing',N'Av. des FAR',               NULL, N'Casablanca',    N'CAS', N'MA', N'20240'),
(44,'Billing',N'Rue Boujloud',              NULL, N'Fès',           N'FES', N'MA', N'30050'),
(45,'Billing',N'Av. Al Massira Al Khadra',  NULL, N'Agadir',        N'SUS', N'MA', N'80010'),
(46,'Billing',N'Av. Hassan II',             NULL, N'Marrakech',     N'MR',  N'MA', N'40100'),
(47,'Billing',N'Rue Mohamed Derfoufi',      NULL, N'Oujda',         N'ORI', N'MA', N'60010'),
(48,'Billing',N'Place El Hedim',            NULL, N'Meknès',        N'MEK', N'MA', N'50010'),
(49,'Billing',N'Avenue Mohamed V',          NULL, N'Tanger',        N'TNG', N'MA', N'90020'),
(50,'Billing',N'Bd. Ghandi',                NULL, N'Casablanca',    N'CAS', N'MA', N'20230');

SELECT *
FROM Addresses;


/* ============================================================
	find Customers Over 40 Who Ordered Premium Products
   ============================================================ */

SELECT DISTINCT
    c.customer_id, c.full_name, c.age, cat.category_name
FROM dbo.Customers AS c
JOIN dbo.Orders AS o
    ON c.customer_id = o.customer_id
JOIN dbo.OrderDetails AS od
    ON o.order_id = od.order_id
JOIN dbo.Products AS p
    ON od.product_id = p.product_id
JOIN dbo.Category AS cat
    ON p.category_id = cat.category_id
WHERE c.age > 40
  AND cat.category_name = 'Premium';



  /* ============================================================
	Create stored procedures
   ============================================================ */


   /* ========================================================================================================================
    Search the products table by keyword in product name & Returns results ordered by the most recent Order Date.
   ================================================================================================================== */
   CREATE OR ALTER PROCEDURE dbo.USP_SearchProductsByName
    @SearchTerm NVARCHAR(100)   -- e.g. N'phone', N'%TV%'
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.product_id,
        p.product_name,
        p.unit_price,
        MAX(o.order_datetime) AS latest_order_datetime,
        COUNT(DISTINCT o.order_id) AS orders_count
    FROM dbo.Products AS p
    LEFT JOIN dbo.OrderDetails AS od ON od.product_id = p.product_id
    LEFT JOIN dbo.Orders       AS o  ON o.order_id    = od.order_id
    WHERE p.product_name LIKE N'%' + @SearchTerm + N'%'
    GROUP BY p.product_id, p.product_name, p.unit_price
    ORDER BY
        CASE WHEN MAX(o.order_datetime) IS NULL THEN 1 ELSE 0 END,
        MAX(o.order_datetime) DESC,
        p.product_name;
END; Search Products by Name
GO

 /* ============================================================
	EXECUTE stored procedures ; Search Products by Name
   ============================================================ */

 EXEC dbo.USP_SearchProductsByName N'phone';


  /* =====================================================================================
 Return full list of products ordered today for a given customer, including supplier details.
   ===================================================================================== */


CREATE OR ALTER PROCEDURE dbo.CustomerOrdersOnDate
    @CustomerId INT,
    @AsOfDate   DATE = NULL   -- default = today
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @d DATE = COALESCE(@AsOfDate, CONVERT(date, GETDATE()));

    SELECT
        o.order_id,
        o.order_datetime,
        p.product_id,
        p.product_name,
        od.quantity,
        od.unit_price_at_order,
        CAST(od.quantity * od.unit_price_at_order AS DECIMAL(12,2)) AS line_total,
        s.supplier_id,
        s.supplier_name
    FROM dbo.Orders       AS o
    JOIN dbo.OrderDetails AS od ON od.order_id  = o.order_id
    JOIN dbo.Products     AS p  ON p.product_id = od.product_id
    JOIN dbo.Suppliers    AS s  ON s.supplier_id = p.supplier_id
    WHERE o.customer_id = @CustomerId
      AND CONVERT(date, o.order_datetime) = @d
    ORDER BY o.order_datetime DESC, p.product_name;
END;
GO

/* ============================================================
	EXECUTE stored procedures ; Get Specific Orders for a Customer
   ============================================================ */
EXEC dbo.CustomerOrdersOnDate @CustomerId = 3, @AsOfDate = '2025-09-08 10:00:00.0000000';



 SELECT * 
	FROM dbo.Orders       AS o
    JOIN dbo.OrderDetails AS od ON od.order_id  = o.order_id
    JOIN dbo.Products     AS p  ON p.product_id = od.product_id
    JOIN dbo.Suppliers    AS s  ON s.supplier_id = p.supplier_id


   /* ===========================================================================
    Updates the details of an existing supplier (name, phone, address, etc.)
   ============================================================================ */
   CREATE OR ALTER PROCEDURE dbo.USP_UpdateSupplier
    @SupplierId   INT,
    @SupplierName NVARCHAR(100) = NULL,
    @Phone        NVARCHAR(30)  = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF NOT EXISTS (SELECT 1 FROM dbo.Suppliers WHERE supplier_id = @SupplierId)
        BEGIN
            RAISERROR(N'Supplier %d not found.', 11, 1, @SupplierId);
            ROLLBACK TRAN; RETURN;
        END

        UPDATE dbo.Suppliers
        SET supplier_name = COALESCE(@SupplierName, supplier_name),
            phone         = COALESCE(@Phone,        phone)
        WHERE supplier_id = @SupplierId;

        COMMIT TRAN;

        -- return updated row
        SELECT supplier_id, supplier_name, phone
        FROM dbo.Suppliers
        WHERE supplier_id = @SupplierId;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 11, 1);
    END CATCH
END;
GO

/* ============================================================
	EXECUTE stored procedures ; Update Supplier Details
   ============================================================ */

EXEC dbo.USP_UpdateSupplier @SupplierId=403, @SupplierName=N'SioPrime Distributors';


 EXEC dbo.USP_UpdateSupplier @SupplierId=405, @Phone=N'06-28-44-19-72';



    /* ============================================================
    Deletes an order from the database only if status is 'Delivered'.
   ============================================================ */
   CREATE OR ALTER PROCEDURE dbo.USP_DeleteDeliveredOrder
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF NOT EXISTS (SELECT 1 FROM dbo.Orders WHERE order_id = @OrderId)
        BEGIN
            RAISERROR(N'Order %d not found.', 11, 1, @OrderId);
            ROLLBACK TRAN; RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Orders WHERE order_id = @OrderId AND status = N'Delivered')
        BEGIN
            RAISERROR(N'Order %d is not Delivered and cannot be deleted.', 11, 1, @OrderId);
            ROLLBACK TRAN; RETURN;
        END

        DELETE FROM dbo.ProductReviews      WHERE order_id = @OrderId;
        DELETE FROM dbo.OrderStatusHistory  WHERE order_id = @OrderId;
        DELETE FROM dbo.OrderDetails        WHERE order_id = @OrderId;
        DELETE FROM dbo.Orders              WHERE order_id = @OrderId;

        COMMIT TRAN;

        SELECT @OrderId AS deleted_order_id, N'Deleted (status was Delivered)' AS result;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 11, 1);
    END CATCH
END;
GO

/* ============================================================
	EXECUTE stored procedures ; Delete Delivered Order
   ============================================================ */
EXEC dbo.USP_DeleteDeliveredOrder @OrderId = 701;



/* ============================================================
	CREATE VIEW
   ============================================================ */
/* ======================================================================================================================
     Displays Order Date, Total Cost, Product Category, Supplier Name, and any associated product reviews.
             Used for reporting all past and current orders.
   ====================================================================================================================== */
CREATE OR ALTER VIEW dbo.vw_OrderOverview
AS
SELECT
    o.order_id,
    o.order_datetime,
    o.status,
    o.customer_id,
    c.full_name AS customer_name,

    -- product + line info
    od.product_id,
    p.product_name,
    cat.category_name,
    s.supplier_name,

    od.quantity,
    od.unit_price_at_order,
    CAST(od.quantity * od.unit_price_at_order AS DECIMAL(12,2)) AS line_total,

    -- order total across all products in the order
    CAST(
        SUM(od.quantity * od.unit_price_at_order)
        OVER (PARTITION BY o.order_id)
        AS DECIMAL(14,2)
    ) AS order_total,

    -- review 
    pr.rating       AS review_rating,
    pr.comment      AS review_comment,
    pr.created_at   AS review_created_at
FROM dbo.Orders        AS o
JOIN dbo.Customers     AS c   ON c.customer_id   = o.customer_id
JOIN dbo.OrderDetails  AS od  ON od.order_id     = o.order_id
JOIN dbo.Products      AS p   ON p.product_id    = od.product_id
JOIN dbo.Category      AS cat ON cat.category_id = p.category_id
JOIN dbo.Suppliers     AS s   ON s.supplier_id   = p.supplier_id
LEFT JOIN dbo.ProductReviews AS pr
       ON pr.order_id    = o.order_id
      AND pr.product_id  = p.product_id
      AND pr.customer_id = o.customer_id;

 /* ============================================================
	vw_CustomerOrdersSummary
   ============================================================ */ 

	  SELECT DISTINCT order_id, order_datetime, order_total
FROM dbo.vw_OrderOverview
ORDER BY order_datetime DESC, order_id;


SELECT *
FROM dbo.vw_OrderOverview
ORDER BY order_datetime DESC, order_id, product_name;


/* ============================================================
	Create TRIGGERS 
   ============================================================ */

/* ============================================================
	Create TRIGGERS 
	TO RESTORE STOCKS THAT WHERE CANCELLED
   ============================================================ */

   GO
CREATE TRIGGER trg_RestoreStockOnCancel
ON dbo.Orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check only cancelled orders
    IF UPDATE(status)
    BEGIN
        UPDATE s
        SET s.stock_level = s.stock_level + od.quantity
        FROM dbo.Stock AS s
        INNER JOIN dbo.OrderDetails AS od ON s.product_id = od.product_id
        INNER JOIN inserted i ON i.order_id = od.order_id
        WHERE i.status = 'Cancelled';
    END
END;
GO

