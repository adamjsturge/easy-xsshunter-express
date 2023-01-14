<h1 align="center">
  Easy XSSHunter Express
  <br>
</h1>



<p align="center">
  <a href="https://twitter.com/adamjsturge"><img src="https://img.shields.io/twitter/follow/adamjsturge.svg?logo=twitter"></a>
</p>

<p align="center">
  <a href="#installation-instructions">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#more-info">More Info</a>
</p>


**easy-express-hunter** allows you to quickly setup a new machine with docker and xsshunter-express

# Installation Instructions

We only really need curl.

```bash
curl -fsSL https://raw.githubusercontent.com/adamjsturge/easy-xsshunter-express/master/easy-xsshunter-express.sh -o easy-xsshunter-express.sh
sudo bash easy-xsshunter-express.sh
```

# Usage

```sh
sudo bash easy-xsshunter-express.sh
```

This will first prompt you to install docker automatically or not.


```console
┌──(root@ubuntu):~
└─# sudo bash easy-xsshunter-express.sh
Do you want to install Docker? (y/n)
```

After docker you can pick between 2 github repos of xsshunter-express. The official one or the fork that I coded with slack notifications. Personally I like the one with slack notification

```console
1) Official Repo (https://github.com/mandatoryprogrammer/xsshunter-express)
2) Slack Notification Fork (https://github.com/adamjsturge/xsshunter-express)
Which Github option would you like to choose?
```

Lastly you'll be prompted with if you want to do the guided setup. If you say no it you'll have to manually change the docker-compose.yml

```console
Do you want to go through basic setup? (y/n) y
Leave anything blank you don't know or don't want to change
```

# Repos referenced in this script
<a href="https://github.com/mandatoryprogrammer/xsshunter-express">Official Repo</a>
<a href="https://github.com/adamjsturge/xsshunter-express">Slack Notification Fork</a>

# More info
If you get stuck you can DM me on twitter or make a github issue and I'll try to address it. 
I have only tested this on linux.

My Article: https://adamjsturge.medium.com/easy-xsshunter-express-setup-script-d5a66039f7b6?sk=52394aa4a2d66779ffcaeaf7cab63af9
