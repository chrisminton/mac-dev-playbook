#!/bin/bash

if softwareupdate --history | grep --silent "Command Line Tools"; then
    echo 'Command-line tools already installed.'
else
    printf "Installing Xcode"
    xcode-select --install
fi

if ! command -v brew; then
    printf "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! command -v ansible; then
    brew install ansible
fi

ansible-galaxy install -r requirements.yml
