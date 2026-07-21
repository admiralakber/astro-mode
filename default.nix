{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "astro-mode";
  version = "1.0.0";

  # Source script file
  src = ./astro;

  # Skip unpacking since src is a single file
  dontUnpack = true;

  nativeBuildInputs = [ pkgs.makeWrapper ];

  # Installation: install script, then wrap so runtime tools are on PATH
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -Dm755 $src $out/bin/astro
    wrapProgram $out/bin/astro \
      --prefix PATH : ${pkgs.lib.makeBinPath [
        pkgs.gammastep
        pkgs.wlsunset
        pkgs.procps      # pgrep / pkill
        pkgs.coreutils  # timeout
        pkgs.util-linux # setsid
      ]}
    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "Toggle astronomy red mode for Wayland/Sway - perfect for preserving night vision";
    homepage = "https://github.com/admiralakber/astro-mode";
    license = licenses.mit;
    mainProgram = "astro";
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
