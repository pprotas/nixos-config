{
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        edit = "nvim {{filename}}";
        editPreset = "nvim-remote";
        openLink = ''open "$(echo "{{link}}" | sed 's/%2F/\//g')"'';
      };
      gui = {
        nerdFontsVersion = "3";
        border = "rounded";
      };
      keybinding = {
        commits = {
          moveDownCommit = "<c-n>";
          moveUpCommit = "<c-p>";
        };
      };
      services."gitlab.inverselink.com" = "gitlab:gitlab.inverselink.com";
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };
}
