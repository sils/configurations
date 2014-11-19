DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install vim configurations
ln -s $DIR/vim/.vimrc ~/
ln -s $DIR/vim/.vim ~/

# Install git configurations
ln -s $DIR/git/.gitconfig ~/

# Install jhbuild configurations
ln -s $DIR/jhbuild/jhbuildrc ~/.config/

# Install octaverc
ln -s $DIR/octave/.octaverc ~/

echo "Please make sure the zsh shell (and wget) is installed or abort this process (Ctrl+C)."
read

sudo sed -i 's,/bin/bash,/bin/zsh,' /etc/default/useradd
sudo chsh -s /bin/zsh $USER

sudo wget -O /etc/zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
touch ~/.zshrc
echo "alias g=git" >> ~/.zshrc
