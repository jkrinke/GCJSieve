#!/bin/sh

rm -rf subset-at subset-d-at sample-15 sample-d-15 sample-at-15 sample-d-at-15

# Invert tasks and users
../inv_task_user.sh subset subset-at
../inv_task_user.sh subset-d subset-d-at

# Create 15/15 samples 
../sample.py subset sample-15 15 15
../sample.py subset-d sample-d-15 15 15
../sample.py subset-at sample-at-15 15 15
../sample.py subset-d-at sample-d-at-15 15 15


