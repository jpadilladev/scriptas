#!/bin/sh
PATH=/home/user/watchedfolder/
TARGET=/home/user/target/
LOG_FILE=/home/user/log.txt
ANALYZING_FILE=/home/user/analyzingfolder/$1
FILE=$PATH$1
OUTPUT=$TARGET$1
COUNT=`/usr/bin/wc -l < $LOG_FILE`
if [ "$COUNT" -gt "2000" ]
then 
	/bin/rm $LOG_FILE
fi

/bin/mv $FILE $ANALYZING_FILE 
/usr/bin/clamscan -r --remove $ANALYZING_FILE --log=$LOG_FILE

if [ $? -eq 0 ]
then
	/bin/mv $ANALYZING_FILE $OUTPUT
	/bin/echo "No Virus found in $1, moved to $OUTPUT" >> $LOG_FILE
fi
if [ $? -eq 1 ]
then
	/bin/echo "Virus found in $1, file removed by clam" >> $LOG_FILE
fi
