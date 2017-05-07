#!/usr/bin/env bash

set -e
set -x

git config --global diff.tool meld
git config --global merge.tool meld
git config --global merge.conflictstyle diff3
git config --global commit.gpgsign true
git config --global user.signingkey 4F0AD019928AE098
