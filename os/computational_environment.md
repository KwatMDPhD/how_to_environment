## Set profile

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/setting/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/setting/vimrc > ~/.vimrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/setting/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain &&

git config --global pull.rebase true &&

git config --global fetch.prune true &&

git config --global diff.colorMoved zebra &&

git config --global status.submoduleSummary true

git config --global diff.submodule log

git lfs install
```

## Set julia

Install Julia 1.6.3

```sh
julia
```

```julia
using Pkg: add, build

for name in (
    "BenchmarkTools",
    "IJulia",
    "JuliaFormatter",
    #"Kwat",
    #"PyCall",
    "Revise",
)

    add(name)

end
```

## Set python

```sh
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.6 &&

pyenv global 3.9.6 &&

python --version
```

```sh
python -m pip install isort black autoflake jupyterlab webio_jupyter_extension kaleido
```

## Set jupyter notebook

~/.jupyter/nbconfig/notebook.json

```json
{
  "load_extensions": {
    "vim_binding/vim_binding": true
  },
  "keys": {
    "command": {
      "bind": {
        "ctrl-9": "jupyter-notebook:restart-kernel-and-run-all-cells",
        "ctrl-0": "jupyter-notebook:restart-kernel-and-clear-output"
      },
      "unbind": [
        "0,0"
      ]
    }
  }
}
```

https://github.com/lambdalisue/jupyter-vim-binding

## Set jupyter lab?

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
