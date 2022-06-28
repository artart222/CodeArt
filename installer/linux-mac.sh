if [[ $(uname) == "Linux" ]]; then
  PACKAGE_MANAGER=""
  if [ -x "$(command -v pacman)" ]; then
    PACKAGE_MANAGER="pacman"
  elif [ -x "$(command -v apt-get)" ]; then
    PACKAGE_MANAGER="apt-get"
  elif [ -x "$(command -v dnf)" ]; then
    PACKAGE_MANAGER="dnf"
  elif [ -x "$(command -v zypper)" ]; then
    PACKAGE_MANAGER="zypper"
  elif [ -x "$(command -v emerge)" ]; then
    PACKAGE_MANAGER="emerge"
  fi
elif [[ $(uname) == "Darwin" ]]; then
  PACKAGE_MANAGER="brew"
  LIST_OF_APPS=($(ls "/bin")+$(ls "/usr/bin"))
  IFS="|"

  if [[ "${IFS}"${LIST_OF_APPS[*]}"${IFS}" =~ "${IFS}brew${IFS}" ]]; then
    echo "brew is not installed"
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "brew, is installed. Checking next dependency.."
  fi
fi

pack_manager_install() {
  LIST_OF_APPS=($(ls "/bin")+$(ls "/usr/bin"))
  IFS="|"
  if [[ "${IFS}"${LIST_OF_APPS[*]}"${IFS}" =~ "${IFS}$2${IFS}" ]]; then
    echo "$2, is installed. Checking next dependency.."
  else
    echo $2 "is not installed."
    echo "Installing" $2
    if [[ "$1" == "pacman" ]]; then
      sudo pacman -Sy $3 --noconfirm
    elif [[ "$1" =~ "apt-get" ]]; then
      sudo apt update
      sudo apt install $4 -y
    elif [[ "$1" =~ "dnf" ]]; then
      sudo dnf update -y
      sudo dnf install $5 -y
    elif [[ "$1" =~ "zypper" ]]; then
      sudo zypper ref
      sudo zypper install -n $6
    elif [[ "$1" =~ "emerge" ]]; then
      emerge $7
    elif [[ "$1" =~ "brew" ]]; then
      brew install $8
    fi
  fi
}

install_font() {
  echo "Downloading font"
  echo "Please wait"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip --output-document ~/Downloads/JetBrainsMono.zip
  unzip ~/Downloads/JetBrainsMono.zip -d ~/Downloads/JetBrainsMono
  if ![ $PACKAGE_MANAGER == "brew" ]; then
    mv ~/Downloads/JetBrainsMono/JetBrains Mono Regular Nerd Font Complete Mono.ttf /Library/Fonts/
  else
    mv ~/Downloads/JetBrainsMono/JetBrains Mono Regular Nerd Font Complete Mono.ttf ~/.fonts/
    fc-cache -f -v
  fi
  echo "Font installed"
}

echo "Installing dependencies"
if ! [ "$(cat /etc/os-release | grep "ID=debian")" == "ID=debian" ]; then
  if [ $PACKAGE_MANAGER == "apt-get" ]; then
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt update
    pack_manager_install $PACKAGE_MANAGER "nvim" " " "neovim" "" "" "" ""
  else
    pack_manager_install $PACKAGE_MANAGER "nvim" "neovim" "neovim" "neovim" "neovim" "app-editors/neovim" "neovim"
  fi
fi
pack_manager_install $PACKAGE_MANAGER "curl" "curl" "curl" "curl" "curl" "net-misc/curl" "curl"
pack_manager_install $PACKAGE_MANAGER "git" "git" "git" "git" "git" "dev-vcs/git" "git"
pack_manager_install $PACKAGE_MANAGER "unzip" "unzip" "unzip" "unzip" "unzip" "app-arch/unzip" "unzip"
pack_manager_install $PACKAGE_MANAGER "node" "nodejs" "nodejs" "nodejs" "nodejs14" "net-libs/nodejs" "node"
pack_manager_install $PACKAGE_MANAGER "npm" "npm" "npm" "npm" "npm14" "" ""
pack_manager_install $PACKAGE_MANAGER "xclip" "xclip" "xclip" "xclip" "xclip" "x11-misc/xclip" "xclip"
pack_manager_install $PACKAGE_MANAGER "gcc" "gcc" "gcc" "gcc" "gcc" "sys-devel/gcc" "gcc"
pack_manager_install $PACKAGE_MANAGER "make" "make" "make" "make" "make" "sys-devel/make" "make"
pack_manager_install $PACKAGE_MANAGER "ripgrep" "ripgrep" "ripgrep" "ripgrep" "ripgrep" "sys-apps/ripgrep" "ripgrep"
pack_manager_install $PACKAGE_MANAGER "fd" "fd" "fd-find" "fd-find" "fd" "sys-apps/fd" "fd"
pack_manager_install $PACKAGE_MANAGER "wget" "wget" "wget" "wget" "wget" "net-misc/wget" "wget"

install_font

pip3 install pynvim
npm install neovim

echo "Dependencies installed"

echo
echo "Installation finished"
