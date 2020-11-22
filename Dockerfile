FROM ubuntu:20.10

RUN mkdir temp
WORKDIR temp

# Updating APT package manager
RUN apt update

# Install language [golang/python/ruby/java] and etc..
RUN apt install -y golang ruby python3 openjdk-11-jdk make gcc g++ python3-pip

# Install utility
RUN apt install -y net-tools firefox wget curl zsh neovim git apt-utils fzf
RUN wget https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
RUN dpkg -i pet_0.3.0_linux_amd64.deb

# Install tools with go-get
RUN GO111MODULE=on go get github.com/projectdiscovery/httpx/cmd/httpx
RUN GO111MODULE=on go get github.com/projectdiscovery/nuclei/cmd/nuclei
RUN GO111MODULE=on go get github.com/projectdiscovery/naabu/cmd/naabu
RUN GO111MODULE=on go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
RUN GO111MODULE=on go get github.com/lc/gau
RUN go get github.com/jaeles-project/gospider
RUN go get github.com/hakluke/hakrawler
RUN go get github.com/OJ/gobuster
RUN go get github.com/haccer/subjack
RUN go get github.com/tomnomnom/assetfinder
RUN go get github.com/tomnomnom/waybackurls
RUN go get github.com/tomnomnom/meg
RUN go get github.com/tomnomnom/gf
RUN go get github.com/tomnomnom/gron
RUN go get github.com/tomnomnom/qsreplace
RUN go get github.com/tomnomnom/unfurl
RUN go get github.com/asciimoo/wuzz
RUN go get github.com/ffuf/ffuf
RUN go get github.com/hahwul/dalfox
RUN go get github.com/hahwul/jwt-hack
RUN go get github.com/hahwul/mzap
RUN go get github.com/hahwul/s3reverse
RUN go get github.com/sensepost/gowitness
RUN go get github.com/m4ll0k/Aron

# ZSH Extension
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc --skip-chsh"
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# NeoVim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove tempdir
RUN rm -rf /temp

# Copy profiles
COPY docker/zshrc ~/.zshrc

# Running Shell
ENTRYPOINT ["/usr/bin/zsh"]
