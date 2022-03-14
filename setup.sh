#!/bin/bash

pacman --noconfirm -Syu \
    mosh \
    tmux \
    zsh

ZSH=$(which zsh)

if [ "$ZSH" != "$SHELL" ]
then
    chsh -s "$ZSH"
fi
