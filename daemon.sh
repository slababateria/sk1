#!/bin/bash

PIDFILE=serverpid.pid
COMMAND=$1
PID=$(cat $PIDFILE)

#start
if test $COMMAND = 'start'
then
    ./server.sh &
#stop
elif test $COMMAND = 'stop'
then
    kill $PID
#reset
elif test $COMMAND = 'reset'
then
    kill $PID
    ./server.sh &
#status
elif test $COMMAND = 'status'
then
    echo test
else
    echo Nierozpoznana komenda.
fi
