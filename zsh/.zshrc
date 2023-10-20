# Aliases
alias g=git
alias camon='sudo modprobe -r v4l2loopback && sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 && gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2'

alias p='sudo pacman'
alias pr='sudo pacman -R'
alias ps='pacman -Ss'
alias pi='sudo pacman -Syu'

alias pipi='pip install'
alias pipir='pip install -r requirements.txt'

alias s='sudo'
alias sr='sudo !!'

alias ipy='ipython --no-confirm-exit --no-banner'

alias gm='. ~/.venvs/coon/bin/activate'
alias ae='. ~/.venvs/aer/bin/activate'

# Python venv
. ~/venvs/def/bin/activate

# Ruby gems
export PATH=$PATH:~/.gem/ruby/2.3.0/bin:~/Downloads/ngrok-stable-linux-amd64

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
