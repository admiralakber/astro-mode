{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "astro-mode";
  version = "1.0.0";

  # Source script file
  src = ./astro;

  # Dependencies needed at runtime
  buildInputs = [ pkgs.gammastep pkgs.wlsunset ];

  # Skip unpacking since src is a single file
  unpackPhase = ":";

  # Installation phase: copy the script to $out/bin and make it executable
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/astro
    chmod +x $out/bin/astro
  '';

  # Metadata for the package
  meta = with pkgs.lib; {
    description = "Toggle astronomy red mode for Wayland/Sway - perfect for preserving night vision";
    homepage = "https://github.com/admiralakber/astro-mode";
    license = licenses.mit;
    maintainers = [
      {
        name = "Aqeel Akber";
        email = "aqeel@aqeelakber.com";
        github = "admiralakber";
        gitlab = "admiralakber";
      }
    ];
    platforms = platforms.linux;
  };
}
