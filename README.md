# flake-ndi
flake-ndi implements a license override [the ndi package from
Nixpkgs](https://github.com/NixOS/nixpkgs/blob/nixos-21.05/pkgs/development/libraries/ndi/default.nix#L56)
via a flake, simply by using `override` on the `requireFile` function in the ndi
package and providing this as an overlay which can be consumed by anyone.

## TL;DR

This flake forces `ndi` to download instead of requiring manual steps with
`nix-prefetch` so you can just use it like a normal package.

## Usage

To enable `flake-ndi`, add it to your `flake.nix`:

```nix
{
  inputs.flake-ndi.url = "github:matthewcroughan/flake-ndi";

  outputs = { self, nixpkgs, flake-ndi }: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      overlays = [ flake-ndi.overlay ];
    };
  };
}
```

## Example of using in Obs with Home-Manager

https://github.com/MatthewCroughan/nixcfg/commit/3ac4bd4550e4e4047bb185d72ddaeeb29017fa77
