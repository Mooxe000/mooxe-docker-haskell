FROM mooxe/base:dev

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN apt-fast update && \
    apt-fast upgrade -y

# ============
# Cabal && GHC
# ============
RUN add-apt-repository -y ppa:hvr/ghc

# update
RUN apt-fast update && \
    apt-fast upgrade -y

ENV CABAL_VERSION 2.4
ENV GHC_VERSION 8.6.2

RUN apt-fast install -y cabal-install-${CABAL_VERSION} ghc-${GHC_VERSION}

RUN echo ' \
    export PATH="$HOME/.cabal/bin:/opt/cabal/${CABAL_VERSION}/bin:/opt/ghc/${GHC_VERSION}/bin:$PATH"' \
    >> ~/.bashrc

ADD config .cabal/config

RUN bash -lc "cabal update"

# ============
# Stack
# ============
RUN curl -sSL https://get.haskellstack.org/ | sh

RUN mkdir -p ~/.stack && \
    echo "\n\
package-indices:\n\
- name: Tsinghua\n\
  download-prefix: http://mirrors.tuna.tsinghua.edu.cn/hackage/package/\n\
  http: http://mirrors.tuna.tsinghua.edu.cn/hackage/00-index.tar.gz\n\
" >> ~/.stack/config.yaml

RUN stack setup
RUN stack path
# stack exec env

RUN echo ' \
    export PATH="/root/.local/bin:$PATH"' \
    >> ~/.bashrc

# ============
# Shelly
# ============
RUN bash -lc "cabal new-install --lib shelly"

# ============
# Yesod
# - https://github.com/yesodweb/yesod
# ============
# RUN stack install yesod-bin --install-ghc
# RUN bash -lc "cabal install yesod"

# ============
# Miso
# - https://github.com/dmjio/miso
# ============

# Fay
# - https://github.com/faylang/fay

# ============
# Fix
# ============
RUN ln -s \
    /lib/x86_64-linux-gnu/libtinfo.so.5.9 \
    /lib/x86_64-linux-gnu/libtinfo.so

RUN rm -rf dist

# ============
# Clean
# ============
RUN \
    apt-fast autoremove -y && \
    apt-fast autoclean
    # rm -rf /var/lib/apt/lists/*
