# nvim.nix
{ pkgs, ... }:
let
  lsp = import ./lsp.nix { inherit pkgs; };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = (with pkgs; [ sqlite ]) ++ lsp.extraPackages;

    plugins = (with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-tree-lua
      bufferline-nvim
      lualine-nvim
      nvim-web-devicons
      gitsigns-nvim
      fzf-lua
      plenary-nvim
      sqlite-lua
      telescope-nvim

      (pkgs.vimUtils.buildVimPlugin {
        name = "bookmarks-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "heilgar";
          repo = "bookmarks.nvim";
          rev = "main";
          hash = "sha256-WwMeReR7MU9yAPpS0Uj1etYAtcgJBT1no2fPH3Cn9L4=";
        };
        doCheck = false;
      })
    ]) ++ lsp.plugins;

    initLua = ''
      -- Bind native SQLite dynamic library path for NixOS
      vim.g.sqlite_clib_path = "${pkgs.sqlite.out}/lib/libsqlite3.so"

      -- Leader Key Setup (Space)
      vim.g.mapleader = " "

      -- Editor Options
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.termguicolors = true
      vim.opt.signcolumn = "yes"
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10

      -- Indentation Options (2 spaces)
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
      vim.opt.expandtab = true

      -- Clipboard Keymap
      vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

      -- Custom Highlight Groups
      local colors = {
        bg           = "#110206",
        bg_dark      = "#0a0104",
        bg_highlight = "#260812",
        fg           = "#e6c2ca",
        red          = "#ff2e55",
        bright_red   = "#ff4d6d",
        muted_red    = "#801b2e",
        comment      = "#8a505c",
        string       = "#ff9ebb",
        line_nr      = "#5c2a35",
      }

      local hls = {
        Normal                = { fg = colors.fg, bg = colors.bg },
        NormalNC              = { fg = colors.fg, bg = colors.bg_dark },
        CursorLine            = { bg = colors.bg_highlight },
        CursorLineNr          = { fg = colors.bright_red, bold = true },
        LineNr                = { fg = colors.line_nr },
        Comment               = { fg = colors.comment, italic = true },
        Keyword               = { fg = colors.red, bold = true },
        Statement             = { fg = colors.red },
        Function              = { fg = colors.bright_red },
        String                = { fg = colors.string },
        Identifier            = { fg = colors.fg },
        Type                  = { fg = colors.bright_red },
        Constant              = { fg = colors.string },
        Special               = { fg = colors.bright_red },
        SignColumn            = { bg = colors.bg },
        VertSplit             = { fg = colors.muted_red, bg = colors.bg },
        WinSeparator          = { fg = colors.muted_red },
        BookmarkHighlight     = { bg = colors.bg_highlight },
        BookmarkSignHighlight = { fg = colors.bright_red, bg = colors.bg },
      }

      for group, opts in pairs(hls) do
        vim.api.nvim_set_hl(0, group, opts)
      end

      -- FZF Lua setup & <leader>f binding
      local fzf = require("fzf-lua")
      fzf.setup({
        winopts = { height = 0.85, width = 0.80, row = 0.35, col = 0.50, border = "rounded" },
      })
      vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Fuzzy find files" })

      -- Initialize Telescope & Bookmarks
      require("nvim-web-devicons").setup()
      require("telescope").setup({})
      require("bookmarks").setup({
        db_path = vim.fn.stdpath("data") .. "/bookmarks.db",
        use_branch_specific = false,
        default_mappings = false,
      })
      require("telescope").load_extension("bookmarks")

      vim.keymap.set("n", "mm", "<cmd>BookmarkAdd<cr>", { desc = "Add bookmark" })
      vim.keymap.set("n", "mc", "<cmd>BookmarkRemove<cr>", { desc = "Remove bookmark" })
      vim.keymap.set("n", "mn", function() require("bookmarks").jump_to_next() end, { desc = "Next bookmark" })
      vim.keymap.set("n", "mp", function() require("bookmarks").jump_to_prev() end, { desc = "Previous bookmark" })
      vim.keymap.set("n", "ma", "<cmd>Bookmarks<cr>", { desc = "List all bookmarks via Telescope" })

      -- Git Signs & UI
      require("gitsigns").setup()
      require("nvim-tree").setup({ view = { width = 30 } })
      require("bufferline").setup({})
      require("lualine").setup({})

      -- Append LSP and Autocompletion Configuration
      ${lsp.initLua}
    '';
  };
}
