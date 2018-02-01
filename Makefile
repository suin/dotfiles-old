CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

install: macos commands dotfiles

macos:
	./setup-macos.sh

brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew analytics off # ユーザ行動分析データを送信しないようにする https://docs.brew.sh/Analytics.html

commands: brew
	brew bundle --verbose
	./install-commands-via-gem.sh
	# ./install-commands-via-go-get.sh

dotfiles:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

more:
	./setup-file-icons.sh
	./setup-wallpapers.sh
