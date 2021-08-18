#!/bin/bash
input="./test.txt"

#empty results file before you start writing to it
> test.results

#read test.txt line by line and echo to terminal
while IFS= read -r line
    read -r line2
    read -r line3
do
    #write the two lines the program is expecting to a temp file
    echo "$line" > test.temp
    echo "$line2" >> test.temp
    #also write these lines to the test.results file
    printf "INPUT=================\n" >> test.results
    echo "$line" >> test.results
    echo "$line2" >> test.results
    printf "EXPECTED OUTPUT======\n" >> test.results
    echo "$line3" >> test.results
    printf "OUTPUT================\n" >> test.results
    cat test.temp | ./third-maximum-number >> test.results
done < "$input"

rm test.temp
cat test.results
