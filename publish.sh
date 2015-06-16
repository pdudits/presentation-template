#!/bin/bash

bundler exec guard -i &
BUNDLER_PID=$!
git clone . gh-pages
cd gh-pages
git checkout gh-pages
git rm -r --cached *
rm -rf *
sleep 5
# the new reveal.js has async loading, so wget needs help
wget -r -nH --base http://localhost:35729/ -i - <<EOL
/
reveal.js/css/reveal.css
reveal.js/lib/js/head.min.js
reveal.js/js/reveal.js
reveal.js/css/print/paper.css
highlightjs-cypher/javascripts/cypher.js 
reveal.js/plugin/highlight/highlight.js 
reveal.js/plugin/zoom-js/zoom.js 
reveal.js/plugin/notes/notes.js 
EOL
git add -A .
git commit -a -m "Publish script run"
git push origin gh-pages
cd -
pkill -TERM -P $BUNDLER_PID
rm -rf gh-pages
