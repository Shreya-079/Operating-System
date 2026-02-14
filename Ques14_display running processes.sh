#!/bin/bash

# Display header
echo "PID   USER       %CPU %MEM   VSZ   RSS   TTY   STAT   START   TIME   COMMAND"
echo "--------------------------------------------------------------------------------"

# Display running processes
ps -eo pid,user,%cpu,%mem,vsz,rss,tty,stat,start,time,command --sort=-%cpu | head -20
