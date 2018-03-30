#!/bin/bash

PIDFILE=serverpid.pid
COMMAND=$1

#start
if test $COMMAND = 'start'
then
    ./server.sh &
    echo $! > $PIDFILE
#stop
elif test $COMMAND = 'stop'
then
    PID=$(cat $PIDFILE)
    kill $PID
    rm $PIDFILE
#reset
elif test $COMMAND = 'reset'
then
    PID=$(cat $PIDFILE)
    kill $PID
    ./server.sh &
    echo $! > $PIDFILE
#status
elif test $COMMAND = 'status'
then
    echo test
else
    echo Nierozpoznana komenda.
fi
