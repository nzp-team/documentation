#!/bin/bash
rm -rf build/
mkdir -p build/{res,landing,mapping,internal}
cp -r markdown/res build/
mkdir -p build/ && cd markdown/
find . -iname "*.md" -type f -exec sh -c 'pandoc --standalone --toc --template ../template/template.html --from=markdown --to=html5 --lua-filter=../links-to-html.lua -o "../build/${0%.md}.html" "${0}"' {} \;