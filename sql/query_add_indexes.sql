CREATE INDEX idx_lineitem_partkey ON lineitem (l_partkey); -- Q1
CREATE INDEX idx_part_type ON part (p_type); -- Q1
CREATE INDEX idx_supplier_nationkey ON supplier (s_nationkey); -- Q1
CREATE INDEX idx_customer_name ON customer (c_name); -- Q3
CREATE INDEX idx_orders_custkey ON orders (o_custkey); -- Q3
CREATE INDEX idx_lineitem_orderkey ON lineitem (l_orderkey); -- Q3