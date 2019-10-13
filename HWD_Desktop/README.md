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

accountsservice-0.6.55"
acl-2.2.53-bin"
acpi-1.7"
acpilight-1.2"
alsa-utils-1.1.9"
arandr-0.1.10"
atool-0.39.0"
attr-2.4.48-bin"
bash-interactive-4.4-p23"
bcache-tools-1.0.7"
bind-9.14.4"
bind-9.14.4-host"
bzip2-1.0.6.0.1-bin"
command-not-found"
commons-compress-1.18"
coreutils-8.31"
cpio-2.12"
cpufrequtils-008"
cpupower-5.3"
crda-3.18"
cryptsetup-2.1.0"
curl-7.65.3-bin"
dbus-1.12.16"
diffutils-3.7"
dmenu-4.9"
docker-19.03.2"
dosfstools-4.1"
e2fsprogs-1.45.3-bin"
escrotum-2019-06-10"
file-5.37"
findutils-4.7.0"
fish-3.0.2"
fontconfig-2.12.6-bin"
fuse-2.9.9"
fuse-3.6.2"
gawk-5.0.1"
getconf-1003.1-2008"
getent-1003.1-2008"
glibc-2.27"
glibc-locales-2.27"
glxinfo-8.4.0"
gnugrep-3.3"
gnused-4.7"
gnutar-1.32"
gnutls-3.6.9-bin"
gzip-1.10"
htop-2.2.0"
i3-gaps-4.17"
i3lock-2.12"
i3status-rust-0.10.0"
iceauth-1.0.8"
iftop-1.0pre4"
inxi-3.0.36-1"
iotop-0.6"
iproute2-5.2.0"
iptables-1.8.3"
iputils-20190709"
kbd-2.0.4"
kexec-tools-2.0.20"
kmod-26"
less-551"
libcap-2.27"
libressl-2.9.2-nc"
lightdm-1.30.0"
linux-pam-1.3.1"
lm-sensors-3.5.0"
lshw-02.18b"
lsof-4.93.2"
lvm2-2.03.01"
man-db-2.8.6.1"
mdadm-4.1"
mkpasswd-5.5.1"
modem-manager-1.10.0"
msr-tools-1.3"
nano-4.4"
ncurses-6.1-20190112"
nethogs-0.8.5"
net-tools-1.60_p20170221182432"
network-manager-1.18.2"
networkmanager_dmenu-1.1"
NetworkManager-fortisslvpn-gnome-1.2.10"
NetworkManager-iodine-gnome-1.2.0"
NetworkManager-l2tp-gnome-1.2.12"
NetworkManager-openconnect-gnome-1.2.4"
NetworkManager-openvpn-gnome-1.8.10"
NetworkManager-vpnc-gnome-1.2.6"
nix-2.3"
nix-bash-completions-0.6.7"
nix-info"
nixos-build-vms"
nixos-container"
nixos-enter"
nixos-generate-config"
nixos-help"
nixos-icons-2017-03-16"
nixos-install"
nixos-manpages"
nixos-manual.desktop"
nixos-manual-html"
nixos-option"
nixos-rebuild"
nixos-version"
nmon-16k"
nvidia-persistenced-435.21"
nvidia-settings-435.21"
nvidia-x11-435.21-5.3-bin"
nvtop-1.0.0"
openresolv-3.9.1"
openssh-7.9p1"
openssl-1.1.1d-bin"
p7zip-16.02"
patch-2.7.6"
pavucontrol-4.0"
pciutils-3.6.2"
perl-5.30.0"
polkit-0.116"
polkit-0.116-bin"
powertop-2.10"
procps-3.3.15"
pulseaudio-12.2"
python2.7-s-tui-0.8.3"
rofi-unwrapped-1.5.4"
rsync-3.1.3"
rtkit-0.11"
rxvt-unicode-with-perl-with-unicode3-with-plugins-9.22"
setxkbmap-1.3.1"
shadow-4.6"
shadow-4.6-su"
shared-mime-info-1.12"
silver-searcher-2.2.0"
strace-5.2"
stress-ng-0.10.02"
sudo-1.8.27"
sysstat-12.1.5"
systemd-243"
tcpdump-4.9.2"
texinfo-interactive-6.5"
time-1.9"
tpacpi-bat-3.1"
tree-1.8.0"
udisks-2.8.4"
unzip-6.0"
urxvt-font-size-2015-05-22"
urxvt-perls-2.2"
usbutils-012"
util-linux-2.33.2-bin"
vim-8.1.1967"
wget-1.20.3"
which-2.21"
wpa_supplicant-2.9"
xauth-1.1"
xdg-utils-1.1.3"
xf86-input-evdev-2.10.6"
xf86-input-libinput-0.28.2"
xinput-1.6.3"
xlsclients-1.1.4"
xorg-server-1.20.5"
xprop-1.2.4"
xrandr-1.5.0"
xrdb-1.2.0"
xset-1.2.4"
xsetroot-1.1.2"
xterm-348"
xz-5.2.4-bin"


## Users Packages

sudo nixos-option users.users.mudrii.packages | head -2 | tail -1 | \
    sed -e 's/ /\n/g' | cut -d- -f2- | sort | uniq 

asciinema-2.0.2"
awscli-1.16.215"
bat-0.12.1"
chromium-77.0.3865.90"
dep-0.5.4-bin"
direnv-2.20.1-bin"
elinks-0.12pre6"
fd-7.3.0"
ffmpegthumbnailer-2.2.0"
firefox-69.0.1"
git-2.23.0"
gnumake-4.2.1"
go-1.12.9"
google-cloud-sdk-255.0.0"
highlight-3.53"
jq-1.6-bin"
keychain-2.8.5"
kubectx-0.6.3"
kubernetes-1.15.4"
mediainfo-19.07"
mupdf-1.14.0-bin"
ncurses-6.1-20190112"
neovim-0.3.8"
poppler-utils-0.74.0"
psensor-1.2.0"
python3-3.7.4"
python3.7-pip-19.2.3"
python3.7-powerline-2.7"
python3.7-Pygments-2.4.2"
python3.7-pygments-markdown-lexer-0.1.0.dev39"
python3.7-virtualenv-16.4.3"
python3.7-XStatic-Pygments-2.2.0.1"
ranger-1.9.2"
screenFetch-3.8.0"
slack-4.0.2"
sshfs-fuse-3.5.2"
sublimetext-2.0.2"
terraform-0.12.9-bin"
tmux-2.9a"
vlc-3.0.8"
vscode-1.38.1"
w3m-0.5.3+git20190105"
xmind-8-update8"
zoom-us-3.0.291715.0908"
