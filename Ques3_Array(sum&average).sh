#!/bin/bash
# Prompt user to enter numbers
read -p "Enter numbers separated by spaces: " -a numbers
# Initialize sum variable
sum=0
# Get the length of the array
count=${#numbers[@]}
# Loop through array elements to calculate sum
for num in "${numbers[@]}"; do
    sum=$((sum + num))
done

# Calculate average
average=$(echo "scale=2; $sum / $count" | bc)

# Display results
echo "Sum: $sum"
echo "Average: $average"
