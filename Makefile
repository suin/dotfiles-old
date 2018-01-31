CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

commands: launchpad
	brew bundle --verbose
	./install-commands-via-gem.sh
	./install-commands-via-go-get.sh

more:
	./setup-file-icons.sh
	./setup-wallpapers.sh

all: commands dotfiles

launchpad:
	defaults write com.apple.dock springboard-columns -int 12
	defaults write com.apple.dock springboard-rows -int 6
	killall Dock
