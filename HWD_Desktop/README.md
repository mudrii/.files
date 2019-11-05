# install

## wifi
nmtui


parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 1 boot on
parted /dev/sda -- mkpart primary 512MiB 100%

mkfs.fat -F 32 -n boot /dev/sda1
ls -la /dev/disk/by-uuid/
export PARTUUID=$(blkid -s PARTUUID -o value /dev/sda2) && echo $PARTUUID
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

nix-channel --add https://nixos.org/channels/nixos-unstable unstable
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --list
nix-channel --update

nix-channel --update unstable
nix-channel --update nixos
nix-channel --update home-manager

nixos-install
reboot

# recover

export PARTUUID=$(blkid -s PARTUUID -o value /dev/sda1) && \
echo $PARTUUID

cryptsetup luksOpen /dev/disk/by-partuuid/$PARTUUID crypted

mount /dev/disk/by-label/nixos /mnt
mount /dev/disk/by-label/boot /mnt/boot

curl -L https://get.oh-my.fish | fish
omf install bobthefish
omf theme bobthefish
omf reload


rfkill list

# create missing folders

mkdir ~/.local/share/Trash
mkdir ~/Images


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

## Update OS
sudo nixos-rebuild switch --upgrade

# Wirless i3

exec --no-startup-id wicd-client --tray
#or
exec --no-startup-id nm-applet


## Find packages 

nix-env -qaP '.*emacs.*'

## File description

nix-env -qa --description '.*emacs.*'


## Show files installed by the package

readlink -f $(which nvim)
du -a /nix/store/72q6z4wy5bz9j7q4wbblig0cdm6j2n5w-neovim-0.3.8/bin/nvim

## Verify all installed packages 

sudo nix-store --verify --check-contents

## Fix packages with failed checksums 

sudo nix-store --verify --check-contents --repair

## List package dependencies 

nix-store --query --requisites $(readlink -f /run/current-system)
nix-store -q --tree /nix/var/nix/profiles/system

nix-store --query --references\
  $(nix-instantiate '<nixpkgs>' -A emacs)

## Check for broken dependencies

nix-store --verify --check-contents


## Install Packages

nix-instantiate --strict --json --eval -E 'builtins.map (p: p.name) (import <nixpkgs/nixos> {}).config.environment.systemPackages' | nix run nixpkgs.jq -c jq -r '.[]' | sort -u
# or
sudo nixos-option environment.systemPackages | head -2 | tail -1 | \
    sed -e 's/ /\n/g' | cut -d- -f2- | sort | uniq


## Users Packages

sudo nixos-option users.users.mudrii.packages | head -2 | tail -1 | \
    sed -e 's/ /\n/g' | cut -d- -f2- | sort | uniq 


# git develop
# Fork 1st

git clone git@github.com:mudrii/nixpkgs.git
git remote add upstream git@github.com:NixOS/nixpkgs.git

# syncup with original
git pull upstream master

export NIXPKGS=/home/mudrii/src/nixpkgs/

# view packages

nix-env -f $NIXPKGS -qaP '*'

# Index all binary and files
nix-index

# locate specific library
nix-locate -1 -w lib/ld-linux-x86-64.so.2

