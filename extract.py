import csv
import pandas
import sys
import os

# Extract all source files with the given ending.
def entry(fname, content, ending):
    if fname.endswith(ending):
        # Rearrange the path structure.
        dirs = fname.split('/')
        oldDir = os.path.join(dirs[0], dirs[1], dirs[2], dirs[3], dirs[4])
        newDir = os.path.join(dirs[0], dirs[1] + '-' + dirs[2] + '-' + dirs[4], dirs[3])
        fname = fname.replace(oldDir, newDir)
        # Replace all '.' with '_' in folder names.
        # ('.' in folder names cause all kinds of trouble.)
        orig_dir = os.path.dirname(fname)
        dir = orig_dir.replace('.', '_')
        fname = fname.replace(orig_dir, dir)
        # Create folder
        try:
            os.makedirs(dir, exist_ok=True)
        except:
            print("Failed (directory):", fname)
            return
        # Create file
        with open(fname, "w") as f:
            try:
                f.write(str(content))
            except:
                print("Failed: ", fname)
                print(">>" + str(content) + "<<")

# The CSV file is passed as the first argument.
csvFile = sys.argv[1]
# The file ending is passed as the second argument.
ending = sys.argv[2]

# Read the CSV file and extract the files.
d = pandas.read_csv(csvFile)
result = [entry(x, y, ending) for x, y in zip(d['full_path'], d['flines'])]

# Done.
