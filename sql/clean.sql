-- query_drop_indexes.sql
DROP INDEX IF EXISTS idx_lineitem_partkey; -- Q1
DROP INDEX IF EXISTS idx_part_type; -- Q1
DROP INDEX IF EXISTS idx_supplier_nationkey; -- Q1
DROP INDEX IF EXISTS idx_customer_name; -- Q3
DROP INDEX IF EXISTS idx_orders_custkey; -- Q3
DROP INDEX IF EXISTS idx_lineitem_orderkey; -- Q3

--- query1_drop_mv_indexes.sql
DROP INDEX IF EXISTS idx_lineitem_partkey;
DROP INDEX IF EXISTS idx_part_type;
DROP INDEX IF EXISTS idx_supplier_nationkey;
DROP INDEX IF EXISTS idx_customer_custkey;

--- query3_drop_mv_indexes.sql
DROP INDEX IF EXISTS idx_customer_name;

--- mvs
DROP MATERIALIZED VIEW IF EXISTS mv_q1;
DROP MATERIALIZED VIEW IF EXISTS mv_q3;