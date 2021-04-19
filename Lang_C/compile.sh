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
	# if gcc *.c 2>&1; then
	if clang -w -S -emit-llvm -c *.c 2>&1; then
	    # Ensure that an executable has been generated.
	    if find . -name '*.ll'; then
		    echo  "# COMPILE SUCCESS: $i"
		    mkdir -p $BASE/gcj-d/$i
            cfile=`echo *.ll | sed 's/\(.*\.\)ll/\1/'`
            if timeout 1m ~/shared/src/llvm2c -o $BASE/gcj-d/$i/"$cfile"c "$cfile"ll 2>&1; then
                if test -d $BASE/gcj-d/$i; then
                    echo  "# DECOMPILE SUCCESS: $i"
                else
                    echo  "# DECOMPILE FAILED (NO OUTPUT): $i"
                fi
                else
                    echo  "# DECOMPILE FAILED: $i"
                fi
	        else
		        echo  "# COMPILE FAILED (NO .ll FILE): $i"
	        fi
	    else
	        echo  "# COMPILE FAILED: $i"
	fi
    )
done > $BASE/compile.log

# Done.
