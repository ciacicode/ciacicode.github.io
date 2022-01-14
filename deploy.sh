#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "Deploying updates to mariacerase com"

# Build the project.
hugo --baseURL="http://www.mariacerase.com"  -D -t sleekfolio # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Docs folder
cd docs

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master