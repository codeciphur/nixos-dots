# vscodium.nix
{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim               # Vim motions
      usernamehw.errorlens        # End-of-line diagnostics
      mkhl.direnv                 # nix-direnv integration
      jnoortheen.nix-ide          # Nix language support

      # --- Python Extensions ---
      ms-python.python            # Python language support
      detachhead.basedpyright     # BasedPyright LSP
    ];

    profiles.default.userSettings = {
      # Error Lens icon customization
      "errorLens.prefix" = [
        " "  # Error icon
        " "  # Warning icon
        " "  # Info icon
        " "  # Hint icon
      ];

      # Vim Leader & Clipboard Setup
      "vim.leader" = "<space>";
      "vim.useSystemClipboard" = false;
      "vim.hlsearch" = true;

      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          "before" = [ "<leader>" "y" ];
          "after" = [ "\"" "+" "y" ];
        }
        {
          "before" = [ "<leader>" "Y" ];
          "after" = [ "\"" "+" "Y" ];
        }
      ];

      "vim.visualModeKeyBindingsNonRecursive" = [
        {
          "before" = [ "<leader>" "y" ];
          "after" = [ "\"" "+" "y" ];
        }
      ];

      # BasedPyright Settings
      "basedpyright.analysis.typeCheckingMode" = "standard"; # Options: "off", "basic", "standard", "recommended", "all"

      # General UI Tweaks
      "workbench.startupEditor" = "none";
      "editor.minimap.enabled" = false;

      # Direct Nix LSP support
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
  };
}
