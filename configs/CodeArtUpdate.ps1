mv $HOME\AppData\Local\nvim\lua\user_settings.lua $HOME\AppData\Local\user_settings.lua
svn export --force https://github.com/artart222/CodeArt.git/trunk/configs/ $HOME\AppData\Local\nvim
rm $HOME\AppData\Local\nvim\lua\user_settings.lua
mv $HOME\AppData\Local\user_settings.lua $HOME\AppData\Local\nvim\lua\user_settings.lua
