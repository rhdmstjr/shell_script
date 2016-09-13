#!/bin/sh

# important points
#
# $ ./getopts.sh -a -p /home/user/docs /tmp
#	|			 |	|		  |			|
#   $0			 $1 $2        $3	 	$4

# after shift 3
# $ ./getopts.sh -a -p /home/user/docs /tmp
#   |									|
#	$0									$1


# check -a option 
a_flag=0

separator=""

while getopts "ap:" option
do
	case $option in
		a)
			a_flag=1
			;;
		p)
			separator="$OPTARG"
			;;
		# except a and p represented as ?
		\?)
			echo "Usage: $0 [-a] [-p separator] target_dir" 1>&2
			exit 1
		;;
	esac
done


# OPTIND == number next to last arguments used by getopts
shift $(expr $OPTIND - 1)


# because of shift, now $1 is the target_dir
path="$1"
echo "path==$1"

#
if [ $a_flag -eq 1 ]; then
	# -- to prevent when $path starting with '-'
	ls -a -- "$path"
else
	ls -- "$path"
fi 

if [ -n "$separator" ]; then
	echo "$separator"
fi

