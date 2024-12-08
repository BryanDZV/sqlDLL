-- Eliminar las tablas en el orden correcto
DROP TABLE ORDER_ITEMS CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENTS CASCADE CONSTRAINTS;
DROP TABLE SALGRADES CASCADE CONSTRAINTS;
DROP TABLE PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;


-- Crear tabla CUSTOMERS
CREATE TABLE CUSTOMERS (
    custid INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Insertar datos en CUSTOMERS
INSERT INTO CUSTOMERS (custid, name, city) VALUES (1, 'Alice', 'New York');
INSERT INTO CUSTOMERS (custid, name, city) VALUES (2, 'Bob', 'Los Angeles');
INSERT INTO CUSTOMERS (custid, name, city) VALUES (3, 'Charlie', 'Chicago');
INSERT INTO CUSTOMERS (custid, name, city) VALUES (4, 'Diana', 'Houston');

-- Crear tabla ORDERS
CREATE TABLE ORDERS (
    ordid INT PRIMARY KEY,
    custid INT,
    order_date DATE,
    FOREIGN KEY (custid) REFERENCES CUSTOMERS(custid)
);

-- Insertar datos en ORDERS
INSERT INTO ORDERS (ordid, custid, order_date) VALUES (101, 1, TO_DATE('2024-11-01', 'YYYY-MM-DD'));
INSERT INTO ORDERS (ordid, custid, order_date) VALUES (102, 2, TO_DATE('2024-11-02', 'YYYY-MM-DD'));
INSERT INTO ORDERS (ordid, custid, order_date) VALUES (103, 3, TO_DATE('2024-11-03', 'YYYY-MM-DD'));
INSERT INTO ORDERS (ordid, custid, order_date) VALUES (104, 2, TO_DATE('2024-11-04', 'YYYY-MM-DD'));

-- Crear tabla PRODUCTS
CREATE TABLE PRODUCTS (
    prodid INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Insertar datos en PRODUCTS
INSERT INTO PRODUCTS (prodid, name, price) VALUES (1, 'Laptop', 1200.50);
INSERT INTO PRODUCTS (prodid, name, price) VALUES (2, 'Mouse', 25.75);
INSERT INTO PRODUCTS (prodid, name, price) VALUES (3, 'Keyboard', 45.60);
INSERT INTO PRODUCTS (prodid, name, price) VALUES (4, 'Monitor', 300.00);

-- Crear tabla ORDER_ITEMS
CREATE TABLE ORDER_ITEMS (
    ordid INT,
    prodid INT,
    quantity INT,
    PRIMARY KEY (ordid, prodid),
    FOREIGN KEY (ordid) REFERENCES ORDERS(ordid),
    FOREIGN KEY (prodid) REFERENCES PRODUCTS(prodid)
);

-- Insertar datos en ORDER_ITEMS
INSERT INTO ORDER_ITEMS (ordid, prodid, quantity) VALUES (101, 1, 1);
INSERT INTO ORDER_ITEMS (ordid, prodid, quantity) VALUES (101, 2, 2);
INSERT INTO ORDER_ITEMS (ordid, prodid, quantity) VALUES (102, 3, 1);
INSERT INTO ORDER_ITEMS (ordid, prodid, quantity) VALUES (103, 4, 1);
INSERT INTO ORDER_ITEMS (ordid, prodid, quantity) VALUES (104, 2, 4);

-- Crear tabla EMPLOYEES
CREATE TABLE EMPLOYEES (
    empno INT PRIMARY KEY,
    ename VARCHAR(100),
    sal DECIMAL(10, 2),
    deptno INT,
    mgr INT
);

-- Insertar datos en EMPLOYEES
INSERT INTO EMPLOYEES (empno, ename, sal, deptno, mgr) VALUES (1, 'John', 5000, 10, NULL);
INSERT INTO EMPLOYEES (empno, ename, sal, deptno, mgr) VALUES (2, 'Jane', 4500, 20, 1);
INSERT INTO EMPLOYEES (empno, ename, sal, deptno, mgr) VALUES (3, 'Mike', 3000, 10, 1);
INSERT INTO EMPLOYEES (empno, ename, sal, deptno, mgr) VALUES (4, 'Anna', 3500, 20, 2);

-- Crear tabla DEPARTMENTS
CREATE TABLE DEPARTMENTS (
    deptno INT PRIMARY KEY,
    dname VARCHAR(100),
    loc VARCHAR(100)
);

-- Insertar datos en DEPARTMENTS
INSERT INTO DEPARTMENTS (deptno, dname, loc) VALUES (10, 'IT', 'New York');
INSERT INTO DEPARTMENTS (deptno, dname, loc) VALUES (20, 'HR', 'Los Angeles');
INSERT INTO DEPARTMENTS (deptno, dname, loc) VALUES (30, 'Finance', 'Chicago');

-- Crear tabla SALGRADES
CREATE TABLE SALGRADES (
    grade INT PRIMARY KEY,
    losal DECIMAL(10, 2),
    hisal DECIMAL(10, 2)
);

-- Insertar datos en SALGRADES
INSERT INTO SALGRADES (grade, losal, hisal) VALUES (1, 1000, 2000);
INSERT INTO SALGRADES (grade, losal, hisal) VALUES (2, 2001, 3000);
INSERT INTO SALGRADES (grade, losal, hisal) VALUES (3, 3001, 4000);
INSERT INTO SALGRADES (grade, losal, hisal) VALUES (4, 4001, 5000);
INSERT INTO SALGRADES (grade, losal, hisal) VALUES (5, 5001, 6000);
