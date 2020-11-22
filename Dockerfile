FROM ubuntu:20.10

# Updating APT package manager
RUN apt update

# Install language [golang/python/ruby/java] and etc..
RUN apt install -y golang ruby python3 openjdk-11-jdk make gcc g++ python3-pip

# Install utility
RUN apt install -y net-tools firefox wget curl zsh neovim git

# Install tools with go-get
RUN GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
RUN GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
RUN GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/cmd/nuclei
RUN GO111MODULE=on go get -v github.com/projectdiscovery/naabu/cmd/naabu
RUN GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
RUN GO111MODULE=on go get -v github.com/lc/gau
RUN go get -v github.com/jaeles-project/gospider
RUN go get -v github.com/hakluke/hakrawler
RUN go get -v github.com/OJ/gobuster
RUN go get -v github.com/michenriksen/gitrob
RUN go get -v github.com/haccer/subjack
RUN go get -v github.com/tomnomnom/assetfinder
RUN go get -v github.com/tomnomnom/waybackurls
RUN go get -v github.com/tomnomnom/meg
RUN go get -v github.com/tomnomnom/gf
RUN go get -v github.com/tomnomnom/gron
RUN go get -v github.com/tomnomnom/qsreplace
RUN go get -v github.com/tomnomnom/unfurl
RUN go get -v github.com/asciimoo/wuzz
RUN go get -v github.com/ffuf/ffuf
RUN go get -v github.com/hahwul/dalfox
RUN go get -v github.com/hahwul/jwt-hack
RUN go get -v github.com/hahwul/mzap
RUN go get -v github.com/hahwul/s3reverse
RUN go get -v github.com/sensepost/gowitness
RUN go get -v github.com/m4ll0k/Aron

# ZSH Extension
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# NeoVim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
