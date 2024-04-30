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

