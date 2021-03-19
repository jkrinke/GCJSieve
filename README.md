# gcj50

Create subsets of the Google Code Jam data.

The subsets are for C and Java. They consist of all submissions to tasks for which at least 50 compilable (and for Java, also de-compilable) submissions exist from authors who have at least four of such submissions.
# Preparation

The subsets are created from the [Google Code Jam dataset](https://github.com/Jur1cek/gcj-dataset), a collection of solutions from the [Google Code Jam dataset programming competition](https://codingcompetitions.withgoogle.com/codejam/archive), years 2008-2020.

The first step is to retrieve the archives for the years 2008-2017 (retrieve.sh).

# Create the C subset

The C subset is created inside the `Lang_C` folder.

Execute the following steps:

1. Extract (extract.sh): creates the file systems structure out of the CSV files into `gcj`.
2. Clean (../clean.sh): Remove all empty files and directories.
3. Reduce (I) (reduce1.sh): Remove tasks with less than 50 submissions. Apply multiple times.
4. Compile (compile.sh): Attempt to compile all C files.
5. Extract (success.sh): Create a subset of the last compilable submissions into `gcj50c`.
6. Reduce (II) (reduce2.sh): Remove tasks with less than 50 submissions. Apply multiple times.

Note that the reduce steps need to be repeated until no more removal occurs.

The folder `gcj50c` contains the final subset.

# Create the Java subset

The Java subset is created inside the `Lang_Java` folder.

Execute the same steps as for the C subset.

However, there are slight differences as the Java subset contains submissions that are compilable and also de-compilable (via CFR). Also, the compile/de-compile step will take very long (days).

The folder `gcj50java` contains the final subset.

# Creating sub-subsets

To apply other criteria for the subsets, one can adapt the `_reduce.sh` script. 
For example, one could require more submissions per task or per author by modifying the scripts and run `reduce2.sh` as long as the numbers are larger.
If the numbers are smaller, then all steps from `reduce1.sh` need to be repeated.

There is another script, `subset.py`, which is an example on how to create random subsets of a certain structure in a deterministic way.
In the example, a subset of 25 tasks with 25 submissions each is generated.
It is generated randomly with a fixed random seed so that the subset can be repeated.
