# personal dotfiles

## Requirements

  * base-devel, bash, stow, paru
  * sudo permissions to install packages

## install

    chezmoi init [--ssh] phoefflin
    chezmoi diff
    chezmoi apply

## useful commands

  * `chezmoi managed`: list managed files
  * `chezmoi execute-template <[template-file]`: evaluate uns dump given template's content
  * `chezmoi data`: show data usable in templates

## links

  * chezmoi docs: https://www.chezmoi.io
  * daily operations: https://www.chezmoi.io/user-guide/daily-operations/
  * templating: https://www.chezmoi.io/user-guide/templating/
