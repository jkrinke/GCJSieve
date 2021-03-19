#!/bin/sh

USERS="$PWD/users"

cd "$1"

echo "Remove small tasks..."

# Remove all tasks with less than 50 submissions.

for i in *; do
    if [ `ls $i | wc -l` -lt 50 ]; then
	echo "Removing $i:" `ls $i | wc -l`
	rm -rf $i
    fi
done

# Count the number of submissions per user.
rm -f $USERS.lst
for i in *; do
    (cd $i
     ls >> $USERS.lst
    )
done

echo "Remove users with few submissions..."

# Extract the users with just a few submissions.
sort $USERS.lst | uniq -c | sort -n | grep '^ *[1-3] ' > $USERS.sorted

if test -s $USERS.sorted; then
    # Remove submissions from such users.
    for i in */*; do
	if grep -q `basename $i`\$ $USERS.sorted; then
            # Remove submission
            echo "Removing $i."
            rm -rf $i
	fi
    done
else
    echo "All users have enough submissions."
fi

# Done.
