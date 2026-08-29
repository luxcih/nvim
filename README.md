# nvim

My personal Neovim configuration.

## Requirements

- Neovim
- Git
- A Nerd Font is recommended for icons

Some language servers, formatters, and other development tools are installed and managed separately.

## Installation

Clone the repository into your Neovim configuration directory:

```sh
git clone https://github.com/luxcih/nvim.git ~/.config/nvim
```

Then start Neovim:

```sh
nvim
```

## Structure

```text
.
├── init.lua
├── lua
│   ├── config/    # General Neovim configuration
│   ├── core/      # Reusable core abstractions
│   ├── lsp/       # LSP configuration
│   └── plugins/   # Plugin configuration
└── lsp/           # Individual language-server configuration
```

## Features

- Native `vim.pack` plugin management
- Multiple colorschemes
- Built-in LSP configuration
- Treesitter
- Formatting with Conform
- File exploration with Oil
- Mini.nvim utilities
- Mason for development tools

## License

This repository is provided as my personal configuration. Feel free to use it as inspiration.
