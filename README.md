# Dotfiles

## Contents

 * `./install`: main script
 * `./modules_active`: list of modules (i.e. subfolders) to activate
 * `<module folders>`: grouped configs for specific app/topic, consisting of:
   * `packages.txt`: list of packages (official or AUR) to install
   * `aur`: folder with aur packages to build and install locally
   * `everything else`: configs managed by [GNU Stow](https://www.gnu.org/software/stow/manual/html_node/index.html) 

## Requirements

  * base-devel, bash, stow, paru
  * sudo permissions to install packages

## install

        # edit `modules_active` and run
        ./install
