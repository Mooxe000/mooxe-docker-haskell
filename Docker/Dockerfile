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

# ENV CABAL_VERSION 3.0
ENV CABAL_VERSION head
ENV GHC_VERSION 8.8.1

RUN apt-fast install -y cabal-install-${CABAL_VERSION} ghc-${GHC_VERSION}

RUN echo ' \
    export PATH="/opt/ghc/bin:$PATH"' \
    >> ~/.bashrc

# RUN echo "\
#   repository mirrors.tuna.tsinghua.edu.cn\n\
#   url: http://mirrors.tuna.tsinghua.edu.cn/hackage\n\
#   " >> ~/.cabal/config && \
ADD config /root/.cabal/config
RUN /opt/ghc/bin/cabal update

# ============
# Stack
# ============
RUN apt-fast install -y libffi-dev zlib1g-dev
RUN curl -sSL https://get.haskellstack.org/ | sh

# https://mirror.tuna.tsinghua.edu.cn/help/hackage/
# https://mirrors.ustc.edu.cn/help/hackage.html

# lts-build-plans: http://mirrors.tuna.tsinghua.edu.cn/stackage/lts-haskell/\n\
# nightly-build-plans: http://mirrors.tuna.tsinghua.edu.cn/stackage/stackage-nightly/\n\
# http: http://mirrors.tuna.tsinghua.edu.cn/hackage/00-index.tar.gz\n\
# - name: Tsinghua\n\

RUN mkdir -p ~/.stack && \
    echo "\
setup-info: \"http://mirrors.tuna.tsinghua.edu.cn/stackage/stack-setup.yaml\"\n\
urls:\n\
  latest-snapshot: http://mirrors.tuna.tsinghua.edu.cn/stackage/snapshots.json\n\
package-indices:\n\
  - download-prefix: http://mirrors.tuna.tsinghua.edu.cn/hackage/package/\n\
    hackage-security:\n\
      keyids:\n\
      - 0a5c7ea47cd1b15f01f5f51a33adda7e655bc0f0b0615baa8e271f4c3351e21d\n\
      - 1ea9ba32c526d1cc91ab5e5bd364ec5e9e8cb67179a471872f6e26f0ae773d42\n\
      - 280b10153a522681163658cb49f632cde3f38d768b736ddbc901d99a1a772833\n\
      - 2a96b1889dc221c17296fcc2bb34b908ca9734376f0f361660200935916ef201\n\
      - 2c6c3627bd6c982990239487f1abd02e08a02e6cf16edb105a8012d444d870c3\n\
      - 51f0161b906011b52c6613376b1ae937670da69322113a246a09f807c62f6921\n\
      - 772e9f4c7db33d251d5c6e357199c819e569d130857dc225549b40845ff0890d\n\
      - aa315286e6ad281ad61182235533c41e806e5a787e0b6d1e7eef3f09d137d2e9\n\
      - fe331502606802feac15e514d9b9ea83fee8b6ffef71335479a2e68d84adc6b0\n\
      key-threshold: 3 # number of keys required\n\
      \n\
      # ignore expiration date, see https://github.com/commercialhaskell/stack/pull/4614\n\
      ignore-expiry: no\
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
# RUN bash -lc "export PATH=\"/opt/ghc/bin:$PATH\" && cabal new-install --lib shelly"

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
# RUN ln -s \
#     /lib/x86_64-linux-gnu/libtinfo.so.5.9 \
#     /lib/x86_64-linux-gnu/libtinfo.so

# RUN rm -rf dist

# ============
# Clean
# ============
# RUN \
#     apt-fast autoremove -y && \
#     apt-fast autoclean
#     # rm -rf /var/lib/apt/lists/*
