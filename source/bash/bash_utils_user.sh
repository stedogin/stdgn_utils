#!/usr/bin/env bash
source ~/stdgn_utils/source/bash/bash_utils_shared.sh

# bash profile
alias vb="vi ~/.bash_profile"
alias cb="cat ~/.bash_profile"

# aws ssh
sc(){
	ssh -i ~/.ssh/aws_free_tier_machine.pem ubuntu@$1
}

alias sa="sc ec2-18-221-195-136.us-east-2.compute.amazonaws.com"
alias ss="sc ec2-18-188-233-77.us-east-2.compute.amazonaws.com"

# aws scp
sp(){
	scp -i ~/.ssh/aws_free_tier_machine.pem $1 ubuntu@ec2-18-221-195-136.us-east-2.compute.amazonaws.com:~
}

scpshiny(){
    scp -r -i ~/.ssh/aws_free_tier_machine.pem $1 ubuntu@ec2-18-188-233-77.us-east-2.compute.amazonaws.com:~
}

echo "bash_scripts_user.sh loaded"