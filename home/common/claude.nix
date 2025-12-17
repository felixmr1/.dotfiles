{ config, pkgs, ... }:

{
  programs.claude-code = {
    enable = true;

    mcpServers = {
      context7 = {
        type = "stdio";
        command = "${pkgs.nodejs_22}/bin/npx";
        args = [ "-y" "@upstash/context7-mcp@latest" ];
      };
    };
  };
}
