#!/bin/bash

JOB_NAME=yo

RUN_DIR="/var/vcap/sys/run/${JOB_NAME}"
LOG_DIR="/var/vcap/sys/log/${JOB_NAME}"
PIDFILE="${RUN_DIR}/pid"

case $1 in
start)
  echo $$ > $PIDFILE
  exec /var/vcap/packages/hello-server/hello
  ;;
stop)
  kill -9 `cat $PIDFILE`
  rm -f $PIDFILE
  ;;
esac


