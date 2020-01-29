#!/bin/sh
# update.sh
# This script tries to pull the latest changes from upstream and copy
# them over to this repository without overwriting existing files.
git pull ../S-SI
cp -ur ../S-SI/* .
