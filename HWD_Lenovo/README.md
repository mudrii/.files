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

# fallocate -l 2G /mnt/swapfile # Not working for kernel 5.7
dd if=/dev/zero of=/mnt/swapfile bs=1M count=2048 status=progress

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

#wifi connect mannually with network manager
nmtui
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

## Fix Issue with fonts post update for i3 showing squares

```sh
fc-cache -f -v 
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
[   20.306958] acpi_call: module verification failed: signature and/or required key missing - tainting kernel
[   20.309198] thinkpad_ec: thinkpad_ec_request_row: arg0 rejected: (0x01:0x00)->0x00
[   20.309198] thinkpad_ec: thinkpad_ec_read_row: failed requesting row: (0x01:0x00)->0xfffffffb
[   20.309217] thinkpad_ec: initial ec test failed


[   20.628625] tpm_tis STM7364:00: 2.0 TPM (device-id 0x0, rev-id 78)
[   20.630554] tpm tpm0: tpm_try_transmit: send(): error -5
[   20.630655] i801_smbus 0000:00:1f.4: enabling device (0000 -> 0003)
[   20.631463] tpm tpm0: [Firmware Bug]: TPM interrupt not working, polling instead

[   26.503250] virbr0: port 1(virbr0-nic) entered disabled state
[   26.595625] ucsi_acpi USBC000:00: con2: failed to register alternate modes
```

## Development

# 1st fork https://github.com/nixos/nixpkgs 

```sh
git clone --depth=1 git@github.com:mudrii/nixpkgs.git

#bash
export NIXPKGS=~/tmpdev/nixpkgs

#fish
set -x NIXPKGS ~/src/nixpkgs

ls -la $NIXPKGS
echo $NIXPKGS
```

### list all available software from the local repository $NIXPKGS  

```sh
nix-env -f $NIXPKGS -qaP '*'
```

### install software from local repository

```sh
nix-env -f $NIXPKGS -iA python-urlgrabber
```

### update the system based on your local $NIXPKGS

```sh
nixos-rebuild -I nixpkgs=$NIXPKGS switch
```

### build an expression and put the output in to `pwd`/results

```sh
nix-build $NIXPKGS -A irssi
```

###  get an environment which is used to build irssi (also see nix-shell)

```sh
nix-build $NIXPKGS --run-env -A irssi
```

### get a persistent environment which is used to build irssi

```sh
nix-build $NIXPKGS --run-env -A irssi --add-root
```

## Tracking upstream changes and avoiding extra rebuilding

```sh
# merge 
git remote add upstream https://github.com/NixOS/nixpkgs.git
git remote -v
git fetch upstream
git checkout master
git merge --no-ff upstream/master
git push -v origin master

# rebase
git remote add upstream https://github.com/NixOS/nixpkgs.git
git remote -v
git fetch upstream
git checkout master
git rebase upstream/master
git push -f origin master
```

### Merge 

```sh
git checkout master
git pull origin master
git merge upstream-master
git push origin master
```


### Change install Pulumi

```sh
cd /home/mudrii/src/nixpkgs/pkgs/tools/admin/pulumi

vim update.sh

# chcek installed nix-env -f $NIXPKGS -qP '*'
nix-env -f $NIXPKGS -qP '*'

# install pulumi from local
nix-env -f $NIXPKGS -iA pulumi-bin

# check installed pulumi version
pulumi verion

# uninstaled pulumi verion from local repo
nix-env -f $NIXPKGS -e pulumi
```
