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


# TODO Complete this function for neovim
def copy_or_make_vim_vimrc():
    pass


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
    url = "https://github-releases.githubusercontent.com/27574418/1ec18580-452f-11ea-8073-041a7cbaca61?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210425%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210425T103503Z&X-Amz-Expires=300&X-Amz-Signature=590045ddcc5069e5003a7000294b386f5e4b8f4c4467de1609e55c7258918d57&X-Amz-SignedHeaders=host&actor_id=55560437&key_id=0&repo_id=27574418&response-content-disposition=attachment%3B%20filename%3DFiraCode.zip&response-content-type=application%2Foctet-stream"
    urllib.request.urlretrieve(url, home_directory_address + "/.fonts/Caskaydia-Cove-Nerd-Font.zip")
    print("file downloaded")

    os.chdir(home_directory_address + "/.fonts")
    os.system("unzip Caskaydia-Cove-Nerd-Font.zip")

    os.system("fc-cache -f -v")


def install_vim_plug():
    os.system("sh -c \'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\'")


def copy_configs():
    os.system("mkdir ~/.config/nvim")
    os.system("cp ../configs/* ~/.config/nvim")
