{ config, pkgs, ... }:

{
  imports = [
    ../linux.nix
  ];

  # Work environment (Einride)
  home.sessionVariables = {
    GOOGLE_CLOUD_PROJECT = "e-gemini-cli-prod";
    GOOGLE_CLOUD_LOCATION = "europe-west1";
    GOOGLE_GENAI_USE_VERTEXAI = "true";
    CLAUDE_CODE_USE_VERTEX = "1";
    CLOUD_ML_REGION = "europe-west1";
    ANTHROPIC_VERTEX_PROJECT_ID = "e-gemini-cli-prod";
  };

  # Machine-specific PATH
  home.sessionPath = [
    "$HOME/.opencode/bin"
  ];

  # Thinkpad-specific packages
  home.packages = with pkgs; [
    # Add thinkpad-specific packages here
  ];
}
