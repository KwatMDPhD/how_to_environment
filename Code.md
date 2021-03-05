## Command line

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/vimrc > ~/.vimrc
```

## Global program

Use brew to install everything (try to).

```sh
rm -rf ~/.* # If something breaks, we can learn fix and learn about it
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)" &&

sudo rm -fr /usr/local/*
```

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

```sh
sudo rm -fr /usr/local/*
```

```sh
brew reinstall macvim fzf tree rename node julia shfmt isort black pandoc wkhtmltopdf

pip3 install jupyterlab autoflake
```

## Git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain
```

## Julia

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

## Jupyter

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
