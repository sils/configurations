DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install vim configurations
ln -s $DIR/vim/.vimrc ~/
ln -s $DIR/vim/.vim ~/

# Install git configurations
ln -s $DIR/git/.gitconfig ~/

