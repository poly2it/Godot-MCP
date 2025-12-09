{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgsFor = system: nixpkgs.legacyPackages.${system};
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forAllSystems = let
      lib = nixpkgs.lib;
    in
      f:
        systems
        |> lib.map (system: f system (pkgsFor system))
        |> lib.foldl (a: b: lib.recursiveUpdate a b) {};
  in
    forAllSystems (
      system: pkgs: {
        packages.${system}.default = pkgs.callPackage ./. {};
      }
    );
}
