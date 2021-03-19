#!/bin/sh

# Extract all source files from the CSV files for each year.

echo "Clean up..."
rm -rf gcj
for i in 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017; do
    echo "Extracting $i ..."
    python ../extract.py "../gcj$i.csv" ".java"
done

# Done.
