#!/bin/bash

# Source bashrc if bash_profile isn't there
# This is incase .bash_profile isn't loaded below Ubuntu 18

export OS_VERSION=$(printf "%.0f\n" $(lsb_release -rs) )

if [[ $OS_VERSION -lt 18 ]]; then
  # Source It
  . $HOME/.bashrc
fi
