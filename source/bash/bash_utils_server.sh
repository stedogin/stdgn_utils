source ~/stdgn_utils/source/bash/bash_utils_shared.sh

# bash profile
alias vb="vi ~/.bashrc"
alias cb="cat ~/.bashrc"

# logging
export LOG_FILE_PATH="${HOME}/logs/log.txt"
alias gl="cat $LOG_FILE_PATH | grep "

# run sudo with env vars
alias sp37="sudo -HE env PATH=$PATH PYTHONPATH=$PYTHONPATH python3.7 " 


echo "bash_scripts_server.sh loaded"