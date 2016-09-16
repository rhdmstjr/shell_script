#!/bin/sh

# to-do
# command curl
# what is the url?
# 
# we can check signal's name using "$kill -l" at the terminal
count=0
# INT 는 SIGINT 를 의미하는 듯, 즉 여기서는 SIGINT(Ctrl + C) 일때 호출할 애를 정의하는 듯
# trap 'what I want to do when this signal called' [name of signal]
trap ' echo
    echo "Try count: $count"
    exit ' INT


while :
do
    curl -o /dev/null $1
    count=$(expr $count + 1)
    sleep 1
done

