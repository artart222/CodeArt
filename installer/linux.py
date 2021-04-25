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
    if not os.path.isdir(home_directory_address + "/.config/nvim"):
        os.mkdir(home_directory_address + "/.config/nvim")
    else:
        try:
            items_in_nvim_dir = os.listdir(home_directory_address + "./config/nvim")
            last_backup = "0"
            new_last_backup = ""

            numbers = "0123456789"
            for item in items_in_nvim_dir:
                if "backup" in item:
                    for char in item:
                        if char in numbers:
                            new_last_backup += char

                    try:
                        if int(new_last_backup) > int(last_backup):
                            last_backup = new_last_backup
                    except ValueError:
                        pass

                    new_last_backup = ""

            new_backup = int(last_backup) + 1
            os.mkdir(home_directory_address + "/.config/nvim/" + "backup" + str(new_backup))

            for item in items_in_nvim_dir:
                if not "backup" in item:
                    shutil.move(home_directory_address + "/.config/nvim/" + item, home_directory_address + "/.config/nvim/backup" + str(new_backup))
        except FileNotFoundError:
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
        print("ctags is installed. moving to next dependency")
    else:
        print("ctags is not installed.\ninstalling ctags")
        if distro_name == "arch":
            os.system("sudo pacman -Sy ctags --noconfirm")
        elif distro_name == "debian":
            os.system("sudo apt update; sudo apt install universal-ctags -y")
        elif distro_name == "rhel":
            os.system("sudo dnf update -y; sudo dnf install ctags -y")
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n ctags")

    # Installing cmake # TODO complete this part
    if "cmake" in list_of_apps:
        print("cmake is installed. moving to next dependencys")
    else:
        if distro_name == "debian":
            os.system("sudo apt update; sudo apt install cmake -y")

    # Installing nodejs # TODO complete this part
    if "node" in list_of_apps:
        print("nodejs is installed. all dependencys now are installed")
    else:
        if distro_name == "debian":
            os.system("sudo apt update; sudo apt install nodejs -y")


def install_needed_font():
    try:
        os.mkdir(home_directory_address + "/.fonts")
    except FileExistsError:
        pass

    print("beginning file download")
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
    urllib.request.urlretrieve(url, home_directory_address + "/.fonts/FiraCode.zip")
    print("file downloaded")

    os.chdir(home_directory_address + "/.fonts")
    os.system("unzip FiraCode.zip")

    os.system("fc-cache -f -v")


def install_vim_plug():
    os.system("sh -c \'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\'")


def copy_configs():
    try:
        os.mkdir(home_directory_address + "/.config/nvim")
    except FileExistsError:
        pass

    for item in os.listdir(os.path.dirname(__file__) + "/../configs"):
        shutil.copy(os.path.dirname(__file__) + "/../configs/" + item, home_directory_address + "/.config/nvim/" + item)


def install_plugins():
    os.system("nvim -c PlugInstall -c qa!")
