#!/bin/bash

if ! command -v yay &> /dev/null; then
   echo "yay is not installed"
else
   echo "yay is present in the system"
fi
