#!/bin/bash

export DATE_CMD="date -u +%Y-%m-%d_%H.%M.%S_UTC"
CMDS_LINUX="cat /etc/*release*,cat /proc/version, uname -a,inxi -c 0 -b,lsb_release -a,df -h,lsblk,lscpu,cat /proc/meminfo,lspci,lsusb,lshw -short"

echo "SYSTEM INFORMATION REPORT $(eval ${DATE_CMD})"

if [ "$(uname -s)" == "Linux" ]; then
  CMDS=$CMDS_LINUX
fi

# https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
IFS="," CMDS_LIST=($CMDS)
for CMD in "${CMDS_LIST[@]}"; do
  echo
  echo "---"
  echo
  echo "# ${CMD}"
  echo '```'
  eval "${CMD}"
  echo '```'
done
