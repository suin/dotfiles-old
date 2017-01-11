#!/usr/bin/env bash

set -eux

: "Install commands via Homebrew" && {
	taps=(
		codekitchen/dinghy
		coteditor/coteditor
	)

	formula=(
		ag # the_silver_searcher - A code-searching tool similar to ack, but faster.
		coreutils # GNU File, Shell, and Text utilities. `k` コマンドで使用
		cot # The command-line helper tool for CotEditor. https://coteditor.com
		curl
		dinghy
		docker
		docker-machine
		docker-compose
		git
		ngrok
		httpie
		hub
		node
		reattach-to-user-namespace
		pandoc
		stone
		tig
		tmux
		tree
		vim
		vimpager
		wget
		yarn
		zsh
	)

	brew update && brew tap "${taps[@]}" && brew install "${formula[@]}"
}
