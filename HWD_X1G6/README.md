# NixOS Installation

## Disk partitioning

```sh
parted /dev/nvme0n1 -- mklabel gpt

parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB

parted /dev/nvme0n1 -- set 1 boot on

parted /dev/nvme0n1 -- mkpart primary 512MiB 100%
```

## Disk Formating and encryption

```sh
mkfs.fat -F 32 -n boot /dev/nvme0n1p1

ls -la /dev/disk/by-uuid/

export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme0n1p2) && echo $PARTUUID

cryptsetup luksFormat /dev/disk/by-partuuid/$PARTUUID

cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted

mkfs.ext4 -L nixos /dev/mapper/crypted
```

## Make swap file and mounting file system

```sh
mount /dev/disk/by-label/nixos /mnt

mkdir -p /mnt/boot

ls -la /dev/disk/by-label/

mount /dev/disk/by-label/boot /mnt/boot

fallocate -l 2G /mnt/swapfile

chmod 600 /mnt/swapfile

mkswap /mnt/swapfile

nixos-generate-config --root /mnt

vim /mnt/etc/nixos/configuration.nix
```

## Add channel for unstable and home-manager

```sh
nix-channel --add https://nixos.org/channels/nixos-unstable unstable

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager

nix-channel --list

nix-channel --update

#nix-channel --update unstable
#nix-channel --update nixos
#nix-channel --update home-manager
```

## NixOS installation

```sh
nixos-install
reboot
```

## Post reboot

```sh
sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable

sudo nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager

sudo nix-channel --update unstable

sudo nix-channel --update nixos

sudo nix-channel --list
```

## Install Oh My Fish for Theme

```sh
curl -L https://get.oh-my.fish | fish

omf install bobthefish

omf theme bobthefish

omf reload
```

## NixOS Operations

### Install packages after change in configuration

```sh
sudo nix-store --verify --check-contents
```

### Optimize nix store to relink and remove duplicated

```sh
sudo nix-store --optimise -v
```

### Garbage collection

```sh
sudo nix-collect-garbage
```

### Garbage collection remove from history

```sh
sudo nix-collect-garbage -d
```

### Find packages

```sh
nix-env -qaP '.*emacs.*'
```

### File description

```sh
nix-env -qa --description '.*emacs.*'
```

### Show files installed by the package

```sh
readlink -f $(which nvim)
du -a /nix/store/72q6z4wy5bz9j7q4wbblig0cdm6j2n5w-neovim-0.3.8/bin/nvim
```

### Verify all installed packages

```sh
sudo nix-store --verify --check-contents
```

### Fix packages with failed checksums

```sh
sudo nix-store --verify --check-contents --repair
```

### List package dependencies

```sh
nix-store --query --requisites $(readlink -f /run/current-system)
nix-store -q --tree /nix/var/nix/profiles/system

nix-store --query --references\
  $(nix-instantiate '<nixpkgs>' -A emacs)
```

# Packaghe maintainer

```sh
nix eval --json '(import <nixpkgs> {}).tuxguitar.meta.maintainers'
## or
nix eval nixpkgs.tuxguitar.meta.maintainers
```

## Install Packages
```sh
nix-instantiate --strict --json --eval -E 'builtins.map (p: p.name) (import <nixpkgs/nixos> {}).config.environment.systemPackages' | nix run nixpkgs.jq -c jq -r '.[]' | sort -u
# or
sudo nixos-option environment.systemPackages | head -2 | tail -1 | \
    sed -e 's/ /\n/g' | cut -d- -f2- | sort | uniq
```

### Installed Users Packages

```sh
sudo nixos-option users.users.mudrii.packages | head -2 | tail -1 | \
    sed -e 's/ /\n/g' | cut -d- -f2- | sort | uniq
```
