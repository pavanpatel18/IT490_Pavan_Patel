#!/bin/bash

echo "updating system"
sudo apt update && sudo apt upgrade -y

echo "installing packages"
sudo apt install -y php composer rabbitmq-server net-tools openssh-server git

echo "starting ssh"
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh

REPO_DIR="IT490"
REPO_URL="https://github.com/MattToegel/IT490.git"

if [ -d "$REPO_DIR" ]; then
    echo "repository already exists. skipping clone."
else
    echo "cloning IT490 gitHub repo"
    git clone "$REPO_URL"
fi

echo "Running Composer in the project"
cd IT490
composer update
composer install

echo "Setup complete."