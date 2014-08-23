#!/bin/bash

if [ ! $# == 2 ]; then
    echo "Usage: $0 author_name output_root_directory"
    exit 1
fi

author=$1
output=$2
end=""
begin=""
patchcount=1
rangecount=1

for O in $(git log --pretty=format:"%h" --author="$author"); do
        if ! git log --pretty=format:"%h" --author="$author" $O^^..$O^ --exit-code 1>/dev/null ; then
            if [[ "$end" == "" ]]; then
                end=$O
            fi
            begin=$O
            ((rangecount++))
        else
            if [[ "$end" == "" ]]; then
                tmp=$(($patchcount - 1))
                echo "Adding one patch to $tmp existing:"
                git log $O^..$O
                echo "Please enter a subdirectory name for this patch:"
                read subdir
                mkdir -p $output/$subdir
                git format-patch $O^..$O -o$output/$subdir
                ((patchcount++))
            else
                tmp=$(($patchcount - 1))
                echo "Adding $rangecount patches to $tmp existing."
                git log $begin^^..$end --oneline
                echo "Please enter a subdirectory name for these patches:"
                read subdir
                mkdir -p $output/$subdir
                git format-patch $begin^^..$end -o$output/$subdir
                end=""
                patchcount=$(($patchcount + $rangecount))
                rangecount=1
            fi
        fi
    done
