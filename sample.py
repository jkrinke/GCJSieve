#!/usr/bin/env python

import random
import os
import sys
import shutil
from os.path import join

# Create sample sub-subsets of a specific size.
# A sample subset of t_no tasks with s_no submissions each is generated.

# Source folder
s = sys.argv[1]

# Destination folder
d = sys.argv[2]

# Number of tasks
t_no = int(sys.argv[3])

# Number of submissions per task
s_no = int(sys.argv[4])

# Setting the random seed to create a deterministic shuffle.
# By setting the seed, the actual generated sub-subset is repeatable.
# Remove the line for true randomness.
random.seed(25)

# Read all folders inside the source folder and generate a shuffle.
tasks = os.listdir(s)
tasks.sort()
random.shuffle(tasks)
# Read the first t_no folders of the shuffle and copy s_no random sub-folders to the destination.
for t in tasks[0:t_no]:
    sourceDir = join(s, t)
    print(sourceDir)
    targetDir = join(d, t)
    # Read all folders or files and generate a shuffle.
    entries = os.listdir(sourceDir)
    entries.sort()
    random.shuffle(entries)
    # Copy the first s_no folders or files to the destination.
    for u in entries[0:s_no]:
        shutil.copytree(join(sourceDir, u), join(targetDir, u), dirs_exist_ok=True)

# Done.
