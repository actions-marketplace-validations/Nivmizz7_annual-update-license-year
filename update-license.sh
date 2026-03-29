#!/bin/bash

# Update all years in LICENSE files to current year
set -e

CURRENT_YEAR=$(date +%Y)

# Find and update all LICENSE files
for file in LICENSE LICENSE.md LICENSE.txt COPYING COPYING.md; do
  [ ! -f "$file" ] && continue
  
  # Find all 4-digit years and replace with year range
  sed -i "s/\([^0-9]\)\([0-9]\{4\}\)\([^0-9]\)/\1\2-${CURRENT_YEAR}\3/g" "$file"
  sed -i "s/^\([0-9]\{4\}\)-[0-9]\{4\}/\1-${CURRENT_YEAR}/" "$file"
  
  echo "Updated: $file"
done

# Git commit if in a repo and changes exist
if git rev-parse --git-dir > /dev/null 2>&1; then
  if ! git diff --quiet LICENSE* COPYING* 2>/dev/null; then
    git config user.name "License Bot"
    git config user.email "bot@github.com"
    git add LICENSE* COPYING*
    git commit -m "chore: update license year to $CURRENT_YEAR"
    git push || true
  fi
fi
