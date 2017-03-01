# Resource: https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

main() {
  # Use colors, but only if connected to a terminal, and that terminal
  # supports them.
  if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
  fi
  # Only enable exit-on-error after the non-critical colorization stuff,
  # which may fail on systems lacking tput or terminfo
  set -e

  gimp_path=$(which gimp)
  if [ $? -ne 0 ]; then
    printf "${YELLOW}Gimp is not installed!${NORMAL} Please install Gimp first!\n"
    exit 1
  fi

  version='2.8'
  gimp_path_version_string=$($gimp_path --version)
  if echo "$gimp_path_version_string" | grep -qvF "$version"; then
    printf "${YELLOW}Gimp version is not installed!${NORMAL} Please install Gimp $version first!\n"
    exit 1
  fi

  printf "${BLUE}Cloning GimpPs...${NORMAL}\n"
  hash git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
  }

  gimp_ps_directory="$HOME/.gimp-$version"

  # Backup previous directory, if any
  if [ -e "$gimp_ps_directory" ]; then
    now=$(date +"%Y%m%d%H%M%S")
    mv "$gimp_ps_directory" "$gimp_ps_directory.backup.$now"
  fi

  env git clone --depth=1 https://github.com/doctormo/GimpPs.git $gimp_ps_directory || {
    printf "Error: git clone of GimpPs repo failed\n"
    exit 1
  }

  printf "${GREEN}"
  echo 'GimpPs successfully installed'
  echo 'Enjoy!'
  printf "${NORMAL}"
}

main
