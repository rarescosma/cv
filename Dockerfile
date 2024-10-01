FROM archlinux:base-20240929.0.266368

RUN pacman -Sy -q --noconfirm \
    texlive-xetex \
    texlive-latexrecommended \
    texlive-fontsrecommended \
    texlive-langeuropean \
    texlive-pictures \
    make git && rm -rf /var/cache/pacman

WORKDIR /data

