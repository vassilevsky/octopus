#!/bin/bash

set -ex

for i in {1..10}
do
  echo $i > $i.txt
done

git --version > git.txt

git init
git add .
git commit -m "Let's get started"

for i in {1..10}
do
  git checkout -b branch$i
  echo 0 > $i.txt
  git add .
  git commit -m "Changed file $i"
  git checkout master
done

git merge -m Octopus $(for i in {1..10}; do echo branch$i; done)
