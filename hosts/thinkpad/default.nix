{ pkgs, config, ... }:
let
  goodix-gt7868q =
    config.boot.kernelPackages.callPackage ./goodix-gt7868q.nix
      { };
in
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  services.logind.lidSwitch = "ignore";

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  services = {
    tlp.enable = true;
    tlp.settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC = "power";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "performance";

      INTEL_GPU_MIN_FREQ_ON_AC = 500;
      INTEL_GPU_MIN_FREQ_ON_BAT = 500;

      STOP_CHARGE_THRESH_BAT0 = 1;

      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;

      # INTEL_GPU_MAX_FREQ_ON_AC=0;
      # INTEL_GPU_MAX_FREQ_ON_BAT=0;
      # INTEL_GPU_BOOST_FREQ_ON_AC=0;
      # INTEL_GPU_BOOST_FREQ_ON_BAT=0;

      # PCIE_ASPM_ON_AC = "default";
      # PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  environment.etc."libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
    [Lenovo Thinkbook G6+ IMH - Goodix GT7868Q]
    MatchDMIModalias=dmi:bvnLENOVO:*:pvrThinkBook*G6+IMH*:*
    MatchVendor=0x27C6
    MatchProduct=0x01E9

    #AttrEventCode=-ABS_MT_PRESSURE;-ABS_PRESSURE;
    AttrPressureRange=2:0
    AttrPalmPressureThreshold=600
    AttrThumbPressureThreshold=1000
  '';

  boot = {
    kernelModules = [
      "acpi_call"
      "thinkpad_acpi"
      "goodix-gt7868q"
    ];
    extraModulePackages =
      with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [
        pkgs.cpupower-gui
        goodix-gt7868q
      ];
  };
}
