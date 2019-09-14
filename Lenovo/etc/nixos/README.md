# install

parted /dev/nvme1n1 -- mklabel gpt
parted /dev/nvme1n1 -- mkpart ESP fat32 1MiB 512MiB
parted /dev/nvme1n1 -- set 1 boot on
parted /dev/nvme1n1 -- mkpart primary 512MiB -1

mkfs.fat -F 32 -n boot /dev/nvme1n1p1
ls -la /dev/disk/by-uuid/
export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme1n1p2) && echo $PARTUUID
cryptsetup luksFormat /dev/disk/by-partuuid/$PARTUUID
cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted
mkfs.ext4 -L nixos /dev/mapper/crypted

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
ls -la /dev/disk/by-label/
mount /dev/disk/by-label/boot /mnt/boot
fallocate -l 1G /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
nixos-generate-config --root /mnt
vim /mnt/etc/nixos/configuration.nix

nixos-install
reboot

# recover

export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme1n1p2) && \
echo $PARTUUID

cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted

mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot

curl -L https://get.oh-my.fish | fish
omf install bobthefish
omf theme bobthefish
omf reload


rfkill list



dmesg | grep iwl
dmesg | grep Bluetooth

lspci -k | grep -i network

modinfo iwlwifi

la /nix/store/klbqid1x4sr401xfl6hr24ifhyy6cjky-firmware-linux-nonfree-2019-03-12/lib/firmware/

la /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/iwlwifi-cc-a0-48.ucode

cp iwlwifi-cc-a0-48.ucode /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware/
