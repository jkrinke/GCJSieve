#!/bin/sh

../_reduce.sh subset 10 "^ *[ ][0-9] "
../_reduce.sh subset 10 "^ *10 "
../_reduce.sh subset-d 10 "^ *[ ][0-9] "
../_reduce.sh subset-d 10 "^ *10 "

# Done.
