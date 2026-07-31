{ ... }:
{
  # AMD Graphics
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Audio (Pipewire)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # Libinput (Touchpad)
   services.libinput = {
    enable = true;
    touchpad.sendEventsMode = "enabled";
    accelSpeed = "0.3";
    };
}
