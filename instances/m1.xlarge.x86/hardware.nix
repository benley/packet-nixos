{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    version = 2;
    # efiSupport = true;
    devices = ["/dev/sda" "/dev/sdb" "/dev/sdc" "/dev/sdd" "/dev/sde" "/dev/sdf" ];

    extraConfig = ''
      serial --unit=1 --speed=115200 --word=8 --parity=no --stop=1
      terminal_output serial console
      terminal_input serial console
      '';
  };

  boot.initrd.availableKernelModules = [
    "xhci_pci" "ehci_pci" "ahci" "megaraid_sas" "usbhid" "sd_mod"
  ];

  boot.kernelModules = [ "kvm_intel" ];
  boot.kernelParams =  [ "console=ttyS1,115200n8" "elevator=none" ];
  boot.extraModulePackages = [ ];

  hardware.enableAllFirmware = true;

  nix.maxJobs = 48;
}
