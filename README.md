
This repository is my Emacs Org-Mode configuration for all my Linux and Windows computers.

# General Setup
```
cd ~ ; mkdir src ; cd src
git clone git@github.com:jmewes/emacs-config.git
```

# Linux Setup
- Install Emacs via the package manager
```
cd ~
rm .emacs
ln -s src/emacs-config/.emacs
```

# Windows Setup
- Download and extract binaries from http://ftp.gnu.org/gnu/emacs/windows/
- Set the environment variable HOME to the users home directory
```
cd ~
rm .emacs
ln src/emacs-config/.emacs
```
