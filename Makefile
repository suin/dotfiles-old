CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

commands:
	brew bundle
	./install-commands-via-gem.sh
	./install-commands-via-go-get.sh

more:
	./setup-file-icons.sh
	./setup-wallpapers.sh

all: commands dotfiles
