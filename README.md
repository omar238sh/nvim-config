# Neovim Configuration for Efficient Development

This is my personal Neovim (nvim) configuration aimed at improving the development experience. It includes settings and tools like auto-completion, auto-formatting, and various plugins to boost developer productivity.

## Requirements

- [Neovim](https://neovim.io/) (version 0.5 or higher)
- [Git](https://git-scm.com/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management

## Installation

### 1. Clone the repository:
```bash
git clone https://github.com/your-username/nvim-config.git ~/.config/nvim
```

### 2. Install Plugins:
Use Lazy.nvim for plugin management. To install the plugins, simply run:

```bash
nvim +LazyInstall +qall
```

### 3. Customize Settings:
Feel free to customize the settings in `init.lua` and other files in the `lua/` directory.

## File Structure

The project follows this structure:

```
├── init.lua
├── lazy-lock.json
├── LICENSE.md
├── lua
│   ├── custom
│   │   └── plugins
│   │       ├── switch.lua
│   │       ├── ui.lua
│   │       ├── windsurf.lua
│   │       └── yazi.lua
│   ├── keymaps.lua
│   ├── kickstart
│   │   ├── health.lua
│   │   └── plugins
│   │       ├── autopairs.lua
│   │       ├── blink-cmp.lua
│   │       ├── conform.lua
│   │       ├── debug.lua
│   │       ├── gitsigns.lua
│   │       ├── indent_line.lua
│   │       ├── lint.lua
│   │       ├── lspconfig.lua
│   │       ├── mini.lua
│   │       ├── neo-tree.lua
│   │       ├── telescope.lua
│   │       ├── todo-comments.lua
│   │       ├── tokyonight.lua
│   │       ├── treesitter.lua
│   │       └── which-key.lua
│   ├── lazy-bootstrap.lua
│   ├── lazy-plugins.lua
│   └── options.lua
└── README.md
```

Any new plugin or configuration you add should be placed in the `lua/custom/plugins/` folder. These files will be automatically loaded when Neovim starts.

## Plugins

- **Lazy.nvim**: The plugin manager used in this configuration.
- **nvim-treesitter**: For enhanced syntax highlighting and more accurate formatting.
- **coc.nvim**: Provides auto-completion and full LSP (Language Server Protocol) support.
- **vim-fugitive**: For managing Git from within Neovim.
- **nerdtree**: A file explorer for navigating the project directory.

## Customizations

- Keybindings have been customized for easier navigation between files.
- Performance settings have been optimized for smoother operation on low-resource machines.
- Special configurations for smoother integration with version control systems (like Git) and debugging tools.

## AI Features

To enable AI features like Codium Auth, you can add the necessary configuration to your `lua/custom/plugins` folder. The AI-related settings can be found and customized under `codium-auth.lua` or a similar file name in the `custom` folder.

## Contributing

If you'd like to improve this configuration or add new features, feel free to open pull requests or report issues.

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for more information.
