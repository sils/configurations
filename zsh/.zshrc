# Aliases
alias g=git
alias p='sudo pacman'
alias pr='sudo pacman -R'
alias ps='pacman -Ss'
alias pi='sudo pacman -Syu'
alias pipi='pip install'

# Python venv
. ~/venvs/def/bin/activate

# Ruby gems
export PATH=$PATH:~/.gem/ruby/2.3.0/bin

# coala autocompletion
autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete `which coala`)"
