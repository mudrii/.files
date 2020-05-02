# NixOS Installation

## write cd image to usb stik

```sh
sudo cp /home/mudrii/Downloads/nixos-graphical-19.09.840.8bf142e001b-x86_64-linux.iso  /dev/sda
```

## ncurses wifi config

```sh
nmtui
```

## Disk partitioning

```sh
parted /dev/nvme1n1 -- mklabel gpt

parted /dev/nvme1n1 -- mkpart ESP fat32 1MiB 512MiB

parted /dev/nvme1n1 -- set 1 boot on

parted /dev/nvme1n1 -- mkpart primary 512MiB 100%
```

## Disk Formating and encryption

```sh
mkfs.fat -F 32 -n boot /dev/nvme1n1p1

ls -la /dev/disk/by-uuid/

export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme1n1p2) && echo $PARTUUID

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

## Recover boot from usb stik

```sh
export PARTUUID=$(blkid -s PARTUUID -o value /dev/nvme1n1p2) && \
echo $PARTUUID

cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted

mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot
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

## Debug errors

```sh
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
```

## Debug wifi

```sh
rfkill list

dmesg | grep iwl

dmesg | grep Bluetooth

lspci -k | grep -i network

modinfo iwlwifi

la /nix/store/klbqid1x4sr401xfl6hr24ifhyy6cjky-firmware-linux-nonfree-2019-03-12/lib/firmware/

la /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware

wget https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/iwlwifi-cc-a0-48.ucode

cp iwlwifi-cc-a0-48.ucode /nix/store/1jqa4bzjqvl97vrdq0chc9k6hd8n7q31-firmware/lib/firmware/
```

## sshfs

```sh
sshfs mudrii@192.168.1.12:/ ~/sshfs/

fusermount -u mountpoint

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

# create gpg key for git

```sh
gpg --list-key
gpg --gen-key
# Ex
git config --global user.signingkey 6AB3587A
```

# Errors to fix

```sh
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
```
