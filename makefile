DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

update:
	git pull origin master

deploy:
		@echo 'deploy dotfiles to home directory.'
		@echo
		@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install: update deploy
		@exec $$SHELL

clean:
		@echo 'Remove dot files in your home directory...'
		@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
		-rm -rf $(DOTPATH)
