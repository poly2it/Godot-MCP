{
  lib,
  buildNpmPackage,
}:
buildNpmPackage {
  pname = "godot-mcp";
  version = "0.1.0";

  src = ./server;

  npmDepsHash = "sha256-uZpv6aM07LYIcAlCN7rwRFn1KVs971EC+wCLwvnwF0s=";

  npmFlags = [ "--legacy-peer-deps" ];

  meta = with lib; {
    description = "An MCP for Godot that lets you create and edit games in the Godot game engine";
    homepage = "https://github.com/ee0pdt/Godot-MCP";
    license = licenses.mit;
    mainProgram = "godot-mcp-server";
  };
}
