{
  description = "Kitware's Paraview";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.paraview = pkgs.paraview.overrideAttrs (oldAttrs: {
        version = "5.10.0";
        src = pkgs.fetchFromGitLab {
          domain = "gitlab.kitware.com";
          owner = "paraview";
          repo = "paraview";
          rev = "v5.10.0";
          sha256 = "sha256-Qj+g7CphlcCuT1eXnyvdZipm5ZZCg73fYfFCQvA3/UY=";
          fetchSubmodules = true;
        };
      });
    };
}
