-- Disable Mason on NixOS (LSP servers installed via Nix)
return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
}
