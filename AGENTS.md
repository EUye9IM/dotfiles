# dotfiles

Personal config for neovim, zsh, tmux, and kitty.

## Structure

Each subdirectory is a component with its own `setup.sh` that copies config files to `~` (not symlinks, uses `cp -rfb` — existing files get backed up).

| Component | Setup target | Post-setup step |
|---|---|---|
| `neovim/` | `nvim --headless --clean +'echo stdpath("config")' +q!` → copies `nvim/*` there | `nvim --headless +"Lazy! sync" +qa!` |
| `zsh/` | `~/.zshrc`, `~/.p10k.zsh`, `~/.zsh/*` | `. ~/.zshrc; zinit update` |
| `tmux/` | `~/.tmux.conf` | none |
| `kitty/` | `~/.config/kitty/kitty.conf` | none |

## Commands

- **Full install**: `./setup.sh`
- **Selective install**: `./setup.sh neovim zsh` (one or more components)
- **Container test**: `podman build --build-arg ALL_PROXY=$ALL_PROXY -t dotfiles . && podman run -it dotfiles`
- **Template for new component**: copy `.tmpl/` dir, write `setup.sh` sourcing `../utils.sh`

## Utils (sourced from `utils.sh`)

- `CP from ... to` — `cp -rfb` (backup, recursive)
- `RM path` — `rm -rf`
- `MKDIR path` — `mkdir -p`
- `CHK cmd ...` — warn if command not found
- `run_sub_scripts <path> <script> [dirs...]` — iterate subdirs running a script

## Notes

- `install.sh` is referenced in README but does not exist in repo (likely system-level package install, run separately before `setup.sh`)
- Config files are **copied**, not symlinked — modifications in-repo must be re-copied
- All `setup.sh` scripts source `../utils.sh` from the repo root
