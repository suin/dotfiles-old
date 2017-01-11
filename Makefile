CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

commands:
	./install-commands-via-homebrew.sh
	./install-commands-via-go-get.sh

more:
	./setup-file-icons.sh

all: commands dotfiles
