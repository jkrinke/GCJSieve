#!/bin/sh

rm -rf subset-at subset-d-at sample-25 sample-d-25 sample-at-25 sample-d-at-25

# Invert tasks and users
../inv_task_user.sh subset subset-at
../inv_task_user.sh subset-d subset-d-at

# Create 25/25 samples 
../sample.py subset sample-25 25 25
../sample.py subset-d sample-d-25 25 25
../sample.py subset-at sample-at-25 25 25
../sample.py subset-d-at sample-d-at-25 25 25


