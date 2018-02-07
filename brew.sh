#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# Install Zsh.
brew install zsh
# Install Fish.
brew install fish
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh

# Install `wget` with IRI support.
brew install wget --with-iri

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/.zsh/completions
cp etc/hub.zsh_completion ~/.zsh/completions/_hub
echo 'fpath=(~/.zsh/completions $fpath)' >> ~/.zsh_profile
echo 'autoload -U compinit && compinit' >> ~/.zsh_profile

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra
rbenv install ruby

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Fonts
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-inconsolata
brew cask install font-courier-prime
brew cask install font-courier-prime-code
brew cask install font-courier-nerd-font
brew cask install font-ricty-diminished

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install lastpass-cli --with-pinentry
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Mac App Store CLI
brew install mas

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
brew cask install --appdir="/Applications" hazel
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="/Applications" launchrocket
brew cask install --appdir="~/Applications" xquartz
brew cask install --appdir="~/Applications" bartender

# Development tool casks
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" macdown

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" discord
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" quiver
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" fantastical
brew cask install --appdir="/Applications" github
brew cask install --appdir="/Applications" karabiner
brew cask install --appdir="/Applications" lastpass
brew cask install --appdir="/Applications" mailplane
brew cask install --appdir="/Applications" launchrocket
brew cask install --appdir="/Applications" omnifocus
brew cask install --appdir="/Applications" scrivener
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" wacom-intuos-tablet

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Install Docker, which requires virtualbox
brew cask install docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
