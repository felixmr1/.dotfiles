{ config, pkgs, ... }:

{
  home.file.".claude.json".text = builtins.toJSON {
    mcpServers = {
      context7 = {
        type = "stdio";
        command = "${pkgs.nodejs_22}/bin/npx";
        args = [ "-y" "@upstash/context7-mcp@latest" ];
      };
    };
  };
}
