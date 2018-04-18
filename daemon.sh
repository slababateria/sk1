#!/bin/bash

PIDFILE=serverpid.pid
COMMAND=$1

#start
if test $COMMAND = 'start'
then
    if test -e $PIDFILE
    then
        PID=$(cat $PIDFILE)
        if test -d /proc/$PID
        then
            echo "BŁĄÐ: Program już jest uruchomiony!"
        else
            ./server.sh &
            echo $! > $PIDFILE
        fi
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
        if test -d /proc/$PID
        then
            kill $PID
            rm $PIDFILE
        else
           echo "BŁĄÐ: Program nie był uruchomiony!"
        fi
    else
        echo "BŁĄÐ: Brak pidfile!"
    fi
    
#reset
elif test $COMMAND = 'reset'
then
    if test -e $PIDFILE
    then
        PID=$(cat $PIDFILE)
        if test -d /proc/$PID
        then
            kill $PID
            ./server.sh &
            echo $! > $PIDFILE
        else
            ./server.sh &
            echo $! > $PIDFILE
        fi
    else
        echo "BŁĄÐ: Brak pidfile!"
    fi
    
#status
elif test $COMMAND = 'status'
then
    if test -e $PIDFILE
    then
        PID=$(cat $PIDFILE)
        if test -d /proc/$PID
            then
            echo "Program jest uruchomiony. PID:" $PID
        else
            echo "Program nie jest uruchomiony."
        fi
    else
        echo "BŁĄÐ: Brak pidfile!"
    fi
else
    echo "BŁĄÐ:Nierozpoznana komenda!"
fi
