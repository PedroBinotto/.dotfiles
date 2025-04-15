# .dofiles

Pre-requisites:
- `git`;
- `make`;
- `stow`;

On Ubuntu:

```bash
# pwd: $HOME
git clone --recursive-submodules git@github.com:PedroBinotto/.dotfiles.git
cd .dotfiles
./install
```

---

TODO:
- [x] Neovim: Automatic build from source;
- [x] kitty: Automatic build from source;
- [x] Install NodeJS and Go (and Python, pip) for LSP configuration;
- [x] Install NerdFonts;
- [ ] Automate firefox and thunderbird backup and restore;
- [x] Solve `/etc/environment` bug;
- [x] FZF version bug;
- [ ] Add spell dict to vim;
