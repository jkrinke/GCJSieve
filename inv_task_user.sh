#!/bin/sh

# Copy the source directory to a target directory
# with task and user structure inverted:
# source/task/user -> target/user/task

rm -rf "$2"
mkdir "$2"
N=$PWD/"$2"
cd "$1"
for d1 in *; do
    echo "$d1"
    cd "$d1"
    for d2 in *; do
        if [ \! -d "$N/$d2" ]; then
            mkdir "$N/$d2"
        fi
        cp -r "$d2" "$N/$d2/$d1"
    done
    cd ..
done
