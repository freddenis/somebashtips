#!/bin/bash
# Fred Denis -- August 21st 2020 -- fred.denis3@gmail.com
# Trap command example
#

on_exit() {
  printf "\033[1;36m%s\033[m\n" "Delete tempfile"
  rm -f "${TEMPFILE}"
  printf "\033[1;36m%s\033[m\n" "Check if the tempfile still exists"
  ls -ltr "${TEMPFILE}"
  printf "\033[1;36m%s\033[m\n" "Sending an email to let people know the script is finished"
}
on_term() {
  printf "\033[1;31m%s\033[m\n" "I have been killed !"
  exit 123
}
on_int() {
  printf "\n\033[1;31m%s\033[m\n" "You hit CTRL-C, are you sure ? (y/n)"
  read answer
  if [[ ${answer} = "y" ]]; then
    printf "\033[1;31m%s\033[m\n" "OK, lets quit then"
    exit 456
  else
    printf "\033[1;31m%s\033[m\n" "OK, lets continue then"
  fi
}
trap on_term TERM SEGV
trap on_exit EXIT
trap on_int INT

TEMPFILE=$(mktemp)
printf "\033[1;36m%s\033[m\n" "Tempfile is ${TEMPFILE}"
printf "\033[1;36m%s\033[m\n" "Sending an email to let people know the script is starting"

printf "\033[1;36m%s\033[m\n" "I am PID $$"
printf "\033[1;36m%s\033[m\n" "A first sleep"
sleep 20
printf "\033[1;36m%s\033[m\n" "A second sleep"
sleep 10

