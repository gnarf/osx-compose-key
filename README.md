# Setting up a "Compose Key" in Mac OS X

Install [Karabiner](https://pqrs.org/osx/karabiner/) for remapping keys support, and download these files into the correct places:

```bash
brew cask install karabiner
mkdir -p ~/Library/Application\ Support/Karabiner
curl 'https://raw.githubusercontent.com/gnarf/osx-compose-key/master/private.xml' -o ~/Library/Application\ Support/Karabiner/private.xml
mkdir -p ~/Library/KeyBindings
curl 'https://raw.githubusercontent.com/gnarf/osx-compose-key/master/DefaultKeyBinding.dict' -o ~/Library/KeyBindings/DefaultKeyBinding.dict
```

In Karabiner, enable "Send Shift-Ctrl-F13 for Right Option":

![screenshot](https://s3.amazonaws.com/f.cl.ly/items/1S1r1a0w3N223b3u0Z0A/Screenshot%202015-05-06%2015.35.43.png)

Note: changes to `~/Library/KeyBindings/DefaultKeyBinding.dict` require quitting and restarting any apps you want to test them in.