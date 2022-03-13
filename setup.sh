#!/bin/bash
pacman --noconfirm -Syu \
    fish \
    git \
    meson \
    neovim \
    ninja \
    && pacman --noconfirm -Scc
