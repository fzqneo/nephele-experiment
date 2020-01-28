SELECT  avg(l_extendedprice), sum(l_quantity), count(*)
FROM lineitem as l, orders as o
where l.l_orderkey=o.o_orderkey and o.o_orderdate <= date("1994-12-01");
