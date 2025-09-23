#!/bin/bash
file="$1"
nano "$file"
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
