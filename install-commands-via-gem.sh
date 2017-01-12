#!/usr/bin/env bash

set -eux

: "Install commands via gem" && {
	commands=(
		tmuxinator
	)

	gem install "${commands[@]}"
}
