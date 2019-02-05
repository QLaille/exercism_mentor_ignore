#!/bin/bash

#usage: ./exercism_mentor_ignore.sh $function $filename
# where $function is either comment or uncomment,
# and $filename the path to the test file.

COMMENTTYPE1='\/\/'
COMMENTTYPE2='\#'
#Feel free to add more comment type if necessary.

function comment() {
	case $1 in
		*.c)
			sed -i "/TEST_IGNORE/s/^/$COMMENTTYPE1/g" $1 ;;
		#add between the hashtags in this switch-case your file format, and copy-paste the above sed command with the appropriated comment type.
		#
		*)
			echo "not a valid file" >> /dev/stderr;;
	esac
}

function uncomment() {
	case $1 in
		*.c)
			sed -i "/TEST_IGNORE/s/^$COMMENTTYPE1*//g" $1;;
		#add between the hashtags in this switch-case your file format, and copy-paste the above sed command with the appropriated comment type.
		#
		*)
			echo "not a valid file" >> /dev/stderr;;
	esac
}

"$@"