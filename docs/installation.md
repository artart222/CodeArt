# Installation

Back up any existing Neovim config before installing.

## Requirements

- **Neovim 0.12+** (CodeArt refuses to load on older versions)
- **[`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/tree/master/crates/cli) ≥ 0.26.1** on `PATH` (OS package manager / cargo — **not** the npm package)
- Git, a C compiler, make, ripgrep, fd (installers try to provide these)
- A [Nerd Font](https://www.nerdfonts.com/) in the terminal (JetBrains Mono is installed by default)

## Linux and macOS

```bash
git clone https://github.com/artart222/CodeArt ~/.config/nvim
chmod +x ~/.config/nvim/installer/linux-mac.sh
exec ~/.config/nvim/installer/linux-mac.sh
```

### Debian

Stock Debian `neovim` is often too old for 0.12. The installer prints a **red** notice and skips installing Neovim. Install Neovim 0.12+ yourself (testing/backports, AppImage, or [GitHub releases](https://github.com/neovim/neovim/releases)), then continue.

## Windows

Open PowerShell **as administrator**:

```powershell
git clone https://github.com/artart222/CodeArt $HOME\AppData\Local\nvim
powershell.exe -executionpolicy bypass -file $HOME\AppData\Local\nvim\installer\windows.ps1
```

## After install

1. Open Neovim
2. Run `:Lazy sync`
3. Restart Neovim
4. Install language tools as needed — see [LSP and Treesitter](lsp-treesitter.md)

If icons look wrong, set your terminal font to a Nerd Font (e.g. JetBrains Mono Nerd Font).
