## Set profiles

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/zshrc > ~/.zshrc &&

curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/vimrc > ~/.vimrc
```

## Set git preferences

```sh
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

```julia
using Pkg

for na in [
    "IJulia",
]

    Pkg.add(na)

end
```

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/JuliaFormatter.toml > ~/.JuliaFormatter.toml
```

## Set jupyter

```sh
curl https://raw.githubusercontent.com/KwatMDPhD/environment/main/profile/notebook.json > ~/
```
