import platform

os = platform.system()

if os == "Linux":
    import linux

    distro_name = linux.find_distro_name()
    linux.get_sudo_access()
    linux.copy_or_make_vim_vimrc()
    linux.install_dependencys(distro_name)
    linux.install_needed_font()
    linux.install_vundle()
    linux.copy_vimrc()
    linux.copy_vimspector()

elif os == "Darwin":
    import mac_os

    mac_os.copy_or_make_vim_vimrc()
    mac_os.install_homebrew()
    mac_os.install_dependencys()
    mac_os.install_needed_font()
    mac_os.install_vundle()
    mac_os.copy_vimrc()
    mac_os.copy_vimspector()

elif os == "Windows":
    pass
