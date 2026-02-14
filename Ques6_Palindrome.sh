#!/bin/bash
# Read input from user
echo -n "Enter a string: "
read str
# Reverse the string
rev_str=$(echo "$str" | rev)

# Check if the original string and reversed string are the same
if [ "$str" == "$rev_str" ]; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi
