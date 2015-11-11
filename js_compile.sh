#! /usr/bin/bash

FILES="*.js"

for f in $FILES
do
	OUTPUT_FILE=$f"c"
	INPUT_FILE=$f
	echo "Compiling \""$INPUT_FILE"\""
	closure --js $INPUT_FILE --js_output_file $OUTPUT_FILE
done