#!/bin/bash

if [ "$#" -ne 3 ]
then
    echo "Usage: <file_list>(file name w/ any parent dirs) <source_directory>(with trailing /) <target_dir>(with trailing /)"
    echo "Example: ./file_move_check.sh my_list.txt /lus/hsi001/1212pgs/ /lus/hsi030/1212pgs/"
    echo "Example <file_list>..."
    echo "file1.txt"
    echo "dir1/file2.txt"
    exit 1
fi


files_with_diff_removed=$1
source_dir=$2
target_dir=$3

for i in `cat $files_with_diff_removed`
do

    #source_file=`$source_dir$i`
    source_file_size=`stat $source_dir$i | grep Size | awk '{print $2}'`

    #echo $source_file
    echo "$source_dir$i size = $source_file_size"

    target_file_size=`stat $target_dir$i | grep Size | awk '{print $2}'`

    echo "$target_dir$i size = $target_file_size" 

    if [[ $source_file_size == $target_file_size ]]
    then
        echo "$source_dir$i  size matches $target_dir$i"
    else
        echo "$source_dir$i size does NOT match $target_dir$i"
    fi


    echo "--------------------------------------------------------------"
done
