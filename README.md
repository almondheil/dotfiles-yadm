# To clone dotfiles onto a new system

Clone with https, since we don't have any ssh keys yet

```
yadm clone https://github.com/almondheil/dotfiles.git
```

Decrypt the ssh keys stored in the repo

```
yadm decrypt
```

Switch the repo over from https to ssh going forward

```
yadm remote set-url origin git@github.com:almondheil/dotfiles.git
```
