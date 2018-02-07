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

brew install erlang

# Install exenv

 git clone git://github.com/mururu/exenv.git ~/.exenv
 echo 'export PATH="$HOME/.exenv/bin:$PATH"' >> ~/.zsh_profile

# Install elixir-build
git clone git://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build

exenv install 1.6.1

mix local.hex
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez