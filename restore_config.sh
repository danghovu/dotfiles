if [[ "$OSTYPE" == "darwin"* ]]; then 
  echo "Install brew ..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Install Kitty..."
  brew cask install kitty
  echo "Install Neovim..."
  brew install neovim
else 
  echo "Invalid OS"
  exit 1
fi

mkdir -p Code/go
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/kitty
cp {kitty.conf,theme.conf} ~/.config/kitty
mkdir ~/.config/karabiner
cp karabiner.json ~/.config/karabiner
mkdir ~/.config/nvim
cp ./{coc-settings.json,init.vim} ~/.config/nvim
cp ./{.vimrc,.zshrc,.gitconfig,.kubectl_aliases,.bash_aliases,.vim_snippet} ~/

#Install golang libs
nvim +PlugInstall
nvim +GoInstallBinaries

