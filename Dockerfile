FROM ubuntu:20.10

# Updating APT package manager
RUN apt update

# Install language [golang/python/ruby/java] and etc..
RUN apt install golang ruby python3 openjdk-11-jdk make gcc g++ python3-pip 

# Install utility
RUN apt install net-tools firefox wget curl zsh nvim
