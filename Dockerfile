FROM archlinux:base-devel

ARG USERNAME
WORKDIR /root

COPY ./*.sh /root/
RUN /root/setup.sh 

COPY pacman.conf /etc/pacman.conf
COPY sudoers /etc/sudoers
