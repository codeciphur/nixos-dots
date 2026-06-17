{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      format =
        "[](#be1c31)" +
        "$os" +
        "$username" +
        "[](bg:#9a141d fg:#be1c31)" +
        "$directory" +
        "[](fg:#9a141d bg:#d64550)" +
        "$git_branch" +
        "$git_status" +
        "[](fg:#d64550 bg:#5c1e29)" +
        "$c" +
        "$elixir" +
        "$elm" +
        "$golang" +
        "$gradle" +
        "$haskell" +
        "$java" +
        "$julia" +
        "$maven" +
        "$nodejs" +
        "$bun" +
        "$nim" +
        "$rust" +
        "$scala" +
        "[](fg:#5c1e29 bg:#a68c96)" +
        "$docker_context" +
        "[](fg:#a68c96 bg:#a68c96)" +
        "$time" +
        "[ ](fg:#a68c96)" +
        "$line_break" +
        "$character";

      # Add a blank line at the start of the prompt
      add_newline = true;

      username = {
        show_always = true;
        style_user = "bg:#be1c31 fg:#f2e6eb";
        style_root = "bg:#be1c31 fg:#ff2e43"; # Glowing red eyes highlight for root!
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        style = "bg:#be1c31";
        disabled = true;
      };

      directory = {
        style = "bg:#9a141d fg:#f2e6eb";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      c = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "bg:#a68c96 fg:#0d0406";
        format = "[ $symbol $context ]($style)";
      };

      elixir = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#d64550 fg:#0d0406";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#d64550 fg:#0d0406";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      gradle = {
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      haskell = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      julia = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $style_user ($version) ]($style)";
      };

      maven = {
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      bun = {
        symbol = "";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      scala = {
        symbol = " ";
        style = "bg:#5c1e29 fg:#decad3";
        format = "[ $symbol ($version) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %p";
        style = "bg:#a68c96 fg:#0d0406";
        format = "[ $time ]($style)";
      };
    };
  };
}
