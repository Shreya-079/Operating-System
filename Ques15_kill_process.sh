#!/bin/bash
kill_by_name() {
    read -p "Enter process name: " pname
    pids=$(pgrep "$pname")
    if [ -z "$pids" ]; then
        echo "No process found with name: $pname"
    else
        echo "Killing processes: $pids"
        kill -9 $pids
        echo "Process(es) killed."
    fi
}
# Function to kill process by PID
kill_by_pid() {
    read -p "Enter process ID: " pid
    if kill -0 "$pid" 2>/dev/null; then
        kill -9 "$pid"
        echo "Process $pid killed."
    else
        echo "No such process with PID: $pid"
    fi
}

# Menu for user selection
echo "Choose an option:"
echo "1) Kill by Process Name"
echo "2) Kill by Process ID"
read -p "Enter your choice: " choice

case $choice in
    1) kill_by_name ;;
    2) kill_by_pid ;;
    *) echo "Invalid choice" ;;
esac
