# dotfiles

Personal dotfiles for macOS development environment. Includes configurations for Neovim (Kickstart.nvim), Zsh with oh-my-zsh, AeroSpace tiling window manager, and IntelliJ IdeaVim.

## Prerequisites

- **macOS** (required for AeroSpace and some shell functions)
- **Homebrew** - [Install here](https://brew.sh)
- **oh-my-zsh** - [Install here](https://ohmyz.sh/#install)

## Installation

### 1. Install Applications

```bash
# Install Neovim
brew install neovim

# Install AeroSpace window manager
brew install --cask nikitabobko/tap/aerospace
```

### 2. Install oh-my-zsh Plugins

```bash
# Zsh autosuggestions - suggests commands as you type
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Zsh syntax highlighting - highlights commands
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Git prune plugin - helps clean up git branches
git clone https://github.com/Seinh/git-prune.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-prune
```

### 3. Symlink Configuration Files

```bash
mkdir -p ~/.config/nvim
ln -sf "$(pwd)/init.lua" ~/.config/nvim/init.lua
ln -sf "$(pwd)/vscode.lua" ~/.config/nvim/vscode.lua
ln -sf "$(pwd)/.ideavimrc" ~/
ln -sf "$(pwd)/.zshrc" ~/
ln -sf "$(pwd)/.aerospace.toml" ~/
ln -sf "$(pwd)/keybindings.json" ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf "$(pwd)/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json


# Remove legacy home-dir Neovim symlink if present
rm -f ~/init.lua
```

## What's Included

- **init.lua** - Neovim configuration based on Kickstart.nvim with LSP support, Telescope fuzzy finder, Treesitter syntax highlighting, and autocompletion
- **vscode.lua** - Cursor / VS Code Neovim keymaps (IdeaVim-style), loaded only when running inside vscode-neovim
- **.zshrc** - Zsh configuration with oh-my-zsh plugins, custom functions for macOS keychain integration, and development tool paths (Volta, Java)
- **.aerospace.toml** - AeroSpace window manager configuration with i3-like keybindings for tiling window management
- **.ideavimrc** - Vim emulation configuration for JetBrains IDEs with custom keybindings

## Post-Installation

1. **Restart your terminal** or run `source ~/.zshrc`
2. **Launch AeroSpace** from Applications (it will run in the menu bar)
3. **(Optional)** Create `~/.localrc.sh` for machine-specific settings that will be automatically sourced

## Key Features

- **Neovim**: Leader key is `<Space>`. Use `<leader>sf` to search files, `<leader>sg` to grep, `gd` for go-to-definition
- **AeroSpace**: Use `alt-h/j/k/l` to navigate windows, `alt-[1-9]` to switch workspaces
- **Zsh**: Custom functions `keychain-environment-variable` and `set-keychain-environment-variable` for secure credential storage
