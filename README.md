<!-- markdownlint-disable MD013 -->

# Dotfiles Install

Dotfiles for the distros/setups I often use. Stored centrally and stow'd.

Script is as POSIX compliant as I could get it as Alpine uses Ash by default.

Backed up dotfiles will have `NAME._dotsb.DATE`. `dots -u` to update/stow new files.

These are mine, unlikely to be useful for you, but you do you.

## General Install

```sh
wget -qO - https://raw.githubusercontent.com/jnines/dots-test/refs/heads/main/install.sh | sh
```

or...

```sh
curl -sL https://raw.githubusercontent.com/jnines/dots-test/refs/heads/main/install.sh | sh
```

### If wanted toss in a ENV to specify which files to use

```sh
... | SPEC=alpine sh
alpine | alp
arch
debian | deb
debian-lite | debian_lite | debl | dl
```
