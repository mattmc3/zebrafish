# makefile
.PHONY: help submodules
.DEFAULT_GOAL := help

submodules:
	git submodule -q foreach git pull -q origin master

help:
	@echo "help"
	@echo "    shows this message"
	@echo ""
	@echo "submodules"
	@echo "    Update git submodules. "
