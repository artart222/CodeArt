import platform

if platform.system() == "Linux":
    import linux

    distro_name = linux.find_distro_name()
    linux.copy_or_make_vim_vimrc()
    linux.install_dependencys(distro_name)
    linux.install_needed_font(distro_name)
    linux.install_vundle()
    linux.copy_vimrc()
    linux.copy_vimspector()
