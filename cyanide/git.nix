{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "codeciphur";
        email = "ayyoobgithub@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
