#!/bin/sh 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR/..

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

cd $DIR
hugo

cd $DIR/..
git add .
git commit -m "Publish by hugo"
echo "Publish and Commit done."

cd $PWD
