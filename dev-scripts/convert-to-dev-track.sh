#!/bin/bash
# Converts to a '-dev' version of a track.
# Requirements: yq, bash
set -euo pipefail

USAGE="Usage: Run script from inside an Instruqt track directory."

# Must be in a track directory.
if ! [[ -f track.yml ]]; then
  echo $USAGE
fi

# Check whether this is already a dev version track
ISDEV=$(yq '.slug | contains("-dev")' track.yml)
if [[ $ISDEV == "true" ]]; then
  echo -e "It looks like the track slug already has the -dev suffix.\nRun the promote-track-changes.sh script when you are done editing."
  exit 1
fi

# Check for the yq command
if ! command -v yq &> /dev/null
then
  echo "The yq command could not be found."
  exit 1
fi

# Strip out the track ids and rename the dev track
echo "Converting track to dev version..."
for file in $(find . -name assignment.md); do
  yq eval --inplace --front-matter=process 'del(.id)' $file
done
yq eval --inplace 'del(.id)' track.yml
yq eval --inplace '.slug += "-dev"' track.yml
yq eval --inplace '.title = "DEV - " + .title' track.yml

echo "############################################"
echo "Dev conversion complete. You may run \`instruqt track push\`."
echo "When you are done editing and testing the dev track,"
echo "run the promote-track-changes.sh and then \`git commit\`."