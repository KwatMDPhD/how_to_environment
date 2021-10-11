## Set profile

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/setting/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/kwatme/environment/master/setting/vimrc > ~/.vimrc
```

## Set git

```sh
git config --global user.name "KwatME" &&

git config --global user.email "kwat.me@icloud.com" &&

git config --global credential.helper osxkeychain &&

git config --global pull.rebase true &&

git config --global fetch.prune true &&

git config --global diff.colorMoved zebra &&

git config --global status.submoduleSummary true &&

git config --global diff.submodule log &&

git lfs install
```

## Set julia

Install Julia 1.6

```julia
using Pkg: add, build

for na in [
    "BenchmarkTools",
    "IJulia",
    "JuliaFormatter",
    "OhMyREPL",
    "PackageCompiler",
    "Revise",
]

    add(na)

end
```

```sh
mkdir ~/.julia/config/ &&

curl https://raw.githubusercontent.com/kwatme/environment/master/setting/startup.jl > ~/.julia/config/startup.jl
```

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/setting/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set python

```sh
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.6 &&

pyenv global 3.9.6
```

```sh
python -m pip install isort black autoflake jupyterlab webio_jupyter_extension kaleido
```

## Set jupyter notebook

```sh
curl https://raw.githubusercontent.com/kwatme/environment/master/setting/notebook.json > ~/.jupyter/nbconfig/notebook.json
```

Install https://github.com/lambdalisue/jupyter-vim-binding
