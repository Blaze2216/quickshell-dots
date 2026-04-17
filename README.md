# quickshell-dots

> My personal fork of the [caelestia dots](https://github.com/caelestia-dots/caelestia) — a complete Hyprland rice tweaked to my preferences.

This is the full caelestia setup (shell + all app configs) with personal modifications pushed as I make them. If you want the original, polished upstream experience, head to [caelestia-dots/caelestia](https://github.com/caelestia-dots/caelestia). If you want to see what I've changed or use this as a base for your own tweaks, you're in the right place.

---

## What's different from upstream

- Custom ASCII art / figlet banner (replaced the default caelestia logo)
- Personal preference tweaks pushed incrementally

More changes may be added over time.

---

## Stack

| Role | Tool |
|---|---|
| Window manager | [Hyprland](https://hyprland.org) |
| Shell | [Quickshell](https://quickshell.outfoxxed.me) (via [caelestia-shell](https://github.com/caelestia-dots/shell)) |
| Terminal | [foot](https://codeberg.org/dnkl/foot) |
| Shell (CLI) | [fish](https://fishshell.com) + [starship](https://starship.rs) |
| System monitor | [btop](https://github.com/aristocratos/btop) |
| Fetch | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| File manager | [Thunar](https://docs.xfce.org/xfce/thunar/start) |
| Editor | [VSCodium](https://vscodium.com) / [Zed](https://zed.dev) |
| Browser | [Floorp Browser](https://floorp.app/) |
| Music | [Spotify](https://spotify.com) + [Spicetify](https://spicetify.app) |
| Session manager | [uwsm](https://github.com/Vladimir-csp/uwsm) |
| Base dots | [caelestia](https://github.com/caelestia-dots) |

---

## Installation

### Quick install (Arch Linux)

You need [`fish`](https://github.com/fish-shell/fish-shell) installed first.

```bash
git clone https://github.com/Blaze2216/quickshell-dots.git ~/.local/share/caelestia
~/.local/share/caelestia/install.fish
```

> **Warning:** The install script symlinks configs into place, so do **not** move or delete the cloned folder afterwards. If you do, apps like Hyprland will fail to start. `~/.local/share/caelestia` is the recommended location.

The install script accepts optional flags:

```
usage: ./install.fish [-h] [--noconfirm] [--spotify] [--vscode] [--discord] [--zen] [--aur-helper]

options:
  -h, --help                  show this help message and exit
  --noconfirm                 skip confirmation prompts
  --spotify                   install Spotify with Spicetify theming
  --vscode=[codium|code]      install VSCodium or VSCode
  --discord                   install Discord with OpenAsar + Equicord
  --zen                       install Zen browser
  --aur-helper=[yay|paru]     AUR helper to use (default: yay)
```

Example with optional apps:

```bash
~/.local/share/caelestia/install.fish --spotify --vscode=codium --zen --aur-helper=paru
```

### Manual installation

Install the following dependencies:

**Core:**
`hyprland`, `xdg-desktop-portal-hyprland`, `xdg-desktop-portal-gtk`, `hyprpicker`, `wl-clipboard`, `cliphist`, `inotify-tools`, `app2unit`, `wireplumber`, `trash-cli`

**Apps:**
`foot`, `fish`, `fastfetch`, `starship`, `btop`, `jq`, `eza`

**Theming:**
`adw-gtk-theme`, `papirus-icon-theme`, `qtengine-git`, `ttf-jetbrains-mono-nerd`

Then install [caelestia-shell](https://github.com/caelestia-dots/shell#manual-installation) and [caelestia-cli](https://github.com/caelestia-dots/cli) separately.

Finally, symlink the config folders into `~/.config`:

```bash
ln -sf ~/.local/share/caelestia/hypr       ~/.config/hypr
ln -sf ~/.local/share/caelestia/foot       ~/.config/foot
ln -sf ~/.local/share/caelestia/fish       ~/.config/fish
ln -sf ~/.local/share/caelestia/fastfetch  ~/.config/fastfetch
ln -sf ~/.local/share/caelestia/btop       ~/.config/btop
ln -sf ~/.local/share/caelestia/uwsm       ~/.config/uwsm
cp     ~/.local/share/caelestia/starship.toml ~/.config/starship.toml
```

#### Optional: Spicetify

```bash
ln -sf ~/.local/share/caelestia/spicetify ~/.config/spicetify
spicetify config current_theme caelestia color_scheme caelestia custom_apps marketplace
spicetify apply
```

#### Optional: VSCode / VSCodium

```bash
# For VSCodium (replace VSCodium with Code for VSCode):
ln -sf ~/.local/share/caelestia/vscode/settings.json    ~/.config/VSCodium/User/settings.json
ln -sf ~/.local/share/caelestia/vscode/keybindings.json ~/.config/VSCodium/User/keybindings.json
ln -sf ~/.local/share/caelestia/vscode/flags.conf       ~/.config/codium-flags.conf
codium --install-extension vscode/caelestia-vscode-integration/caelestia-vscode-integration-*.vsix
```

#### Optional: Zen Browser

```bash
# Symlink userChrome.css into your Zen profile:
ln -sf ~/.local/share/caelestia/zen/userChrome.css ~/.zen/<your-profile>/chrome/userChrome.css

# Install native messaging host (replace /home/youruser with your actual home path):
cp ~/.local/share/caelestia/zen/native_app/manifest.json ~/.mozilla/native-messaging-hosts/caelestiafox.json
# Edit caelestiafox.json — replace {{ $lib }} with the absolute path to ~/.local/lib/caelestia
ln -sf ~/.local/share/caelestia/zen/native_app/app.fish ~/.local/lib/caelestia/caelestiafox
```

Then install the [CaelestiaFox extension](https://addons.mozilla.org/en-US/firefox/addon/caelestiafox).

---

## Usage

> These dots don't include a login manager. You'll need to set one up yourself (e.g. [`greetd`](https://sr.ht/~kennylevinsen/greetd) + [`tuigreet`](https://github.com/apognu/tuigreet)) or log in from a TTY.

### Keybinds

| Keybind | Action |
|---|---|
| `Super` | Open launcher |
| `Super` + `1–9` | Switch to workspace |
| `Super` `Alt` + `1–9` | Move window to workspace |
| `Super` + `Return` | Open terminal (foot) |
| `Super` + `B` | Open browser (Floorp) |
| `Super` + `C` | Open editor (VSCodium) |
| `Super` + `S` | Toggle special workspace |
| `Ctrl` `Alt` + `Delete` | Open session menu |
| `Ctrl` `Super` + `Space` | Toggle media play/pause |
| `Ctrl` `Super` `Alt` + `R` | Restart the shell |

All shell keybinds work via Hyprland global shortcuts and can be customised in the hypr config.

---

## Updating

```bash
yay  # update AUR packages

cd ~/.local/share/caelestia
git pull  # pull latest config changes
```

---

## Credits

All the real work is by the caelestia-dots team. Big thanks to:

- [@soramanew](https://github.com/soramanew) — for building and maintaining the entire caelestia ecosystem
- [@outfoxxed](https://github.com/outfoxxed) — for creating [Quickshell](https://quickshell.outfoxxed.me)

---

## License

GPL-3.0 — same as upstream. See [LICENSE](./LICENSE).