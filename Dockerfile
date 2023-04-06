FROM manjarolinux/base:latest AS build-stage

RUN pacman -Syyu --noconfirm \
        dash wget git make sudo python3 \
        base-devel cmake ninja qt5-base \
        arch-install-scripts pyalpm squashfs-tools libisoburn dosfstools

RUN wget https://www.ftp.ne.jp/Linux/packages/blackarch/blackarch/os/x86_64/blackarch-keyring-20180925-5-any.pkg.tar.zst && \
        pacman --noconfirm -U blackarch-keyring-20180925-5-any.pkg.tar.zst
COPY . /uhuruos
WORKDIR /uhuruos
RUN pacman-key --init
RUN pacman-key --populate manjaro blackarch
ENTRYPOINT ["./build.sh","-c","zstd","--noloopmod","--noconfirm","xfce"]
#RUN /bin/bash /uhuruos/build.sh -c lz4 xfce

#FROM scratch AS export-stage

#COPY --from=build-stage /uhuruos/out /