#!/usr/bin/env bash

set -e
set -x

mkdir -p \
	$HOME/Bin \
	$HOME/.{vim,vimswap,vimbackup} \
	$HOME/.zsh \
	$HOME/.ssh/master \
	$HOME/.config \
	$HOME/.local/share
