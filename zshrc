# ==============================================================================
# Colors
# ==============================================================================
FONT_DEFAULT="$(tput sgr0)"

FONT_BOLD="$(tput bold)"

FONT_EMERALD="\033[38;5;43m"

FONT_PURPLE="\033[38;5;93m"

FONT_BLUE="\033[38;5;4m"

FONT_GREY="\033[38;5;8m"

# ==============================================================================
# Aliases
# ==============================================================================
alias ..="cd .."

alias ...="cd ../.."

alias ....="cd ../../.."

alias ls="ls -G"

alias ll="ls -l"

alias la="ls -lA"

alias lt="ls -ltr"

alias du="du -h"

alias df="df -h"

alias grep="grep --color"

alias rm="rm -i"

alias mkdir="mkdir -pv"

alias cp="cp -i"

alias mv="mv -i"

alias rsync="rsync --archive --verbose --itemize-changes --human-readable --progress --stats"

alias xargs="xargs -t"

alias ju="julia --project"

alias shfmt="shfmt -s -w"

# ==============================================================================
# Functions
# ==============================================================================
function path() {

	tr ":" "\n" <<<$PATH

}

function rc() {

	source ~/.zshrc

}

function extract() {

	if [ -f $1 ]; then

		case $1 in

		*.tar.bz2) tar xvjf $1 ;;

		*.tar.gz) tar xvzf $1 ;;

		*.bz2) bzip2 -dk $1 ;;

		*.rar) unrar x $1 ;;

		*.gz) gunzip $1 ;;

		*.bgz) bgzip $1 ;;

		*.tar) tar xvf $1 ;;

		*.tbz2) tar xvjf $1 ;;

		*.tgz) tar xvzf $1 ;;

		*.zip) unzip $1 ;;

		*.Z) uncompress $1 ;;

		*.7z) 7z x $1 ;;

		*) printf "Failed to extract $1\n" ;;

		esac

	fi

}

function re-rm() {

	pa_=(".DS_Store" ".com.apple.*" ".~*" "*.swp" "__pycache__" "*.pyc" ".ipynb_checkpoints")

	for pa in $pa_; do

		find . -name "$pa" -prune -print0 | xargs -0 rm -rf

	done

}

function re-chmod() {

	find . -type f -print0 | xargs -0 chmod 644

	find . -type d -print0 | xargs -0 chmod 755

}

function re-rename() {

	find . -depth -print0 | xargs -0 -p rename --sanitize --lower-case --expr "s/-/_/g" --force

}

function re-sed() {

	rg --files-with-matches $1 | xargs sed -i "" "s/$1/$2/g"

}

# ==============================================================================
# Pip functions
# ==============================================================================
function pip-update() {

	python -m pip list --outdated --format=freeze | grep -v "^-e" | cut -d = -f 1 | xargs python -m pip install --upgrade

}

function pip-reset() {

	python -m pip freeze | grep -v "^-e" | xargs -p python -m pip uninstall --yes

}

# ==============================================================================
# Julia functions
# ==============================================================================
function re-jl() {

	for pa in $(find -E . -regex ".*/*\.jl" -type d -prune); do

		pushd $pa

		printf "$FONT_BOLD$FONT_PURPLE$(pwd)$FONT_DEFAULT\n"

		pkgr enforce .

		pkgr export-nb .

		ju --eval "using Pkg; Pkg.instantiate(); Pkg.update(); Pkg.test()"

		popd

	done

}

# ==============================================================================
# Lean project functions
# ==============================================================================
function re-pro() {

	for pa in $(find -E . -regex ".*/*\.pro" -type d -prune); do

		pushd $pa

		printf "$FONT_BOLD$FONT_BLUE$(pwd)$FONT_DEFAULT\n"

		lea enforce .

		ju --eval "using Pkg; Pkg.instantiate(); Pkg.update()"

		popd

	done

}

# ==============================================================================
# Clean functions
# ==============================================================================
function re-clean-jl() {

	find -E . -regex ".*/*\.(jl|ipynb)" -type f -print0 | xargs -0 clean-jl

}

function re-clean-py() {

	autoflake --in-place --remove-all-unused-imports . &&

	isort --profile black . &&

	black .

}

function re-clean-web() {

	find -E . -regex ".*/*\.(json|md|ts|tsx|js|jsx)" -type f -print0 | xargs -0 npx prettier --write

}

# ==============================================================================
# Docker functions
# ==============================================================================

# ==============================================================================
# Git functions
# ==============================================================================
function re-git-fetch-status-diff() {

	for pa in $(find -E . -regex ".*/\.git" -type d -prune); do

		pushd $pa/../

		printf "$FONT_BOLD$FONT_EMERALD$(pwd)$FONT_DEFAULT\n"

		git fetch

		git status

		git diff

		popd

	done

}

function re-git-add-commit-push() {

	for pa in $(find -E . -regex ".*/\.git" -type d -prune); do

		pushd $pa/../

		printf "$FONT_BOLD$FONT_EMERALD$(pwd)$FONT_DEFAULT\n"

		git commit -a -m "$1"

		git push

		popd

	done

}

# ==============================================================================
# Housekeep
# ==============================================================================
function re-housekeep() {

	re-rm

	re-jl

	re-pro

	re-clean-jl

	re-clean-py

	re-clean-web

	re-git-add-commit-push "$1"

}

# ==============================================================================
# Style
# ==============================================================================
PROMPT="%B%~%b "

RPROMPT=" %B%*%b"

# ==============================================================================
# Julia bin
# ==============================================================================
PATH=~/.julia/bin:$PATH

# ==============================================================================
# Pyenv
# ==============================================================================
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

eval "$(pyenv init -)"

# ==============================================================================
# Additional settings
# ==============================================================================
export NODE_OPTIONS="--max-old-space-size=16000"
