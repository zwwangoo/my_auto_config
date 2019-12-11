#!/bin/sh

export DISABLE_AUTO_TITLE="true"
cmd=$(which tmux)
session=codefun

if [ -z $cmd ]; then
  echo "You need to install tmux."
  exit 1
fi

$cmd has -t $session

if [ $? != 0 ]; then
  $cmd new -d -n work -s $session

  $cmd splitw -h -p 10 -t $session
  $cmd splitw -v -p 50 -t $session
fi

$cmd att -d -t $session:1.0

exit 0

