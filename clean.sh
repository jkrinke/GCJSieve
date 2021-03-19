#!/bin/sh

# Remove all empty files and directories
echo "Clean up..."
find gcj -name .DS_Store -delete
find gcj -empty -delete

# This does not catch everything. There are files that are not
# completly empty, but have no actual code inside.  They will fail the
# decompilation stage.

# Done.
