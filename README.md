# 🔴 astro-mode

**Toggle astronomy red mode for Wayland/Sway** — preserve your night vision with a single command.

[![Latest Tag](https://img.shields.io/github/tag/admiralakber/astro-mode?color=%23ffb7c5&style=for-the-badge)](https://github.com/admiralakber/astro-mode/releases)
[![GitHub Stars](https://img.shields.io/github/stars/admiralakber/astro-mode?style=for-the-badge&color=%23ffc0cb)](https://github.com/admiralakber/astro-mode/stargazers)

## What is this?

`astro-mode` is a simple CLI tool that instantly toggles your Wayland/Sway display into **blood-red astronomy mode** — perfect for preserving night vision during stargazing sessions, late-night coding, or any time you need to protect your dark adaptation.

Unlike generic blue-light filters, this tool applies an extreme red filter optimised for astronomy, making it ideal for:
- 🌙 Stargazing sessions
- 🔭 Telescope observation prep
- 💻 Late-night development work
- 🌃 Any activity requiring dark-adapted vision

## Features

- ✅ **One-command toggle** — `astro` to switch on/off instantly
- ✅ **Auto-detects tools** — uses `gammastep` or `wlsunset` automatically
- ✅ **Status checking** — see current state with `astro status`
- ✅ **Clean process management** — properly handles background processes
- ✅ **Portable bash** — runs on any Linux with bash + a red-filter tool
- ✅ **Nix-native** — `nix run` / flake install wraps deps for you

## Quick Start

### Nix Users (Recommended)

Zero-install run (flake wraps `gammastep` / `wlsunset` onto `PATH`):

```bash
nix run github:admiralakber/astro-mode
```

Or install it:

```bash
nix profile install github:admiralakber/astro-mode
astro
```

From a checkout, drop into a shell with the deps:

```bash
nix-shell   # uses ./shell.nix
./astro status
```

### Traditional Installation (no Nix)

The script shebang is plain `#!/usr/bin/env bash` — no `nix-shell` required.

1. Install a red-filter backend:
   ```bash
   # Arch Linux
   sudo pacman -S gammastep   # and/or wlsunset

   # Debian/Ubuntu
   sudo apt install gammastep # and/or wlsunset

   # Fedora
   sudo dnf install gammastep # and/or wlsunset
   ```

2. Install the script somewhere on your `PATH`:
   ```bash
   chmod +x astro
   sudo install -Dm755 astro /usr/local/bin/astro
   # or: mkdir -p ~/.local/bin && cp astro ~/.local/bin/
   ```

3. Run it:
   ```bash
   astro
   ```

## Usage

```bash
# Toggle on/off
astro

# Explicitly enable
astro on

# Explicitly disable
astro off

# Check current status
astro status
```

## How It Works

```text
┌─────────────────┐     prefers      ┌────────────┐
│  astro (bash)   │ ───────────────► │ gammastep  │
│  on / off / …   │     fallback     │  wlsunset  │
└─────────────────┘ ───────────────► └────────────┘
         │
         │  Nix path only
         ▼
┌─────────────────────────────────────┐
│ flake / default.nix wraps PATH with │
│ gammastep, wlsunset, procps, …      │
└─────────────────────────────────────┘
```

The script automatically detects and uses either:
- **gammastep** (preferred) — applies extreme red filter via Wayland protocol
- **wlsunset** (fallback) — alternative Wayland colour temperature tool

Both are configured to apply maximum red filtering suitable for astronomy work.

## Requirements

- **Wayland compositor** (Sway, Hyprland, wlroots-based, etc.)
- Either `gammastep` or `wlsunset` installed (or provided by the Nix wrapper)
- **bash** on `PATH`
- Linux (tested on NixOS; works on other distributions)

## Why This Exists

Most blue-light filters don't go red enough for true astronomy work. This tool fills that gap with a single, simple command that applies the extreme red filtering needed to preserve dark adaptation — essential for seeing faint deep-sky objects.

## License

MIT License — feel free to use, modify, and share.

## Contributing

Pull requests welcome! This is a simple tool, so improvements are always appreciated.

---

**Made for astronomers, night owls, and anyone who values their dark-adapted vision.** 🌌
