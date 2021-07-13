#!/bin/sh

../_reduce.sh subset 15 "^ *[ ][0-9] "
../_reduce.sh subset 15 "^ *1[0-4] "
../_reduce.sh subset-d 15 "^ *[ ][0-9] "
../_reduce.sh subset-d 15 "^ *1[0-4] "

# Done.
