#!/usr/bin/env bash

set -e
set -x

mkdir -p \
	$HOME/.config \
	$HOME/.local/share \
	$HOME/.ssh/master \
	$HOME/.vifm \
	$HOME/.zsh \
	$HOME/.{vim,vimswap,vimbackup} \
	$HOME/Bin
