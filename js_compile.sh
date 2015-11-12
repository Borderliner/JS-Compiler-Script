#! /usr/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
ORANGE=`tput setaf 3`
PINK=`tput setaf 5`
RESET=`tput sgr0`

function compile
{
	FILES="*.js"
	for f in $FILES
	do
		#If folder does not contain any JS files, exit
		if [[ "$f" = "*.js" ]]
		then
			echo "${RED}Could not find any JavaScript files here.${RESET}"
			exit
		fi

		#If file name contains ".min" ignore that file
		if [[ "$f" == *.min.* ]] || [[ "$f" == *-min.* ]]
		then
			echo "${RED}"$f"${ORANGE} is already minified.${RESET}"
		else
			OUTPUT_FILE=$f"c"
			INPUT_FILE=$f
			echo "Compiling ${PINK}\""$INPUT_FILE"\"${RESET}"
			closure --js $INPUT_FILE --js_output_file $OUTPUT_FILE
		fi
	done

	prompt
	echo "${GREEN}Successfully compiled!${RESET}"
}

function prompt
{
	echo "Do you want to replace newly compiled files with original files?"
	select yn in "Yes" "No"
	do
		case $yn in
			Yes ) replace; break;;
			No ) echo "${GREEN}Successfully compiled!${RESET}"; exit;;
		esac
	done
	
}

function replace
{
	C_FILES="*.jsc"
	echo "${ORANGE}Replacing old files with new ones...${RESET}"
	for f in $C_FILES
	do
		FILE_NAME=$(echo $f | rev | cut -c 5- | rev)
		rm $FILE_NAME".js"
		mv $f $FILE_NAME".js"
	done
}

compile