#!/usr/bin/env bash

OSX_VERSION="$(sw_vers -productVersion | sed -E "s/^[0-9]+\.([0-9]+)/\\1/")"

# Install Karabiner if it isn't installed, but homebrew and cask are.
if [[ "$(type -P brew)" && "$(brew tap | awk '/cask/')" ]]; then
  if [[ ! "$(brew cask list 2>/dev/null | grep karabiner)" ]]; then
    echo "Installing Karabiner..."
	if [[ $OSX_VERSION -ge 12 ]]; then
	  brew cask install karabiner-elements
	else
	  brew cask install karabiner
	fi
  fi
  echo "Karabiner installed."
else
  echo "Homebrew and Homebrew Cask not detected. Not installing Karabiner."
  echo "If you intended for this script to install Karabiner, install"
  echo "Homebrew and Homebrew Cask:"
  echo
  echo "http://brew.sh/"
  echo "http://caskroom.io/"
  echo
fi

# Copy Karabiner settings.
echo "Copying Karabiner settings..."
if (( $(echo "$OSX_VERSION > 12" | bc -l) )); then
  mkdir -p ~/.karabiner.d/configuration
  cp karabiner.json ~/.karabiner.d/configuration/karabiner.json
else
  mkdir -p ~/Library/Application\ Support/Karabiner
  cp private.xml ~/Library/Application\ Support/Karabiner/private.xml
fi

# Copy DefaultKeyBinding.dict
mkdir -p ~/Library/KeyBindings
echo "Copying DefaultKeyBinding.dict..."
cp DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

echo
echo "Done."
