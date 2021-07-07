#!/bin/bash

BASE="$PWD"

cd gcj

export LANG=C

for i in */*/*/*; do
    (
        echo  "# $i" #>&2
	cd "$i"
	find . -type f | sort
	# Compile all source files with Python-2.7
	echo "# Attempting Python-2.7"
	if python2.7 -m compileall *.py 2>&1; then
	    COMPILED=2
	else
	    echo "# Attempting Python-3.8"
	    if python3.8 -m compileall *.py 2>&1; then
		COMPILED=3
		find .
		mv __pycache__/* .
		rmdir __pycache__
	    else
		echo  "# COMPILE FAILED: $i"
	    fi
	fi
	if [ -n "$COMPILED" ]; then
	    # Compilation done, no check that code was generated.
	    if find . -name '*.pyc' > /dev/null; then
		if [ `find . -type d | wc -l` -ne '1' ]; then
		    # There should no folder be generated (sanity check).
		    echo "# COMPILE FAILED (DIRECTORY GENERATED)."
		    exit
		fi
		# Compilation succeeded, now try decompilation.
		echo  "# COMPILE SUCCESS: $i"
		find . -name '*.pyc' | sort
		echo "# Decompiling"
		mkdir -p $BASE/gcj-d/$i
		if python3.8 /usr/local/bin/uncompyle6 -o $BASE/gcj-d/$i *.pyc 2>&1; then
		    if test -d $BASE/gcj-d/$i; then
			echo "# Decompile complete."
			find $BASE/gcj-d/$i -type f
			for f in $BASE/gcj-d/$i/*.py; do
			    if [ `grep -v '^#' "$f" | wc -l` -eq '0' ]; then
				echo "# Empty file: $f" 
				echo "# DECOMPILE FAILED: $i"
				exit
			    fi
			done
		 	echo  "# DECOMPILE SUCCESS: $i"
	 	    else
			echo  "# DECOMPILE FAILED (NO OUTPUT): $i"
		    fi
	    	else
		    echo  "# DECOMPILE FAILED: $i"
	    	fi
	    else
		echo  "# COMPILE FAILED (NO CLASS): $i"
	    fi
	fi
    )
done > $BASE/compile.log

# Done.
