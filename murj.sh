#!/bin/bash

declare -a input_files
declare -a output_files


get_input_files()
{
	while [[ $1 != "-o" &&  $# -ne 0 ]]; do
		#echo $1
		input_files+=("$1")
		shift
	done
}

get_output_files()
{
        while [[ $1 != "-i" &&  $# -ne 0 ]]; do
                #echo $1
                output_files+=("$1")
                shift
        done
}

print_help_text()
{
	if [[ $NUM_ARGS -le 1 ]]; then
		echo "-----------"
		echo "* M U R J *"
		echo "-----------"
		echo "Murj is a script for merging PDF files."
		echo ""
		echo "Input:	Multiple PDF files."
		echo "Output: Merged PDF file."
		echo ""
		echo "* Requires at least one input and one output file"
		echo "* Can make more than one copy of the merged file"
		echo ""
		echo "Usage:	murj -i input.pdf [files.pdf] -o merged.pdf [copies.pdf]
	murj [-h | --help]"
		echo ""
		echo "	e.g.	murj -i foo.pdf bar.pdf -o baz.pdf"
		echo ""
		echo "Options:
		-i	provide the input files to be merged
		-o 	provide the output file name(s)
		-h 	print this help text"
		echo ""

		echo "Note:	Options cannot be combined."
		echo "-----------"
		echo "* M U R J *"
		echo "-----------"
	else
		echo "ERROR: Incorrect use of -h or --help option."
	fi
}

# ----------------------
# code logic begins here
# ----------------------

NUM_ARGS=$#
#echo $NUM_ARGS

if [[ $NUM_ARGS -eq 0 ]]; then
	print_help_text
	exit 0
fi

while [ $# -ne 0 ]; do
	#echo $1
	case "$1" in
		-i)
			#echo ${@:2}
			get_input_files "${@:2}"
			;;
		-o)
			get_output_files "${@:2}"
			;;
		--help)
			print_help_text
			exit 1
			;;
		-h)
			print_help_text
			exit 1
			;;
		-*)
			echo "ERROR: Incorrect use of options. Use -h or --help for help."
			exit 1
			;;
	esac
	shift
done

if [[  ${#input_files[@]} -eq 0 ]]; then
	echo "ERROR: No input files specified. Use -h or --help for help."
	exit 1
fi

if [[  ${#output_files[@]} -eq 0 ]]; then
	echo "ERROR: No output files specified. Use -h or --help for help."
	exit 1
fi

INPUT=${input_files[@]}
OUTPUT=${output_files[@]}

NUM_INPUT=${#input_files[@]}
NUM_OUTPUT=${#output_files[@]}

LOCAL_PATH=$(dirname $0)

python $LOCAL_PATH/murj.py $NUM_INPUT $NUM_OUTPUT $INPUT $OUTPUT

echo Done
