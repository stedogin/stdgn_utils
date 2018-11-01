source ~/stedogin/stdgn_utils/source/bash/bash_scripts_shared.sh

# bash profile
alias vb="vi ~/.bashrc"
alias cb="cat ~/.bashrc"

# logging
export LOG_FILE_PATH="${HOME}/logs/log.txt"
alias gl="cat $LOG_FILE_PATH | grep "


echo "bash_scripts_server.sh loaded"