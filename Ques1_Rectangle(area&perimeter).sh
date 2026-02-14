#!/bin/bash
# Function to calculate Area and Perimeter of a Rectangle
calculate_rectangle() {
    echo "Enter the length of the rectangle:"
    read length
    echo "Enter the width of the rectangle:"
    read width
    # Calculate Area (A = length * width)
    area=$((length * width))
    # Calculate Perimeter (P = 2 * (length + width))
    perimeter=$((2 * (length + width)))
    echo "The Area of the Rectangle is: $area"
    echo "The Perimeter of the Rectangle is: $perimeter"
}
calculate_rectangle         # Call the function
