#!/bin/bash

PIDFILE=serverpid.pid
COMMAND=$1

#start
if test $COMMAND = 'start'
then
    if test -e $PIDFILE
    then
        echo "BŁĄÐ: Program już jest uruchomiony!"
    else
        ./server.sh &
        echo $! > $PIDFILE
    fi
#stop
elif test $COMMAND = 'stop'
then
    if test -e $PIDFILE
    then
        PID=$(cat $PIDFILE)
        kill $PID
        rm $PIDFILE
    else
        echo "BŁĄÐ: Program nie jest uruchomiony!"
    fi
#reset
elif test $COMMAND = 'reset'
then
    if test -e $PIDFILE
    then
        PID=$(cat $PIDFILE)
        kill $PID
        ./server.sh &
        echo $! > $PIDFILE
    else
        echo "BŁĄÐ: Program nie jest uruchomiony!"
    fi
#status
elif test $COMMAND = 'status'
then
    if test -e $PIDFILE
    then
        echo "Program jest uruchomiony. PID:" $(cat $PIDFILE)
    else
        echo "Program nie jest uruchomiony."
    fi
else
    echo Nierozpoznana komenda.
fi
