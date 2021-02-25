FROM ubuntu:20.04

LABEL maintainer fenoai

ARG DEBIAN_FRONTEND=nointeractive
ENV TZ=Asia/Seoul

COPY .vimrc /root/

RUN apt-get update && apt-get -y upgrade \ 
    && apt-get install -y gcc clang git locales xclip \
    && apt-get install -y build-essential cmake vim-nox python3-dev \
    && localedef -f UTF-8 -i ko_KR ko_KR.UTF-8 \
    && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
    && vim +PluginInstall +qall \    
    && cd ~/.vim/bundle/youcompleteme \
    && python3 install.py --clangd-completer

ENV LC_ALL ko_KR.UTF-8

WORKDIR /src

CMD ["/bin/bash"]