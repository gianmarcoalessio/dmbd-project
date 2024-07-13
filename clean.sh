source utils.sh

# execute_query_file "./sql/query3a.sql" > ./results/query3a_clean_$timestamp.txt

# # Create indexes for Query 1
# execute_query_file "./sql/query3_add_indexes.sql"
# execute_query_file "./sql/query3a.sql" > ./results/query3a_indexed_$timestamp.txt
# # Remove indexes for Query 3
# execute_query_file "./sql/query3_drop_indexes.sql"

# # Create mv
# execute_query_file "./sql/query3a_create_mv.sql"
# execute_query_file "./sql/query3a_mv.sql" > ./results/query3a_mv_$timestamp.txt

# # Create indexes for Query 1
# execute_query_file "./sql/query3_mv_add_indexes.sql"
# execute_query_file "./sql/query3a_mv.sql" > ./results/query3a_mv_indexed_$timestamp.txt
# execute_query_file "./sql/query3_mv_drop_indexes.sql"

# # Big Materialized View
# execute_query_file "./sql/query_create_bigmv.sql"

# # Query 3 materialized view
# execute_query_file "./sql/query3a_bigmv.sql" > ./results/query3_bigmv_$timestamp.txt

# # Add indexes for Query 3 materialized view
# execute_query_file "./sql/query3_mv_add_indexes.sql"

# # Query 3 materialized view
# execute_query_file "./sql/query3a_bigmv.sql" > ./results/query3_bigmv_indexed_$timestamp.txt


# Horizontal Fragmentation
execute_query_file "./sql/create_horizontal_fragmentation.sql"

# Query 1
execute_query_file "./sql/query1a_hf.sql" > ./results/query1a_hf_$timestamp.txt
# Query 3
execute_query_file "./sql/query3a_hf.sql" > ./results/query3a_hf_$timestamp.txt

# # Create indexes for Query 1a
# execute_query_file "./sql/query1_add_indexes.sql"
# execute_query_file "./sql/query1a.sql" > ./results/query1a_indexed_$timestamp.txt
# # Remove indexes for Query 1a
# execute_query_file "./sql/query1_drop_indexes.sql"
# 4er
# # Create mv
# execute_query_file "./sql/query1a_create_mv.sql"
# execute_query_file "./sql/query1a_mv.sql" > ./results/query1a_mv_$timestamp.txt

# # Create indexes for Query 1a
# execute_query_file "./sql/query1_mv_add_indexes.sql"
# execute_query_file "./sql/query1a_mv.sql" > ./results/query1a_mv_indexed_$timestamp.txt
# execute_query_file "./sql/query1_mv_drop_indexes.sql"

# # Big Materialized view
# execute_query_file "./sql/query_create_bigmv.sql"

# # Query 1a materialized view
# execute_query_file "./sql/query1a_bigmv.sql" > ./results/query1a_bigmv_$timestamp.txt

# # Add indexes for Query 1a materialized view
# execute_query_file "./sql/query1_mv_add_indexes.sql"

# # Query 1a materialized view
# execute_query_file "./sql/query1a_bigmv.sql" > ./results/query1a_bigmv_indexed_$timestamp.txt


# Remove indexes for Query 1
execute_query_file "./sql/query1_drop_indexes.sql"

# Remove indexes for Query 3
execute_query_file "./sql/query3_drop_indexes.sql"

# Remove indexes for Query 1 materialized view
execute_query_file "./sql/query1_mv_drop_indexes.sql"

# Remove indexes for Query 3 materialized view
execute_query_file "./sql/query3_mv_drop_indexes.sql"

# Query materialized view
execute_query_v "DROP MATERIALIZED VIEW big_view;"

# Query materialized view
execute_query "DROP MATERIALIZED VIEW mv_query1;"

# Query materialized view
execute_query "DROP MATERIALIZED VIEW mv_query3;"

# Drop partitioned table
execute_query_file "./sql/drop_horizontal_fragmentation.sql"