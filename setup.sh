#!/bin/sh

cat aliases >> ~/.bashrc
cat coa_function.sh >> ~/.bashrc
cat gitconfig >> ~/.gitconfig
echo "extension:"
code --install-extension eamodio.gitlens

echo "echo installextinbashrc; code --install-extension zxh404.vscode-proto3" >> ~/.bashrc
