FROM archlinux:base-devel

ARG USERNAME

RUN	pacman --noconfirm -Syu \
		fish \
		git \
		meson \
		neovim \
		ninja \
	&& pacman --noconfirm -Scc \
	# make neovim available to use as vim
	# below is cited from https://aur.archlinux.org/packages/neovim-symlinks
	&& cd /usr/bin \
	&& echo -e '#!/bin/sh\nexec nvim -e "$@"'  > ex \
	&& echo -e '#!/bin/sh\nexec nvim -E "$@"'  > exim \
	&& echo -e '#!/bin/sh\nexec nvim -RZ "$@"' > rview \
	&& echo -e '#!/bin/sh\nexec nvim -Z "$@"'  > rvim \
	&& echo -e '#!/bin/sh\nexec nvim -R "$@"'  > view \
	&& echo -e '#!/bin/sh\nexec nvim -d "$@"'  > vimdiff \
	&& chmod 755 ex* rvi* view vimdiff \
	&& for _link in edit vedit vi vim; do ln -s nvim $_link; done

COPY pacman.conf /etc/pacman.conf
COPY sudoers /etc/sudoers

RUN useradd -m -G wheel "$USERNAME"

USER "$USERNAME"
WORKDIR "/home/$USERNAME/"

CMD /usr/bin/fish
