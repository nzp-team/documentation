#!/bin/bash
set -e

rm -rf build/
mkdir -p build/{res,landing,mapping,internal,server}
cp -r markdown/res build/
mkdir -p build/ && cd markdown/
while IFS= read -r -d '' source; do
    pandoc --standalone --toc --template ../template/template.html --from=markdown --to=html5 --lua-filter=../links-to-html.lua -o "../build/${source%.md}.html" "$source"
done < <(find . -iname "*.md" -type f -print0)
