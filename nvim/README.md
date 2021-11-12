# NVIM SETUP
Cloned from https://github.com/ecosse3/nvim/tree/master/lua/plugins

## For tree-sitter haskell, follow the directions to symlink gcc properly on osx
https://github.com/tree-sitter/tree-sitter-haskell

Also have to install lua-language-server
https://github.com/sumneko/lua-language-server/wiki/PreCompiled-Binaries

brew uninstall neovim
brew uninstall luajit --ignore-dependencies
brew install --HEAD luajit
brew install --HEAD neovim

brew install ripgrep

npm i -g typescript typescript-language-server
npm i -g neovim