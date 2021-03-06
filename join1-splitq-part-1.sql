.timer ON
.headers ON

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
