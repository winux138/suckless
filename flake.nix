{
  description = "Suckless build deps";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default =
        with pkgs;
        mkShell {
          buildInputs = [
            pkg-config
            libxcrypt
            xorg.libX11
            xorg.libXft
            xorg.libXext
            xorg.libXinerama
            xorg.libXrandr
            fontconfig
            freetype
            harfbuzz
            gcc
            gnumake
          ];
        };
    };
}
