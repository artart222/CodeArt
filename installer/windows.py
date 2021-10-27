import os, shutil, subprocess

def run(cmd):
    completed = subprocess.run(["powershell", "-Command", cmd], capture_output=True)
    return completed

run("choco_installer.ps1")

def make_backup_of_config(home_directory_address):
    print("Creating backup for your configs")
    if not os.path.isdir(home_directory_address + "\\AppData\\Local\\nvim"):
        pass
    else:
        try:
            items_in_nvim_dir = os.listdir(home_directory_address + "\\AppData\\Local\\nvim")
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
            os.mkdir(home_directory_address + "\\AppData\\Local\\nvim\\" + "backup" + str(new_backup))

            for item in items_in_nvim_dir:
                if not "backup" in item:
                    shutil.move(home_directory_address + "\\AppData\\Local\\nvim\\" + item, home_directory_address + "\\AppDate\\Local\\nvim\\backup" + str(new_backup))
        except FileNotFoundError:
            pass
    print("Backup created\n")


def pack_manager_install(package_name):
    print("Installing {}".format(package_name))
    os.system("choco install {} -y".format(package_name))


def pip_install(pkgs, pack_name):
    if pack_name in pkgs:
        print("{} is installed. moving to next dependency".format(pack_name))
    else:
        os.system("pip3 install {}".format(pack_name))


def npm_install(pkgs, pack_name):
    if pack_name in pkgs:
        print("{} is installed. moving to next dependency".format(pack_name))
    else:
        os.system("npm -g install {}".format(pack_name))


def install_font():
    pack_manager_install("jetbrainsmononf")


def copy_configs(home_directory_address):
    print("Moving configs")
    try:
        os.mkdir(home_directory_address + "\\AppData\\Local\\nvim")
    except FileExistsError:
        pass

    configs_dir_addr = os.path.dirname(__file__).split("\\")[::-1]
    new_configs_dir_addr = ""
    for string in reversed(configs_dir_addr):
        new_configs_dir_addr += string
        new_configs_dir_addr += "\\"

    cmd = "mv {}".format(str(new_configs_dir_addr) + "\\..\\configs\\ " ) + home_directory_address + "\\AppData\\Local\\nvim\\"
    run(cmd)
    print("Configs moved")


def main():
    home_directory_address = os.path.expanduser("~")

    print("Downloading dependencys")
    pack_manager_install("neovim")
    pack_manager_install("curl")
    pack_manager_install("git")
    pack_manager_install("7zip")
    pack_manager_install("ctags")
    pack_manager_install("nodejs")
    pack_manager_install("pip")
    pack_manager_install( "mingw")
    pack_manager_install("ripgrep")
    pack_manager_install("wget")

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
    pip_install(py3_pkgs, "ueberzug")
    pip_install(py3_pkgs, "pynvim")
    npm_install(npm_pkgs, "neovim")

    install_font()
    print("Dependencys installed\n")
    copy_configs(home_directory_address)
    print("instalation proccess finished")


main()
