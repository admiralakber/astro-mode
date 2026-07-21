# Ad-hoc Nix shell for hacking on / running ./astro without installing.
#   nix-shell
#   ./astro status
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  packages = [
    pkgs.gammastep
    pkgs.wlsunset
  ];
}
