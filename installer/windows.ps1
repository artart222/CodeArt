# Install CodeArt system dependencies for Windows (Chocolatey).

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is installed. Checking next dependency..."
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

function Test-AppInstalled([string]$AppName) {
    return [bool](Get-Command $AppName -ErrorAction SilentlyContinue)
}

function pack_manager_install([string]$PackName, [string]$AppName) {
    if (Test-AppInstalled $AppName) {
        Write-Host "$AppName is installed. Checking next dependency..."
        return
    }

    Write-Host "$AppName is not installed."
    Write-Host "Installing $AppName ($PackName)."
    choco install $PackName -y
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

Write-Host "Installing dependencies"

pack_manager_install "neovim" "nvim"
pack_manager_install "python" "python"
pack_manager_install "curl" "curl"
pack_manager_install "git" "git"
pack_manager_install "7zip" "7z"
pack_manager_install "make" "make"
pack_manager_install "nodejs" "node"
pack_manager_install "mingw" "gcc"
pack_manager_install "ripgrep" "rg"
pack_manager_install "fd" "fd"
pack_manager_install "tree-sitter" "tree-sitter"

Write-Host "Installing JetBrainsMono Nerd Font..."
choco install nerd-fonts-JetBrainsMono -y

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

if (Get-Command pip3 -ErrorAction SilentlyContinue) {
    pip3 install --user pynvim
} elseif (Get-Command pip -ErrorAction SilentlyContinue) {
    pip install --user pynvim
} else {
    Write-Host "pip/pip3 not found; skip pynvim."
}

if (Get-Command npm -ErrorAction SilentlyContinue) {
    npm install -g neovim
} else {
    Write-Host "npm not found; skip neovim npm package."
}

Write-Host "Dependencies installed"
Write-Host "Installation process finished"

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
