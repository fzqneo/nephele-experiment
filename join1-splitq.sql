.timer ON
.headers ON
.print "should clear page cache"

.print "Attaching orders"
ATTACH '/mnt/orders-mnt/tpch10g-orders.sqlite' AS ordersdb;

.print "create intermediate table"
CREATE TABLE intermediate (o_orderkey INTEGER NOT NULL);

.print "filter join keys"
INSERT INTO intermediate 
    SELECT o_orderkey 
    FROM ordersdb.orders
    WHERE o_orderdate <= date("1992-01-25");

.print "detach orders"    
DETACH ordersdb;

.print "!!!TIME TO HANDOFF"

.print "Attaching lineitem"
ATTACH '/mnt/lineitem-mnt/tpch10g-lineitem.sqlite' AS lineitemdb; 

.print "perform join"
SELECT  avg(l_extendedprice), sum(l_quantity), count(*)
FROM lineitemdb.lineitem as l, intermediate as o
where l.l_orderkey=o.o_orderkey;

.print "clean up"
DROP TABLE intermediate;
DETACH lineitemdb;
