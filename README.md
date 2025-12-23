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
- ✅ **Nix-native** — works seamlessly with `nix run` or traditional installation

## Quick Start

### Nix Users (Recommended)

Run directly without installation:

```bash
nix run github:admiralakber/astro-mode
```

Or install it:

```bash
nix profile install github:admiralakber/astro-mode
astro
```

### Traditional Installation

1. Make the script executable:
   ```bash
   chmod +x astro
   ```

2. Install dependencies:
   ```bash
   # NixOS/Nix
   nix-shell -p gammastep wlsunset
   
   # Arch Linux
   sudo pacman -S gammastep wlsunset
   
   # Debian/Ubuntu
   sudo apt install gammastep wlsunset
   ```

3. Add to your PATH or run directly:
   ```bash
   ./astro
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

The script automatically detects and uses either:
- **gammastep** (preferred) — applies extreme red filter via Wayland protocol
- **wlsunset** (fallback) — alternative Wayland colour temperature tool

Both are configured to apply maximum red filtering suitable for astronomy work.

## Requirements

- **Wayland compositor** (Sway, Hyprland, wlroots-based, etc.)
- Either `gammastep` or `wlsunset` installed
- Linux (tested on NixOS, works on other distributions)

## Why This Exists

Most blue-light filters don't go red enough for true astronomy work. This tool fills that gap with a single, simple command that applies the extreme red filtering needed to preserve dark adaptation — essential for seeing faint deep-sky objects.

## License

MIT License — feel free to use, modify, and share.

## Contributing

Pull requests welcome! This is a simple tool, so improvements are always appreciated.

---

**Made for astronomers, night owls, and anyone who values their dark-adapted vision.** 🌌
