# environment

Create a nice computational environment :bath:

## Set profile

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/vimrc > ~/.vimrc
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

Install Julia 1.7

```julia
using Pkg

for na in [
    "IJulia",
]

    Pkg.add(na)

end
```

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set Python

```sh
VE=3.10.0 &&

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $VE &&

pyenv global $VE
```

```sh
python -m pip install autoflake isort black jupyter jupyter-black webio_jupyter_extension kaleido
```

## Set Jupyter notebook

```sh
mkdir ~/.jupyter/nbconfig &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/notebook.json > ~/.jupyter/nbconfig/notebook.json
```

Install https://github.com/lambdalisue/jupyter-vim-binding
