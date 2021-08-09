#!/bin/sh
# POSIX

show_help() {
    cat << EOF
Usage: setup-cpp-env [-h] [-d NEW-DIRECTORY] [-l LOCATION-OF-NEW-DIRECTORY]
Sets up a cpp enviroment for leetcode/hackerrank problems
Creates a NEW-DIRECTORY at LOCATION-OF-NEW-DIRECTORY and copies over a generic cpp file and generic makefile
and renames them to match the new problem.  Also renames within the makefile.
    -h                              display help and exits
    -d NEW-DIRECTORY                Name of the directory you want to create
    -l LOCATION-OF-NEW-DIRECTORY    location you want the new directory to live
EOF
}

# Initialize all the option variables
directory=
location=
fileName=
finalLocation=

# Grab the flags and the info
while getopts d:l:h flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
        l) location=${OPTARG};;
        h) show_help
           exit 0;;
    esac
done

# If directory or location are empty
if [ -z $directory ] || [ -z $location ]
then
   show_help 
   exit 0
fi

#######################################
#After grabbing the values
######################################
mkdir "${location}"/"${directory}"

fileName=$(echo "$directory" | awk '{print tolower($0)}' )

cp ~/Code/Scripts/Generic/generic.cpp "${location}"/"${directory}"/"${fileName}".cpp
cp ~/Code/Scripts/Generic/makefile "${location}"/"${directory}"/makefile.temp

sed "s/generic/${fileName}/g" "${location}"/"${directory}"/makefile.temp > "${location}"/"${directory}"/makefile
rm -rf "${location}"/"${directory}"/makefile.temp

touch "${location}"/"${directory}"/test.txt




