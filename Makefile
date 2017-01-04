CURRENT_DIR := $(shell pwd)
INSTALL_DIR := $(HOME)

all: cui

.PHONY: git hammerspoon percol tig tmux tmuxinator vim zsh
cui: .PHONY

git:
	ln -fns $(CURRENT_DIR)/git/gitconfig $(INSTALL_DIR)/.gitconfig
	ln -fns $(CURRENT_DIR)/git/gitignore $(INSTALL_DIR)/.gitignore

hammerspoon:
	ln -fns $(CURRENT_DIR)/hammerspoon $(INSTALL_DIR)/.hammerspoon

percol:
	ln -fns $(CURRENT_DIR)/percol/percol.d $(INSTALL_DIR)/.percol.d

tig:
	ln -fns $(CURRENT_DIR)/tig/tigrc $(INSTALL_DIR)/.tigrc

tmux:
	ln -fns $(CURRENT_DIR)/tmux/tmux.conf $(INSTALL_DIR)/.tmux.conf

tmuxinator:
	ln -fns $(CURRENT_DIR)/tmuxinator $(INSTALL_DIR)/.tmuxinator

vim:
	ln -fns $(CURRENT_DIR)/vim/vimrc $(INSTALL_DIR)/.vimrc
	ln -fns $(CURRENT_DIR)/vim       $(INSTALL_DIR)/.vim

zsh:
	ln -fns $(CURRENT_DIR)/zsh/zshrc  $(INSTALL_DIR)/.zshrc
	ln -fns $(CURRENT_DIR)/zsh/zshenv $(INSTALL_DIR)/.zshenv
