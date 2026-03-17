#!/bin/bash

echo "server performance stats"

echo ""
echo "cpu:"
top -bn1 | grep "Cpu(s)" | awk '{print "usage: " $2 + $4 "%"}'

echo ""
echo "ram:"
free | awk '/Mem/ {printf("used: %sMB / total: %sMB (%.2f%%)\n", $3,$2,$3/$2*100)}'

echo ""
echo "disk:"
df -h / | grep /dev/ | awk '{printf("used: %s / avail: %s / perc: %s\n", $3, $4, $5)}'

echo ""
echo "top 5 by ram usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

echo ""
echo "top 5 by cpu usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

