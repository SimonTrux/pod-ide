#!/bin/bash

# This script will alias the podman run command to "ide" which you can use as nvim.

# Check if "install" or "remove" is specified and if command present
if [ $# -ne 3 ]; then
  echo "Error, need <verb> <alias_name> <command_to_alias>
  - available verbs : install, remove"
  exit 1
fi

verb="$1"
alias_name="$2"
command_to_alias="$3"

alias_file="/tmp/test"

if ! grep -q "alias ${alias_name}=" $alias_file && [[ $verb = "install" ]] ; then
# echo -e "Installing alias ide=${1} \n"
  echo "alias ${alias_name}='$command_to_alias'" >> $alias_file 
  source $alias_file
elif grep -q "alias ${alias_name}=" $alias_file && [[ $verb = "remove" ]] ; then
# sed -i '/^alias\side=/d' $alias_file
  sed -i "/^alias\s${alias_name}=/d" $alias_file
fi

exit 0
