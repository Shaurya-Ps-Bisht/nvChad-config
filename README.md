# nvChad-config

Neovim config on [NvChad](https://github.com/NvChad/NvChad) v2.5, built from [NvChad/starter](https://github.com/NvChad/starter). NvChad itself is loaded as a plugin (see `init.lua`), so this repo only holds my config. The old v2.0 config lives on the `legacy-v2.0` branch.

## Setup on a new machine

### Requirements

- Neovim 0.11+ (tested on 0.12)
- `git`, `curl`, `unzip`, `tar`, and a C compiler (`gcc` or `clang`)
- Node.js + npm (Mason installs the TypeScript, Tailwind, ESLint, HTML and CSS servers and prettierd through npm)
- `ripgrep` (Telescope live grep)
- A [Nerd Font](https://www.nerdfonts.com/) set as the terminal font

### Install

1. Move any existing Neovim config and data out of the way:

   ```bash
   for d in ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
     [ -e "$d" ] && mv "$d" "$d.bak"
   done
   ```

2. Clone, then install plugins at the commits pinned in `lazy-lock.json`. The second restore pins lazy.nvim itself, which `init.lua` bootstraps from its `stable` branch:

   ```bash
   git clone https://github.com/Shaurya-Ps-Bisht/nvChad-config.git ~/.config/nvim
   nvim --headless "+Lazy! restore" +qa
   nvim --headless "+Lazy! restore" +qa
   ```

3. Open `nvim` and run `:MasonInstallAll`. This installs the LSP servers, formatters, codelldb and the tree-sitter CLI listed in `M.mason.pkgs` in `lua/chadrc.lua`.
4. Restart `nvim` and run `:TSInstallAll` to build the treesitter parsers (needs the tree-sitter CLI from step 3).

`git status` in `~/.config/nvim` should be clean afterwards. To update plugins later, run `:Lazy update` and commit the new `lazy-lock.json`.

## clang-format

```bash
~/.local/share/nvim/mason/bin/clang-format --style GNU --dump-config > .clang-format
```

Has to be generated in the root of the project.

## 2do

- [ ] nvim-dap: create a separate launch config for debugging with gpu, currently even default config has nvidia-prime env vars haha
- [ ] nvim-dap: also fix vram allocation cap on not-titanfall3
