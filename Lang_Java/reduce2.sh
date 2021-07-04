#!/bin/sh

# 38 is currently the maximal value that works.

../_reduce.sh subset 30 '^ *[ 12][0-9] '
../_reduce.sh subset 30 '^ *30 '
../_reduce.sh subset-d 30 '^ *[ 12][0-9] '
../_reduce.sh subset-d 30 '^ *30 '

# Done.
