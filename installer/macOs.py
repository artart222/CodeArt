import os, shutil, urllib.request


home_directory_address = os.path.expanduser("~")
currect_directory_address = os.getcwd()

items_in_home_directory = os.listdir(home_directory_address)


def copy_or_make_vim_vimrc():
    if ".vimrc" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vimrc", home_directory_address + "/.vimrc-copy.vim")
    if ".vim" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vim", home_directory_address + "/.vim-copy/")


def install_homebrew():
    os.system("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"")


def install_dependencys():
    #listing installed apps
    list_of_apps = os.listdir("/usr/bin")

    #installing vim
    if "vim" in list_of_apps:
        print("vim is installed. moving to next dependency")
    else:
        print("vim is not installed.\ninstalling vim")
        os.system("brew install vim")

    #installing git
    if "git" in list_of_apps:
        print("git is installed. moving to next dependency")
    else:
        print("git is not installed.\ninstalling git")
        os.system("brew install git")

    #installing ctags
    if "ctags" in list_of_apps:
        print("ctags is installed. all dependencys now are installed")
    else:
        print("ctags is not installed.\ninstalling ctags")
        os.system("brew install ctags")


def install_needed_font():
    print("beginning file download")
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip"
    urllib.request.urlretrieve(url, home_directory_address + "/Desktop/Caskaydia-Cove-Nerd-Font.zip")
    print("file downloaded")

    os.chdir(home_directory_address + "/Desktop")
    os.system("unzip Caskaydia-Cove-Nerd-Font.zip")

    os.system("mv ~/Desktop/Caskaydia Cove Nerd Font Complete* /Library/Fonts/")


def install_vundle():
    os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")


def copy_vimrc():
    shutil.copyfile(currect_directory_address + "/vimrc.vim", home_directory_address + "/.vimrc")


def copy_vimspector():
    os.mkdir(home_directory_address + "/.vim/spector-debugger-conf")
    shutil.copyfile(currect_directory_address + "/vimspector.json", home_directory_address + "/.vim/spector-debugger-conf/vimspector.json")
