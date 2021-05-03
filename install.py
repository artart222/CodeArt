import platform

os = platform.system()

if os == "Linux":
    from installer import linux

    distro_name = linux.find_distro_name()
    linux.make_backup_of_config()
    linux.install_dependencys(distro_name)
    linux.install_needed_font()
    linux.install_vim_plug()
    linux.copy_configs()
    linux.install_plugins_and_extensions()

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
