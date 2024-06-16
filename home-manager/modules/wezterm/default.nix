{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    colorSchemes = {
      colors = {
        ansi = [
          "#000000"
          "#ef596f"
          "#89ca78"
          "#e5c07b"
          "#61afef"
          "#d55fde"
          "#2bbac5"
          "#abb2bf"
        ];
        background = "#000000";
        brights = [
          "#434852"
          "#f38897"
          "#a9d89d"
          "#edd4a6"
          "#8fc6f4"
          "#e089e7"
          "#4bced8"
          "#c8cdd5"
        ];
        cursor_bg = "#d55fde";
        cursor_fg = "#000000";
        foreground = "#abb2bf";
        selection_bg = "#d55fde";
        selection_fg = "#abb2bf";
        indexed = { };
      };

      metadata = {
        name = "onedarkpro_onedark_dark";
        origin_url = "https://github.com/olimorris/onedarkpro.nvim";
      };
    };
  };

  xdg.configFile.wezterm = {
    source = ./wezterm;
    recursive = true;
  };
}
