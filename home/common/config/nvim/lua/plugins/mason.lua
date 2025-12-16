-- Disable Mason on NixOS (LSP servers installed via Nix)
return {
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
}
