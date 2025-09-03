# File:     flake.nix
# Author:   David Ricci
# Date:     09/02/2025
# Desc:     This flake defines development shells and packages provided by this repository.
{
  description = "Embedded systems development environment with multi-architecture support";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
  };

  outputs = inputs : let
    in {
      # Define the architectures you want to support for development hosts
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      
      # Define target architectures for embedded systems
      targetArchitectures = {
        "arm-cortex-m0" = {
          triple = "arm-none-eabi";
          cpu = "cortex-m0";
          fpu = "none";
          float-abi = "soft";
        };
        "arm-cortex-m4" = {
          triple = "arm-none-eabi";
          cpu = "cortex-m4";
          fpu = "fpv4-sp-d16";
          float-abi = "hard";
        };
        "arm-cortex-a9" = {
          triple = "arm-none-eabihf";
          cpu = "cortex-a9";
          fpu = "neon";
          float-abi = "hard";
        };
        "aarch64-embedded" = {
          triple = "aarch64-none-elf";
          cpu = "cortex-a53";
          fpu = "crypto-neon-fp-armv8";
          float-abi = "hard";
        };
      };
    };
}
