TARGET=base16-manager
PREFIX=~
DESTDIR=
BINDIR=${PREFIX}/.bin
LICENSEDIR=${PREFIX}/share/licenses
BASHCOMP=completion/completion.bash
BASHCOMPDIR=${PREFIX}/share/bash-completion/completions
ZSHCOMP=completion/completion.zsh
ZSHCOMPDIR=${PREFIX}/share/zsh/site-functions/

install:
	install -m755 ${TARGET} ${DESTDIR}${BINDIR}/${TARGET}

	@if [[ -d ${BASHCOMPDIR} ]] ; \
	then \
	echo "install completion for bash"; \
	install -m644 ${BASHCOMP} ${DESTDIR}${BASHCOMPDIR}/base16-manager; \
	fi;

	@if [[ -d ${ZSHCOMPDIR} ]] ; \
	then \
	echo "install completion for zsh"; \
	install -m644 ${ZSHCOMP} ${DESTDIR}${ZSHCOMPDIR}/_base16-manager; \
	fi;

clean:
	rm -f ${DESTDIR}${BINDIR}/${TARGET}
	rm -f ${DESTDIR}${LICENSEDIR}/${TARGET}/LICENSE
	rm -f ${DESTDIR}${BASHCOMPDIR}/base16-manager
	rm -f ${DESTDIR}${ZSHCOMPDIR}/_base16-manager
