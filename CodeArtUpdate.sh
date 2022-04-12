#!/usr/bin/bash

if [[ $XDG_CONFIG_HOME != "" || $XDG_CONFIG_HOME != " " ]]; then
  nvim_dir=~/.config/nvim
else
  nvim_dir=$XDG_CONFIG_HOME/nvim
fi

if [ ! -d $nvim_dir/.git ]; then

  cd $nvim_dir/..
  mv ./nvim/lua/user_settings.lua ./user_settings.lua

  cp -r $nvim_dir $nvim_dir.backup
  rm -r --force $nvim_dir
  git clone https://github.com/artart222/CodeArt $nvim_dir
  mv ./user_settings.lua $nvim_dir/user_settings.lua

  exit 1
fi

exit 0
