# Installing chocolatey
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")


function pack_manager_install([string]$PYTHON_VERSIONACK_NAME) {
    echo "Installing $PYTHON_VERSIONACK_NAME"
    choco install "$PYTHON_VERSIONACK_NAME" -y
}


function copy_configs {
    echo "Moving configs"
    Copy-Item -Path ".\configs\" -Destination "~\AppData\Local\nvim" -Recurse
    echo "Configs moved"
}


echo "Downloading dependencys"
# Installing python
$PYTHON_VERSION = &{python -V} 2>&1
# check if an ErrorRecord was returned
$version = if($PYTHON_VERSION -is [System.Management.Automation.ErrorRecord])
{
    # grab the version string from the error message
    $PYTHON_VERSION.Exception.Message
}
else
{
    $PYTHON_VERSION
}
if ($PYTHON_VERSION == "" -or $PYTHON_VERSION == " ") {
    pack_manager_install -v "python"
}
# Installing other dependencies
pack_manager_install("neovim")
pack_manager_install("curl")
pack_manager_install("git")
pack_manager_install("7zip")
pack_manager_install("make")
pack_manager_install("nodejs")
pack_manager_install("mingw")
pack_manager_install("ripgrep")
pack_manager_install("fd")
pack_manager_install("svn")
pack_manager_install("jetbrainsmononf")

pip3 install pynvim
npm install neovim


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"


echo "Dependencies installed\n"
copy_configs
echo "Installation process finished"


$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
