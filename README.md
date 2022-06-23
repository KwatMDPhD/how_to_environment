# how_to_environment

## Set profiles

```bash
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/code/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/code/vimrc > ~/.vimrc
```

## Set git preferences

```bash
git config --global user.name ""

git config --global user.email ""

git config --global credential.helper osxkeychain &&

git config --global pull.rebase true &&

git config --global fetch.prune true &&

git config --global diff.colorMoved zebra &&

git config --global status.submoduleSummary true &&

git config --global init.defaultBranch main &&

git config --global diff.submodule log &&

git lfs install
```

## Set julia

Install [julia](https://julialang.org/downloads).

```bash
ln -s /Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
```

```julia
using Pkg

for na in [
    "OhMyREPL",
    "BenchmarkTools",
    "IJulia",
]

    Pkg.add(na)

end
```

```bash
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/code/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set python

Check for the latest, stable version

```bash
 pyenv install --list | grep 3.10
```

Install

```bash
VERSION=3.10.2 &&

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $VERSION &&

pyenv global $VERSION
```

## Set jupyter

```bash
python -m pip install jupyter webio_jupyter_extension autoflake isort black jupyter-black
```

```bash
mkdir ~/.jupyter/nbconfig &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/code/notebook.json > ~/.jupyter/nbconfig/notebook.json
```

Install https://github.com/lambdalisue/jupyter-vim-binding
