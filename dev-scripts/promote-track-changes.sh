#!/bin/bash
# Merges changes made in a dev version of a track.
# Requirements: yq, bash
set -euo pipefail

USAGE="Usage: Run script from inside an Instruqt dev track directory."

# Must be in a track directory.
if ! [[ -f track.yml ]]; then
  echo $USAGE
fi

# Make sure this is a -dev track
ISDEV=$(yq '.slug | contains("-dev")' track.yml)
if ! [[ $ISDEV == "true" ]]; then
  echo -e "This is not a -dev track. Make sure you run the convert-to-dev-track.sh script first."
  exit 1
fi

# Check for the yq command
if ! command -v yq &> /dev/null
then
  echo "The yq command could not be found."
  exit 1
fi

# Merge our changes back into the production track, preserving ids
echo "Preparing local changes to dev track for git commit."
# Remove the dev suffix and title prefix
yq eval --inplace '.slug |= sub("-dev", "")' track.yml
yq eval --inplace '.title |= sub("DEV - ", "")' track.yml
# Strip ids from assignment.md files
for file in $(find . -name assignment.md); do
  yq eval --inplace --front-matter=process 'del(.id)' $file
done
# Do the same for the track.yml file
yq eval --inplace 'del(.id)' track.yml

echo "########################################"
echo "Track changes ready for git commit."
echo "Run the following commands to continue:"
echo "git add ."
echo "git commit -m \"Added new content.\""
echo "git push origin your-dev-branch-name"