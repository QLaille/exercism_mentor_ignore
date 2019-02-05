#!/bin/bash

#usage: ./exercism_mentor_ignore.sh $function $filename
# where $function is either comment or uncomment,
# and $filename the path to the test file.

COMMENTTYPE1='\/\/'
COMMENTTYPE2='\#'

#Feel free to add more comment type if necessary.

C_TEST_IGNORE='TEST_IGNORE'

#Above is the list of function calls to ignore a test, in c, it is TEST_IGNORE().

function comment() {
	case $1 in
		*.c)
			sed -i "/$C_TEST_IGNORE/s/^/$COMMENTTYPE1/g" $1 ;;
		#add between the hashtags your file format, and copy-paste the above sed command with the appropriated comment type.
		#
		*)
			echo "not a valid file" >> /dev/stderr;;
	esac
}

function uncomment() {
	case $1 in
		*.c)
			sed -i "/$C_TEST_IGNORE/s/^$COMMENTTYPE1*//g" $1;;
		#add between the hashtags your file format, and copy-paste the above sed command with the appropriated comment type.
		#
		*)
			echo "not a valid file" >> /dev/stderr;;
	esac
}

"$@"