#!/bin/bash

# dependencies for gitbook:
#   sudo apt-get install nodejs
#   sudo apt-get install npm
#   sudo npm -g install gitbook
# 



PACKAGES="main 
manual 
tutorials 
release_notes"

DOC_ROOT=./docs

# for i in "$@"
for i in $PACKAGES
do

  echo "  "
  echo " -------------------- "
  echo "  "
  echo "  BUILDING DOCS FOR: $i"
  echo "  "
  echo " -------------------- "
  echo "  "


  gitbook init  ./$i
  gitbook install ./$i
  gitbook build ./$i --config ./$i/book.json --output=./$i/_book

done

rm -rf $DOC_ROOT
mv -f main/_book $DOC_ROOT
mv -f manual/_book $DOC_ROOT/manual
mv -f tutorials/_book $DOC_ROOT/tutorials
mv -f release_notes/_book $DOC_ROOT/release_notes


#  Send new documentation to github for particle-analytics.github.io/docs

  # cd $DOC_ROOT/
  # git init
  # git commit --allow-empty -m 'update book'
  # git checkout -b gh-pages
  # git add .
  # git commit -am "update book"
  # git push git@github.com:particle-analytics/docs gh-pages --force


