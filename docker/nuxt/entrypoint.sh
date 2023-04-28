#!/usr/bin/env sh

for arg in $@
do
    if [ "$arg" = "shell" ]
    then
        exec /bin/sh
    elif [ "$arg" = "background" ]
    then
        exec yarn run dev
    elif [ "$arg" = "production" ]
    then
        exec yarn run start
    elif [ "$arg" = "test" ]
    then
        exec yarn run test
    else
        echo "I don't know what I have to do"
    fi
done