#!/bin/sh

# Initialize a variable to track if --dry-run is passed
dry_run=0

# Initialize a variable to hold arguments excluding --dry-run
new_args=""

# Iterate over all arguments
for arg in "$@"; do
  if [ "$arg" = "--dry" ]; then
    dry_run=1
  else
    new_args="$new_args $arg"
  fi
done

# Choose the command based on the presence of --dry-run
if [ $dry_run -eq 1 ]; then
  sudo nixos-rebuild dry-activate --flake . $new_args
else
  sudo nixos-rebuild switch --flake . "$@"
fi
