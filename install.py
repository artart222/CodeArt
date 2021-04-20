import platform

os = platform.system()

if os == "Linux":
    from installer import linux

    distro_name = linux.find_distro_name()
    linux.copy_or_make_vim_vimrc()
    linux.install_dependencys(distro_name)
    linux.install_needed_font()
    linux.install_vundle()
    linux.copy_vimrc()
    linux.copy_vimspector()

elif os == "Darwin":
    from installer import macOs

    macOs.copy_or_make_vim_vimrc()
    macOs.install_homebrew()
    macOs.install_dependencys()
    macOs.install_needed_font()
    macOs.install_vundle()
    macOs.copy_vimrc()
    macOs.copy_vimspector()

elif os == "Windows":
    from installer import windows

    windows.install_scoop()
    windows.copy_or_make_vim_vimrc()
    windows.install_dependencys()
    windows.install_font()
    windows.install_vundle()
    windows.copy_vimrc()
    windows.copy_vimspector()
