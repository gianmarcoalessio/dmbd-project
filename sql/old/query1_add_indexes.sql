CREATE INDEX idx_lineitem_partkey ON lineitem (l_partkey);
CREATE INDEX idx_orders_custkey ON orders (o_custkey);
CREATE INDEX idx_part_type_partkey ON part (p_type, p_partkey);
CREATE INDEX idx_supplier_nationkey_suppkey ON supplier (s_nationkey, s_suppkey); 

