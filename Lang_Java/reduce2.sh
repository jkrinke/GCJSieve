#!/bin/sh

# 38 is currently the maximal value that works.

../_reduce.sh gcj50java 30 '^ *[ 12][0-9] '
../_reduce.sh gcj50java 30 '^ *30 '
../_reduce.sh gcjD50java 30 '^ *[ 12][0-9] '
../_reduce.sh gcjD50java 30 '^ *30 '

# Done.
