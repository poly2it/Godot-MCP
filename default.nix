{
  lib,
  buildNpmPackage,
}:
buildNpmPackage {
  pname = "godot-mcp";
  version = "0.1.0";

  src = ./server;

  npmDepsHash = "sha256-AnzGLvpo5IDdDZOoMIjRklJmulObckoAA7YgdC745y0=";

  meta = with lib; {
    description = "An MCP for Godot that lets you create and edit games in the Godot game engine";
    homepage = "https://github.com/ee0pdt/Godot-MCP";
    license = licenses.mit;
    mainProgram = "godot-mcp-server";
  };
}
