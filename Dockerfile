FROM jare/emacs:testing
MAINTAINER Jin Xue <csjinxue@outlook.com>

RUN git clone -b develop https://github.com/hlissner/doom-emacs ${UHOME}/.emacs.d && \
    git clone https://github.com/Jimx-/doom-emacs-private.git ${UHOME}/.doom.d && \
    cd ${UHOME}/.emacs.d && make
    

