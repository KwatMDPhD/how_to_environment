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

alias vim="mvim --remote-tab-silent"

alias rsync="rsync --verbose --itemize-changes --human-readable --progress --stats --recursive"

function listpath() {

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

function sshport() {

	ssh $1 -f -N -L localhost:$3:localhost:$2

}

function removejunk() {

	local patterns=("*.swp" "__pycache__" "*.pyc" ".ipynb_checkpoints" ".DS_Store" ".com.apple.*" ".~*")

	for pattern in "${patterns[@]}"; do

		find . -name $pattern -prune -exec rm -rf {} \;

	done

}

function resetmode() {

	find . -not -path "*/.*" -type f -exec chmod 644 {} \;

	find . -not -path "*/.*" -type d -exec chmod 755 {} \;

}

function cleanweb() {

	npx prettier --write $1

}

function cleanjl() {

	julia --eval 'using JuliaFormatter; format(".")'

}

function cleanpy() {

	isort --combine-as --quiet $1 &&
		autoflake --ignore-init-module-imports --in-place --remove-all-unused-imports $1 &&
		black --quiet $1

}

function cleansh() {

	shfmt -s -w $1

}

function gitclone() {

	for repository_name in \
		Environment.md \
		Medicine.md \
		Patient.md \
		GeneSetControl.tsv \
		HotPlot.jl \
		Normalization.jl \
		InformationTheory.jl \
		GCTGMT.jl \
		MDNetwork.jl \
		FeatureSetEnrichment.jl \
		Kraft.py \
		GCTGMT.py \
		Model.py \
		Comparison.py \
		Proxy.py \
		CancerCellLine.py \
		Medulloblastoma.py \
		ChronicFatigueSyndrome.py \
		CleanNB.py \
		MDPost.py \
		FeatureSetEnrichment.py \
		GenomeExplorer.js \
		GSEA.js \
		kwatme.com; do

		git clone https://github.com/KwatME/$repository_name

	done

}

function gitaddcommitpush() {

	git add -A && git commit -m "$1" && git push

}

function gitsyncrepositories() {

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

function releasepypi() {

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
