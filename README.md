<h1 align="center">
  <br>
  <a href=""><img src="https://user-images.githubusercontent.com/13212227/100126258-1329bb80-2ec1-11eb-915b-7a536a2524e0.png" alt="" width="500px;"></a>
  <br>
  <img src="https://img.shields.io/github/v/release/hahwul/backbomb?style=flat-square"> 
  <a href="https://snapcraft.io/backbomb"><img src="https://snapcraft.io/backbomb/badge.svg" /></a>
  <img src="https://img.shields.io/github/languages/top/hahwul/backbomb?style=flat-square"> 
  <img src="https://api.codacy.com/project/badge/Grade/ea74e272d1d6486da19d469881e5c176"> 
  <a href="https://goreportcard.com/report/github.com/hahwul/backbomb"><img src="https://goreportcard.com/badge/github.com/hahwul/backbomb"></a> 
  <img src="https://github.com/hahwul/backbomb/workflows/CodeQL/badge.svg">
  <img src="https://github.com/hahwul/backbomb/workflows/Docker%20Build/badge.svg">
  <img src="https://github.com/hahwul/backbomb/workflows/Go%20Build/badge.svg">
  <a href="https://twitter.com/intent/follow?screen_name=hahwul"><img src="https://img.shields.io/twitter/follow/hahwul?style=flat&logo=twitter"></a>
  <a href="https://github.com/hahwul"><img src="https://img.shields.io/github/stars/hahwul?style=flat&logo=github"></a>
</h1>

> Cool Guys Don't Look At Explosions 😎💣

- [What is BackBomb?](#what-is-backbomb)
- [Getting started](#getting-started)
  * [Requirements](#requirements)
  * [Installation](#installation)
- [Usage](#usage)
  * [Initialization](#initialization)
  * [Run](#run)

## What is BackBomb?
Dockerized penetration-testing/bugbounty/app-sec testing environment

## Getting started
### Requirements
This tool uses a docker cli. Docker installation is required. 

https://docs.docker.com/get-docker

### Installation
```
$ go get -u github.com/hahwul/backbomb
```

## Usage 
```
.----.   .--.   .---. .-. .-..----.  .----. .-.   .-..----. 
| {}  } / {} \ /  ___}| |/ / | {}  }/  {}  \|  `.'  || {}  }
| {}  }/  /\  \\     }| |\ \ | {}  }\      /| |\ /| || {}  }
`----' `-'  `-' `---' `-' `-'`----'  `----' `-' ` `-'`----' 

Dockerized penetration-testing/bugbounty/app-sec testing environment
	Cool Guys Don't Look At Explosions 😎💣

Usage:
  backbomb [command]

Available Commands:
  help        Help about any command
  init        Initialization backbomb docker image
  run         Start backbomb
  update      Update hahwul/backbomb image
  version     Show version

Flags:
      --config string   config file (default is $HOME/.backbomb.yaml)
  -h, --help            help for backbomb

Use "backbomb [command] --help" for more information about a command.
```

### Initialization
```
$ backbomb init
```

After initialization, the docker image and volume are prepared 😎
```
$ docker images
REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
hahwul/backbomb                                  latest              749a17299401        23 hours ago        3.97GB
```
```
$ docker volume list | grep backbomb
local               backbomb
```

### Run
`run` command allows you to omit and drive additional docker execution options, such as `--mount`.
```
$ backbomb run
```
