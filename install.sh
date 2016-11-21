#!/usr/bin/env bash

# Install Karabiner if it isn't installed, but homebrew and cask are.
if [[ "$(type -P brew)" && "$(brew tap | awk '/cask/')" ]]; then
  if [[ ! "$(brew cask list 2>/dev/null | grep karabiner)" ]]; then
    echo "Installing Karabiner-Elements..."
    brew cask install karabiner-elements
  fi
  echo "Karabiner-Elements installed."
else
  echo "Homebrew and Homebrew Cask not detected. Not installing Karabiner-Elements."
  echo "If you intended for this script to install Karabiner-Elements, install"
  echo "Homebrew and Homebrew Cask:"
  echo
  echo "http://brew.sh/"
  echo "http://caskroom.io/"
  echo
fi

# Copy Karabiner settings.
mkdir -p ~/.karabiner.d/configuration
echo "Copying Karabiner-Elements settings..."
cp karabiner.json ~/.karabiner.d/configuration/karabiner.json

# Copy DefaultKeyBinding.dict
mkdir -p ~/Library/KeyBindings
echo "Copying DefaultKeyBinding.dict..."
cp DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

echo
echo "Done."
