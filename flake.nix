{
  description = "astro-mode - Toggle astronomy red mode for Wayland/Sway to preserve night vision";

  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      package = import ./default.nix { inherit pkgs; };
    in {
    # Define the default package as a derivation, passing pkgs
    packages.${system}.default = package;

    # Define the app for nix run
    apps.${system}.default = {
      type = "app";
      program = "${package}/bin/astro";
    };
  };
}
