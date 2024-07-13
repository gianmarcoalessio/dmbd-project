# !/bin/bash

source utils.sh

# Function to execute SQL queries from a file multiple times and calculate the mean of 'real' time
execute_query_file_time_rep() {
    local sql_file=$1
    local times=$2
    local total_real=0
    local real_time=0

    for ((i=0; i<times; i++)); do
        # Capture the 'real' time using 'time' command and extract it
        real_time=$( (time psql -U $db_user -d $db_name -f "$sql_file" > /dev/null) 2>&1 | grep real | awk '{print $2}' | sed 's/m/*60+/g;s/s//')
        # Convert 'real' time to seconds
        real_time=$(echo "$real_time" | bc)
        # Accumulate 'real' time
        total_real=$(echo "$total_real + $real_time" | bc)
    done

    # Calculate mean of 'real' time
    local mean_real=$(echo "scale=3; $total_real / $times" | bc)

    echo "Mean of 'real' time over $times runs: $mean_real seconds"
}

################# 

# Step 1: Add "EXPLAIN ANALYZE" at the beginning of the file
echo "EXPLAIN ANALYZE" | cat - "./sql/query1a.sql" > ./sql/query1a_tmp.sql && mv ./sql/query1a_tmp.sql ./sql/query1a.sql

# Step 2: Execute the query file and save the output to a file
execute_query_file "./sql/query1a.sql" > "./results/delme_query1a_output.txt"

# Add indexes for queries
execute_query_file "./sql/query_add_indexes.sql"
# Step 2: Execute the query file and save the output to a file
execute_query_file "./sql/query1a.sql" > "./results/delme_query1a_idx_output.txt"
# Remove indexes for queries
execute_query_file "./sql/query_drop_indexes.sql"

# Step 3: Remove "EXPLAIN ANALYZE" from the beginning of the file
tail -n +2 "./sql/query1a.sql" > ./sql/query1a_tmp.sql && mv ./sql/query1a_tmp.sql ./sql/query1a.sql

