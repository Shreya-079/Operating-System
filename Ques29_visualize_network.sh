#!/bin/bash

# File to store network data
DATA_FILE="network_data.txt"
PLOT_SCRIPT="network_plot.gp"

# Cleanup previous data
echo "# Time Established_Connections" > $DATA_FILE
# Collect network data every second for 30 seconds
for i in {1..30}; do
    TIME=$(date +%H:%M:%S)
    CONNECTIONS=$(ss -H state established | wc -l)
    echo "$TIME $CONNECTIONS" >> $DATA_FILE
    sleep 1
done

# Generate gnuplot script
cat << EOF > $PLOT_SCRIPT
set terminal png size 800,600
set output 'network_graph.png'
set title "Network Connections Over Time"
set xlabel "Time"
set ylabel "Number of Established Connections"
set xdata time
set timefmt "%H:%M:%S"
set format x "%H:%M:%S"
set grid
plot "$DATA_FILE" using 1:2 with lines title "Connections"
EOF
# Run gnuplot
gnuplot $PLOT_SCRIPT

echo "Graph saved as network_graph.png"
