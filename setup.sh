git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc

ln -s ~/dotfiles/.zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

brew install tmux

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

mkdir -p ~/.config/tmuxinator
ln -s ~/dotfiles/.config/tmuxinator/mhnote.yml ~/.config/tmuxinator/mhnote.yml
