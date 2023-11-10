# check if chocolatey is installed
Set-ExecutionPolicy AllSigned
if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "Chocolatey is already installed."
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")    
    Write-Host "Chocolatey has been installed."
}

function pack_manager_install([string]$PACK_NAME, [string]$APP_NAME) {
    # Checking is package installed or not.
    $COMMAND = &{iex "$APP_NAME --version"} 2>&1
    $VERSION = -not (($COMMAND | % gettype) -eq  [System.Management.Automation.ErrorRecord])

    # Installing package if it isn't installed
    if ("$VERSION" -eq "False") {
        echo "$APP_NAME is not installed."
        echo "Installing $APP_NAME."
        choco install -v "$PACK_NAME" -y
    } else {
        echo "$APP_NAME is installed. Checking next dependency..."
    }
}


echo "Downloading dependencys"

# Installing other dependencies
pack_manager_install "neovim" "nvim"
pack_manager_install "python" "python"
pack_manager_install "curl" "curl"
pack_manager_install "git" "git"
pack_manager_install "7zip" "7z"
pack_manager_install "make" "make"
pack_manager_install "nodejs" "nodejs"
pack_manager_install "mingw" "mingw"
pack_manager_install "ripgrep" "ripgrep"
pack_manager_install "fd" "fd"
echo "Installing JetBrains Nerd Fonts mono..."
choco install --pre -v "jetbrainsmononf" -y


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
pip3 install pynvim
npm install neovim


echo "Dependencies installed\n"
echo "Installation process finished"


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
