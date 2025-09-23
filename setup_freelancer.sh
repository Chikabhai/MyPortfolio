#!/bin/bash

# Enter project name
read -p "Enter your project/portfolio name: " PROJECT_NAME

# Check if empty
if [ -z "$PROJECT_NAME" ]; then
    echo "Project name cannot be empty."
    exit 1
fi

# Set project path
PROJECT_PATH=~/portfolio/$PROJECT_NAME

# Create project folder if it doesn't exist
mkdir -p "$PROJECT_PATH"/{TermuxScripts,Projects,Tutorials}

cd "$PROJECT_PATH" || exit

# Initialize git repo if not exists
if [ ! -d ".git" ]; then
    git init
fi

# Ask for GitHub SSH URL
read -p "Enter GitHub SSH repo URL (git@github.com:username/repo.git): " GITHUB_SSH

# Check if empty
if [ -z "$GITHUB_SSH" ]; then
    echo "GitHub repo URL cannot be empty."
    exit 1
fi

# Remove old origin if exists
git remote remove origin 2>/dev/null

# Add new origin
git remote add origin "$GITHUB_SSH"

# Add all files and commit
git add .
git commit -m "Initial setup for $PROJECT_NAME"

# Rename branch to main
git branch -M main

# Push to GitHub
git push -u origin main

echo "✅ Project $PROJECT_NAME setup complete and pushed to GitHub!"
