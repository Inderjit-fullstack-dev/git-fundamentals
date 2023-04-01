#!/bin/bash
#Author Inderjit Singh
#Date: 01 april 2023

echo "Finding git..."

which git;

if [ $? -eq "0" ]; then
	echo "Git is already installed on `hostname` machine"
else
	echo "Git is not installed"
	echo "Checking OS..."
	os=$(cat /etc/os-release | grep -w ID | cut -d = -f2)
	echo "*****************************************"
	echo "Installing git for ${os} Operating System"
	echo "*****************************************"
	if [ $os == "ubuntu" ]; then
		sudo add-apt-repository ppa:git-core/ppa -y ;
		sudo apt update;
		sudo apt install -y git;
	elif [ $os == "fedora" ]; then
		sudo dnf install -y git
	elif [ $os == "amzn" ]; then
		sudo yum install -y git
	else
		echo "We don't support that os yet"
	fi

fi
