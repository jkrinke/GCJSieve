#!/bin/sh

# 38 is currently the maximal value that works.

../_reduce.sh gcj50java 38 '^ *[ 12][0-9] '
../_reduce.sh gcj50java 38 '^ *3[012345678] '
../_reduce.sh gcjD50java 38 '^ *[ 12][0-9] '
../_reduce.sh gcjD50java 38 '^ *3[012345678] '

# Done.
