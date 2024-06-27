# BSPWM Rice
![Screenshot](./img/bsprice.png)

## Table of Contents

- [Introduction](#introduction)
- [Dependencies](#dependencies)
- [Installation](#installation)
  - [Manual Installation](#manual-installation)
  - [Automated Installation](#automated-installation)
- [Troubleshooting](#troubleshooting)
  - [Touchpad Issue](#touchpad-issue)

## Introduction

This repository contains configuration files and setup instructions for 
customizing BSPWM on Arch Linux. It includes configurations for various components such as Polybar, Rofi, and more.

## Dependencies

- **OS:** [Arch Linux](https://archlinux.org/)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** [zsh](https://ohmyz.sh/)
- **Window Manager:** [bspwm](https://github.com/baskerville/bspwm)
- **Compositor:** [picom](https://github.com/yshui/picom)
- **Font:** [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- **Dock:** [Polybar](https://github.com/polybar/polybar)
- **Application Launcher:** [Rofi](https://github.com/davatorium/rofi)

## Installation

You have two options for installing this BSPWM rice setup:

### Manual Installation

1. **Clone this repository:**
   ```bash
   git clone <repository_url>
   ```

2. **Symlink configuration files using `stow`:**
   ```bash
   cd path/to/cloned/repository
   stow bspwm polybar rofi ...
   ```
   Replace `bspwm`, `polybar`, `rofi`, etc., with the directories containing their respective configuration files.

### Automated Installation

1. *(Provide details of your automated installation script if available.)*

## Troubleshooting

### Touchpad Issue

If you encounter issues with the Lenovo X1 Carbon touchpad not working, you can try the following fix:

```bash
sudo cp Xorg/30-touchpad.conf /etc/X11/xorg.conf.d/
```

This step ensures that the touchpad configuration is correctly applied and may resolve the issue.
