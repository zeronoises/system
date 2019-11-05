#!/usr/bin/env bash

# function definitions
######################

function vmsList()
{
  vboxmanage list vms | awk -F '"' '{print $2}'
  }

  # select machine to control
  vm=$(vmsList | rofi -dmenu 'Select machine:')
      vboxmanage startvm "$vm"
exit