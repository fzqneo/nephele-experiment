ATTACH 'tpch1g-orders.sqlite' AS ordersdb;
ATTACH 'tpch1g-lineitem.sqlite' AS lineitemdb; 

SELECT  avg(l_extendedprice), sum(l_quantity), count(*)
FROM lineitemdb.lineitem as l, ordersdb.orders as o
where l.l_orderkey=o.o_orderkey and o.o_orderdate <= date("1994-12-01");

DETACH ordersdb;
DETACH lineitemdb;
