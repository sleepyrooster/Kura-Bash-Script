#!/bin/bash

# Objective:
# User must provide two numbers and operator through command-line
# Based on input do the operation and show the output.
# Use case to handle multiple operations
# Use expr or bc commands.

case $2 in
  +) 
    expr $1 + $3
    ;;
  -)
  expr $1 - $3
  ;;
  *)
  expr $1 * $3
  ;;
  /)
  expr $1 / $3
  ;;
esac
