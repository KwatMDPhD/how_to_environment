# environment

Create a nice computational environment :bath:

## Set profile

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/vimrc > ~/.vimrc
```

## Set Git

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

## Set Julia

Install Julia 1.6

```julia
using Pkg

for na in [
    "BenchmarkTools",
    "Comonicon",
    "IJulia",
    "JuliaFormatter",
    "OhMyREPL",
    "PackageCompiler",
    "PyCall",
    "Revise",
]

    Pkg.add(na)

end
```

```sh
mkdir ~/.julia/config/ &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/startup.jl > ~/.julia/config/startup.jl
```

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set Python

```sh
INSTALLING_VERSION=3.9.7 &&

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $INSTALLING_VERSION &&

pyenv global $INSTALLING_VERSION
```

```sh
python -m pip install autoflake isort black jupyter jupyter-black webio_jupyter_extension kaleido
```

## Set Jupyter notebook

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/master/notebook.json > ~/.jupyter/nbconfig/notebook.json
```

Install https://github.com/lambdalisue/jupyter-vim-binding
