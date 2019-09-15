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


# Debug wifi

dmesg | grep iwl
dmesg | grep Bluetooth

lspci -k | grep -i network

modinfo iwlwifi

la /nix/store/klbqid1x4sr401xfl6hr24ifhyy6cjky-firmware-linux-nonfree-2019-03-12/lib/firmware/

la /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/iwlwifi-cc-a0-48.ucode

cp iwlwifi-cc-a0-48.ucode /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware/

# Debug errors

journalctl -k

journalctl -p3 -b -1

journalctl -b -p crit

sudo nixos-option boot.kernelModules

inxi -Fxzd
lshw

sudo lshw -short -C memory

lscpu | grep "MHz".

cpufreq-info


sudo cpufreq-set -g conservative -d 1600MHz -u 1600MHz -c 0
sudo cpufreq-set -g conservative -d 1600MHz -u 1600MHz -c 1

# sshfs

sshfs mudrii@192.168.1.12:/ ~/sshfs/

fusermount -u mountpoint

```sh
sudo mkdir /mnt/droplet <--replace "droplet" whatever you prefer
sudo sshfs -o allow_other,defer_permissions root@xxx.xxx.xxx.xxx:/ /mnt/droplet
sudo sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa root@xxx.xxx.xxx.xxx:/ /mnt/droplet

sudo umount /mnt/droplet
#fstab
USERNAME@HOSTNAME_OR_IP:/REMOTE/DIRECTORY  /LOCAL/MOUNTPOINT  fuse.sshfs  defaults,_netdev  0  0
sshfs#root@xxx.xxx.xxx.xxx:/ /mnt/droplet
#or
user@domain.org:/home/user  /media/user   fuse.sshfs    defaults,allow_other,_netdev    0  0
#or
llib@192.168.1.200:/home/llib/FAH  /media/FAH2  fuse.sshfs  defaults,_netdev  0  0
```

# Packaghe maintainer

nix eval --json '(import <nixpkgs> {}).tuxguitar.meta.maintainers'
## or
nix eval nixpkgs.tuxguitar.meta.maintainers


# Errors to fix

nixos kernel: mce: CPU6: Package temperature above threshold, cpu clock throttled (total events = 1)
nixos kernel: tpm tpm0: tpm_try_transmit: send(): error -5
nixos kernel: tpm tpm0: [Firmware Bug]: TPM interrupt not working, polling instead
nixos kernel: Bluetooth: hci0: Failed to load Intel firmware file (-2)
nixos kernel: iwlwifi 0000:52:00.0: no suitable firmware found!
nixos kernel: iwlwifi 0000:52:00.0: minimum version required: iwlwifi-cc-a0-39
nixos kernel: iwlwifi 0000:52:00.0: maximum version supported: iwlwifi-cc-a0-46
nixos kernel: iwlwifi 0000:52:00.0: check git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g>
nixos kernel: iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]
nixos kernel: irq 48: nobody cared (try booting with the "irqpoll" option)
nixos kernel: handlers:
nixos kernel: [<0000000070ec9b05>] tis_int_handler [tpm_tis_core]
nixos kernel: Disabling IRQ #48
nixos dhcpcd[1020]: ipv6_addaddr1: Permission denied

# Wirless i3

exec --no-startup-id wicd-client --tray
#or
exec --no-startup-id nm-applet



