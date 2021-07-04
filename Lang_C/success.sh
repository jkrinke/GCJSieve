#!/bin/bash

# Extract all submissions for which the compilation was successful.

# First, delete llvm files and empty folders.
find gcj -name '*.ll' -delete
find gcj -empty -delete

# Then delete the old results.
rm -rf subset subset-d

# Keep only the latest successful attempt.
IFS=$'\n'; for i in `grep '# COMPILE SUCCESS:' compile.log`; do
    echo "|i=$i|"
    s=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\1:'`
    u=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\2:'`
    a=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\3:'`

    echo "s=$s"
    echo "u=$u"
    echo "a=$a"

    # Original sources.
    M="subset/$s/$u"
    # Decompiled sources.
    D="subset-d/$s/$u"

    # Earlier successful attempts are overwritten."
    rm -rf "$M" "$D"
    mkdir -p "$M" "$D"
    cp -r "gcj/$s/$u/$a/extracted/." "$M"
    cp -r "gcj-d/$s/$u/$a/extracted/." "$D"
done

# Done.
