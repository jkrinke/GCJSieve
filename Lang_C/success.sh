#!/bin/sh

# Extract all submissions for which the compilation was successful.

# First, delete all empty folders.
find gcj -empty -delete

# Keep only the latest successful attempt.
IFS=$'\n'; for i in `grep '# COMPILE SUCCESS:' compile.log`; do
    s=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\1:'`
    u=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\2:'`
    a=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\3:'`

    # Original sources.
    M="gcj50c/$s/$u"
    # Decompiled sources.
    D="gcjD50c/$s/$u"

    # Earlier successful attempts are overwritten."
    rm -rf "$M" "$D"
    mkdir -p "$M" "$D"
    cp -r "gcj/$s/$u/$a/extracted/" "$M"
    cp -r "gcj-d/$s/$u/$a/extracted/" "$D"
done

# Done.
