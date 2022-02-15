## Set profiles

```
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/vimrc > ~/.vimrc
```

## Set git preferences

```
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

```
ln -s /Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
```

```julia
using Pkg

for na in []

    Pkg.add(na)

end
```

```
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set python

Check for the latest, stable version

```
 pyenv install --list | grep 3.10
```

Install

```
VERSION=3.10.2 &&

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $VERSION &&

pyenv global $VERSION
```
