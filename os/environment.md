## Set profile

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/setting/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/setting/vimrc > ~/.vimrc
```

## Set git

```sh
git config --global user.name "KwatMDPhD" &&

git config --global user.email "kwat.me@icloud.com" &&

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

Install Julia 1.6.3

```julia
using Pkg: add, build

for na in [
    "BenchmarkTools",
    "IJulia",
    "JuliaFormatter",
    "OhMyREPL",
    "PackageCompiler",
    "PyCall",
    "Revise",
]

    add(na)

end
```

```sh
mkdir ~/.julia/config/ &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/setting/startup.jl > ~/.julia/config/startup.jl
```

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/setting/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set python

```sh
INSTALLING_VERSION=3.9.7 &&

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $INSTALLING_VERSION &&

pyenv global $INSTALLING_VERSION
```

```sh
python -m pip install black isort autoflake jupyter webio_jupyter_extension kaleido
```

## Set jupyter notebook

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/setting/notebook.json > ~/.jupyter/nbconfig/notebook.json
```

Install https://github.com/lambdalisue/jupyter-vim-binding
