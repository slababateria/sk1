#!/bin/bash

PIDFILE=serverpid.pid
COMMAND=$1
PID=$(cat $PIDFILE)
TEST=$(ps | grep $PID)

#start
if test $COMMAND = 'start'
then
   if $TEST
   then
      echo BŁĄD: Proces już jest uruchomiony.
   else
      ./server.sh &
   fi
#stop
elif test $COMMAND = 'stop'
then
   kill $PID
#reset
elif test $COMMAND = 'reset'
then
   kill $PID
   ./server.sh
#status
elif test $COMMAND = 'status'
then
   echo test
else
   echo Nierozpoznana komenda.
fi
