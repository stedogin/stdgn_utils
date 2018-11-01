export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# screen
alias ns="screen -S "
alias s="screen -r "
alias sx="screen -D -RR "

# misc terminal commands
alias pd="pushd "
alias po="popd"
alias ll="ls -la"
alias bl="bash -l"
alias h="history"
alias hg="history | grep "
alias c="clear"

# git
alias ga="git add ."
alias gm="git commit -m "
alias gp="git pull"
alias gs="git push"

g(){
	gp && ga && gm $1 && gs
}

# pip

# venv
alias d="deactivate"

v(){
	source ~/$1_venv/bin/activate
}

cv(){
	VENV_PATH="${HOME}/$1_venv"
	if [ -d ${VENV_PATH} ]; then
		read -p "$VENV_PATH already exists, continue? (y/n) " -n 1 -r
		echo
		if [[ $REPLY = "n" ]]; then
			return
		fi
	fi
	python3.7 -m venv "${VENV_PATH}"
	v $1
}


echo "bash_scripts_shared.sh loaded"