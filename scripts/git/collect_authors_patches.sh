#!/bin/bash

# Copyright 2014 by Lasse Schuirmann <lasse.schuirmann@gmail.com>
# License: GPL 3

if [ ! $# == 2 ]; then
    echo "Usage: $0 author_name output_root_directory"
    echo
    echo "This is a simple helper script that allows collecting all patches from"
    echo "one author in a git repository. It will detect consequent ranges of"
    echo "patches and ask for each range for a subdirectory so you can distinguish"
    echo "the patch series'."

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
                echo "Please enter a subdirectory name for this patch (leave this empty to leave this patch out, use ./ for the root directory):"
                read subdir
                if [[ "$subdir" != "" ]]; then
                    mkdir -p $output/$subdir
                    git format-patch $O^..$O -o$output/$subdir #--start-number=$patchcount
                    ((patchcount++))
                else
                    echo "Omitting patch..."
                fi
            else
                tmp=$(($patchcount - 1))
                echo "Adding $rangecount patches to $tmp existing."
                git log $begin^^..$end --oneline
                echo "Please enter a subdirectory name for these patches (leave this empty to leave this patch out, use ./ for the root directory):"
                read subdir
                if [[ "$subdir" != "" ]]; then
                    mkdir -p $output/$subdir
                    git format-patch $begin^^..$end -o$output/$subdir #--start-number=$patchcount
                    end=""
                    patchcount=$(($patchcount + $rangecount))
                    rangecount=1
                else
                    echo "Omitting patch series..."
                fi
            fi
        fi
    done
