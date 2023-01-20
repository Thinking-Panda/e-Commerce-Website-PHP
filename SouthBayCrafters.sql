DROP DATABASE IF EXISTS craft_store;
CREATE DATABASE craft_store;
USE craft_store;

CREATE USER 'user_a' IDENTIFIED BY 'jellyfish';
Grant SELECT,UPDATE,INSERT,DELETE on * to 'user_a';

-- Creating Tables for the Database
CREATE TABLE customers (
customerID        INT            NOT NULL   AUTO_INCREMENT,  
  pwd      VARCHAR(60)    NOT NULL,
  firstName         VARCHAR(60)    NOT NULL,
  lastName          VARCHAR(60)    NOT NULL,
  emailAddress      VARCHAR(255)   NOT NULL,
  shipAddressID     INT                       DEFAULT NULL,
  billingAddressID  INT                       DEFAULT NULL,  
  addressID  INT                       DEFAULT NULL,  
  PRIMARY KEY (customerID)
-- UNIQUE INDEX emailAddress (emailAddress)
);

SELECT * FROM customers;

CREATE TABLE categories (
  categoryID        INT            NOT NULL   AUTO_INCREMENT,
  categoryName      VARCHAR(255)   NOT NULL,
  PRIMARY KEY (categoryID)
);

CREATE TABLE products (
  productID         INT            NOT NULL   AUTO_INCREMENT,
  categoryID        INT            NOT NULL,
  productCode       VARCHAR(10)    NOT NULL,
  productName       VARCHAR(255)   NOT NULL,
  prodDescription       TEXT           NOT NULL,
  listPrice         DECIMAL(10,2)  NOT NULL,
  -- discountPercent   DECIMAL(10,2)  NOT NULL   DEFAULT 0.00,
  -- dateAdded         DATETIME       NOT NULL,
  PRIMARY KEY (productID), 
  FOREIGN KEY (categoryID) REFERENCES categories (categoryID),
  INDEX categoryID (categoryID), 
  UNIQUE INDEX productCode (productCode)
);

CREATE TABLE administrators (
  adminID           INT            NOT NULL   AUTO_INCREMENT,
  emailAddress      VARCHAR(255)   NOT NULL,
  pwd          VARCHAR(255)   NOT NULL,
  firstName         VARCHAR(255)   NOT NULL,
  lastName          VARCHAR(255)   NOT NULL,
  PRIMARY KEY (adminID)
);

CREATE TABLE addresses (
  addressID         INT            NOT NULL   AUTO_INCREMENT,
  customerID        INT            NOT NULL,
  line1             VARCHAR(60)    NOT NULL,
  line2             VARCHAR(60)               DEFAULT NULL,
  city              VARCHAR(40)    NOT NULL,
  state             VARCHAR(2)     NOT NULL,
  zipCode           VARCHAR(10)    NOT NULL,
  phone             VARCHAR(12)    NOT NULL,
  disabled          TINYINT(1)     NOT NULL   DEFAULT 0,
  PRIMARY KEY (addressID),
  FOREIGN KEY (customerID) REFERENCES customers (customerID),
  INDEX customerID (customerID)
);

CREATE TABLE orders (
  orderID           INT            NOT NULL   AUTO_INCREMENT,
  customerID        INT            NOT NULL,
  orderDate         DATETIME       NOT NULL,
  shipAmount        DECIMAL(10,2)  NOT NULL,
  taxAmount         DECIMAL(10,2)  NOT NULL,
  shipDate          DATETIME                  DEFAULT NULL,
  shipAddressID     INT            NOT NULL,
  cardType          INT            NOT NULL,
  cardNumber        CHAR(16)       NOT NULL,
  cardExpires       CHAR(7)        NOT NULL,
  billingAddressID  INT            NOT NULL,
  PRIMARY KEY (orderID), 
  FOREIGN KEY (customerID) REFERENCES customers (customerID),
  INDEX customerID (customerID)
);

CREATE TABLE orderItems (
  itemID            INT            NOT NULL   AUTO_INCREMENT,
  orderID           INT            NOT NULL,
  productID         INT            NOT NULL,
  itemPrice         DECIMAL(10,2)  NOT NULL,
  -- discountAmount    DECIMAL(10,2)  NOT NULL,
  quantity          INT NOT NULL,
  PRIMARY KEY (itemID), 
  FOREIGN KEY (productID) REFERENCES products (productID),
   FOREIGN KEY (orderID) REFERENCES orders (orderID),
  INDEX orderID (orderID), 
  INDEX productID (productID)
);
SELECT * FROM orderitems;
DROP TABLE orderitems;

INSERT INTO categories VALUES
(1, 'Wood Carving'),
(2, 'Decorations'),
(3, 'Jewelry');
SELECT * FROM categories;
INSERT INTO products VALUES
(1, 1, 'star', '2D Star', 'A two dimensional star carved from teak wood.','15.00'),
(2, 1, 'duck', '3D Duck','A three dimensional duck carve from rose wood.', '15.00'),
(3, 1, 'frame', 'Picture Frame', 'A wooden picture frame with intrinsic design','25.00'),
(4, 1, 'bunny', 'Bunny', 'A mother and baby duo bunny','20.00'),
(5, 2, 'flower', 'Flower Painting','Beautifully painted flower using acrylic colors', '35.99'),
(6, 2, 'shells', 'Quilled Shell', 'Paper quilled shell with  tranquilising effect','20.00'),
(7, 2, 'macrame', 'Macrame', 'Macrame wall hanging ','14.99'),
(8, 3, 'pinkBeads', 'Pink Necklace', 'A pink necklace with synthetic beads','24.99'),
(9, 3, 'greenBeads', 'Emerald Necklace','A green necklace with glass beads', '24.99'),
(10, 3, 'turqBeads', 'Turquoise Necklace','a boho necklace', '24.99');
SELECT * FROM products;


