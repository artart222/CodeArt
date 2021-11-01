#!/usr/bin/bash

mv ~/.config/nvim/lua/user_settings.lua ~/.config/
svn export --force https://github.com/artart222/CodeArt.git/trunk/configs/ ~/.config/nvim
mv --force ~/.config/user_settings.lua ~/.config/nvim/lua/user_settings.lua
