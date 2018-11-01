source ~/bash_scripts_shared.sh

# bash profile
alias vb="vi ~/.bash_profile"
alias cb="cat ~/.bash_profile"

# aws ssh
sc(){
	ssh -i ~/.ssh/aws_free_tier_machine.pem ubuntu@$1
}

alias sa="sc ec2-18-221-195-136.us-east-2.compute.amazonaws.com"

echo "bash_scripts_user.sh loaded"