FROM archlinux/base

LABEL maintainer="tmplxz"

RUN pacman --noconfirm -Syy openssh wget nano bc zip unzip screen gcc htop texlive-most

RUN pacman --noconfirm -S python python-pip
RUN pacman --noconfirm -S python-scikit-learn
RUN pacman --noconfirm -S python-matplotlib
RUN pacman --noconfirm -S python-pillow
RUN pacman --noconfirm -S python-networkx
RUN pip install pxpy

RUN mkdir -p /home/exp/stml
RUN mkdir -p /home/exp/scripts
RUN mkdir -p /home/exp/tests
COPY stml/* /home/exp/stml/
COPY tests/* /home/exp/tests/
COPY MANIFEST.in /home/exp/
COPY setup.py /home/exp/
COPY README.md /home/exp/
COPY LICENSE.md /home/exp/
COPY scripts/* /home/exp/scripts/
RUN cd /home/exp; pip install .
