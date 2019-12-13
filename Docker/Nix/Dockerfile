FROM nixos/nix

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

RUN echo ${HTTP_PROXY}
RUN echo ${HTTPS_PROXY}

RUN \
  nix-channel --remove nixpkgs && \
  nix-channel --update
RUN \
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs && \
  nix-channel --update

# RUN nix-build -A pythonFull '<nixpkgs>'

RUN \
  nix-env -iA \
    nixpkgs.curl \
    nixpkgs.git \
    nixpkgs.gnumake

########
# SHELL
########

RUN \
  nix-env -f "<nixpkgs>" -iA \
    bash bashInteractive \
    zsh fish

RUN \
  git clone --depth=1 https://github.com/Bash-it/bash-it.git \
    ~/.bash_it && \
  bash -lc "~/.bash_it/install.sh"

RUN \
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git \
    ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

RUN \
  curl -L https://get.oh-my.fish > install && \
  fish install --noninteractive --path=~/.local/share/omf --config=~/.config/omf && \
  rm -rf install

RUN fish -lc "omf install robbyrussell"

########
# LOCALE
########

RUN \
  nix-env -f "<nixpkgs>" -iA \
    locale

RUN \
  echo -e "\
export PATH="/root/.local/bin:$PATH"\n\
export LOCALE_ARCHIVE_2_27=\
`nix-build --no-out-link \"<nixpkgs>\" -A glibcLocales`\
/lib/locale/locale-archive" >> .profile

RUN \
  echo -e "source ~/.profile" >> .zshrc && \
  echo -e "source ~/.profile" >> .config/fish/config.fish

RUN echo $'\
set fish_greeting \'\'\n\
set -gx LC_ALL en_US.UTF-8\n\
set -gx LC_CTYPE en_US.UTF-8\n\
' >> ~/.config/fish/config.fish

########
# CABAL && STACK
########

RUN \
  nix-env -f "<nixpkgs>" -iA \
    cabal2nix nix-prefetch-git

RUN \
  nix-env -f "<nixpkgs>" -iA \
    stack

ENV STACK_MIRROR http://mirrors.tuna.tsinghua.edu.cn
# ENV STACK_MIRROR https://mirrors.ustc.edu.cn

RUN mkdir -p ~/.stack && \
    echo -e "\
nix:\n\
  enable: true\n\
setup-info: \"${STACK_MIRROR}/stackage/stack-setup.yaml\"\n\
urls:\n\
  latest-snapshot: ${STACK_MIRROR}/stackage/snapshots.json\n\
package-indices:\n\
  - download-prefix: ${STACK_MIRROR}/hackage/package/\n\
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
      ignore-expiry: true\
" >> ~/.stack/config.yaml

RUN stack setup
RUN stack path
# stack exec env

RUN \
  nix-env -f "<nixpkgs>" -iA \
    haskellPackages.ghc \
    haskellPackages.cabal-install

RUN \
  cabal user-config update && \
  export Repo_Url="hackage.haskell.org" && \
  export Mirror_Url="mirrors.tuna.tsinghua.edu.cn" && \
  sed -i \
    -e "s/${Repo_Url}/${Mirror_Url}/" \
    -e "s/http:\/\/${Mirror_Url}\//http:\/\/${Mirror_Url}\/hackage/" \
    ~/.cabal/config && \
  cabal update && cabal new-update

ADD ./Demo /root/Demo

RUN \
  mkdir -p ~/.local/bin && \
  curl https://raw.githubusercontent.com/jmackie/nix-runghc/master/nix-runghc > \
    ~/.local/bin/nix-runghc && \
  chmod +x ~/.local/bin/nix-runghc

RUN \
  bash -lc "~/Demo/NixScript/withDeps/main.hs"

RUN \
  nix-instantiate --eval -E \
    'fetchGit {\
      url = "https://github.com/NixOS/nixpkgs.git";\
      # ref = "release-19.09";\
    }'

RUN \
  cd ~/Demo/MonoRepo && \
  make run && \
  cd
  
RUN rm -rf ~/Demo
