#!/bin/sh

for i in 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017; do
    curl https://raw.githubusercontent.com/Jur1cek/gcj-dataset/master/gcj$i.csv.tar.bz2 -o - | tar xjf -
done

# Done.
