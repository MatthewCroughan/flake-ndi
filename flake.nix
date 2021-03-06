{
  description = "License override flake for ndi in Nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    defaultPackage.x86_64-linux = (import nixpkgs {
      system = "x86_64-linux";
      overlays = [ self.overlay ];
    }).ndi;
    overlay = final: prev: {
      ndi = prev.ndi.override {
        requireFile = { ... }: builtins.fetchurl rec {
          url = "https://downloads.ndi.tv/SDK/NDI_SDK_Linux/InstallNDISDK_v${prev.ndi.version}_Linux.tar.gz";
          sha256 = "181ypfj1bl0kljzrfr6037i14ykg2y4plkzdhym6m3z7kcrnm1fl";
        };
      };
    };
  };
}

