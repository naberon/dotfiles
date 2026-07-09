# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository for configuring development environments across Linux/WSL systems. It manages configurations for Neovim, Zsh, Tmux, WezTerm, Git, and tig through symlinks.

## Installation and Setup

### Installing Dotfiles

```bash
./install.sh
```

This creates symlinks from `~/workspace/dotfiles/*` to their respective locations in `~/.config/` and home directory. The script skips existing symlinks to prevent overwriting.

### Uninstalling

```bash
./unlink.sh
```

Removes all symlinks created by the installation script.

## Architecture

### Directory Structure

```
dotfiles/
├── nvim/              # Neovim configuration (Lua-based)
│   ├── init.lua       # Entry point: loads general, keymap, plugin
│   ├── lua/
│   │   ├── general.lua    # Core vim settings
│   │   ├── keymap.lua     # Key mappings
│   │   ├── plugin.lua     # Plugin manager setup (lazy.nvim)
│   │   └── plugins/       # Individual plugin configurations
├── zsh/               # Zsh configuration
│   └── .zshrc         # Shell configuration with fzf integration
├── tmux/              # Tmux configuration
│   └── tmux.conf
├── wezterm/           # WezTerm terminal emulator config
│   └── wezterm.lua
├── sheldon/           # Zsh plugin manager configuration
│   └── plugins.toml
├── gitconfig          # Git configuration
├── tigrc              # Tig (git TUI) configuration
└── gemrc              # Ruby gem configuration
```

### Neovim Architecture

Neovim uses **lazy.nvim** as the plugin manager with a modular Lua configuration:

- **Entry point**: `nvim/init.lua` loads three core modules
- **General settings**: `nvim/lua/general.lua` contains editor options (tabs, line numbers, clipboard, etc.)
- **Key mappings**: `nvim/lua/keymap.lua`
- **Plugin management**: `nvim/lua/plugin.lua` configures lazy.nvim and loads all plugins from `plugins/` directory

Each plugin has its own file in `nvim/lua/plugins/` that returns a lazy.nvim plugin spec. Major plugin categories:

- **LSP**: nvim-lspconfig, lspsaga, trouble.nvim, blink_cmp (completion)
- **Git**: gitsigns, diffview, git-conflict
- **File navigation**: oil.nvim, nvim-tree, telescope
- **UI/Diagnostics**: noice, tiny-inline-diagnostic, diagflow, lsp_lines
- **Editing**: nvim-treesitter, nvim-surround, comment.nvim, emmet-vim
- **Terminal**: toggleterm
- **Syntax**: nvim-highlight-colors (color code visualization)

### Zsh Architecture

Zsh uses **sheldon** for plugin management with these plugins loaded via `sheldon/plugins.toml`:

- zsh-completions
- zsh-autosuggestions
- zsh-syntax-highlighting
- zsh-history-substring-search
- powerlevel10k (theme)

The `.zshrc` includes:

- **History configuration**: 100k entries with sharing across sessions
- **Completion system**: Advanced zstyle configurations with menu select
- **fzf integration**: Custom functions for history search (`^r`) and directory navigation via cdr (`^q`)
- **gok function**: Wrapper for long-running commands that triggers tmux activity notification on completion
- **mise**: Version manager activation

## Key Development Commands

### Neovim Plugin Management

```bash
# Launch Neovim and access lazy.nvim UI
nvim
:Lazy

# Update all plugins
:Lazy update

# Install new plugins (after adding to nvim/lua/plugin.lua)
:Lazy install
```

### Zsh Plugin Management

```bash
# Update sheldon plugins
sheldon lock --update

# Reload zsh configuration
source ~/.zshrc
```

### Testing Configuration Changes

After modifying dotfiles:

1. **Neovim**: Restart nvim or `:source $MYVIMRC`
2. **Zsh**: Run `source ~/.zshrc` or restart shell
3. **Tmux**: Prefix + r (if reload binding configured) or restart tmux

## Important Configuration Notes

### Neovim

- Tab width: 4 spaces (default), 2 spaces for HTML/CSS/JSON/Vue
- Leader key and other keymaps are defined in `nvim/lua/keymap.lua`
- LSP servers must be installed separately (managed by nvim-lspconfig)
- Plugin documentation with keymaps is maintained in `nvim_plugin.md`

### Zsh

- Uses **emacs keybindings** (`bindkey -e`)
- History search: `^r` (fzf)
- Recent directory navigation: `^q` (fzf + cdr)
- Docker/Podman socket: Configured for rootless podman
- PATH additions: sheldon (`~/.local/bin`), mise

### File Type Handling

- JavaScript/TypeScript/PHP files use 4-space indentation, HTML/CSS/JSON/Vue files use 2-space indentation in Neovim
- Emmet expansion works in HTML/CSS/JS/JSX/TS/TSX/Vue/Svelte files

## Adding New Neovim Plugins

1. Create a new file in `nvim/lua/plugins/` (e.g., `nvim/lua/plugins/myplugin.lua`)
2. Export a lazy.nvim plugin spec:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       -- plugin configuration
     end,
   }
   ```
3. Add `require 'plugins.myplugin'` to the `neovim_plugins` table in `nvim/lua/plugin.lua`
4. Restart Neovim - lazy.nvim will auto-install

## System Dependencies

This configuration assumes the following tools are installed:

- Neovim (recent version with Lua support)
- Git
- fzf (fuzzy finder)
- sheldon (Zsh plugin manager, install to `~/.local/bin`)
- mise (version manager)
- tig (optional, for git TUI)
- Nerd Font (for icons in Neovim and terminal)
- WezTerm (optional terminal emulator)
