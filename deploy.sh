#!/bin/bash

if [[ "$1" != "bs4" && "$1" != "bs5" && "$1" != "paper" && "$1" != "plain-html" ]]; then
  echo 'Framework is not set. Allowed values: "bs4", "bs5", "paper", "plain-html"';
  exit 1;
fi

git checkout gh-pages
# from https://stackoverflow.com/questions/37890510/bash-script-to-check-if-the-current-git-branch-x
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "gh-pages" ]]; then
  echo 'Current branch is not "gh-pages"';
  exit 1;
fi

git rm -rf "./$1"
mkdir "./$1"
cat "$1" > "./$1/$1.txt"
git add "./$1"
git commit -m "Pushing $1 to github pages"
git push origin gh-pages
git checkout master
