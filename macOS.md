## Reset disk

Boot into the recovery mode by `Cmd + R`

Erase all volumes except the base

Make a new volume

Reinstall macOS

## Set OS

### Update software

System Preferences > Software Update

### Set System Preferences

### Set Finder Preferences

### Simlify dock

### Get software

XCode

### Disable PressAndHold

```sh
defaults write -globalDomain ApplePressAndHoldEnabled -bool false
```

## Set environment

### Command line

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/vimrc > ~/.vimrc
```

### Global program

Uninstall brew.

```sh
rm -rf ~/.*
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)" &&

sudo rm -fr /usr/local/*
```

Install brew.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Use brew to install as many things.

```sh
brew install tree rename macvim fzf the_silver_searcher node julia shfmt isort black pandoc wkhtmltopdf

pip3 install jupyterlab autoflake
```

### Git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain
```

### Julia

```sh
julia
```

```julia
using Pkg: add

for package in (
    "BenchmarkTools",
    "IJulia",
    "PyCall",
    "Revise",
)

    add(package)

end

using Pkg: build

build("IJulia")
```

### Jupyter

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
