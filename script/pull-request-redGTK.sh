#!/bin/bash

cd $HOME/Github/red
issue=$1
shift
commits=$*

git checkout -b GTK-patch-${issue} red/GTK # GTK from the original upstream repo
git cherry-pick ${commits} # commits to insert <commit-from> is not inserted when <commit-to> is

git push origin
git checkout GTK
git branch -D GTK-patch-${issue}