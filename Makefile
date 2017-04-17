PREFIX = /usr/local
.PHONY: deps lint install uninstall

deps:
	@command -v zsh > /dev/null || echo "missing dependencies: need to install zsh"
	@command -v rg > /dev/null || echo "missing dependencies: need to install ripgrep"

lint:
	zsh -n consider.sh

install: consider.sh deps
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/consider

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/consider
