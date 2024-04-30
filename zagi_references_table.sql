CREATE TABLE CALENDAR_Dimension (
CalendarKey	INT	NOT NULL	IDENTITY(1, 1),
FullDate	Date	NOT NULL,
DayOfWeek	Char(12)	NOT NULL,
DayOfMonth	INT	NOT NULL,
Month	Char(12)	NOT NULL,
Quarter	INT	NOT NULL,
Year	INT	NOT NULL,
CONSTRAINT	Calendar_PK	PRIMARY KEY	(CalendarKey));

CREATE TABLE STORE_Dimension (
StoreKey	INT	NOT NULL	IDENTITY(1, 1),
StoreID	Char(2)	NOT NULL,
StoreZip	INT	NOT NULL,
StoreRegionName	Char(20)	NOT NULL,
CONSTRAINT	Store_PK	PRIMARY KEY	(StoreKey));

CREATE TABLE CUSTOMER_Dimension (
CustomerKey	INT	NOT NULL	IDENTITY(1, 1),
CustomerID	Char(10)	NOT NULL,
CustomerName	Char(15)	NOT NULL,
CustomerZip	INT	NOT NULL,
CONSTRAINT Customer_PK PRIMARY KEY	(CustomerKey));

CREATE TABLE PRODUCT_Dimension (
ProductKey	INT	NOT NULL	IDENTITY(1,1),
ProductID	Char(3)	NOT NULL,
ProductName	Char(20)	NOT NULL,
ProductPrice	Numeric(7, 2)	NOT NULL,
ProductVendorName	Char(20)	NOT NULL,
ProductCategoryName	Char(15)	NOT NULL,
CONSTRAINT Product_PK PRIMARY KEY (ProductKey));

CREATE TABLE SALES_Fact (
CalendarKey	INT	NOT NULL,
StoreKey	INT	NOT NULL,
CustomerKey	INT	NOT NULL,
ProductKey	INT	NOT NULL,
DollarsSold	Money	NOT NULL,
UnitsSold	INT	NOT NULL,
CONSTRAINT Sales_PK PRIMARY KEY	(CalendarKey, StoreKey, CustomerKey, ProductKey),
CONSTRAINT Calendar_FK FOREIGN KEY	(CalendarKey)	REFERENCES CALENDAR_Dimension (CalendarKey),
CONSTRAINT Store_FK	FOREIGN KEY	(StoreKey)	REFERENCES STORE_Dimension	(StoreKey),
CONSTRAINT	Customer_FK	FOREIGN KEY	(CustomerKey)	REFERENCES Customer_Dimension	(CustomerKey),
CONSTRAINT Product_FK	FOREIGN KEY	(ProductKey)	REFERENCES PRODUCT_Dimension	(ProductKey));

SELECT *
FROM CUSTOMER;

SELECT StoreID, StoreZip, RegionName
FROM STORE, REGION
WHERE STORE.RegionID=REGION.RegionID;

SELECT ProductID, ProductName, ProductPrice, VendorName, CategoryName
FROM PRODUCT, CATEGORY, VENDOR
WHERE PRODUCT.VendorID=VENDOR.VendorID
AND PRODUCT.CategoryID=CATEGORY.CategoryID;


INSERT INTO REGION
VALUES ('C', 'Chicagoland'),
('T', 'Tristate');

INSERT INTO STORE
VALUES ('S1', 60600, 'C'),
('S2', 60605, 'C'),
('S3', 35400, 'T');

INSERT INTO CATEGORY
VALUES ('CP', 'Camping'),
('FW', 'Footware');

INSERT INTO VENDOR
VALUES ('PG', 'Pacific Gear'),
('MK', 'Mountain King');

INSERT INTO CUSTOMER
VALUES ('1-2-333', 'Tina', 60137),
('2-3-444', 'Tony', 60611),
('3-4-555', 'Pam', 35401);

INSERT INTO PRODUCT
VALUES ('1X1', 'Zzz Bag', 100, 'PG', 'CP'),
('2X2', 'Easy Boot', 70, 'MK', 'FW'),
('3X3', 'Cosy Sock', 15, 'MK', 'FW'),
('4X4', 'Dura Boot', 90, 'PG', 'FW'),
('5X5', 'Tiny Tent', 150, 'MK', 'CP'),
('6X6', 'Biggy Tent', 250, 'MK', 'CP');

INSERT INTO SALESTRANSACTION
VALUES ('T111', '1-2-333', 'S1', '2020-01-01'),
('T222', '2-3-444', 'S2', '2020-01-01'),
('T333', '1-2-333', 'S3', '2020-01-02'),
('T444', '3-4-555', 'S3', '2020-01-02'),
('T555', '2-3-444', 'S3', '2020-01-02');

INSERT INTO INCLUDES
VALUES ('1X1', 'T111', 1),
('2X2', 'T222', 1),
('3X3', 'T333', 5),
('1X1', 'T333', 1),
('4X4', 'T444', 1),
('2X2', 'T444', 2),
('4X4', 'T555', 4),
('5X5', 'T555', 2),
('6X6', 'T555', 1);
