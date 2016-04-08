#!/bin/bash

dmesg | grep -q "EFI v"    # -q tell grep to output nothing
if [ $? -eq 0 ]      # check exit code; if 0 EFI, else BIOS
then
    echo "You are using EFI boot."
  else
    echo "You are using BIOS boot"
fi
