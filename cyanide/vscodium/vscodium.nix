# vscodium.nix
{ pkgs, ... }: {
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = false; # Force Home Manager to control all extensions

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim               # Vim motions
        alefragnani.bookmarks       # Marks in the gutter like marks.vim
        usernamehw.errorlens        # End-of-line diagnostics
        mkhl.direnv                 # nix-direnv integration
        jnoortheen.nix-ide          # Nix language support
        ms-python.python            # Python language support
        detachhead.basedpyright     # BasedPyright LSP

        # Doki Theme from VS Code Marketplace
        (pkgs.vscode-utils.extensionFromVscodeMarketplace {
          name = "doki-theme";
          publisher = "unthrottled";
          version = "88.1.15";
          hash = "sha256-ys3D84zg7mGGTG5Ey65gqgujbUJBsg27MC3qUnbluoM=";
        })
      ];

      userSettings = {
        #  Editor settings
        "workbench.colorTheme" = "ea9a13f6-fa7f-46a4-ba6e-6cefe1f55160";
        "editor.fontFamily" = "CaskaydiaCove Nerd Font";
        "terminal.integrated.fontFamily" = "CaskaydiaCove Nerd Font";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "smooth"; # Options: "smooth", "phase", "expand", "solid"
        "editor.semanticHighlighting.enabled" = true;

        "editor.fontSize" = 16;
        "editor.formatOnSave" = true;

        # Enable relative line numbers for Vim motions
        "editor.lineNumbers" = "relative";

        # Automatically insert () and place cursor inside when accepting function completions
        "python.analysis.completeFunctionParens" = true;
        "basedpyright.analysis.completeFunctionParens" = true;
        "editor.acceptSuggestionOnEnter" = "on";

        # Doki theme setup
        "doki.background.enabled" = true;
        "doki.wallpaper.enabled" = false;

        # Error Lens setup
        #"errorLens.messageTemplate" = "[$count] $severity $message $source($code)";
        "errorLens.messageTemplate" = "$severity  $message";
        "errorLens.messageMaxChars" = 500;
        "errorLens.severityText" = [
          " "  # Error icon
          " "  # Warning icon
          " "  # Info icon
          " "  # Hint icon
        ];


        # Vim Leader & Clipboard Setup
        "vim.leader" = "<space>";
        "vim.useSystemClipboard" = false;

        "vim.handleKeys" = {
          "<C-p>" = false;
          "<C-k>" = false;
          "<C-t>" = false;
        };

        "vim.normalModeKeyBindingsNonRecursive" = [
          {
            "before" = [ "<leader>" "y" ];
            "after" = [ "\"" "+" "y" ];
          }
          {
            "before" = [ "<leader>" "Y" ];
            "after" = [ "\"" "+" "Y" ];
          }
          {
            "before" = [ "<leader>" "f" ];
            "commands" = [ "workbench.action.quickOpen" ];
          }
          # Vim marks with Bookmarks
          {
            "before" = [ "m" "m" ];
            "commands" = [ "bookmarks.toggle" ];
          }
          {
            "before" = [ "m" "n" ];
            "commands" = [ "bookmarks.jumpToNext" ];
          }
          {
            "before" = [ "m" "N" ];
            "commands" = [ "bookmarks.jumpToPrevious" ];
          }
          {
            "before" = [ "m" "a" ];
            "commands" = [ "bookmarks.listFromAllFiles" ];
          }
          {
            "before" = [ "m" "c" ];
            "commands" = [ "bookmarks.clear" ];
          }
        ];

        "vim.visualModeKeyBindingsNonRecursive" = [
          {
            "before" = [ "<leader>" "y" ];
            "after" = [ "\"" "+" "y" ];
          }
        ];

        # BasedPyright Settings
        "basedpyright.analysis.typeCheckingMode" = "standard";

        # UI Tweaks
        "workbench.startupEditor" = "none";
        "editor.minimap.enabled" = false;
      };
    };
  };
}
