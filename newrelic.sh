###############################################################################
# System-Wide Packages                                                        #
###############################################################################

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Add New Relic tap
brew tap newrelic/commune git@source.datanerd.us:commune/newrelic-homebrew

# Make sure we’re using the latest Homebrew.
brew update

brew install newrelic/commune/biosecurity
brew install newrelic/commune/nrql
brew install newrelic/commune/grandcentral
brew install newrelic/commune/newrelic-vault
brew install newrelic/commune/newrelic-env
brew install newrelic/commune/nos

