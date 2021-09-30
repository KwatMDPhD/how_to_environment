## Reset disk

Boot into the recovery mode

Restart > `Cmd + R`

Erase all volumes except the base

Make a new volume

Reinstall macOS

## Update software

System Preferences > Software Update

## Simlify dock

Move to the left

Remove everything

## Set System Preferences

## Set Finder Preferences

## Disable press-and-hold

```sh
defaults write -globalDomain ApplePressAndHoldEnabled -bool false
```

## Get Brew and program

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

```sh
brew install tree rename macvim fzf ripgrep node pyenv-virtualenv julia shfmt pandoc mactex git-lfs
```

## Set MacVim

Preferences > General > Open untitled window > never

Preferences > General > Open files from applications > in the current window

Preferences > General > After last window closes > Quit MacVim

Preferences > Appearance > Titlebar appearance > Transparent

## Get software

XCode

Docker

SensibleSideButtons

Corsair iCUE

Zoom

IINA

## Get Safari extension

Ad block

Vimari

Vimari > Open Configuration File >

```json
"excludedUrls": "localhost,tinkercad.com",
```

## [Set computational environment](computational_environment.md)
