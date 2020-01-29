#!/bin/sh
# update.sh
# This script tries to pull the latest changes from upstream and copy
# them over to this repository without overwriting existing files.
git pull ../S-SI
cp -ur ../S-SI/* .

# Use interactive mode for git-add, so we can selectively add files to be
# commited.
git add -i
