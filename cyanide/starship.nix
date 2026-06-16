{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    
    settings = {
      format =
        "[](#B34F7C)" +
        "$os" +
        "$username" +
        "[](bg:#9A6F8D fg:#B34F7C)" +
        "$directory" +
        "[](fg:#9A6F8D bg:#D47A8C)" +
        "$git_branch" +
        "$git_status" +
        "[](fg:#D47A8C bg:#7E5470)" +
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
        "[](fg:#7E5470 bg:#C8A2B7)" +
        "$docker_context" +
        "[](fg:#C8A2B7 bg:#C8A2B7)" +
        "$time" +
        "[ ](fg:#C8A2B7)";

      # Add a blank line at the start of the prompt
      add_newline = true;

      username = {
        show_always = true;
        style_user = "bg:#B34F7C";
        style_root = "bg:#B34F7C";
        format = "[$user ]($style)";
        disabled = false;
      };

      os = {
        style = "bg:#B34F7C";
        disabled = true;
      };

      directory = {
        style = "bg:#9A6F8D";
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
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      cpp = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "bg:#C8A2B7";
        format = "[ $symbol $context ]($style)";
      };

      elixir = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:#D47A8C";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:#D47A8C";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      gradle = {
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      haskell = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      julia = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      maven = {
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      bun = {
        symbol = "";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      scala = {
        symbol = " ";
        style = "bg:#7E5470";
        format = "[ $symbol ($version) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%I:%M %p";
        style = "bg:#C8A2B7 fg:#120A12";
        format = "[ $time ]($style)";
      };
    };
  };
}
