#!/bin/sh

BASE="$PWD"

cd gcj

export LANG=C

for i in */*/*/*; do
    (
        echo  "# $i" #>&2
		cd "$i"
		find . -type f | sort
		if javac *.java 2>&1; then
	    	if find . -name '*.class' > /dev/null; then
		    	echo  "# COMPILE SUCCESS: $i"
				find . -name '*.class' | sort
		    	if [ `find . -type d | wc -l` -ne '1' ]; then
					echo "DIRECTORY GENERATED."
					exit
	    		fi
	    		mkdir -p $BASE/gcj-d/$i
	    		if java -jar ~/shared/opt/cfr/cfr-0.151.jar --outputdir $BASE/gcj-d/$i *.class 2>&1; then
					if test -d $BASE/gcj-d/$i; then
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
		else
	    	echo  "# COMPILE FAILED: $i"
		fi
    )
done > $BASE/compile.log

# Done.
