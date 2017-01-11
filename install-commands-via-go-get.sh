#!/usr/bin/env bash

set -eux

: "Install commands via go get" && {
	commands=(
		github.com/suin/ishi
		github.com/suin/git-forgot
	)

	go get -u "${commands[@]}"
}
