#!/bin/bash
# Scans a directory of tracks and creates a track-slugs.yml file
# Requirements: yq, bash
set -euo pipefail

# Check for the yq command
if ! command -v yq &> /dev/null
then
  echo "The yq command could not be found."
  exit 1
fi

# Clear track-slugs.yml
echo "---" > track-slugs.yml
echo "tracks:" >> track-slugs.yml

# Gather track.yml data
for dir in $(ls -d */); do
  echo "Adding $dir to track-slugs"
  yq '"  - { slug: " + .slug + ", id: " + .id + " }"' ${dir}track.yml >> track-slugs.yml
done

echo "Your track-slugs.yml file has been created."
echo "Remove any tracks from the file that do not require testing."