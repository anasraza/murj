# murj
A shell script for merging PDF files. A bit hacky, but it does the job; in accordance with the UNIX philosophy of doing one job and doing it well.

## Installing
1. Save the two files `murj.sh` and `murj.py` to a directory on your `PATH` e.g. `/usr/local/bin` or `$HOME/bin`
2. Make the script executable using `chmod +x murj.sh`
3. Install the Python module PyPDF2 with `pip install PyPDF2`
4. Add an alias to your `bashrc` file: `alias murj="murj.sh"`

## Usage
Invoke the script then include the input files with the `-i` option and include the output file(s) with the `-o` option.
If given more than one output files it will make copies of the merged file.

e.g. `murj -i file1.pdf file2.pdf file3.pdf -o merged.pdf`

## TODO
* Make the script Python only
* Make a GUI (?)
