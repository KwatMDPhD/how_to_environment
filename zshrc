# ================================================================================================
# Colors
# ================================================================================================
FONT_DEFAULT="$(tput sgr0)"

FONT_BOLD="$(tput bold)"

FONT_EMERALD="\033[38;5;43m"

FONT_PURPLE="\033[38;5;93m"

FONT_BLUE="\033[38;5;4m"

FONT_GREY="\033[38;5;8m"

# ================================================================================================
# Aliases
# ================================================================================================
alias ..="cd .."

alias ...="cd ../.."

alias ....="cd ../../.."

alias ls="ls -hG"

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

alias tree="tree -h"

alias shfmt="shfmt -s -w"

alias ju="julia --project"

alias pu="ju --eval \"using Pluto; Pluto.run(auto_reload_from_file = true)\""

alias jp="jupyter-nbconvert --log-level 40 --inplace --execute --ExecutePreprocessor.timeout=-1 --clear-output"

alias dc="docker run --rm --interactive --tty --user root --volume ~/craft/:/home/craft/"

# ================================================================================================
# Functions
# ================================================================================================
function path() {

	tr ":" "\n" <<<$PATH

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

function prefix-and-flatten() {

	rename -A $1 * &&

	mv * .. &&

	rm -rf $(pwd) &&

	cd ..

}

function recursively-rm() {

	pa_=(".DS_Store" ".com.apple.*" ".~*" "*.swp" "__pycache__" "*.pyc" ".ipynb_checkpoints") &&

	for pa in $pa_; do

		find . -name "$pa" -prune -print0 | xargs -0 rm -rf

	done

}

function recursively-chmod() {

	find . -type f -print0 | xargs -0 chmod 644 &&

	find . -type d -print0 | xargs -0 chmod 755

}

function recursively-rename() {

	find . -not -path "*/.*" -not -path "*/README.md*" -not -path "*/LICENSE*" -depth -print0 | xargs -0 -p rename --sanitize --lower-case --expr "s/-/_/g" --force

}

function recursively-sed() {

	rg --files-with-matches $1 | xargs sed -i "" "s/$1/$2/g"

}

# ================================================================================================
# Kata functions
# ================================================================================================
function recursively-kata() {

	for pa in $(find -E . -regex ".*/*\.(jl|pro)" -type d); do

		pushd $pa &&

		printf "$FONT_BOLD$FONT_PURPLE$(pwd)$FONT_DEFAULT\n" &&

		kata format . &&

		kata call . "update" &&

		kata call . "run" &&

		popd

	done

}

# ================================================================================================
# Clean functions
# ================================================================================================
function recursively-clean-jl() {

	find -E . -regex ".*/*\.(jl|ipynb)" -type f -print0 | xargs -0 clean-jl

}

function recursively-clean-web() {

	find -E . -regex ".*/*\.(json|md|ts|tsx|js|jsx)" -type f -print0 | xargs -0 npx prettier --write

}

function recursively-clean-py() {

	autoflake --in-place --remove-all-unused-imports . &&

	isort --profile black . &&

	black .

}

# ================================================================================================
# Git functions
# ================================================================================================
function recursively-git-fetch-status-diff() {

	for pa in $(find -E . -regex ".*/\.git" -type d); do

		pushd $pa/../ &&

		printf "$FONT_BOLD$FONT_EMERALD$(pwd)$FONT_DEFAULT\n" &&

		git fetch &&

		git status &&

		git diff &&

		popd

	done

}

function recursively-git-add-commit-push() {

	for pa in $(find -E . -regex ".*/\.git" -type d); do

		pushd $pa/../

		printf "$FONT_BOLD$FONT_EMERALD$(pwd)$FONT_DEFAULT\n"

		git add -A

		git commit -m "$1"

        git pull

		git push

		popd

	done

}

# ================================================================================================
# Housekeep
# ================================================================================================
function recursively-housekeep() {

	recursively-rm &&

	recursively-clean-jl &&

	recursively-clean-web &&

	recursively-clean-py &&

	recursively-kata &&

	recursively-git-add-commit-push "$1"

}

# ================================================================================================
# Style
# ================================================================================================
PROMPT="%B%~%b "

RPROMPT=" %B%*%b"

# ================================================================================================
# Julia bin
# ================================================================================================
PATH=~/.julia/bin:$PATH

# ================================================================================================
# Pyenv
# ================================================================================================
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

eval "$(pyenv init -)"

# ================================================================================================
# Additional settings
# ================================================================================================
#export NODE_OPTIONS="--max-old-space-size=16000"
