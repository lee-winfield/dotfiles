# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for development tools and window management on macOS. The repository uses symlinks to deploy configuration files to the home directory.

## Installation and Setup

To deploy the dotfiles, run the command from the README:

```bash
ln -sf "$(pwd)/.ideavimrc" ~/ && ln -sf "$(pwd)/.zshrc" ~/ && ln -sf "$(pwd)/init.lua" ~/
```

### Required Dependencies

Install these dependencies before using the configurations:

```bash
# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Seinh/git-prune.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-prune

# Install Neovim
brew install neovim
```

## Configuration Files

### Neovim Configuration (init.lua)

The Neovim configuration is based on **Kickstart.nvim** - a minimal, well-documented starting configuration. Key characteristics:

- **Plugin Manager**: Uses `lazy.nvim` for plugin management
- **LSP Setup**: Configured with `mason.nvim`, `nvim-lspconfig` for Language Server Protocol support
- **Key Plugins**:
  - `telescope.nvim` - Fuzzy finder for files, LSP symbols, grep
  - `nvim-treesitter` - Syntax highlighting and code understanding
  - `nvim-cmp` with `LuaSnip` - Autocompletion
  - `gitsigns.nvim` - Git integration
  - `mini.nvim` - Collection of small utilities (statusline, surround, text objects)
  - `conform.nvim` - Code formatting
  - `which-key.nvim` - Keybinding hints

**Important Keybindings**:
- Leader key: `<Space>`
- `<leader>sf` - Search files
- `<leader>sg` - Live grep
- `<leader>sh` - Search help
- `gd` - Go to definition
- `gr` - Go to references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>f` - Format buffer

**Plugin Management Commands**:
- `:Lazy` - Open plugin manager
- `:Lazy update` - Update plugins
- `:Mason` - Manage LSP servers and tools
- `:checkhealth` - Diagnose configuration issues

### Zsh Configuration (.zshrc)

Based on **oh-my-zsh** with custom configuration:

- **Theme**: `robbyrussell`
- **Plugins**: git, git-prune, zsh-autosuggestions, zsh-syntax-highlighting, z
- **Editor**: `nvim` set as default editor (EDITOR and vi alias)
- **Node Version Manager**: Volta configured at `$HOME/.volta`
- **Java**: OpenJDK 17 added to PATH

**Custom Functions**:
- `keychain-environment-variable SECRET_ENV_VAR` - Retrieve secrets from macOS keychain
- `set-keychain-environment-variable SECRET_ENV_VAR` - Store secrets in macOS keychain
- `code` - Open VS Code from terminal

**Local Customization**: Sources `~/.localrc.sh` if it exists for machine-specific settings

### AeroSpace Configuration (.aerospace.toml)

AeroSpace is a tiling window manager for macOS with i3-like keybindings.

**Key Configuration**:
- Config version: 2
- Default layout: tiles
- Gaps: All set to 0 (no gaps between windows)
- Keyboard layout: QWERTY

**Important Keybindings**:
- `alt-h/j/k/l` - Focus left/down/up/right
- `alt-shift-h/j/k/l` - Move window left/down/up/right
- `alt-[1-9]` and `alt-[a-z]` - Switch to workspace
- `alt-shift-[1-9]` and `alt-shift-[a-z]` - Move window to workspace
- `alt-minus/equal` - Resize window
- `alt-slash` - Toggle tiles layout orientation
- `alt-comma` - Toggle accordion layout
- `alt-tab` - Switch to last workspace
- `alt-shift-semicolon` - Enter service mode

**Service Mode** (`alt-shift-semicolon` to enter):
- `esc` - Reload config and return to main mode
- `r` - Reset layout (flatten workspace tree)
- `f` - Toggle floating/tiling
- `backspace` - Close all windows except current

### IntelliJ IdeaVim Configuration (.ideavimrc)

Vim emulation for JetBrains IDEs with custom keybindings.

**Enabled Plugins**: surround, multiple-cursors, commentary, argtextobj, textobj-entire, ReplaceWithRegister

**Leader key**: `<Space>`

**Custom Mappings**:
- Navigation: `<leader>f` (find usages), `<leader>g` (go to declaration)
- Editing: `<leader>e` (expand region), `<leader>c` (collapse region)
- Refactoring: `<leader>m` (extract method), `<leader>r` (rename), `<leader>v` (introduce variable)
- Multiple carets: `Ctrl-g` (select next occurrence)
- VCS: `<leader>a` (annotate), `<leader>h` (file history)

## Working with This Repository

When modifying configuration files:

1. **Test changes locally** before committing - these configs affect the user's entire development environment
2. **Preserve existing structure** - especially in init.lua which is based on Kickstart.nvim's educational format
3. **Maintain compatibility** - the configs are designed for macOS with specific tools (Homebrew, Neovim, etc.)
4. **Document significant changes** - these are personal configs that may be used across multiple machines
5. **Respect the Kickstart philosophy** - init.lua is meant to be readable and understandable from top to bottom

## Architecture Notes

- **Deployment Strategy**: Symlinks from repository to home directory, allowing version control while keeping configs in standard locations
- **Modular Design**: Each config file is independent; changes to one shouldn't affect others
- **Plugin Management**: Neovim uses lazy-loading for performance; AeroSpace uses TOML for declarative config
- **Shell Customization**: Zsh config extends oh-my-zsh rather than replacing it, maintaining compatibility with oh-my-zsh ecosystem
