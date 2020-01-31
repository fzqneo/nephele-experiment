.print "Attaching lineitem"
ATTACH '/mnt/lineitem-mnt/tpch1g-lineitem.sqlite' AS lineitemdb; 

.print "perform join"
SELECT  avg(l_extendedprice), sum(l_quantity), count(*)
FROM lineitemdb.lineitem as l, intermediate as o
where l.l_orderkey=o.o_orderkey;

.print "clean up"
DROP TABLE intermediate;
DETACH lineitemdb;
