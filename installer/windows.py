import os, shutil, ctypes, sys


home_directory_address = os.path.expanduser("~")
currect_directory_address = os.getcwd()

items_in_home_directory = os.listdir(home_directory_address)


def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False


#installing chocolatey(it is package manager for windows)
if is_admin():
    # Code of your program here
    os.system("@\"%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe\" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command \"[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString(\'https://chocolatey.org/install.ps1\'))\" && SET \"PATH=%PATH%;%ALLUSERSPROFILE%\\chocolatey\\bin\"")
else:
    # Re-run the program with admin rights
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)


def copy_or_make_vim_vimrc():
    if ".vimrc" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vimrc", home_directory_address + "/.vimrc-copy.vim")
    elif "_vimrc" in items_in_home_directory:
        shutil.move(home_directory_address + "/_vimrc", home_directory_address + "/_vimrc-copy.vim")
    if ".vim" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vim", home_directory_address + "/.vim-copy/")


def install_dependencys():
    #installing vim
    print("installing vim")
    os.system("scoop install vim")
    print("moving to next dependency")

    #installing curl
    print("installing curl")
    os.system("scoop install curl")

    #installing git
    print("installing git")
    os.system("scoop install git")
    print("moving to next dependency")

    #installing unzip
    print("installing unzip")
    os.system("scoop install unzip")

    #installing ctags
    print("installing ctags")
    os.system("scoop install ctags")
    print("moving to next dependency")


def install_font():
    os.system("scoop bucket add nerd-fonts")


def install_vundle():
    os.system("git clone https://github.com/VundleVim/Vundle.vim.git {}".format(home_directory_address + "/.vim/bundle/Vundle.vim"))

def copy_vimrc():
    shutil.copyfile(currect_directory_address + "/vimrc.vim", home_directory_address + "/_vimrc")


def copy_vimspector():
    os.mkdir(home_directory_address + "/.vim/spector-debugger-conf")
    shutil.copyfile(currect_directory_address + "/vimspector.json", home_directory_address + "/.vim/spector-debugger-conf/vimspector.json")
