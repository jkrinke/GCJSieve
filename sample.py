import random
import os
import shutil
from os.path import join

# Example to create sub-subsets of a specific size.
# In the example below, a subset of 25 tasks with 25 submissions each is generated.

# Source folder
s = "subset"

# Destination folder
d = "sample-25"

# Setting the random seed to create a deterministic shuffle.
# By setting the seed, the actual generated sub-subset is repeatable.
# Remove the line for true randomness.
random.seed(25)

# Read all folders inside the source folder and generate a shuffle.
tasks = os.listdir(s)
tasks.sort()
random.shuffle(tasks)
# Read the first 25 folders of the shuffle and copy 25 random sub-folders to the destination.
for t in tasks[0:25]:
    sourceDir = join(s, t)
    print(sourceDir)
    targetDir = join(d, t)
    # Read all folders or files and generate a shuffle.
    entries = os.listdir(sourceDir)
    entries.sort()
    random.shuffle(entries)
    # Copy the first 25 folders or files to the destination.
    for u in entries[0:25]:
        shutil.copytree(join(sourceDir, u), join(targetDir, u), dirs_exist_ok=True)

# Done.
