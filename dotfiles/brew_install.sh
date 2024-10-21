# Install Homebrew

# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # obsolete
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade

# Install packages
brew install htop
brew install openssl
brew install openssh
brew install git
brew install git-delta
brew install wget
brew install unrar

brew install starship
# brew install powerlevel10k

brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-history-substring-search # ?
brew install z
brew install zsh-completions

brew install bat
brew install micro
brew install gping
brew install curl
brew install eza
brew install fzf
brew install jq
brew install tldr
brew install redis
brew install direnv
brew install zoxide
brew install tmux

# package managers
# brew install asdf
brew install mise
# brew install nix # not yet

echo "Success! Basic brew packages are installed."

# Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install cask packages

brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" spotify
# brew install --cask --appdir="/Applications" sublime-text
brew install --cask --appdir="/Applications" postman
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" brave-browser
brew install --cask --appdir="/Applications" flux
brew install --cask --appdir="/Applications" iterm2

brew install --cask ngrok
brew install --cask --appdir="/Applications" jumpcut # copyclip from appStore was nicer..
brew install --cask --appdir="/Applications" vlc
brew install --cask --appdir="/Applications" tunnelblick
brew install --cask --appdir="/Applications" visual-studio-code
brew install --cask --appdir="/Applications" cursor
brew install --cask --appdir="/Applications" rubymine

brew install --cask font-hack-nerd-font
brew install --cask font-caskaydia-cove-nerd-font


echo "Success! Brew additional applications are installed."
# Remove outdated versions from the cellar.
brew cleanup
