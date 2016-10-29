#!/bin/sh
LOG_FILE=/home/user/log.txt
FILE=/home/user/watchedfolder/$1
COUNT=`/usr/bin/wc -l < $LOG_FILE`
if [ "$COUNT" -gt "800" ]
then 
	/bin/rm $LOG_FILE
fi
/usr/bin/clamscan --remove $FILE --log=$LOG_FILE
