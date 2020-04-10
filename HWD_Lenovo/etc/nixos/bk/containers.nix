{ config, pkgs, ... }:

{
  imports = [
      ./containers/gcpdrgn.nix
      ./containers/gcpsndp.nix
      ./containers/gcpion.nix
      ./containers/awsndp.nix
      ./containers/awsion.nix
  ];

  containers.gcpdrgn.autoStart = false;
  containers.gcpsndp.autoStart = false;
  containers.gcpion.autoStart = true;
  containers.awsndp.autoStart = false;
  containers.awsion.autoStart = true;
}
