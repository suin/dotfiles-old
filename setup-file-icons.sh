#!/usr/bin/env bash

set -eux

: "Check if fileicon exists" && {
  command -v fileicon > /dev/null || yarn global add fileicon
}

: "Set file icons" && {
  mkdir -p /tmp/setup-icons && {
    pushd /tmp/setup-icons && {
      wget -q https://cdn2.iconfinder.com/data/icons/ballicons-2-free/100/bill-512.png -O receipt.png
      fileicon set ~/Dropbox/open/receipts-suin receipt.png
    } && popd
  } && rm -rf /tmp/setup-icons
}
