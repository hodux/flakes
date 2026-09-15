{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./desktop.nix
    ./hardware.nix
    ./packages.nix
    ./system.nix
    # ./cybersec.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.rintaro.imports = [
      ../home-manager
    ];
  };
}
