<h1 align="center">👨‍💻CodeArt:art:</h1>

<h3 align="center">
  <a href="#screenshots">:camera_flash: Screenshots</a>
  <a href="#installation">:construction: Installation</a>
  <a href="#features">:sparkles: Important features</a>
  <a href="#todos">:white_check_mark: TODOS</a>
</h3>

<div align="center">
  <a href="https://github.com/artart222/CodeArt/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/artart222/CodeArt?color=important&style=flat-square" alt="License">
  </a>

  <img src="https://img.shields.io/github/repo-size/artart222/CodeArt?style=flat-square" alt="Repo size">

  <!--
  <a href="https://discordapp.com/channels/875388658637754428">
    <img src="https://img.shields.io/discord/875388658637754428?style=flat-square" alt="Discord server">
  </a>
  -->

  <a href="https://github.com/artart222/CodeArt/issues">
    <img src="https://img.shields.io/github/issues/artart222/CodeArt?color=ff0000&style=flat-square" alt="Open issues">
  </a>

  <a href="https://github.com/artart222/CodeArt/pulse">
    <img src="https://img.shields.io/github/last-commit/artart222/CodeArt?color=blueviolet&style=flat-square" alt="Last commit">
  </a>
</div>


<a id="installation"></a>
## :construction: Install CodeArt easily

🐧 On linux:
```bash
sudo pip3 install distro
python3 install.py
```

#### ⚠️  IMPORTANT NOTE: macOS installer is not tested because I dont have a device with macOS and installer does not work on debian

🍎 On macOS:
```bash
python3 install.py
```

🪟 on Windows:

⚡🐚 Open a powershell session as administrator and run these commands one by one:

```powershell
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
python3.exe installer\windows.py
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

#### 🔌Install plugins:

Open NeoVim and type `:PackerInstall`
And then `:PackerCompile`

#### 🌲💺 Σ🖥️ Install lsp and treesitter:

* You can install lsp for a language with `:LspInstall <language>`
* and you can install treesitter with `:TSInstall <language>`

<a id="screenshots"></a>
## :camera_flash: Screenshots:

![Screenshot1](/utils/media/Screenshot1.png "Screenshots1")

### :art: Many themes!

![Screenshot2](/utils/media/Screenshot2.png "Screenshots2")
![Screenshot3](/utils/media/Screenshot3.png "Screenshots3")
![Screenshot4](/utils/media/Screenshot4.png "Screenshots4")
![Screenshot5](/utils/media/Screenshot5.png "Screenshots5")
![Screenshot6](/utils/media/Screenshot6.png "Screenshots6")
![Screenshot7](/utils/media/Screenshot7.png "Screenshots7")
![Screenshot8](/utils/media/Screenshot8.png "Screenshots8")
![Screenshot9](/utils/media/Screenshot9.png "Screenshots9")
![Screenshot10](/utils/media/Screenshot10.png "Screenshots10")
![Screenshot11](/utils/media/Screenshot11.png "Screenshots11")
![Screenshot12](/utils/media/Screenshot12.png "Screenshots12")
![Screenshot13](/utils/media/Screenshot13.png "Screenshots13")
![Screenshot13](/utils/media/Screenshot14.png "Screenshots14")

<a id="features"></a>
## :sparkles: Features:

* 😴 Lazy load plugins!. With lazy loading NeoVim start up is very fast. It took around 45 miliseconds on virtual machine with 4GB ram and 2 Cores
![LazyLoad](/utils/media/LazyLoad.png "LazyLoad")

* Σ🖥️ Native LSP code completion support with documentation
![CodeCompletion](/utils/media/CodeCompletion.png "CodeCompletion")

* 🌲💺 Treesitter based code highlighting
![Treesitter](/utils/media/Treesitter.png "Treesitter")

* 🌳:card_file_box: NvimTree as file tree
![FileTree](/utils/media/FileTree.png "FileTree")

* 🚏🚌 ToggleTerm as built in terminal
![Terminal](/utils/media/Terminal.png "Terminal")

* 🔭 Fuzzy finder
![Telescope](/utils/media/Telescope.png "Telescope")

* :white_check_mark: TODO viewer
![TODO](/utils/media/TODO.png "TODO")

* :bookmark: Tag viewer
![TagViewer](/utils/media/TagViewer.png "TagViewer")

* 🤔🔑 Wichkey
![Wichkey](/utils/media/Wichkey.png "Wichkey")

* ┇ Status line with git and lsp indicator + File manager and bufferline lsp indicator
![StatusLine](/utils/media/StatusLine.png "StatusLine")

<a id="todos"></a>
# :white_check_mark: TODOS:

1. - [x] Move from lueline to feline or to [this fork of lualine](https://github.com/shadmansaleh/lualine.nvim)
2. - [x] Add lsp status to lualine
3. - [ ] Lazy load plugins
4. - [ ] Find a way to install NeoVim 0.5 on debian based operating systems
5. - [ ] Find a way to install ueberzug on rhel based operating systems and opensuse
6. - [ ] Make new install script for windows
7. - [ ] Test current MacOS script
8. - [ ] Clean current codebase and convert vimscripts(I mean vimscripts in luafiles) to lua and maybe remove some plugins
9. - [ ] Move to shell script for macOS and linux installer and powershell for windows installer
10. - [ ] Implement a way to update CodeArt
11. - [ ] Write a proper WhichKey
12. - [ ] Move from compe to cmp
