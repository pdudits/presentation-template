#!/bin/bash

bundler exec guard -i &
git clone . gh-pages
cd gh-pages
git checkout gh-pages
rm -rf *
sleep 5
wget -r -nH http://localhost:35729/
git add -A
git commit -a -m "Publish script run"
git push origin gh-pages
cd -
rm -rf gh-pages
kill $!
