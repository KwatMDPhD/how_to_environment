For setting up a macOS computational environment.

## Reset disk

Boot into the recovery mode

Restart > `Cmd + R`

Erase all volumes except the base

Make a new volume

Reinstall macOS

## Set macOS

### Update software

System Preferences > Software Update

### Simlify dock

### Set System Preferences

### Set Finder Preferences

### Disable press-and-hold

```sh
defaults write -globalDomain ApplePressAndHoldEnabled -bool false
```

### Get software

XCode

SensibleSideButtons

Corsair iCUE

VLC Medica Player

### Get Safari extension

Add block

Vimari

Vimari > Open Configuration File >

```json
"excludedUrls": "localhost,tinkercad.com",
```

### Get Brew

Uninstall

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)" &&

sudo rm -fr /usr/local/*
```

Install

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Set computational environment

### Get global program

```sh
brew install tree rename macvim fzf the_silver_searcher node julia python shfmt isort black pandoc &&

python3 -m pip install jupyterlab autoflake
```

Upgrade the programs

```sh
brew update &&

brew upgrade
```

```sh
python3 -m pip list --outdated
```

```sh
python3 -m pip install --upgrade OUTDATED_ONES
```

### Set profile

```sh
curl https://raw.githubusercontent.com/kwatme/Environment.md/master/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/Environment.md/master/vimrc > ~/.vimrc &&

curl https://raw.githubusercontent.com/kwatme/Environment.md/master/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

### Set git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain
```

### Set julia

```sh
julia
```

```julia
using Pkg: add

for package in (
    "BenchmarkTools",
    "IJulia",
    "JuliaFormatter",
    "PyCall",
    "Revise",
)

    add(package)

end

using Pkg: build

build("IJulia")
```

### Set jupyter

```sh
jupyter labextension install @axlair/jupyterlab_vim jupyterlab-plotly
```

Settings > Advanced Settings Editor > Keyboard Shortcuts > User Preferences

```json
{
  "shortcuts": [
    {
      "command": "kernelmenu:restart-and-clear",
      "keys": ["Shift 0", "Shift 0"],
      "selector": "[data-jp-kernel-user]:focus"
    }
  ]
}
```
