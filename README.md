# Dokku playground

In this repository, I want to test how to install static website with [Dokku](https://github.com/dokku/dokku).

## Prerequisite

- Virtualbox
- Vagrant
- [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager) plugin

On OSX, execute this command with [brew](https://brew.sh/index_fr.html) to install this prerequisite :

```sh
$ brew cask install vagrant virtualbox
$ vagrant plugin install vagrant-hostmanager --plugin-version 1.8.9
```

## Start Vagrant host

```
$ vagrant up
```