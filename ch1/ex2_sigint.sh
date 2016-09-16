#!/bin/sh

# to-do
# command curl
# what is the url?
# 
# we can check signal's name using "$kill -l" at the terminal
count=0
# INT �� SIGINT �� �ǹ��ϴ� ��, �� ���⼭�� SIGINT(Ctrl + C) �϶� ȣ���� �ָ� �����ϴ� ��
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

