#! /usr/bin/bash

FILES = "*.js"

function compile()
{
	for f in $FILES
	do
		OUTPUT_FILE = $f"c"
		INPUT_FILE = $f
		echo "Compiling \""$INPUT_FILE"\""
		closure --js $INPUT_FILE --js_output_file $OUTPUT_FILE
	done

	prompt()
}

function prompt()
{
	echo "Do you want to replace newly compiled files with original files?"
	select yn in "Yes" "No"
	do
		case $yn in
			Yes ) replace(); break;;
			No ) exit;;
		esac
	done
	
}

function replace()
{
	C_FILES = "*.jsc"
	for f in $C_FILES
	do
		echo "Replacing old files with new ones..."
		FILE_NAME = $f | cut -d'.' -f 1
		mv $f $FILE_NAME".js"
	done
}