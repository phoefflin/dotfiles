# personal dotfiles

## Requirements

  * base-devel, bash, stow, paru

        # install paru
        mkdir /tmp/paru
        cd /tmp/paru
        sudo pacman -S --needed base-devel stow
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si


  * sudo permissions to install packages

## install

    chezmoi init [--ssh] phoefflin
    chezmoi diff
    chezmoi apply

## useful commands

  * `chezmoi managed`: list managed files
  * `chezmoi execute-template <[template-file]`: evaluate uns dump given template's content
  * `chezmoi data`: show data usable in templates
  * `chezmoi status`: show status
  * `chezmoi add`: ./file

## links

  * chezmoi docs: https://www.chezmoi.io
  * daily operations: https://www.chezmoi.io/user-guide/daily-operations/
  * templating: https://www.chezmoi.io/user-guide/templating/

