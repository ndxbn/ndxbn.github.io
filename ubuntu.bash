#!/usr/bin/env bash
set -eu

sudo apt update
sudo apt upgrade -y
sudo apt install -y git
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
