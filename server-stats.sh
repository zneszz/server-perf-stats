#!/bin/bash

echo "server performance stats"

echo ""
echo "cpu:"
top -bn1 | grep "Cpu(s)" | awk '{print "usage: " $2 + $4 "%"}'
