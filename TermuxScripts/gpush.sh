#!/bin/bash
msg="$1"
if [ -z "$msg" ]; then
  echo "Commit message required"
  exit 1
fi
git pull
git add .
git commit -m "$msg"
git push
