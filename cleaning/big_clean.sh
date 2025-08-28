#!/bin/bash

archive="$1"

name=$(basename "$archive" .tgz)

here=$(pwd)

scratch=$(mktemp -d)

tar -xzf "$archive" -C "$scratch"

grep -rl 'DELETE ME!' "$scratch/$name" | xargs rm -f

cd "$scratch"
tar -czf "$here/cleaned_$archive" "$name"





