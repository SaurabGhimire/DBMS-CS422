#!/bin/bash

# Define the number of times to run the queries
NUM_RUNS=1000
current_dir=$(pwd)
# echo "Current directory: $current_dir"
start_time_ms=$(mysql -u "yogen" -p"dat@123" -h localhost  DBMS_CS422_TX_INDEX -sN -e "SELECT UNIX_TIMESTAMP(NOW(4)) as start_time_ms;")
# Loop through the specified number of times
for ((i=1; i<=$NUM_RUNS; i++)); do
    echo "Executing Query Run $i"

    # Run the MySQL queries (replace with your MySQL command)
    mysql -u "yogen" -p"dat@123" -h localhost  DBMS_CS422_TX_INDEX -e "source $current_dir/Project2/queries.sql;"

    # Sleep for a brief period between runs (optional)
    # sleep 1
done
end_time_ms=$(mysql -u "yogen" -p"dat@123" -h localhost  DBMS_CS422_TX_INDEX -sN -e "SELECT UNIX_TIMESTAMP(NOW(4)) as end_time_ms;")
difference_ms=$(echo "$end_time_ms - $start_time_ms" | bc)
echo "All Query Runs Completed $difference_ms"
