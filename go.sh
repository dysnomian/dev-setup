###############################################################################
# System-Wide Packages                                                        #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

brew install go --cross-compile-common

mkdir $HOME/go
export GOPATH=$HOME/go

echo 'export GOPATH=$HOME/go' >> ~/.zsh_profile
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zsh_profile