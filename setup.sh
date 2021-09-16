#!/bin/sh

cat aliases >> ~/.bashrc
echo "source coa_function.sh" >> ~/.bashrc 
cat gitconfig >> ~/.gitconfig
# git config --global alias.br branch
# git config --global alias.st status
