# Install correct version of Node.js and Node Neovim host
# brew install nvm
. $(brew --prefix nvm)/nvm.sh
echo 'nvm install'
nvm install
npm install -g neovim

# Install Ruby and Solargraph
rbenv install
gem install neovim
gem install solargraph

# Link COC package.json with list of extensions
if [ -L "$HOME/.config/coc/extensions/package.json" ] || [ -f "$HOME/.config/coc/extensions/package.json" ]
then
  read -p "File ~/.config/coc/extensions/package.json exist. Do you want to overwrite it? (yN)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo 'rm ~/.config/coc/extensions/package.json'
    rm ~/.config/coc/extensions/package.json
  fi
fi

if [ ! -L "$HOME/.config/coc/extensions/package.json" ] && [ ! -f "$HOME/.config/coc/extensions/package.json" ]
then
  echo 'ln -s ~/.config/nvim/coc/extensions/package.json ~/.config/coc/extensions/package.json'
  ln -s ~/.config/nvim/coc/extensions/package.json ~/.config/coc/extensions/package.json
fi

# TODO: cd to .config/coc/extensions/ and do npm install
# TODO: brew install python3 and pip3 install pynvim --user
# TODO: brew install cpanm dnd cpanm Neovim::Ext
