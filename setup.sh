#!/bin/bash

pacman --noconfirm -Syu \
    mosh \
    zsh

ZSH=$(which zsh)

if [ "$ZSH" != "$SHELL" ]
then
    chsh -s "$ZSH"
fi
