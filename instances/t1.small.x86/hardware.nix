{
  nixpkgs.config.allowUnfree = true;

  boot.initrd.availableKernelModules = [
    "ehci_pci" "ahci" "usbhid" "sd_mod"
  ];

  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams =  [ "console=ttyS1,115200n8" ];
  boot.extraModulePackages = [ ];

  hardware.enableAllFirmware = true;

  nix.maxJobs = 4;
}
