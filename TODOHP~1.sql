--18
SELECT P.NAME,SUM(OI.QUANTITY) AS CANTIDAD_TOTAL
FROM PRODUCTS P
 JOIN ORDER_ITEMS OI ON P.PRODID=OI.PRODID
GROUP BY P.NAME;

--19


SELECT ename
FROM EMPLOYEES
WHERE hiredate > (SELECT MIN(order_date) FROM ORDERS);

--20
SELECT C.CNAME
FROM customers C
WHERE C.CUSTID = (
SELECT O.CUSTID FROM ORDERS O WHERE O.ORDID=(
SELECT T.ORDID FROM TRANSACTIONS T WHERE T.TRANSID IS NULL));


SELECT DISTINCT C.cname
FROM CUSTOMERS C
JOIN ORDERS O ON C.custid = O.custid
LEFT JOIN TRANSACTIONS T ON O.ordid = T.ordid
WHERE T.transid IS NULL;