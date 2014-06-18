CURRENT_DIR := $(shell pwd)
INSTALL_DIR := $(HOME)

all: cui

.PHONY: zsh git tmux tmuxinator sbt vim phpmake tig percol
cui: zsh git tmux tmuxinator sbt vim phpmake tig percol

zsh:
	ln -fns $(CURRENT_DIR)/zsh/zsh    $(INSTALL_DIR)/.zsh
	ln -fns $(CURRENT_DIR)/zsh/zshrc  $(INSTALL_DIR)/.zshrc
	ln -fns $(CURRENT_DIR)/zsh/zshenv $(INSTALL_DIR)/.zshenv

git:
	ln -fns $(CURRENT_DIR)/git/gitconfig $(INSTALL_DIR)/.gitconfig
	ln -fns $(CURRENT_DIR)/git/gitignore $(INSTALL_DIR)/.gitignore

tmux:
	ln -fns $(CURRENT_DIR)/tmux/tmux.conf $(INSTALL_DIR)/.tmux.conf

tmuxinator:
	mkdir -p $(INSTALL_DIR)/.tmuxinator
	ln -fns $(CURRENT_DIR)/tmuxinator $(INSTALL_DIR)/.tmuxinator

sbt:
	mkdir -p $(INSTALL_DIR)/.sbt/plugins
	ln -fns $(CURRENT_DIR)/sbt/plugins/build.sbt $(INSTALL_DIR)/.sbt/plugins/build.sbt
	ln -fns $(CURRENT_DIR)/sbt/sbtconfig $(INSTALL_DIR)/.sbtconfig

vim:
	ln -fns $(CURRENT_DIR)/vim/vimrc $(INSTALL_DIR)/.vimrc
	ln -fns $(CURRENT_DIR)/vim       $(INSTALL_DIR)/.vim

phpmake:
	ln -fns $(CURRENT_DIR)/phpmake $(INSTALL_DIR)/.phpmake-master

tig:
	ln -fns $(CURRENT_DIR)/tig/tigrc $(INSTALL_DIR)/.tigrc

percol:
	ln -fns $(CURRENT_DIR)/percol/percol.d $(INSTALL_DIR)/.percol.d
