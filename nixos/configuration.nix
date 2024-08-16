{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
  networking.firewall = {
    allowedUDPPorts = [ 5353 ];
    allowedUDPPortRanges = [{ from = 32768; to = 61000; }];
    allowedTCPPorts = [ 8010 ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.sessionVariables.SSH_AUTH_SOCK = "/home/pawel/.1password/agent.sock";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "pawel";
  };

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "us";
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 10;
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  services.avahi.enable = true;

  users.users.pawel = {
    isNormalUser = true;
    description = "Pawel Protas";
    extraGroups = [ "networkmanager" "wheel" "audio" "tty" "rtkit" ];
    packages = with pkgs; [
    ];
  };


  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    chromium
    discord
    obsidian
    spotify
    qbittorrent
    calibre
    vlc

    burpsuite
    zap
    nmap
    httpie-desktop

    bitwig-studio

    cargo
    go
    nodejs
    gcc

    git
    gnumake
    tree-sitter
    fzf
    ripgrep

    unzip
    wl-clipboard
    tmux-mem-cpu-load
    vesktop
    logiops

    gnome.gnome-tweaks
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  programs.nix-ld.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "pawel" ];
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
