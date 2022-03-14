FROM archlinux:base-devel

COPY ./*.sh /
RUN /setup.sh 

COPY pacman.conf /etc/pacman.conf
COPY sudoers /etc/sudoers

EXPOSE 60001

CMD ["/bin/sh", "-c", "/entrypoint.sh 2>&1 | tee /var/logs/containner.log"]
