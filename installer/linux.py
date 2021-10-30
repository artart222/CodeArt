import os, shutil, distro, urllib.request


def find_distro_name():
    print("Finding which distribution is your os based on")
    distro_name = distro.like()
    if distro_name == "":
        distro_name = distro.id()
    print("Your distro is " + distro_name + " like\n")

    return distro_name


def make_backup_of_config(home_directory_address):
    print("Creating backup for your configs")
    if not os.path.isdir(home_directory_address + "/.config/nvim"):
        pass
    else:
        try_number = 1
        while os.path.isdir(home_directory_address + "/.config/{}nvim".format(try_number)):
            try_number += 1
        shutil.move(home_directory_address + "/.config/nvim", home_directory_address + "/.config/{}nvim".format(try_number))
    print("Backup created\n")


def pack_manager_install(distro_name, list_of_apps, pack_name, arch, debian, rhel, opensuse):
    if pack_name in list_of_apps:
        print(pack_name, "is installed. moving to next dependency")
    else:
        print(pack_name, "is not installed.\ninstalling", pack_name)
        if distro_name == "arch":
            os.system("sudo pacman -Sy {} --noconfirm".format(arch))
        elif distro_name == "debian" or distro_name == "ubuntu":
            os.system("sudo apt update; sudo apt install {} -y".format(debian))
        elif distro_name == "rhel" or distro_name == "fedora" or distro_name == "centos":
            os.system("sudo dnf update -y; sudo dnf install {} -y".format(rhel))
        elif distro_name == "opensuse":
            os.system("sudo zypper ref; sudo zypper -n {}".format(opensuse))


def pip_install(pkgs, pack_name):
    if pack_name in pkgs:
        print("{} is installed. moving to next dependency".format(pack_name))
    else:
        os.system("sudo pip3 install {}".format(pack_name))


def npm_install(pkgs, pack_name):
    if pack_name in pkgs:
        print("{} is installed. moving to next dependency".format(pack_name))
    else:
        os.system("sudo npm -g install {}".format(pack_name))


def install_needed_font(home_directory_address):
    print("Downloading font")
    print("Please wait")
    try:
        os.mkdir(home_directory_address + "/.fonts")
    except FileExistsError:
        pass

    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip"
    urllib.request.urlretrieve(url, home_directory_address + "/.fonts/JetBrainsMono.zip")
    print("file downloaded")

    os.chdir(home_directory_address + "/.fonts")
    os.system("unzip JetBrainsMono.zip")

    os.system("fc-cache -f -v")
    print("Font installed")


def install_packer():
    print("Downloading Neovim package manager")
    os.system("git clone https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
    print("Neovim package manager downloaded")


def copy_configs(home_directory_address):
    print("Moving configs")
    try:
        os.mkdir(home_directory_address + "/.config/nvim")
    except FileExistsError:
        pass

    cmd = "cp -r {}".format(os.path.dirname(__file__) + "/../configs/* ") + home_directory_address + "/.config/nvim/"
    os.system(cmd)
    print("Configs moved")


def main():
    home_directory_address = os.path.expanduser("~")
    make_backup_of_config(home_directory_address)

    # listing installed apps and packages
    list_of_apps = os.listdir("/bin")

    distro_name = find_distro_name()

    print("Downloading dependencys")
    # NOTE: Fix installing NeoVim on ubuntu for now.
    pack_manager_install(distro_name, list_of_apps, "nvim", "neovim", " ", "python3-neovim", "neovim")
    if distro_name == "debian" or distro_name == "ubuntu":
        os.system("sudo apt install software-properties-common")
        os.system("sudo add-apt-repository ppa:neovim-ppa/unstable -y")
        os.system("sudo apt update")
        os.system("sudo apt install neovim -y")
    pack_manager_install(distro_name, list_of_apps, "curl", "curl", "curl", "curl", "curl")
    pack_manager_install(distro_name, list_of_apps, "git", "git", "git", "git", "git")
    pack_manager_install(distro_name, list_of_apps, "unzip", "unzip", "unzip", "unzip", "unzip")
    pack_manager_install(distro_name, list_of_apps, "ctags", "ctags", "universal-ctags", "ctags", "ctags")
    pack_manager_install(distro_name, list_of_apps, "node", "nodejs", "nodejs", "nodejs", "nodejs14")
    pack_manager_install(distro_name, list_of_apps, "npm", "npm", "npm", "npm", "npm14")
    pack_manager_install(distro_name, list_of_apps, "ranger", "ranger", "ranger", "ranger", "ranger")
    pack_manager_install(distro_name, list_of_apps, "xclip", "xclip", "xclip", "xclip", "xclip")
    pack_manager_install(distro_name, list_of_apps, "gcc", "gcc", "gcc", "gcc", "gcc")
    pack_manager_install(distro_name, list_of_apps, "ripgrep", "ripgrep", "ripgrep", "ripgrep", "ripgrep")
    pack_manager_install(distro_name, list_of_apps, "wget", "wget", "wget", "wget", "wget")
    if distro_name == "debian" or distro_name == "ubuntu" or distro_name == "raspbian":
        print("Installing ueberzug and its requirements if they are not installed")
        os.system("sudo apt update; sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev -y")
    elif distro_name == "arch":
        print("installing ueberzug and its requirements if thry are not installed")
        os.system("sudo pacman -Sy ueberzug --noconfirm")
    elif distro_name == "rhel" or distro_name == "fedora" or distro_name == "centos":
        # TODO: Find a way to install ueberzug on fedora
        pass
    elif distro_name == "opensuse":
        # TODO: Find a way to install ueberzug on opensuse
        pass

    py3_pkgs = []
    os.system("pip3 list >> pip3.txt")
    with open("pip3.txt", "r") as pip_file:
        for line in pip_file:
            py3_pkgs.append(line.split(" ")[0])
    npm_pkgs = []
    os.system("npm list -g --depth=0 >> npm.txt")
    with open("npm.txt", "r") as npm_file:
        for line in npm_file:
            try:
                pkg = line.split(" ")[1]
                pkg = pkg.split("@")[0]
                npm_pkgs.append(pkg)
            except:
                pass
    pip_install(py3_pkgs, "pynvim")
    npm_install(npm_pkgs, "neovim")

    install_needed_font(home_directory_address)
    install_packer()
    print("Dependencys installed\n")
    copy_configs(home_directory_address)
    print("instalation proccess finished")


main()
