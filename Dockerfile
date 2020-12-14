FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /backbomb
RUN mkdir /temp
RUN mkdir /project
RUN mkdir /app
RUN mkdir /app/postgres
WORKDIR /temp

# Updating APT package manager
RUN apt update

# Install language and base [golang/python/ruby/java] and etc..
RUN apt install -y golang ruby python3 openjdk-11-jdk make gcc g++ python3-pip postgresql

# Install utility
RUN apt install -y net-tools firefox curl zsh neovim git apt-utils fzf nmap jq rsync httpie
RUN curl -LO https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
RUN dpkg -i pet_0.3.0_linux_amd64.deb

# Install ZAP
RUN curl -LO https://github.com/zaproxy/zaproxy/releases/download/w2020-11-23/ZAP_WEEKLY_D-2020-11-23.zip
RUN unzip ZAP_WEEKLY_D-2020-11-23.zip
RUN mv ZAP_D-2020-11-23 /app/ZAP

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
RUN go get github.com/m4ll0k/Aron

# Setup PostgreSQL and Start
RUN echo data_directory = \'/app/postgres/postgresql/12/main\' >> /etc/postgresql/12/main/postgresql.conf
RUN rsync -av /var/lib/postgresql /app/postgres

# Set Metasploit
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 755 msfinstall
RUN ./msfinstall
COPY docker/msfdatabase.yml /opt/metasploit-framework/embedded/framework/config/database.yml

# ZSH Extension
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --keep-zshrc --skip-chsh"
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source ${PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestionss

# NeoVim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Hack-pet
RUN pet list
RUN curl -fLo ~/.config/pet/snippet.toml --create-dirs https://raw.githubusercontent.com/hahwul/hack-pet/master/hackpet.toml

# Remove tempdir
RUN rm -rf /temp

# Copy profiles
COPY docker/zshrc /root/.zshrc

COPY docker/run.sh /backbomb/run.sh
COPY docker/postgres.sql /backbomb/postgres.sql
RUN chmod 755 /backbomb/run.sh

WORKDIR /project

# Running Shell
ENTRYPOINT sh -c /backbomb/run.sh
