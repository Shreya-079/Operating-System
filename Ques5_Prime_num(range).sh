#!/bin/bash
# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ "$num" -lt 2 ]; then
        return 1  # Not prime
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1  # Not prime
        fi
    done
    return 0  # Prime
}
# Get user input for range
echo -n "Enter the lower bound: "
read lower
echo -n "Enter the upper bound: "
read upper
# Validate input
if ! [[ "$lower" =~ ^[0-9]+$ ]] || ! [[ "$upper" =~ ^[0-9]+$ ]] || [ "$lower" -gt "$upper" ]; then
    echo "Invalid input. Please enter valid numerical bounds."
    exit 1
fi
# Find prime numbers in the given range
echo "Prime numbers between $lower and $upper are:"
for ((num = lower; num <= upper; num++)); do
    if is_prime "$num"; then
        echo -n "$num "
    fi
done
echo  # Print newline
