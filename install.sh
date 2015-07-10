#!/usr/bin/env bash

# Install Karabiner if it isn't installed, but homebrew and cask are.
if [[ "$(type -P brew)" && "$(brew ls --versions brew-cask)" ]]; then
  if [[ ! "$(brew cask list 2>/dev/null | grep karabiner)" ]]; then
    echo "Installing Karabiner..."
    brew cask install karabiner
  fi
fi

# Copy Karabiner settings.
mkdir -p ~/Library/Application\ Support/Karabiner
echo "Copying Karabiner settings..."
cp private.xml ~/Library/Application\ Support/Karabiner/private.xml

# Copy DefaultKeyBinding.diet
mkdir -p ~/Library/KeyBindings
echo "Copying DefaultKeyBinding.dict..."
cp DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

echo "Done."
