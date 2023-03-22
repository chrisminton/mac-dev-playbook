#!/bin/bash

if softwareupdate --history | grep --silent "Command Line Tools"; then
    echo 'Command-line tools already installed.'
else
    printf "Installing Xcode"
    xcode-select --install
fi

if ! command -v brew; then
    printf "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    arch=$(uname -m)
    homebrew_path="/opt/homebrew"
    if [ "$arch" != "arm64" ]; then homebrew_path="/usr/local"; fi
    eval "$(${homebrew_path}/bin/brew shellenv)"
fi

if ! command -v ansible; then
    brew install ansible
fi

ansible-galaxy install -r requirements.yml
