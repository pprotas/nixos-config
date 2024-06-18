{ pkgs, ... }:

{
  imports = [
    ./modules/bundle.nix
  ];
  home = {
    username = "pawel";
    homeDirectory = "/home/pawel";
    stateVersion = "24.05";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

}
