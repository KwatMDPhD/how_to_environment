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

Docker

Zoom

### Get Safari extension

Add block

Vimari

Vimari > Open Configuration File >

```json
"excludedUrls": "localhost,tinkercad.com",
```

### Get Brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Set computational environment

### Get global program

```sh
brew install tree rename macvim fzf ripgrep node pyenv-virtualenv shfmt pandoc mactex git-lfs
```

### Set profile

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/vimrc > ~/.vimrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

### Set MacVim

Preferences >:

General > Open untitled window > never

General > Open files from applications > in the current window

General > After last window closes > Quit MacVim

Appearance > Titlebar appearance > Transparent

### Set python

```sh
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.6 &&

pyenv global 3.9.6 &&

python --version
```

```sh
python -m pip install jupyterlab isort black autoflake
```

### Set git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain &&

git config --global pull.rebase true &&

git config --global fetch.prune true &&

git config --global diff.colorMoved zebra &&

git lfs install
```

### Set julia

Install Julia 1.5.4

Link into /usr/local/bin/julia

```sh
julia
```

```julia
using Pkg: add, build

for name in (
    "IJulia",
    "JuliaFormatter",
    "Revise",
    "BenchmarkTools",
    "PyCall",
)

    add(; name=name)

end

build(; name="IJulia")
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
      "keys": ["Ctrl 0"],
      "selector": "[data-jp-kernel-user]:focus"
    },
    {
      "command": "runmenu:restart-and-run-all",
      "keys": ["Ctrl 9"],
      "selector": "[data-jp-kernel-user]:focus"
    },
    {
      "command": "notebook:enter-command-mode",
      "keys": ["Escape"],
      "selector": ".jp-Notebook.jp-mod-editMode",
      "disabled": true
    }
  ]
}
```

## Note

Uninstall brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)" &&

sudo rm -fr /usr/local/*
```

Upgrade brew programs

```sh
brew update && brew upgrade
```

Uninstall jupyter kernel

```sh
jupyter kernelspec uninstall NAME
```
