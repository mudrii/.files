parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme0n1 -- set 1 boot on
parted /dev/nvme0n1 -- mkpart primary 512MiB 100%

mkfs.fat -F 32 -n boot /dev/nvme0n1p1
ls -la /dev/disk/by-uuid/
export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme0n1p2) && echo $PARTUUID
cryptsetup luksFormat /dev/disk/by-partuuid/$PARTUUID
cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted
mkfs.ext4 -L nixos /dev/mapper/crypted

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
ls -la /dev/disk/by-label/
mount /dev/disk/by-label/boot /mnt/boot
fallocate -l 2G /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
nixos-generate-config --root /mnt
vim /mnt/etc/nixos/configuration.nix

nix-channel --add https://nixos.org/channels/nixos-unstable unstable
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --list
nix-channel --update

nix-channel --update unstable
nix-channel --update nixos
nix-channel --update home-manager

nixos-install
reboot

