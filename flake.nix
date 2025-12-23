{
  description = "astro-mode - Toggle astronomy red mode for Wayland/Sway to preserve night vision";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
    # Define the default package as a derivation, passing pkgs
    defaultPackage.${system} = import ./default.nix { inherit pkgs; };

    # Define the app for nix run
    apps.${system}.default = {
      type = "app";
      program = "${self.defaultPackage.${system}}/bin/astro";
    };
  };
}
