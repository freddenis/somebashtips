#!/bin/bash
# Fred Denis -- August 21st 2020 -- fred.denis3@gmail.com
# Trap command example
#

on_term() {
  printf "\033[1;31m%s\033[m\n" "I have been killed !"
}

trap on_term TERM

TEMPFILE=$(mktemp)
printf "\033[1;36m%s\033[m\n" "Tempfile is ${TEMPFILE}"
printf "\033[1;36m%s\033[m\n" "Sending an email to let people know the script is starting"

printf "\033[1;36m%s\033[m\n" "I am PID $$"
printf "\033[1;36m%s\033[m\n" "A first sleep"
sleep 20
printf "\033[1;36m%s\033[m\n" "A second sleep"
sleep 10

printf "\033[1;36m%s\033[m\n" "Delete tempfile"
rm -f "${TEMPFILE}"
printf "\033[1;36m%s\033[m\n" "Check if tempfile still exists"
ls -ltr "${TEMPFILE}"
printf "\033[1;36m%s\033[m\n" "Sending an email to let people know the script is finished"
