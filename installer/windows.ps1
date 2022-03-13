# Installing chocolatey
Set-ExecutionPolicy AllSigned
#check if chocolatey is installed
$testchoco = powershell choco -v
if(-not($testchoco)){
    Write-Output "Chocolatey is installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    echo "Chocolatey is already installed"
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")


function pack_manager_install([string]$PACK_NAME, [string]$APP_NAME) {
    # Checking is package installed or not.
    $COMMAND = &{iex "$APP_NAME --version"} 2>&1
    $VERSION = -not (($COMMAND | % gettype) -eq  [System.Management.Automation.ErrorRecord])

    # Installing package if it isn't installed
    if ("$VERSION" -eq "False") {
        echo "$APP_NAME is not installed."
        echo "Installing $APP_NAME."
        choco install --pre -v "$PACK_NAME" -y
    } else {
        echo "$APP_NAME is installed. Checking next dependency..."
    }
}


function copy_configs {
    echo "Moving configs"
    Copy-Item -Path ".\configs\" -Destination "~\AppData\Local\nvim" -Recurse
    echo "Configs moved"
}


echo "Downloading dependencies"

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
pack_manager_install "svn" "svn"
echo "Installing JetBrains Nerd Fonts mono..."
choco install --pre -v "jetbrainsmononf" -y


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
pip3 install pynvim
npm install neovim


echo "Dependencies installed\n"
copy_configs
echo "Installation process finished"


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
