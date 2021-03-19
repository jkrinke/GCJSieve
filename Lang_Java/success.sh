#!/bin/sh

# Extract all submissions for which the compilation was successful.
# Keep only the latest successful attempt.
IFS=$'\n'; for i in `grep '# COMPILE SUCCESS:' compile.log`; do
    s=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\1:'`
    u=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\2:'`
    a=`echo $i | sed -e 's:^# COMPILE SUCCESS\: \([^/]*\)/\([^/]*\)/\([^/]*\)/\([^/]*\)$:\3:'`
    M="gcj50java/$s/$u"
    # Earlier successful attempts are overwritten."
    rm -rf "$M"
    mkdir -p "$M"
    cp -r "gcj-d/$s/$u/$a/extracted/" "$M"
done

# Done.
