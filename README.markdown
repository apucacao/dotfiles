# Dotfiles

## Installation:

    git clone git@github.com:apucacao/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule update --init
    rake install

### Vim

The Vim plugin Command-T needs to be compiled:

    cd ~/.vim/bundle/command-t
    rake make

For plenty of color schemes, see the [Color Sample Pack][colorpack].

[colorpack]: http://www.vim.org/scripts/script.php?script_id=625
