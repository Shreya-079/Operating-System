#!/bin/bash
# Function to calculate Fibonacci sequence
fibonacci() {
    n=$1
    a=0
    b=1
    echo "Fibonacci sequence up to $n terms:"
    for (( i=0; i<n; i++ ))
    do
        echo -n "$a "
        fn=$((a + b))
        a=$b
        b=$fn
    done
    echo ""
}

# Read number of terms from user
echo -n "Enter the number of terms: "
read num

# Validate input
if [[ $num =~ ^[0-9]+$ && $num -gt 0 ]]; then
    fibonacci $num
else
    echo "Please enter a valid positive integer."
fi
