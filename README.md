# .dofiles

## installation

Pre-requisites:
- `git`;

On Ubuntu:

```bash
# pwd: $HOME
git clone --recursive git@github.com:PedroBinotto/.dotfiles.git
cd .dotfiles
./install
```

---

## info

### why

This repo contains my personal configuration files for the tools and programs I use most often.
Everything is organized to make updates/maintanance simple and manageable, and facilitate configuring a new machine.
This current version is made to work with modern Ubuntu installations (last tested on 24.04).

### the install script

The repo also includes an "[`install`](https://github.com/PedroBinotto/.dotfiles/blob/main/install)" shellscript.
Running it will install the following packages (from `apt`):

- `apparmor`;
- `build-essential`;
- `cgroup-lite`;
- `cmake`;
- `curl`;
- `docker.io`;
- `gettext`;
- `git`;
- `git-delta`;
- `htop`;
- `kitty`;
- `libcairo2-dev`;
- `libdbus-1-dev`;
- `libfontconfig-dev`;
- `libfontconfig-dev`;
- `libgl1-mesa-dev`;
- `liblcms2-dev`;
- `libpython3-dev`;
- `libsimde-dev`;
- `libssl-dev`;
- `libx11-xcb-dev`;
- `libxcursor-dev`;
- `libxi-dev`;
- `libxinerama-dev`;
- `libxkbcommon-x11-dev`;
- `libxrandr-dev`;
- `libxxhash-dev`;
- `lxc`;
- `make`;
- `ninja-build`;
- `python3`;
- `python3-pip`;
- `python3-venv `;
- `ripgrep`;
- `stow`;
- `texlive-full`;
- `tmux`;
- `tree-sitter-cli`;
- `wmdocker `;
- `xclip`;
- `zathura`;
- `zathura-pdf-poppler`;
- `zsh`;

these packages from `snap`:

- `spotify`;

and the following will be either built from source or downloaded and installed from some other custom provider, either
because the download is too outdated in the default repositories or it is simply unavailable via package managers:

- `go`;
- `nvm`;
- `fzf`;
- `kitty`;
- `nvim`;

The installation script will also install custom system fonts and some custom utilities that I developed for day-to-day use 
but keep in separate repositories:

- [`makedocument`](https://github.com/PedroBinotto/makedocument/);
- [`shellscripts`](https://github.com/PedroBinotto/shellscripts/);
- [`zap-prompt`](https://github.com/PedroBinotto/zap-prompt);

Lastly, it will symlink the configuration files to their target directories and prompt the user to reboot the system:
```
...
[SUCCESS] Please reboot the system in order for the changes to take effect.
```

---

## todo
- [ ] Automate firefox and thunderbird backup and restore;
- [ ] Automatically install gnome extensions (espresso, etc.);
- [ ] Automatically set cutom gnome shortcuts;
