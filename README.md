<h1 align="center">👨‍💻CodeArt:art:</h1>

<h3 align="center">
  <a href="#screenshots">:camera_flash: Screenshots</a>
  <a href="#installation">:construction: Installation</a>
  <a href="#update">⬆️📅 How to update CodeArt</a>
  <a href="#features">:sparkles: Important features</a>
</h3>

<div align="center">
  <a href="https://github.com/artart222/CodeArt/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/artart222/CodeArt?color=important&style=flat-square" alt="License">
  </a>

  <img src="https://img.shields.io/github/repo-size/artart222/CodeArt?style=flat-square" alt="Repo size">

  <a href="https://discord.gg/mhy9aK9Qzp">
    <img src="https://img.shields.io/badge/Discord-server-blue?style=flat-square" alt="Discord server">
  </a>

  <a href="https://github.com/artart222/CodeArt/issues">
    <img src="https://img.shields.io/github/issues/artart222/CodeArt?color=ff0000&style=flat-square" alt="Open issues">
  </a>

  <a href="https://github.com/artart222/CodeArt/pulse">
    <img src="https://img.shields.io/github/last-commit/artart222/CodeArt?color=blueviolet&style=flat-square" alt="Last commit">
  </a>
</div>

## :warning: I chaged CodeArt directory structure on 23th of april. If you downloaded CodeArt before that day please make backup of your config remove nvim config directory and clone https://github.com/artart222/CodeArt as your nvim config directory.

<a id="installation"></a>

## :construction: Install CodeArt easily

**_please backup any existing configuration files_**

🐧🍎 On linux and macOS:

```bash
git clone https://github.com/artart222/CodeArt ~/.config/nvim
chmod +x ~/.config/nvim/installer/linux-mac.sh
exec ~/.config/nvim/installer/linux-mac.sh
```

**_If you have debian, after the instalation finished you must [add debian testing repos](https://serverfault.com/a/550856) and after that run_**:

```bash
sudo apt update; sudo apt install neovim
```

**_And after that open neovim and run `:PackerSync` and then reopen nevom!_**

🪟 on Windows:

**_please backup any existing configuration files_**

⚡🐚 open a powershell session as administrator and run this command:

```powershell
git clone https://github.com/artart222/CodeArt $HOME\AppData\Local\nvim
powershell.exe -executionpolicy bypass -file $HOME\AppData\Local\installer\windows.ps1
```

#### 🌲💺Σ🖥️ Install lsp and treesitter:

- You can install lsp for a language with `:LspInstall <language>`
- You can install treesitter with `:TSInstall <language>`

#### These NeoVim configurations use many nerd fonts icons. JetBrains Mono will be installed by default. If you have problem for fonts and see weird icons you must change your terminal font.

<a id="update"></a>

## ⬆️📅 How to update CodeArt:

#### Very important note: Updating CodeArt will replace this github repo configs directory with ~/.config/nvim so if you don't want to lose any existing modifications you've made you must put your modifications into ~/.config/nvim/lua/user_settings.lua on linux and mac, put your configs in C:\Users\your_user\AppData\Local\nvim\lua\user_settings.lua if you use Windows

- Run `:CodeArtUpdate` inside NeoVim
- Restart NeoVim
- Run `:PackerSync`
- Restart NeoVim!

<a id="screenshots"></a>

## :camera_flash: Screenshots:

![Screenshot1](/utils/media/Screenshot1.png "Screenshots1")

### :art: Many themes!

<div align="center">

[Enfocado](https://github.com/wuelnerdotexe/vim-enfocado)
![Screenshot8](/utils/media/Screenshot8.png "Screenshots8")
[Tokyonight](https://github.com/folke/tokyonight.nvim) with storm style
![Screenshot2](/utils/media/Screenshot2.png "Screenshots2")
[Tokyonight](https://github.com/folke/tokyonight.nvim) with night style
![Screenshot3](/utils/media/Screenshot3.png "Screenshots3")
[Tokyonight](https://github.com/folke/tokyonight.nvim) with day style
![Screenshot4](/utils/media/Screenshot4.png "Screenshots4")
[Nightfly](https://github.com/bluz71/vim-nightfly-guicolors)
![Screenshot5](/utils/media/Screenshot5.png "Screenshots5")
[Moonfly](https://github.com/bluz71/vim-moonfly-colors)
![Screenshot6](/utils/media/Screenshot6.png "Screenshots6")
[Nord](https://github.com/shaunsingh/nord.nvim)
![Screenshot7](/utils/media/Screenshot7.png "Screenshots7")
[Onedark](https://github.com/navarasu/onedark.nvim) with dark style
![Screenshot9](/utils/media/Screenshot9.png "Screenshots9")
[Onedark](https://github.com/navarasu/onedark.nvim) with darker style
![Screenshot10](/utils/media/Screenshot10.png "Screenshots10")
[Onedark](https://github.com/navarasu/onedark.nvim) with cool style
![Screenshot11](/utils/media/Screenshot11.png "Screenshots11")
[Onedark](https://github.com/navarasu/onedark.nvim) with deep style
![Screenshot12](/utils/media/Screenshot12.png "Screenshots12")
[Onedark](https://github.com/navarasu/onedark.nvim) with warm style
![Screenshot13](/utils/media/Screenshot13.png "Screenshots13")
[Onedark](https://github.com/navarasu/onedark.nvim) with warmer style
![Screenshot13](/utils/media/Screenshot14.png "Screenshots14")

</div>

<a id="features"></a>

## :sparkles: Features:

- 😴 Lazy load plugins!. With lazy loading NeoVim starts up very fast. It took me around 20 miliseconds on a virtual machine with 4GB ram and 2 Cores
  ![LazyLoad](/utils/media/LazyLoad.png "LazyLoad")

- Σ🖥️ Native LSP code completion support with documentation
  ![CodeCompletion](/utils/media/CodeCompletion.png "CodeCompletion")

- 🌲💺 [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) based code highlighting
  ![Treesitter](/utils/media/Treesitter.png "Treesitter")

- 🌳:card_file_box: [NvimTree](https://github.com/kyazdani42/nvim-tree.lua) as file tree
  ![FileTree](/utils/media/FileTree.png "FileTree")

- 🚏🚌 [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) as built in terminal
  ![Terminal](/utils/media/Terminal.png "Terminal")

- 🔭 [Fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
  ![Telescope](/utils/media/Telescope.png "Telescope")

- :white_check_mark: [TODO viewer](https://github.com/folke/todo-comments.nvim)
  ![TODO1](/utils/media/TODO.png "TODO")
  ![TODO2](/utils/media/TODO2.png "TODO2")

- :bookmark: [Tag viewer](https://github.com/liuchengxu/vista.vim#commands)
  ![TagViewer](/utils/media/TagViewer.png "TagViewer")

- 🤔🔑 [Whichkey](https://github.com/folke/which-key.nvim)
  ![Wichkey](/utils/media/Wichkey.png "Wichkey")

- ┇ [Status line](https://github.com/nvim-lualine/lualine.nvim) with git and lsp indicator + File manager and [bufferline](https://github.com/akinsho/nvim-bufferline.lua) lsp indicator
  ![StatusLine](/utils/media/StatusLine.png "StatusLine")
