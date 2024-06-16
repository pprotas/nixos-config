{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName = "Pawel Protas";
    userEmail = "contact@pawelprotas.com";
    extraConfig = {
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII874qsVN3P+1Fjo28tOZOcJiMsDtNQZuXqdBzXMq6mC";
      commit.gpgsign = true;
      pull.rebase = true;
      rebase.updateRefs = true;
      rerere.enabled = true;
    };

    delta.enable = true;
  };
}
