#!/bin/sh

# Attempt to compile all source files.

BASE="$PWD"

cd gcj

# Traverse all folders in which submissions are located.
for i in */*/*/*; do
    (
        echo  "# $i"
	cd "$i"
	# Attempt to compile all source files in this folder.
	if gcc *.c 2>&1; then
	    # Ensure that an executable has been generated.
	    if find . -name 'a.out'; then
		echo  "# COMPILE SUCCESS: $i"
		rm a.out
	    else
		echo  "# COMPILE FAILED (NO A.OUT): $i"
	    fi
	else
	    echo  "# COMPILE FAILED: $i"
	fi
    )
done > $BASE/compile.log

# Done.
