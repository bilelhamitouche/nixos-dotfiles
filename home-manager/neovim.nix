{ config, pkgs, ... }:

{
  programs.neovim =
    let
      luaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      themes = {
        Ayu = "ayu";
        Catppuccin = "catppuccin-mocha";
        Dracula = "dracula";
        GruvboxDark = "gruvbox";
        Everforest = "everforest";
        Kanagawa = "kanagawa";
        Monokai = "monokai-pro-classic";
        MonokaiPro = "monokai-pro-default";
        Nord = "nord";
        Nightfox = "nightfox";
        OneDark = "onedark";
        RosePine = "rose-pine-main";
        Solarized = "NeoSolarized";
        TokyoNight = "tokyonight-night";
      };
      currentTheme = "Catppuccin";
      themeColors = themes.${currentTheme};
    in
    {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = ''
        vim.cmd "colorscheme ${themeColors}";
        ${builtins.readFile ../nvim/core/options.lua};
        ${builtins.readFile ../nvim/core/keymaps.lua};
      '';
      plugins = with pkgs.vimPlugins; [
        neovim-ayu
        catppuccin-nvim
        dracula-nvim
        gruvbox-nvim
        kanagawa-nvim
        monokai-pro-nvim
        nord-nvim
        nightfox-nvim
        onedark-nvim
        rose-pine
        NeoSolarized
        tokyonight-nvim
        phha-zenburn
        vscode-nvim
        material-nvim

        nvim-web-devicons
        cmp-nvim-lsp
        cmp-path
        cmp-buffer
        cmp_luasnip
        luasnip
        friendly-snippets
        telescope-ui-select-nvim
        telescope-fzf-native-nvim

        {
          plugin = neo-tree-nvim;
          config = luaFile ../nvim/plugins/neo-tree.lua;
        }
        {
          plugin = indent-blankline-nvim;
          config = luaFile ../nvim/plugins/indent-blankline.lua;
        }

        {
          plugin = alpha-nvim;
          config = luaFile ../nvim/plugins/alpha.lua;
        }

        {
          plugin = lualine-nvim;
          config = luaFile ../nvim/plugins/lualine.lua;
        }

        {
          plugin = fidget-nvim;
          type = "lua";
          config = "require(\"fidget\").setup({})";
        }

        {
          plugin = dressing-nvim;
          type = "lua";
          config = "require(\"dressing\").setup({})";
        }

        {
          plugin = which-key-nvim;
          config = luaFile ../nvim/plugins/which-key.lua;
        }

        {
          plugin = nvim-treesitter;
          config = luaFile ../nvim/plugins/nvim-treesitter.lua;
        }

        {
          plugin = mason-nvim;
          type = "lua";
          config = "require(\"mason\").setup({})";
        }

        {
          plugin = nvim-cmp;
          config = luaFile ../nvim/plugins/nvim-cmp.lua;
        }

        {
          plugin = nvim-autopairs;
          type = "lua";
          config = "require(\"nvim-autopairs\").setup({})";
        }

        {
          plugin = nvim-ts-autotag;
          type = "lua";
          config = "require(\"nvim-ts-autotag\").setup({})";
        }

        {
          plugin = rainbow-delimiters-nvim;
          type = "lua";
          config = "require(\"rainbow-delimiters.setup\").setup({})";
        }

        {
          plugin = nvim-lspconfig;
          config = luaFile ../nvim/plugins/nvim-lspconfig.lua;
        }

        {
          plugin = lspkind-nvim;
          config = luaFile ../nvim/plugins/lspkind.lua;
        }

        {
          plugin = conform-nvim;
          config = luaFile ../nvim/plugins/conform.lua;
        }

        {
          plugin = harpoon2;
          type = "lua";
          config = "require(\"harpoon\"):setup({})";
        }

        {
          plugin = telescope-nvim;
          config = luaFile ../nvim/plugins/telescope.lua;
        }

        {
          plugin = nvim-lint;
          config = luaFile ../nvim/plugins/nvim-lint.lua;
        }

        (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-angular
          p.tree-sitter-astro
          p.tree-sitter-bash
          p.tree-sitter-css
          p.tree-sitter-commonlisp
          p.tree-sitter-haskell
          p.tree-sitter-html
          p.tree-sitter-json
          p.tree-sitter-javascript
          p.tree-sitter-java
          p.tree-sitter-nix
          p.tree-sitter-lua
          p.tree-sitter-vim
          p.tree-sitter-php
          p.tree-sitter-python
          p.tree-sitter-ruby
          p.tree-sitter-scss
          p.tree-sitter-svelte
          p.tree-sitter-styled
          p.tree-sitter-sql
          p.tree-sitter-typescript
          p.tree-sitter-tsx
          p.tree-sitter-vue
        ]))
      ];
      extraPackages = with pkgs; [
        emmet-ls
        gopls
        jdt-language-server
        lua-language-server
        nil
        nodePackages.bash-language-server
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
        nodePackages.typescript-language-server
        nodePackages.svelte-language-server
        nodePackages.vim-language-server
        nodePackages.volar
        pyright
        rust-analyzer
        ruby-lsp
        tailwindcss-language-server
        prettierd
        eslint_d
        rubocop
        python311Packages.isort
        python311Packages.black
        rustfmt
        shfmt
        stylua
        rustywind
        nixfmt-rfc-style
      ];
    };
}
