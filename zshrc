FONT_DEFAULT="$(tput sgr0)"

FONT_BOLD="$(tput bold)"

FONT_EMERALD="\033[38;5;43m"

FONT_PURPLE="\033[38;5;93m"

FONT_BLUE="\033[38;5;4m"

FONT_GREY="\033[38;5;8m"

alias ..="cd .."

alias ...="cd ../.."

if [ "$(uname)" = "Linux" ]; then

	alias ls="ls --human-readable --classify --no-group --color=auto"

elif [ "$(uname)" = "Darwin" ]; then

	alias ls="ls -G"

fi

alias ll="ls -l"

alias la="ls -lA"

alias lt="ls -ltr"

alias rm="rm -i"

alias cp="cp -i"

alias mv="mv -i"

alias mkdir="mkdir -pv"

alias grep="grep --color"

alias du="du -h"

alias df="df -h"

alias vim="mvim"

alias rsync="rsync --verbose --itemize-changes --human-readable --progress --stats --recursive"

function list_path() {

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

		*) printf "Can not extract $1.\n" ;;

		esac

	fi

}

function ssh_port() {

	ssh $1 -f -N -L localhost:$3:localhost:$2

}

function remove_junk() {

	local patterns=("*.swp" "__pycache__" "*.pyc" ".ipynb_checkpoints" ".DS_Store" ".com.apple.*" ".~*")

	for pattern in "${patterns[@]}"; do

		find . -name $pattern -prune -exec rm -rf {} \;

	done

}

function reset_mode() {

	find . -not -path "*/.*" -type f -exec chmod 644 {} \;

	find . -not -path "*/.*" -type d -exec chmod 755 {} \;

}

function clean_sh() {

	shfmt -s -w $1

}

function clean_jl() {

	for f in $(find . -type f -name "*.jl"); do
		echo $f
		julia --eval "using JuliaFormatter; format_file(\"$f\")"
	done

}

function clean_py() {

	for f in $(find . -type f -name "*.py"); do
		echo $f
		isort --combine-as --quiet $f
		autoflake --ignore-init-module-imports --in-place --remove-all-unused-imports $f
		black --quiet $f
	done

}

function clean_ipynb() {

	cleannb **/*.ipynb

}

function clean_web() {

	npx prettier --write "**/*.{json,js,jsx,ts,tsx,md,html}"

}

function git_clone() {

	for repository_name in \
		environment \
		physiology \
		diagnosis \
		pathogen \
		patient \
		Support.jl \
		Normalization.jl \
		Information.jl \
		DataIO.jl \
		GCTGMT.jl \
		Plot.jl \
		FeatureSetEnrichment.jl \
		MDNetwork.jl \
		only_human \
		blood_blood_everywhere \
		cd4_t_cell_in_cfs \
		kraft \
		feature_set_enrichment \
		comparison \
		model \
		proxy \
		gene_set_control \
		cancer_cell_line \
		medulloblastoma \
		chronic_fatigue_syndrome \
		cleannb \
		mdpost \
		genome_explorer \
		kwatme.com \
		translational-crc.org; do

		git clone https://github.com/KwatME/$repository_name

	done

}

function git_add_commit_push() {

	git add -A && git commit -m "$1" && git push

}

function git_sync() {

	for directory in *; do

		if [ -d "$directory/.git" ]; then

			printf "$FONT_BOLD$FONT_EMERALD$d\n"

			printf "$directory\n"

			cd $directory

			printf "${FONT_PURPLE}git status$FONT_DEFAULT\n"

			git status

			printf "${FONT_BLUE}git add -A$FONT_DEFAULT\n"

			git add -A

			printf "${FONT_PURPLE}git commit -m $1$FONT_DEFAULT\n"

			git commit -m "$1"

			printf "${FONT_BLUE}git pull$FONT_DEFAULT\n"

			git pull

			printf "${FONT_PURPLE}git push$FONT_DEFAULT\n"

			git push

			cd ..

		fi

	done

}

function update_jl() {

	julia --eval 'using Pkg; Pkg.update()' &&
		for jl in *; do
			printf "$jl\n"
			cd $jl
			julia --eval 'using Pkg; Pkg.activate("."); Pkg.update()'
			cd ..
		done

}

function release_pypi() {

	rm -rf build dist *.egg-info &&
		python setup.py sdist &&
		twine upload dist/* &&
		rm -rf build dist *.egg-info

}

if [ "$(uname)" = "Linux" ]; then

	PS1="\[$FONT_BOLD\]\w\[$FONT_DEFAULT\] "

elif [ "$(uname)" = "Darwin" ]; then

	PROMPT="%B%~%b "

	RPROMPT=" %B%*%b"

fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
