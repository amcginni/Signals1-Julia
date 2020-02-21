#!/bin/sh
# update.sh
# This script tries to pull the latest changes from upstream and copy
# them over to this repository without overwriting existing files.
git pull https://github.com/spsandova/S-SI

# Allow commiting selectively
git commit -p

#Revert uncommited changes to directory tree
git reset HEAD

echo("If the commit was succesful, now do a git push");
