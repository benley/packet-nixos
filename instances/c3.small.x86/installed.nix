{ lib, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      grub = {
        enable = true;
        extraConfig = ''
          serial --unit=1 --speed=115200 --word=8 --parity=no --stop=1
          terminal_output serial console
          terminal_input serial console
        '';

      };
      # efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "rpool/safe/root";
      fsType = "zfs";
    };
    "/boot" = {
      device = "/dev/sda1";
      fsType = "vfat";
    };
    "/home" = {
      device = "rpool/safe/home";
      fsType = "zfs";
    };
    "/nix" = {
      device = "rpool/local/nix";
      fsType = "zfs";
    };
  };

  swapDevices = [ ];
}
