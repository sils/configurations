#!/bin/bash

if [ ! $# == 1 ]; then
    echo "Usage: $0 author_name"
    exit 1
fi

author=$1
end=""
begin=""

for O in $(git log --pretty=format:"%h" --author="$author"); do
        if ! git log --pretty=format:"%h" --author="$author" $O^^..$O^ --exit-code 1>/dev/null ; then
            if [[ "$end" == "" ]]; then
                end=$O
            fi
            begin=$O
        else
            if [[ "$end" == "" ]]; then
                git format-patch $O^..$O
            else
                git format-patch $begin^^..$end
                end=""
            fi
        fi
    done
