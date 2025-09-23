#!/bin/bash
file="$1"
nano "$file"
if git diff-index --quiet HEAD --; then
  echo "No changes to commit."
  exit 0
fi
echo -n "Enter commit message: "
read msg
if [ -z "$msg" ]; then
  echo "Commit message required"
  exit 1
fi
git pull
git add "$file"
git commit -m "$msg"
git push
