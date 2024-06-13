#!/bin/sh

# Check if the tests directory exists
if [ ! -d "tests" ]; then
  echo "The directory 'tests' does not exist."
  exit 1
fi

# Loop through all .nix files in the tests directory
for file in tests/*.nix; 
do
  if [ -f "$file" ]; then
    echo "Running nix-instantiate on $file"
    nix-instantiate "$file"
  else
    echo "No .nix files found in the tests directory."
  fi
done
