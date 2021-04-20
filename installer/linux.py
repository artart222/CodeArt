import os, shutil, distro, urllib.request


home_directory_address = os.path.expanduser("~")
currect_directory_address = os.getcwd()

items_in_home_directory = os.listdir(home_directory_address)


def find_distro_name():
    print("Finding which distribution is your os based on")
    distro_name = distro.like()
    if distro_name == "":
        distro_name = distro.id()
    print("Your distro is " + distro_name + " like")

    return distro_name


def copy_or_make_vim_vimrc():
    if ".vimrc" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vimrc", home_directory_address + "/.vimrc-copy.vim")
        print("Making backup of your .vimrc")
    if ".vim" in items_in_home_directory:
        shutil.move(home_directory_address + "/.vim", home_directory_address + "/.vim-copy/")
        print("Making backup of your .vim")


def install_dependencys(distro_name):
    #listing installed apps
    list_of_apps = os.listdir("/bin")

    print("Installing dependencys")

    #installing neovim
    if "nvim" in list_of_apps:
        print("neovim is installed. moving to next dependency")
    else:
        print("neovim is not installed.\ninstalling neovim")
        if distro_name == "arch":
            os.system("sudo pacman -Sy neovim --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install neovim -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf neovim python3-neovim -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n neovim")

    #installing curl
    if "curl" in list_of_apps:
        print("curl is not installed. moving to next dependency")
    else:
        print("curl is not installed.\ninstalling curl")
        if distro_name == "arch":
            os.system("sudo pacman -Sy curl --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install curl -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf install curl -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n curl")

    #installing git
    if "git" in list_of_apps:
        print("git is installed. moving to next dependency")
    else:
        print("git is not installed.\ninstalling git")
        if distro_name == "arch":
            os.system("sudo pacman -Sy git --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install git -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf install git -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n git")

    #installing unzip
    if "unzip" in list_of_apps:
        print("unzip is installed. moving to next dependency")
    else:
        print("unzip is not installed.\ninstalling unzip")
        if distro_name == "arch":
            os.system("sudo pacman -Sy unzip --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install unzip -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf install unzip -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n unzip")

    #installing ctags
    if "ctags" in list_of_apps:
        print("ctags is installed. all dependencys now are installed")
    else:
        print("ctags is not installed.\ninstalling ctags")
        if distro_name == "arch":
            os.system("sudo pacman -Sy ctags --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install ctags -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf install ctags -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n ctags")


def install_needed_font():
    try:
        os.mkdir(home_directory_address + "/.fonts")
    except FileExistsError:
        pass

    print("beginning file download")
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip"
    urllib.request.urlretrieve(url, home_directory_address + "/.fonts/Caskaydia-Cove-Nerd-Font.zip")
    print("file downloaded")

    os.chdir(home_directory_address + "/.fonts")
    os.system("unzip Caskaydia-Cove-Nerd-Font.zip")

    os.system("fc-cache -f -v")


def install_vundle():
    os.system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")


def copy_vimrc():
    shutil.copyfile(currect_directory_address + "/vimrc.vim", home_directory_address + "/.vimrc")


def copy_vimspector():
    os.mkdir(home_directory_address + "/.vim/spector-debugger-conf")
    shutil.copyfile(currect_directory_address + "/vimspector.json", home_directory_address + "/.vim/spector-debugger-conf/vimspector.json")
