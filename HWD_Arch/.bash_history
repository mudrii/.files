pwd
mkdir sources && cd sources && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay --editmenu --nodiffmenu --save
echo "______________________________________________________________________________" && grep "COMPRESSXZ=(xz\|MAKEFLAGS=\"-j" /etc/makepkg.conf && echo "______________________________________________________________________________" && sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 8 -z -)/g' /etc/makepkg.conf && sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j9"/g' /etc/makepkg.conf && echo "______________________________________________________________________________" && grep "COMPRESSXZ=(xz\|MAKEFLAGS=\"-j" /etc/makepkg.conf && echo "______________________________________________________________________________"
echo "______________________________________________________________________________" && grep "PermitRootLogin" /etc/ssh/sshd_config && echo "______________________________________________________________________________" && sudo sed -i -e 's/PermitRootLogin yes/#PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config && echo "______________________________________________________________________________" && grep "PermitRootLogin" /etc/ssh/sshd_config && echo "______________________________________________________________________________"
echo "______________________________________________________________________________" && grep "Color" /etc/pacman.conf && echo "______________________________________________________________________________" && sudo sed -i -e 's/#Color/Color/g' /etc/pacman.conf && echo "______________________________________________________________________________" && grep "Color" /etc/pacman.conf && echo "______________________________________________________________________________"
echo "install i915 /bin/false" | sudo tee --append /etc/modprobe.d/blacklist.conf && echo "______________________________________________________________________________" && cat /etc/modprobe.d/blacklist.conf && echo "______________________________________________________________________________"
sudo pacman -Syyuu && yay -Syyuu && sudo pacman -S nvidia nvidia-utils nvidia-settings xorg-server xorg-apps xorg-xinit screenfetch rxvt-unicode ranger rofi conky dmenu urxvt-perls --noconfirm --needed && sudo pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font --noconfirm --needed && sudo pacman -S lightdm lightdm-gtk-greeter i3 --noconfirm --needed && sudo pacman -S chromium firefox atool highlight elinks mediainfo w3m texlive-most --noconfirm --needed && sudo pacman -S alsa-utils alsa-plugins alsa-lib --noconfirm --needed && sudo mkinitcpio -p linux && yay -S visual-studio-code-bin sublime-text-dev urxvt-font-size-git python-pdftotext && ranger --copy-config=all && echo "______________________________________________________________________________" && cat /usr/lib/modprobe.d/nvidia.conf && echo "______________________________________________________________________________"
```sh
echo "options snd_mia index=0" > /etc/modprobe.d/alsa-base.conf
echo "options snd_hda_intel index=1" >> /etc/modprobe.d/alsa-base.conf
echo "______________________________________________________________________________" && \
cat /etc/modprobe.d/alsa-base.conf && \
echo "______________________________________________________________________________"
echo "options snd_mia index=0" > /etc/modprobe.d/alsa-base.conf
echo "options snd_hda_intel index=1" >> /etc/modprobe.d/alsa-base.conf
echo "______________________________________________________________________________" && cat /etc/modprobe.d/alsa-base.conf && echo "______________________________________________________________________________"
echo "options snd_mia index=0" | sudo tee --append /etc/modprobe.d/alsa-base.conf
echo "options snd_hda_intel index=1" | sudo tee --append /etc/modprobe.d/alsa-base.conf
echo "______________________________________________________________________________" && cat /etc/modprobe.d/alsa-base.conf && echo "______________________________________________________________________________"
exit
aplay -l && lspci | grep -i audio && ls -l /dev/snd/
alsamixer -c 1
alsamixer
alsamixer
speaker-test -c 2
showconsolefont && ls -la /usr/share/kbd/consolefonts/
showconsolefont 
ls -la /usr/share/kbd/consolefonts/
lspci -k | grep -A 2 -E "(VGA|3D)" && nvidia-smi && nvidia-smi -q -d TEMPERATURE && xrandr && xrandr --listproviders && xdpyinfo | grep dots
mkdir ~/Sources && cd Sources && git clone https://github.com/mudrii/.files.git && cd .files/HWD && cp -f .bashrc .dircolors .git-completion.bash .git-prompt.sh .inputrc .nanorc .tmux.conf .vimrc .xinitrc .Xresources /home/mudrii && cd .config && cp -rf asciinema conky i3 i3status /home/mudrii/.config && cp -rf ranger/rc.conf /home/mudrii/.config/ranger
lo
ls -la
lo sources/
lo Sources/
lo .config/
pkill x
startXsudo systemctl enable lightdm && \
ip a
startx
sudo systemctl enable lightdm && sudo systemctl start lightdm
reboot
grep 'autologin-user=\|autologin-session=\|greeter-session=' /etc/lightdm/lightdm.con 
grep 'autologin-user=\|autologin-session=\|greeter-session=' /etc/lightdm/lightdm.conf~
grep 'autologin-user=\|autologin-session=\|greeter-session=' /etc/lightdm/lightdm.conf 
grep 'autologin-user=\|autologin-session=\|greeter-session=' /etc/lightdm/lightdm.conf && sudo sed -i 's/#autologin-user=/autologin-user=mudrii/g' /etc/lightdm/lightdm.conf && sudo sed -i 's/#autologin-session=/autologin-session=i3/g' /etc/lightdm/lightdm.conf && sudo sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-gtk-greeter/g' /etc/lightdm/lightdm.conf && echo "______________________________________________________________________________" && grep 'autologin-user=\|autologin-session=\|greeter-session=' /etc/lightdm/lightdm.conf && echo "______________________________________________________________________________"
sudo systemctl restart lightdm
reboot
cd Sources/
git clone git@bitbucket.org:mudrii/docs.git
git clone https://mudrii@bitbucket.org/mudrii/docs.git
cd ..
rm -rf sources
lo
shutdown now
sudp pacman -Syyuu
sudo pacman -Syyuu
yay -Syyuu
yay -S visual-studio-code-bin
yay visual-studio-code-bin
yay -Syyuu
reflector --verbose --latest 200 --number 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo reflector --verbose --latest 200 --number 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyuu
yay -Syyuu
reboot
sudo pacman -Syyuu && yay -Syu
sudo systemctl restart lightdm
sudo pacman -Syyuu && yay -Syu
yay mindx
yya xmind
yay xmind
yay postman
yay zoom
yay spotify
date
sudo pacman -Syyuu && yay -Syu
shutdown now
sudo pacman -Syyuu && yay -Syu
yay slack
sudo pacman -Syyuu && yay -Syu
zoom
./zoom
whereis zoom
sudo updatedb
locate zoom
yay zoom
yay mupdf
sudo pacman -S mupdf
yay pdftoppm
mupdf 
cd Downloads/
mupdf Canyon_Speedmax_EN.pdf 
yay pdfto
sudo pacman -sQ mupdf
sudo pacman -SQ mupdf
sudo pacman -sQ mupdf
yay zoom
yay spotify
yay slack
sudo pacman -R mupdf
sudo pacman -S mupdf
reboot
sudo pacman -Syyuu && yay -Syu
tam vlc
yay vlc
sudo pacman -S vlc
yay polkit
passwd
i3-save-tree --workspace 1 > ~/.config/.i3/workspace_1.json
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
i3-save-tree --workspace 2 > ~/.config/i3/workspace_2.json
sudo pacman -S  perl-anyevent-i3 perl-json-xs
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
i3-save-tree --workspace 2 > ~/.config/i3/workspace_2.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
i3-msg "workspace 1; append_layout ~/.config/i3/workspace-3.json"
lo
lo .config/i3/
i3-msg "workspace 1; append_layout ~/.config/i3/workspace_3.json"
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.i3/workspace_3.json
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.json
i3-msg "workspace 1; append_layout ~/.config/i3/workspace_3.json"
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.json"
i3-save-tree --workspace 1 > ~/.i3/workspace-1.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace-1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace-1.json"
cd .config/i3/
lo
cat workspace-1.json 
rm workspace-1.json 
i3-save-tree --workspace 3 > ~/.i3/workspace_3.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
lo
cat workspace_3.json 
i3-msg "workspace 3; append_layout ~/.i3/workspace_3.json"
cat workspace_3.json 
i3-msg "workspace 3; append_layout ~/.i3/workspace_3.json"
tail -n +2 ~/.i3/workspace_N.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.i3/workspace_N.json
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json
cat workspace_3.json 
cat workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.i3/workspace_3.1json"
vim start.sh
chmod +x start.sh 
./start.sh 
vim start.sh
./start.sh 
lo
vim workspace_3.1.json 
./start.sh 
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
lo
rm -rf workspace_1.json workspace_2.json workspace_3.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.json"
vim workspace_3..json 
lo 
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
lo
rm -rf workspace_3.1.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
cat workspace_3.json 
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
cat workspace_3.json 
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.json
cat workspace_3.json 
lo
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
cat workspace_3.json 
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json
lo
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
vim workspace_3.1.json
i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.1.json"
sudo pacman -S ttf-font-awesome
lo
echo "i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json" >> start.sh 
echo "tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json" >> start.sh 
cat start.sh 
vim workspace_3.1.json
vim start.sh
vim config 
vim start.sh
cat start.sh
i3-save-tree --workspace 4 > ~/.config/i3/workspace_4.json
tail -n +2 ~/.config/i3/workspace_4.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace-4.json
lo
cat workspace_4.json
cat workspace-4.json
cat start.sh
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
cat workspace_4.json
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
vim workspace-4.json
i3-msg "workspace 4; append_layout ~/.config/i3/workspace-4.json"
lo
i3-msg workspace 4; i3-msg exec firefox
vim config 
cat config 
i3-msg workspace 4; exec code; exec ranger
i3-msg workspace 4; exec ranger; exec code
ranger
i3-msg workspace 4; exec ranger
i3-msg workspace 4; exec i3-sensible-terminal; exec ranger; exec code
i3-msg workspace 4; exec ranger; exec code
i3-msg workspace 4; exec ranger; exec code; workspace 5; exec firefox;
i3-msg workspace 4; exec code; exec urxvt; workspace 5; exec firefox;
i3-msg 'workspace 4; exec code; exec urxvt; workspace 5; exec firefox'
i3-msg workspace 4; exec code; && i3-msg workspace 4; exec firefox'
i3-msg workspace 4; exec code; && i3-msg workspace 4; exec firefox
i3-msg workspace 4; exec code; \&& i3-msg workspace 4; exec firefox
i3-msg workspace 4; exec code; exec firefox
i3-msg 'workspace 4; exec code; exec firefox'
i3-msg 'workspace 4; exec code; exec firefox' && i3-msg 'workspace 5; exec ranger; exec urxvt'
i3-msg 'workspace 4; exec code; exec firefox' && i3-msg 'workspace 5; exec ranger'
sudo pacman -R perl-anyevent-i3 perl-json-xs
cd .config/i3/
vim config 
reboot
sudo pacman -Syyuu && yay -Syu
sudo pacman -S perl-anyevent-i3 perl-json-xs
sudo pacman -Syyuu && yay -Syu
cd .config/i3/
lo
i3-save-tree --workspace 2 > ~/.config/i3/workspace-2.json
vim workspace-4.json
lo
vim workspace-4.json
i3-save-tree --workspace 2 > ~/.config/i3/workspace-2.json
lo
vim workspace-4.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace-3.json
vim workspace-4.json
vim workspace-2.json
lo
vim workspace-3.json
rm -rf workspace-3.json 
i3-msg "workspace 2; append_layout ~/.i3/workspace-2.json"
vim workspace-2.json
i3-msg "workspace 2; append_layout ~/.i3/workspace-2.json"
vim workspace-2.json
vim start.sh
./start.sh 
vim workspace-2.json
i3-msg "workspace 2; append_layout ~/.i3/workspace-2.json"
./start.sh 
lo
mv start.sh start_w2.sh
cp start_w2.sh start_w1.sh 
vim start_w1.sh
vim start_w2.sh
lo
mv workspace-2.json workspace_wq2.json 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
i3-save-tree --workspace 4 > ~/.config/i3/workspace_4.json
lo
mv workspace_wq2.json workspace_2.json 
vim workspace_2.json 
vim workspace_1.json 
cd .config/i3/
./start_w2.sh
cd .config/i3/
cd ~/.config/i3/
lo
rm -rf workspace_1.json 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim workspace_1.json 
lo
vim workspace_3.json 
lo
cp start_w1.sh start_w3.sh 
vim start_w3.sh 
lo
cp start_w1.sh start_w4.sh 
vim start_w4.sh 
vim start_w3.sh 
vim start_w2.sh 
vim start_w1.sh 
./start_w3.sh
vim workspace_3.json 
./start_w4.sh
termite -e ranger
uxrvt -e ranger
uxrvt 
urxvt 
urxvt -e ranger
vim start_w4.sh 
./start_w4.sh
vim start_w4.sh 
./start_w4.sh
vim start_w3.sh 
./start_w3.sh
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
vim workspace_3.json 
vim start_w3.sh 
vim start_w4.sh 
./start_w4.sh
i3-save-tree --workspace 4 > ~/.config/i3/workspace_4.json
vim workspace_4.json
./start_w4.sh
xautolock
lo
cat start_w*.sh
cat start_w*.*
lo
cat start_w1.sh start_w2.sh start_w3.sh start_w4.sh
cat start_w1.sh start_w2.sh
cat start_w1.sh 
cat start_w2.sh 
cat start_w3.sh 
cat start_w4.sh 
cp start_w1.sh start.sh 
vim start.sh
vim start_w3.sh
./start_w3.sh
pkill chromium
./start_w1.sh
reboot
cd ~/.config/i3/
i3-save-tree --workspace 4 > ~/.config/i3/workspace_4.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
i3-save-tree --workspace 2 > ~/.config/i3/workspace_2.json
vim workspace_1.json 
vim start_w1.sh
vim start_w2.sh 
vim workspace_2.json 
vim start_w3.sh 
vim workspace_3.json 
vim start_w4.sh 
vim workspace_4.json 
./start_w4.sh
cd ~/.config/i3/
./start_w2.sh
./start_w3.sh
lo
./start_w1.sh
cd ~/.config/i3/
./start_w4.sh
lo
mv workspace_1.json workspace_1.json.bk
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim workspace_1.json 
cd ~/.config/i3/
vim config 
./start_w1.sh
vim config 
cd ~/.config/i3/
lo
xev -event keyboard
xbindkeys -k
./start_w2.sh
cd ~/.config/i3/
sudo pacman -S numlockx
numlockx on
~/.config/i3/start_w2.sh
~/.config/i3/start_w1.sh
~/.config/i3/start_w4.sh
~/.config/i3/start_w1.sh
cd
cd ~/.config/i3/
lo
vim workspace_1.json 
~/.config/i3/start_w1.sh
~/.config/i3/start_w2.sh
lo ~/.local/share/Trash/files/
lo ~/.local/share/Trash/
lo ~/.local/share/
htop
cd Sources/stream/
ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -c:v ffvhuff screen.mkv
lo
ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -vframes 1 screen.png
lo
$ ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac screen.mp4
ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac screen.mp4
sudo pacman -S blender
sudo pacman -S gimp
sudo pacman -S aftershot
yay aftershot
sudo pacman -Syyuu && yay -Syu
lo
cd .config/i3/
cd
cd .config/i3/
lo
cat start_w1.sh 
lo
ps -ef
htop
xprop
xprop --help
lo /tmp/
import /tmp/latest-screenshot.png
xprop 
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
vim ~/.config/i3/workspace_3.json
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
vim ~/.config/i3/workspace_3.json
sudo pacman -Syyuu && yay -Syu
shutdown now
tmux 
sudo shutdown now
sudo pacman -Syyuu && yay -Syu
sudo pacman -Q
sudo pacman -Qe
sudo pacman -Qet
sudo pacman -R obs-studio
sudo pacman -Qet
asciinema.md
cd Sources/
lo
mkdir my-github
lo stream/
mv stream ../Downloads/
lo
mv .files my-github
sudo pacman -Qqe
sudo pacman -Qdt
lo
cd my-github/
lo
cd .files/
git pull
git status 
git add .
gir commit -am "multiple changes in HWD for i3"
git commit -am "multiple changes in HWD for i3"
git config --global user.email "mudreac@gmail.com"
git config --global user.name "mudrii"
git commit -am "multiple changes in HWD for i3"
git push
lo
yay ## Check arch install files
yay ffmpegt
sudo pacman -S ffmpegthumbnailer
pactree vlc
systemctl status paccache.timer
systemctl enable paccache.timer
sudo systemctl enable paccache.timer
sudo  pacman -Sc
sudo pacman -Syyuu && yay -Syu
sudo pacman -Fy
sudo pacman -Fs image
sudo pacman -Fs images
udo pacman -Fs images
cal
cal --help
cal --color
cal --color=always
cal -w
cal -1
cal -l
cal -3
cd Sources/my-github/
cd Sources/
cd my-github/
git clone https://github.com/mudrii/aws-cli.git
lo
cd aws-cli/
vim Dockerfile 
cd ..
git clone https://github.com/mudrii/gkubectl-cli.git
cd gkubectl-cli/
vim Dockerfile 
cd ..
git clone https://github.com/mudrii/tflint-cli.git
cd tflint-cli/
vim Dockerfile 
cd ..
git clone https://github.com/mudrii/packer-cli.git
cd packer-cli/
vim README.md 
cd ..
git clone https://github.com/mudrii/helm-cli.git
git clone https://github.com/mudrii/gcloud-cli.git
cd gcloud-cli/
vim README.md 
vim Dockerfile 
cd ..
git clone https://github.com/mudrii/gcloud-beta-cli.git
cd gcloud-beta-cli/
vim README.md 
vim Dockerfile 
cd ..
git clone https://github.com/mudrii/terraform-cli.git
lo
git clone https://github.com/mudrii/kubectl-cli.git
cd ..
lo
mkdir my-github-docs
cd my-github-docs/
git clone https://github.com/mudrii/eks_rds_terraform.git
git clone https://github.com/mudrii/akc_sql_terraform.git
git clone https://github.com/mudrii/gke_sql_terraform.git
lo
git clone https://github.com/mudrii/awscli_presentation.git
l
lo
cd ..
lo
cd my-github/
lo
cat /etc/group 
lo
cat /etc/group | grep users
cat /etc/passwd 
docker pull nginx:alpine
docker run -ti --rm nginx:alpine
docker run -ti --rm nginx:alpine sh
docker run -ti --rm nginx:alpine bash
docker run -ti --rm nginx:alpine sh
pwd
cd Sources/docs/
lo
cd prezi/
l
lo
cd devopsdays/
lo
docker build -t mudrii/devopsdays .
docker images
docker run -ti --rm mudrii/devopsdays sh
docker run -p 80:80 mudrii/devopsdays 
docker ps -a
docker rmi 86aa72456bd1
docker rm 86aa72456bd1
docker ps -a
docker images
docker build -t mudrii/devopsdays .
docker run -d --rm -p 80:80 mudrii/devopsdays 
docker ps 
docker stop 1c4c6539825d
docker ps 
docker ps -a
docker run -ti --rm mudrii/devopsdays sh
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays sh
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays sh
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays ls -la
docker run -ti --rm mudrii/devopsdays ls -la Images
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays ls -la
docker run --rm -p 80:80 mudrii/devopsdays 
cd ..
lo
cd test/
wget https://github.com/hakimel/reveal.js/archive/3.7.0.zip &&     wget https://github.com/asciinema/asciinema-player/releases/download/v2.6.1/asciinema-player.css &&     wget https://github.com/asciinema/asciinema-player/releases/download/v2.6.1/asciinema-player.js &&     unzip 3.7.0.zip &&     mv reveal.js-3.7.0 reveal.js &&     rm -rf index.html 3.7.0.zip
lo
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
tmux 
docker run --rm -p 80:80 mudrii/devopsdays 
cd Sources/docs/prezi/
lo
cd test/
lo
cp reveal.js/plugin/markdown/example.md .
lo
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker run -ti --rm mudrii/devopsdays ls -la
lo
docker run -ti --rm mudrii/devopsdays cat index.html
cat example.md 
docker run -ti --rm mudrii/devopsdays ls -la
docker run --rm -p 80:80 mudrii/devopsdays 
docker run -ti --rm mudrii/devopsdays ls -la
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays ls -la
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays ls -la
docker images
docker rmi $(docker images -q)
docker images
docker run -ti --rm mudrii/devopsdays ls -la
lo
docker build -t mudrii/devopsdays .
docker run -ti --rm mudrii/devopsdays ls -la
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
asciinema --help
asciinema rec demo.cast
cd Sources/docs/prezi/test/
lo
lo
tmux 
lo
vim .bashrc 
grep alias .bashrc 
docker run --rm -ti -v "$HOME/.config/asciinema":/root/.config/asciinema asciinema/asciinema bash
docker run --rm -ti -v "$HOME/.config":/root/.config asciinema/asciinema bash
ls -la
docker run --rm -ti -v $HOME:/root asciinema/asciinema bash
yay asciimena
yay ascimena
yay asciinema
sudo pacman -Syyuu && yay -Syu
sudo pacman -S asciinema
vim .bashrc 
docker images
docker rmi cc907b7a9c22 acb1f2d6584a
docker images
asciinema rec demo.cast
tmux a
cd Sources/docs/prezi/test/
ls -la 
ps -ef
asciinema rec demo.cast
ls -la
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker images
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker run --rm -p 80:80 mudrii/devopsdays 
docker build -t mudrii/devopsdays .
docker build -t mudrii/devopsdays . && docker run --rm -p 80:80 mudrii/devopsdays
docker build -t mudrii/devopsdays .
docker build -t mudrii/devopsdays . && docker run --rm -p 80:80 mudrii/devopsdays
cd Sources/my-github/gcloud-beta-cli/
git status 
git commit -am "fixed Docker file"
git push
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
aws --version
lo
chown -R mudrii:users .aws
sudo chown -R mudrii:users .aws
lo
grep alias .bashrc 
docker run --rm -tiv $HOME/.aws:/home/mudrii/.aws -v $(pwd):/aws mudrii/aws-cli sh
grep alias .bashrc 
alias aws='docker run --rm -tiv $HOME/.aws:/home/mudrii/.aws  mudrii/aws-cli aws'
aws --version
sudo pacman -Syyu
yay -Syu
sudo pacman -Syyuu && yay -Syu
vim ~/.bashrc 
lo
mkdir Backup
cd Backup
mkdir sda
cd sda
lo
lo /mnt/
mount /dev/sda2 /mnt
lo /mnt/
cat /etc/fstab 
sudo fstrim -v /
lsblk --discard
sudo systemctl enable fstrim.timer
hdparm -I /dev/sdc
sudo pacman -S hdparm 
hdparm -I /dev/sdc
sudo hdparm -I /dev/sdc
hdparm -I /dev/sda | grep TRIM
sudo hdparm -I /dev/sda | grep TRIM
getconf PAGE_SIZE
cat /proc/sys/vm/swappiness
cat /etc/sysctl.conf
sudo sysctl -w vm.swappiness=1
cat /proc/sys/vm/swappiness
vim /etc/sysctl.d/99-sysctl.conf
suod vim /etc/sysctl.d/99-sysctl.conf
sudo vim /etc/sysctl.d/99-sysctl.conf
cat /etc/sysctl.d/99-sysctl.conf
sudo hdparm -I /dev/sda | grep TRIM
cat /proc/sys/vm/swappiness
sudo pacman -S util-linux
sudo systemctl enable fstrim.service
sudo systemctl status fstrim.service
sudo systemctl start fstrim.service
sudo systemctl enable fstrim.service
tmux 
sudo vim /etc/fstab 
sudo mount /dev/sda2 /mnt/
tmux 
reboot
cat /proc/sys/vm/swappiness
sudo mount /dev/sda2 /mnt/
cd Backup/sda/
rsync -av /mnt/rootvol/home/ .
df -h
sudo pacman -Syyuu && yay -Syu
cat /etc/fstab 
sudo pacman -Syyuu && yay -Syu
yay oniguruma
sudo pacman -Syyuu && yay -Syu
tmux 
cal
cal -3
sudo pacman -Syyuu && yay -Syu
ls -lS
ls -l
lo
lo -lSa
lo
echo $LOGNAME
echo $HISTCONTROL
nano 
less .nanorc 
locate .nanorc
vim .nanorc 
lo /usr/share/nano/
ls -l /usr/share/nano/
ls  /usr/share/nano/
ls -a /usr/share/nano/
ls l /usr/share/nano/
ls -l /usr/share/nano/
ssh 192.168.1.23
ping 192.168.1.23
lo
ping 192.168.1.23
tmux a
ssh 192.168.1.23
lo
mkdir .nano
lo
cd .nano
scp 192.168.1.23:~/.nano .
lo .nano/
scp 192.168.1.23:~/.nano/*.* .
scp 192.168.1.23:~/.nano/* .
lo
cat install.sh 
lo
less nanorc 
less nanorc.nanorc 
lo
nano
cd ..
du .nano
du -h .nano
cp -r .nano Sources/my-github/.files/Hyper-V/
cp -r .nano Sources/my-github/.files/HWD/
lo Sources/my-github/.files/Hyper-V/
lo Sources/my-github/.files/HWD/
lo Sources/my-github/.files/HWD/.nano/
ps -efH
dmesg
ip route show
netstat
yay netstat
sudo pacman -S net-tools
sudo pacman -Ql net-tools
sudo pacman -Ql ip
sudo pacman -Ql ss
sudo pacman -Ql ls
sudo pacman -Ql vlc
sudo pacman -Ql gimp
man ls 
lo
mv -r .nano Backup/
mv -R .nano Backup/
man mv
vim .bash_history 
lo
ln -s .bash_history ..bash_history.lnk
lo
id .bash_history
ls -li .bash_history
ls -li .bash_history.lnk
ls -li 
ls -li ..bash_history.lnk
ln .bash_history .bash_history.lnk
ls -li .bash_history.lnk
lo
lo /etc/profile.d
lo /etc/skel/
ping -c3 google.com
man ifconfig 
echo $MANPATH
echo $MPATH
echo $MANUAL
echo $MANUALPATH
env | grep -i man
bunzip2 w
w
whoo
who
cat /etc/shadow
suodcat /etc/shadow 
sudo cat /etc/shadow 
lo /etc/profile 
cat /etc/profile 
lo /etc/man*.*
printf "hello world"
echo "hello world"
find ./ -name .bashrc
find -name .bashrc
lo
find -name .xsession-errors
find ./ -name .xsession-errors
man cd
man -k fanger
man -k ranger
apropos ranger
netstat -a google.com
netstat -s google.com
man netstat 
lo /usr/bin/
info ls
tracepath google.com
yay google earth
lo
rm -rf ..bash_history.lnk .bash_history.lnk 
lo
cat tfixqq 
less tfixqq 
rm tfixqq 
lo
sudo pacman -Syyuu && yay -Syu
cat .config/i3/workspace_1.json 
mv .config/i3/workspace_1.json .config/i3/workspace_1.json.bak
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim .config/i3/workspace_1.json 
xprop 
yay expac
sudo pacman -S expac
expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 20
pacman -Qtdq
sudo pacman -Qtdq
pacman -Si zoom
sudo pacman -Si zoom
yay zoom
yay -Si zoom
yay -R zoom
sudo pacman -Qtdq
sudo pacman -R qt5-quickcontrols2 qt5-webengine
lo
i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
vim .config/i3/workspace_3.json 
pacman -Qqe
yay pacutils
pacman -Qent
pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
yay pacgraph 
sudo pacman -S pacgraph 
pacgraph 
⇞
pacgraph -c
pacgraph --help
lo
pacgraph --help
pacman -Quq|xargs expac -S -H M '%k\t%n' | sort -sh
pacman -Qq | grep -Ee '-(cvs|svn|git|hg|bzr|darcs)$'
sudo pacman -Qq | grep -Ee '-(cvs|svn|git|hg|bzr|darcs)$'
comm -23 <(pacman -Qqt | sort) <(pacman -Sqg base base-devel | sort)
comm -23 <(pacman -Qeq | sort) <(pacman -Qgq base base-devel | sort)
pacman -Qtdq
sudo pacman -Rns $(pacman -Qtdq)
pacman -Qtdq
sudo pacman -Rns $(pacman -Qtdq)
pacman -Qii | awk '/^MODIFIED/ {print $2}'
pacman -Qii
lsof +c 0 | grep -w DEL | awk '1 { print $1 ": " $NF }' | sort -u
pacman -Qqe
pacgraph --help
pacgraph -c
pacgraph -o
pacgraph --help
pacgraph -e
sudo pacman -Syyuu && yay -Syu
sudo pacman -Syyuu && yay -Syu
pdflatex 
chktex 
lscpu 
lshw 
lscpu | grep -i cpu
lshw | less
sudo pacman -Syyuu && yay -Syu
sudo reflector --verbose --latest 200 --number 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyuu && yay -Syu
sudo reflector --verbose --latest 200 --number 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyuu && yay -Syu
cal -5
cal -c5
cal --5
cal 
cal --help
cal -n 12
cal -n 5
cal --help
cal -n 12
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
yay zoom
sudo pacman -Syyuu && yay -Syu
cal
cal -3
date
cat ~/.config/i3/start_w1.sh
lo ~/.config/i3/
xprop 
lo ~/.config/i3/
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim ~/.config/i3/workspace_1.json 
sudo pacman -Syyuu && yay -Syu
tmux 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
lo ~/.config/i3/
cd ~/.config/i3/
vim start_w1.sh 
cat start_w2.sh 
vim start_w1.sh 
sudo pacman -Syyuu && yay -Syu
yay smartmontools
sudo pacman -S smartmontools
sudo smartctl -i /dev/sda
sudo smartctl -i /dev/sdc
lsblk
sudo smartctl -i /dev/sda
sudo smartctl -P show /dev/sda
sudo smartctl -P show /dev/sdb
sudo smartctl -i /dev/sdb
sudo smartctl -i /dev/sda
sudo smartctl -i -a /dev/sda
sudo smartctl -t short /dev/sda
sudo sh -c 'sleep 120 && smartctl -l selftest /dev/sda'
smartctl -X
smartctl -X /dev/sda
sudo smartctl -X /dev/sda
sudo smartctl -i -a /dev/sda
sudo smartctl -i -a /dev/sdb
sudo smartctl -i -a /dev/sdc
sudo smartctl -i -a /dev/sdb
sudo smartctl -i -a /dev/sda
sudo smartctl -t short /dev/sdb
sudo sh -c 'sleep 120 && smartctl -l selftest /dev/sdb'
smartctl -l selftest /dev/sdb
sudo smartctl -l selftest /dev/sdb
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
sudo pacman -Syyuu && yay -Syu
curl ipinfo.io/ip 
expr 2 + 2
expr 2 + 2 \* 4
expr 2 + 2 * 4
expr 2 + 2 \* 4
expr 2 + 2 \* 2
expr \( 2 + 2 \) \* 4
set -e
expr 1 + 5
echo $?
vim test.sh
sh test.sh 
rm doodles.sh
echo $?
vim test.sh
sh test.sh 
sudo pacman -Syyuu && yay -Syu
kubectl explane
kubectl --version
docker ps -a
docker images
docker rmi $(docker images -q)
docker images
kubectl --version
docker images
aliases
alias 
kubect
pwd
whoami
ls -la /
ls -la /usr/share/
ls -la /root/
sudo ls -la /root/
ls -la /usr/
ls -la /usr/local/
ls -la /usr/local/share/
ls -la /usr/local/bin/
ls -la /usr/bin/
find / -type f -name kubectl
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli sh -c export PATH=$PATH:/app/bin; sh
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli sh 
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl explaine
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl explain
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl explain .pod
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl --version
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl -version
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl -v
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl get po
vim . ~/.bashrc 
. ~/.bashrc 
kubectl -v
kubectl version
kubectl explain
kubectl explain help
kubectl explain --help
kubectl api-resources
echo $PATH
ls -la
ls -la /usr/local/bin/
ls -la
echo $PATH
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli sh -c export PATH=$PATH:/app/bin; sh
docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli sh 
sudo pacman -Syyuu && yay -Syu
kubectl explain -h
sudo pacman -Syyuu && yay -Syu
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
uname -a
ps -ef
sudo pacman -Syyuu && yay -Syu
sudo pacman -S obs-studio
sudo pacman -Syyuu && yay -Syu
clear && bash "/home/mudrii/.vscode/extensions/ms-vsliveshare.vsliveshare-0.3.735/out/deps/linux-prereqs.sh" && exit 0
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
cat .config/i3/start_w1.sh 
lo ~/.config/i3/
cd ~/.config/i3/
lo
cat start_w1.sh 
vim start_w1.sh
cat start_w1.sh 
lo
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1_or.json
lo
vim workspace_1_or.json
vim workspace_1.json
vim workspace_1_or.json
mv workspace_1.json workspace_1.json.bk 
mv workspace_1_or.json workspace_1.json
lo
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
cd Sources/
lo
git clone https://mudrii@bitbucket.org/codingentropy/hej.git
docker pull node:8.12-alpine
cd Backup/
lo
cd sda/mudrii/
lo
cd IdeaProjects/
lo
cd meran/
lo
cat Dockerfile 
cd Sources/hej/
lo
cd client/
lo
docker build -t mudrii:client .
docker images
docker run -d -p 80:3000 mudrii:client
docker ps -a
docker ps
docker ps -a
docker rm 1f04810e4c1e
docker run -d -p 3000:3000 mudrii:client
docker ps -a
docker ps
docker logs 2d7e83bc2eba
docker build -t mudrii:client .
docker run -d -p 3000:3000 mudrii:client
docker ps
lo
cd ..
cd server/
docker build -t mudrii:server .
cat docker-compose.yml 
docker images
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=tangent90 -d -p 3306:3306 mariadb
docker images
docker ps
docker run -d -p 9090:9090 mudrii:server
docker ps
docker ps -a
docker rm 2d7e83bc2eba c80f193557f1
docker ps -a
docker images
docker rmi ba05e9da83c8 762541dfba2d
docker images
docker run -d -p 9090:9090 mudrii:server
docker ps
docker ps a
docker ps -a
docker logs 087ff11521d4
netstat -tunap
docke rimages
dockee rimages
docker rimages
docker images
docke rps -a
docker ps -a
docker stop 81cff1ed7df2
docker start 81cff1ed7df2
docker ps 
ip
ip 
ip a
docker build -t mudrii:server .
docker ps -a
docker rm 087ff11521d4
docker run -d -p 9090:9090 mudrii:server
docker ps -a
docker logs ff92a73bb444
docker build -t mudrii:server .
docker ps -a
docker rm ff92a73bb444
docker run -d -p 9090:9090 mudrii:server
docker ps -a
docker ps
docker logs 380f7dc413a8
docker logs 56a7c6771465
docker logs 56a7c6771465
docker ps 
docker stop 81cff1ed7df2
docker rm 81cff1ed7df2
docker ps -a
docker stop 56a7c6771465
docker rm 56a7c6771465
docker ps -a
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=tangent90 -e MYSQL_DATABASE=hej -d -p 3306:3306 mariadb
docker build -t mudrii:server .
docker run -d -p 9090:9090 mudrii:server
docker ps
docker ps
docker logs 3106118f93ea
docker logs 380f7dc413a8
I fixed issues with DB and no errors on server side
docker logs 380f7dc413a8
docker logs 56a7c6771465
docker ps
docker logs 3106118f93ea
docker stop 3106118f93ea
docker rm 3106118f93ea
docker build -t mudrii:server .
docker run -d -p 9090:9090 mudrii:server
docker ps
docker ps -a
docker ps -a
docker stop mariadb
docker  mariadbrm
docker rm  mariadbrm
docker ps -a
docker rm  mariadb
docker run --name mariadb -e MYSQL_ROOT_PASSWORD=tangent90 -e MYSQL_DATABASE=hej -d --net=host mariadb
docker ps 
docker ps -a
docker start 575db552c334
docker ps 
docker ps -a
docker logs 575db552c334
docker ps -a 
netstat -tunap
docker ps -a 
docker stop 575db552c334
docker rm  575db552c334
docker run -d --net=host  mudrii:server
docker ps
docker logs a730ba1aaaee
docker stop 380f7dc413a8
docker rm 380f7dc413a8
docker run -d --net=host mudrii:client
docker ps 
docker build -t server .
docker images
docker rmi b52d21607e20 26346c73aa23
docker images
docker ps
curl http://localhost:3000
docker ps
docker push mudrii:server
docker push mudrii/server
docker login
docker push mudrii:server
docker push mudrii/server
docker images
docker images
docker tag mudrii:server mudrii/server
docker tag mudrii:client mudrii/client
docker images
docker push mudrii/server
docker push mudrii/client
docker ps 
docker stop a730ba1aaaee
docker rm a730ba1aaaee
docker build -t server .
docker run -d --net=host  mudrii:server
docker ps -a
docker logs ced1f74795ed
docker ps
docker stop clint 
docker stop client 
docker stop ced1f74795ed 8906b8c71577
docker rm ced1f74795ed 8906b8c71577
docker build -t server .
cd ../client/
docker build -t client .
docker images
docker run -d --net=host  server
docker run -d --net=host  client
docker ps
docker logs server
docker ps
docker ps -a
docker logs fac499e47131
docker logs d7f66a889608
docker ps -a
docker logs fac499e47131
docker start fac499e47131
docker ps -a
docker logs fac499e47131
docker ps -a
docker logs fac499e47131
docker rm fac499e47131
cd ../server/
docker build -t server .
docker run -d --net=host  server
docker ps 
docker ps -a
docker logs 42fa60347a21
docker ps -a
docker restart 70d40618af78
docker ps -a
docker start 42fa60347a21
docker ps -a
docker ps 
docker rm 42fa60347a21
docker ps -a
docker build -t server .
docker run -d --net=host  server
docker ps
sudo pacman -Syyuu && yay -Syu
cd .config/i3/
lo
cat workspace_1.json 
pwd
lo
cat workspace_1.json.bk 
rm -rf workspace_1.json.bk 
mv workspace_1.json workspace_1.json.bk
lo
cat start_w1.sh 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim workspace_1.json 
cat workspace_1.json.bk 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim workspace_1.json 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim workspace_1.json 
cd .config/i3/
pwd
lo
cat workspace_1.json.bk 
less workspace_1.json.bk 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim start_w1.sh 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
vim start_w1.sh 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
sudo pacman -Syyuu && yay -Syu
tmux 
vim  workspace_1.json.bk 
sudo pacman -Syyuu && yay -Syu
pwd
cd prezi/revealjs-docker/
docker built -t mudrii/revealjs
docker built -t mudrii/revealjs .
docker build -t mudrii/revealjs .
docker push mudrii/revealjs
docker images
cd ../test/
docker build -t mudrii/test .
docker run -d --rm -p 80:80 mudrii/test
docker ps 
doocker stop 1ec606c40c77
docker stop 1ec606c40c77
docker ps -a
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker ps
docker stop reveal
docker run -ti --rm mudrii/test sh
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker ps
cd ../devopsdays_new/
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker ps
docker stop reveal
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker stop reveal
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker stop reveal
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker stop reveal
docker build -t mudrii/test .
docker run --name reveal -d --rm -p 80:80 mudrii/test
docker stop reveal && docker build -t mudrii/test . && docker run --name reveal -d --rm -p 80:80 mudrii/test
docker build -t mudrii/devops_data .
docker push mudrii/devops_data
lo
dockeer images
docker images
docker images | grep none
docker images -q | grep none
docker images -q 
docker images -q  community is up to date
:: Starting full system upgrade...
:: Searching databases for updates...
:: Searching AUR for updates...
mudrii@arch ~ $ sudo pacman -Syyuu && yay -Syu
:: Synchronizing package databases...
:: Starting full system upgrade...
:: Synchronizing package databases...
:: Starting full system upgrade...
:: Searching databases for updates...
:: Searching AUR for updates...
mudrii@arch ~ $ lo
total 356K
drwx------ 21 mudrii users 4.0K Oct 24 20:37 .
drwxr-xr-x  3 root   root  4.0K Sep  5 23:05 ..
drwxr-xr-x  2 mudrii users 4.0K Sep 10 07:57 .aws
drwxr-xr-x  3 mudrii users 4.0K Sep 10 15:22 Backup
drwxr-xr-x 14 mudrii users 4.0K Sep 28 21:43 .cache
drwxr-xr-x 23 mudrii users 4.0K Oct  7 13:27 .config
drwx------  2 mudrii users 4.0K Oct 22 15:48 .docker
drwx------ 11 mudrii users 4.0K Oct 24 23:17 Downloads
drwx------  3 mudrii users 4.0K Sep  6 00:30 .local
drwx------  5 mudrii users 4.0K Sep  7 13:21 .mozilla
drwxr-xr-x  2 mudrii users 4.0K Sep 11 12:50 .nano
drwx------  4 mudrii users 4.0K Sep  8 16:53 .nv
drwx------  3 mudrii users 4.0K Sep  6 00:21 .pki
drwxr-xr-x  7 mudrii users 4.0K Oct 21 15:01 Sources
drwx------  2 mudrii users 4.0K Sep  6 00:29 .ssh
drwxr-xr-x  2 mudrii users 4.0K Sep  6 19:40 .swt
drwxr-xr-x  3 mudrii users 4.0K Oct  7 13:28 .vim
drwxr-xr-x  3 mudrii users 4.0K Sep  6 00:21 .vscode
drwx------  2 mudrii users 4.0K Sep  9 18:45 .w3m
drwxr-xr-x  5 mudrii users 4.0K Sep  6 19:40 .xmind
drwxr-xr-x  6 mudrii users 4.0K Sep 12 09:56 .zoom
-rw-------  1 mudrii users   83 Sep 20 13:34 .ash_history
-rw-------  1 mudrii users  39K Oct 25 00:35 .bash_history
-rw-r--r--  1 mudrii users   21 Jun  4 16:54 .bash_logout
-rw-r--r--  1 mudrii users   57 Jun  4 16:54 .bash_profile
-rw-r--r--  1 mudrii users 5.3K Sep 22 21:14 .bashrc
-rw-r--r--  1 mudrii users 4.1K Sep  6 00:15 .dircolors
-rw-r--r--  1 mudrii users   21 Sep  6 00:18 .dmrc
-rw-------  1 mudrii users   16 Sep  7 10:35 .esd_auth
-rw-r--r--  1 mudrii users  68K Sep  6 00:15 .git-completion.bash
-rw-r--r--  1 mudrii users   49 Sep  9 14:49 .gitconfig
-rw-r--r--  1 mudrii users  16K Sep  6 00:15 .git-prompt.sh
-rw-r--r--  1 mudrii users  548 Sep  6 00:15 .inputrc
-rw-------  1 mudrii users   37 Sep 11 17:10 .lesshst
-rw-r--r--  1 mudrii users 2.6K Sep 11 12:38 .nanorc
-rw-r--r--  1 mudrii users 2.0K Sep 10 18:11 .nvidia-settings-rc
-rw-r--r--  1 mudrii users  141 Sep 20 10:51 test.sh
-rw-r--r--  1 mudrii users 2.1K Sep  6 00:15 .tmux.conf
-rw-------  1 mudrii users  20K Oct 24 01:31 .viminfo
-rw-r--r--  1 mudrii users 5.9K Sep  7 16:02 .vimrc
-rw-r--r--  1 mudrii users  209 Sep  9 17:50 .wget-hsts
-rw-------  1 mudrii users   49 Oct 24 20:37 .Xauthority
-rw-r--r--  1 mudrii users  753 Sep  6 00:15 .xinitrc
-rw-r--r--  1 mudrii users 3.2K Sep  6 00:15 .Xresources
-rw-------  1 mudrii users 1.9K Oct 24 23:51 .xsession-errors
-rw-------  1 mudrii users  27K Oct 24 01:31 .xsession-errors.old
mudrii@arch ~ $ dockeer images
-bash: dockeer: command not found
mudrii@arch ~ $ docker images
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
mudrii/devops_data   latest              6264e29e42d1        6 minutes ago       22.6MB
mudrii/test          latest              6264e29e42d1        6 minutes ago       22.6MB
<none>               <none>              6ad43e822c7e        7 minutes ago       22.6MB
<none>               <none>              ad9f8d428684        8 minutes ago       22.6MB
<none>               <none>              d383b3d43d1a        15 minutes ago      22.6MB
<none>               <none>              7d25b9a0b737        17 minutes ago      22.6MB
<none>               <none>              d5fbeb1926cd        27 minutes ago      22.6MB
<none>               <none>              a2b7bc21bf0c        28 minutes ago      22.6MB
<none>               <none>              784ef44306b0        30 minutes ago      22.6MB
<none>               <none>              98bd2a693426        About an hour ago   21.6MB
<none>               <none>              7549874b97e6        About an hour ago   21.6MB
<none>               <none>              dedf816a1e0b        About an hour ago   17.8MB
mudrii/revealjs      latest              6d83ae43a9d2        About an hour ago   21.6MB
server               latest              d0f5d144b028        2 days ago          72.8MB
<none>               <none>              bd4283ed7a29        2 days ago          72.8MB
client               latest              d1c07588fb6c        2 days ago          330MB
docker images -f "dangling=true" -q
docker images -f "dangling=true" 
docker rmi $(docker images -f "dangling=true" -q)
docker images
dockr push mudrii/devops_data
docker push mudrii/devops_data
docker images -f
docker images -f "dangling=false"
docker images -f "dangling=true"
docker stop reveal && docker build -t mudrii/test . && docker run --name reveal -d --rm -p 80:80 mudrii/test
docker ps
docker ps -a
docker purge 
docker purge --help
docker containers purge 
docker container purge 
docker container prune 
docker ps -a
docker images
docker images prune 
docker images
docker images --help
docker prune images
docker prune 
docker prune --help
docker images --help
docker image prune 
docker ps -a
docker image prune 
docker image 
docker images
docker image prune 
docker ps
docker stop reveal && docker build -t mudrii/test . && docker run --name reveal -d --rm -p 80:80 mudrii/test
docker ps
sudo pacman -Syyuu && yay -Syu
lo
cd prezi/devopsdays_new/
lo
docker ps
docker stop reveal && docker build -t mudrii/test . && docker run --name reveal -d --rm -p 80:80 mudrii/test
docker build -t mudrii/devops_data .
docker push mudrii/devops_data
tmux 
cat ~/.bashrc
sudo pacman -Syyuu && yay -Syu
sudo pacman -S screenfetch
sudo pacman -Syyuu && yay -Syu
docker pull mucrii/gke_demo
docker pull mucrii/gke-demo
docker pull mudrii/gke-demo
docker pull mudrii/gke_demo
docker tag mudrii/gke_demo mudrii/gke_dem
docker images
docker push mudrii/gke_dem
sudo pacman -Syyuu && yay -Syu
cal
cal -3
lo
cd Downloads/
lo
sudo pacman -Syyuu && yay -Syu
uname -a
sudo pacman -Syyuu && yay -Syu
ip a
ping 192.168.1.1
ping 192.168.0.1
ip a
date
ping 192.168.1.1
ping 192.168.1.2
ping 192.168.1.1
ping yahoo.com
ping google.com
ip a
ping 192.168.1.1
cat /etc/sysctl.d/99-sysctl.conf
sudo su -
ping 192.168.1.1
ping google.com
tmux 
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
tmux 
ping google.com
sudo pacman -Syyuu && yay -Syu
reboot
ping google.com
ip a
ping google.com
ping -c 10 google.com
ping 192.168.1.1
ip a
cat /etc/sysctl.d/99-sysctl.conf
cat /etc/systemd/network/20-wired.network
cat /etc/resolv.conf 
cat /etc/systemd/resolved.conf
systemctl status systemd-resolved
sudo systemctl restart systemd-resolved
cat /etc/systemd/resolved.conf
cat /etc/resolv.conf 
lo /etc/resolv.conf 
cat /run/systemd/resolve/stub-resolv.con
cat /run/systemd/resolve/stub-resolv.conf 
sudo vim /etc/systemd/network/20-wired.network
sudo systemctl restart systemd-networkd
sudo systemctl stop systemd-resolved
cat /etc/resolv.conf 
sudo systemctl start systemd-resolved
cat /etc/resolv.conf 
sudo systemctl stop systemd-resolved
cat /etc/resolv.conf 
sudo vim /etc/resolv.conf 
cat /etc/resolv.conf 
sudo systemctl restart systemd-networkd
ip a
sudo vim /etc/systemd/network/20-wired.network
ping 192.168.1.1
tmux 
reboot
ping 192.168.1.1
cat /etc/resolv.conf 
sudo vim /etc/systemd/network/20-wired.network
sudo systemctl restart systemd-networkd
ping 192.168.1.1
ping -c 10 google.com
ping 192.168.1.1
ping -c 10 192.168.1.1
ping 192.168.1.1
ping -c 10 192.168.1.1
sudo systemctl restart systemd-networkd
ping -c 10 192.168.1.1
ping -c 10 google.com
ping -c 10 192.168.1.1
for in 10 do ping -c 10 192.168.1.1 done
ping -c 10 192.168.1.1
for i in 10; do ping -c 10 192.168; .1.1; done
for i in 10; do ping -c 10 192.168.1.1; done
for in 10 do ping -c 10 192.168.1.1 done
for in 10; do ping -c 10 192.168.1.1; done
for i in 10; do ping -c $i 192.168.1.1; done
for i in 20; do ping -c $i 192.168.1.1; done
for i in 20; do ping -c $i 1.1.1.1; done
for i in 20; do ping -c $i 192.168.1.1 ; ping -c $i 1.1.1.1; done
cat /etc/systemd/network/20-wired.network
for i in 20; do ping -c $i 192.168.1.1 ; ping -c $i 1.1.1.1; done
sudo pacman -Syyuu && yay -Syu
for i in 20; do ping -c $i 192.168.1.1 ; ping -c $i 1.1.1.1; done
sudo pacman -Syyuu && yay -Syu
for i in 20; do ping -c $i 192.168.1.1 ; ping -c $i 1.1.1.1; done
sudo pacman -Syyuu && yay -Syu
cd prezi/devopsdays_new/
lo
docker build -t mudrii/devops_forum .
docker ps
docker ps -a
docker images
docker run --rm -p 80:80 mudrii/devops_forum
docker run --rm -p 80:80 mudrii/devops_data
docker build -t mudrii/devops_forum .
docker run --rm -p 80:80 mudrii/devops_forum
docker build -t mudrii/devops_forum .
docker run --rm -p 80:80 mudrii/devops_forum
docker build -t mudrii/devops_forum .
sudo pacman -Syyuu && yay -Syu
docker run --rm -p 80:80 mudrii/devops_forum
docker push mudrii/devops_forum
docker images -f "dangling=true"
docker rmi $(docker images -f "dangling=true" -q)
docker images
cd ..
lo
git status
git pull
git push
git status
git add .
git status
git commit -am "add devops"
git push
sudo pacman -Syyuu && yay -Syu
ping -c 10 192.168.1.1
sudo systemctl restart systemd-networkd
sudo pacman -Syyuu && yay -Syu
ip a
ip route show
ping -c 10 192.168.1.1
ip a
routel
sudo pacman -Syyuu && yay -Syu
sudo systemctl restart systemd-networkd
sudo pacman -Syyuu && yay -Syu
tmux 
sudo reboot
sudo systemctl restart systemd-networkd
ping -c 10 192.168.1.1
iptables -L
sudo iptables -L
ip a
cat /etc/systemd/network/20-wired.network
sudo vim /etc/systemd/network/20-wired.network
history
telnet 
nc
sudo pacman -S bind-utils
sudo pacman -S bind-util
dig
sudo systemctl stop systemd-networkd
sudo systemctl status systemd-networkd
ip a
sudo systemctl status dhcpcd
sudo systemctl start dhcpcd
sudo systemctl status dhcpcd
ip a
ping -c 10 192.168.1.1
sudo systemctl status dhcpcd
sudo systemctl status systemd-networkd
sudo systemctl stop systemd-networkd
sudo systemctl status systemd-networkd
sudo systemctl restart dhcpcd
sudo systemctl status systemd-networkd
ping -c 10 192.168.1.1
sudo vim /etc/systemd/network/20-wired.network
ping -c 10 192.168.1.1
ping -c 10 google.com
cat /etc/resolv.conf 
sudo reboot
tmux 
resolvectl status
ping -c 10 google.com
hostnamectl status
systemctl status dhcpcd
systemctl status systemd-resolved
systemctl status systemd-networkd.service 
ping -c 10 google.com
ip a
cat /etc/resolv.conf 
resolvectl status
ping 1.1.1.1
ping 8.8.8.8
ping yahoo.com
loi
lo
lo .config/
lo .config/i3/
lo .config/i3/config 
tmux 
less .config/i3/config
sudo pacman -Syyuu && yay -Syu
tmux 
sudo pacman -Syyuu && yay -Syu
lshw 
lshw --help
lshw -X
lo
lshw -html
lo
lo *.html
lo *.htm
lshw -html > lshw.html
uname -a
uname 
uname --help
uname -r
uname -rv
uname -rp
uname -ri
uname -r
cat /etc/systemd/network/20-wired.network
ip a
ip addr show
ip addr 
ip route show
routef 
routef -l
route show
route s-v
route -v
route 
routel
iptables -L
sudo iptables -L
ping 1.1.1.1
ping 8.8.8.8
ping 1.1.1.1
vim /etc/systemd/resolved.conf
sudo vim /etc/systemd/resolved.conf
cat /etc/resolv.conf 
sudo systemctl restart systemd-resolved
ping google.co
ping google.com
terraform -v
terraform -c
terraform -v
tmux 
sudo pacman -Syyuu && yay -Syu
sudo reboot
sudo pacman -Syyuu && yay -Syu
lo
ls -lah
sudo pacman -Syyuu && yay -Syu
sudo pacman -Syyuu && yay -Syu
htop
sudo pacman -Syyuu && yay -Syu
sudo pacman -S :: Searching AUR for updates...
sudo pacman -S browsh
yay browsh
browsh
jobs
browsh www.google.com
browsh --help
browsh -version
browsh --version
browsh www.google.com
browsh 
docker run -it --rm browsh/browsh
docker run -it --rm browsh/browsh:latest
link google.co
links google.com
yay browsh
yay -R browsh-bin
yay browsh
lo ~/.config/
lo ~/.config/browsh/
rm -rf ~/.config/browsh
browsh 
browsh 
lo ~/.config/browsh/
lo ~/.config/browsh/config.toml 
cat ~/.config/browsh/config.toml 
ccat ~/.config/browsh/config.toml 
less ~/.config/browsh/config.toml 
browsh --firefox.with-gui

browsh 
tmux 
':'';
cd ~/.config/i3/
lo
mv workspace_1.json workspace_1.json.bk2
cat start_w1.sh 
i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
cat workspace_1.json 
vim workspace_1.json
vimdiff workspace_1.json workspace_1.json.bk2 
vim workspace_1.json
cd ~/.config/i3/
lo
rm -rf workspace_1.json 
mv workspace_1.json.bk2 workspace_1.json
lo
vim start_w1.sh 
mkdir test
cd _
lo
lo test/
rm -rf test
lo
hto
htop 
uname -a
sudo pacman -S browsh
sudo pacman -Syyuu && yay -Syu
ip a
cat /etc/systemd/network/20-wired.network
cat /etc/systemd/resolved.conf
cat /etc/hosts
lscpu
lscpu | grep CLU
lscpu | grep CPU
lscpu | grep CPU(s)
lscpu | grep "CPU(s)"
lscpu | grep "CPU(s):"
man grep
lscpu | grep "CPU(s):" | grep -i NUMA
man grep
lscpu | grep "CPU(s):" | grep -v NUMA
sudo pacman -Syyuu && yay -Syu
glibc
sudo pacman -Syyuu && yay -Syu
LC_ALL=C lscpu | grep Virtualization
grep -E --color=auto 'vmx|svm|0xc0f' /proc/cpuinfo
zgrep CONFIG_KVM /proc/config.gz
lsmod | grep kvm
lsmod | grep virtio
zgrep VIRTIO /proc/config.gz
systool -m kvm_intel -v | grep nested
grep -E --color=auto 'vmx|svm' /proc/cpuinfo
sudo pacman -S libvirt 
libvirtd 
sudo pacman -S virt-manager 
virt-manager 
sudo pacman -S qemu 
sudo virt-manager 
sudo systemctl start libverd
sudo systemctl start libver
sudo systemctl start libvirtd.service 
sudo systemctl status libvirtd.service 
sudo virt-manager 
virt-manager 
history | grep pacman
sudo pacman -S gpm 
browsh 
browsh 
gpm -m /dev/input/mice -t help
sudo gpm -m /dev/input/mice -t help
GPM_ARGS="-m /dev/input/mice -t imps2"
browsh 
GPM_ARGS="-m /dev/input/mice -t msc"
sudo systemctl start gpm.service
sudo systemctl status gpm.service
browsh 
tmux a
systemctl enable gpm.service
sudo systemctl enable gpm.service
less ~/.config/browsh/config.toml 
browsh 
tmux
browsh 
browsh --help
browsh
browsh 
vim .tmux.conf 
vim .tmux.conf
browsh 
tmux
browsh 
lo Sources/
lo Sources/my-github/
lo Sources/my-github/.files/
cd Sources/my-github/.files/
git pull
lo
cd HWD/
lo
cd ..
git status
sudo virt-manager 
browsh 
vim .tmux.conf
browsh 
tmux
browsh 
sudo pacman -Syyuu && yay -Syu
lo /dev/hugepages
sudo vim /etc/fstab
sudo umount /dev/hugepages
sudo mount /dev/hugepages
mount | grep huge
grep Hugepagesize /proc/meminfo
grep HugePages /proc/meminfo
cat /etc/libvirt/libvirtd.conf
less /etc/libvirt/libvirtd.conf
virsh -c qemu:///system
sudo virsh -c qemu:///system
sudo virsh -c qemu:///session
virsh -c qemu:///session
virsh -c qemu:///system
ip a
cat /etc/firewalld/firewalld.conf
sudo cat /etc/firewalld/firewalld.conf
sudo pacman -S firewalld ebtables dnsmasq
sudo pacman -S (5/6) Arming ConditionNeedsUpdate...
sudo pacman -S openbsd-netcat
sudo cat /etc/firewalld/firewalld.conf
sudo vim /etc/firewalld/firewalld.conf
virt-manager 
sudo virt-manager 
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
sudo systemctl restart libvirtd
sudo virt-manager 
sudo cat /etc/systemd/resolved.conf
cat /etc/firewalld/firewalld.conf
cal
ping 192.168.122.166
sudo pacman -Syyuu && yay -Syu
df -h
ssh root@192.168.122.166
ssh root@192.168.122.166
sudo virt-manager 
lo ~/.ssh/
ssh-keygen -b 4096
lo ~/.ssh/
cat ~/.ssh/id_rsa.pub 
ssh root@192.168.122.128
lo /var/lib/libvirt/images
lo /var/lib/libvirt/images/nixos/
sudo lo /var/lib/libvirt/images/nixos/
sudo ls -la /var/lib/libvirt/images/nixos/
vim ~/.ssh/known_hosts 
ssh root@192.168.122.168
ssh mudrii@192.168.122.168
vim ~/.ssh/known_hosts 
free
htop
sudo pacman -Syyuu && yay -Syu
tmux 
ssh mudrii@192.168.122.168
ssh-ip akeygen -b 4096
ip a
lo
cd ..
lo
rm -rf .files/
git clone https://github.com/mudrii/.files
lo
cd .files/
lo
sudo pacman -Syyuu && yay -Syu
tmux a
ssh mudrii@192.168.122.168
dmesg
lightdm 
lightdm --test-mode
sudo pacman -Syyuu && yay -Syu
lightdm --test-mode
sudo pacman -S xephyr
reboot
startx
sudo virt-manager 
tmux a
sudo vim /etc/firewalld/firewalld.conf
sudo pacman -S xephyr
sudo pacman -S firewalld ebtables dnsmasq
sudo pacman -S libvirt 
sudo systemctl status firewalld
sudo systemctl restart libvirtd
sudo virt-manager 
sudo systemctl status firewalld
sudo systemctl enable firewalld
sudo systemctl enable libvertd
sudo systemctl enable libvirtd.service 
ip a
sudo systemctl status firewalld
sudo systemctl enable firewalld
sudo systemctl status  libvirtd.service 
sudo pacman -S dmidecode 
sudo systemctl enable libvirtd.service 
sudo systemctl restart  libvirtd.service 
sudo systemctl status  libvirtd.service 
ip a
sudo virsh net-list --all 
sudo virsh net-start default 
ip a
sudo virsh net-autostart default
virsh -c qemu:///system
virsh -c qemu:///session
jobs
cat /etc/libvirt/libvirtd.conf
less /etc/libvirt/libvirtd.conf
sudo pacman -S polkit 
cat /etc/polkit-1/rules.d/50-libvirt.rules
suod cat /etc/polkit-1/rules.d/50-libvirt.rules
sudo cat /etc/polkit-1/rules.d/50-libvirt.rules
sudo ls -la  /etc/polkit-1/rules.d/
sudo cat /etc/polkit-1/rules.d/50-default.rules
sudo vim /etc/polkit-1/rules.d/49-nopasswd_global.rules
ssh mudrii@192.168.122.168
sudo less /etc/polkit-1/rules.d/50-default.rules
ssh mudrii@192.168.122.168
sudo nixos-container root-login awsion
sudo nixos-container root-login gcpdrgn
mkpasswd -m sha-512
ssh mudrii@192.168.122.168
cal
date
less ~/.config/i3/config 
sudo pacman -Syyuu && yay -Syu
sudo pacman -S bash_it
yay -S bash_it
yay -s bash_it
yay -s bashit
yay -S bashit
ssh mudrii@192.168.122.168
lo
ssh mudrii@192.168.122.168
sudo virsh net-list --all 
ssh test@192.168.122.168
dd
sudo pacman -Syyuu && yay -Syu
sudo reflector --verbose --latest 200 --number 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyuu && yay -Syu
tmux
lo
tmux ls
tmux att 0
tmux
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
cd .bash_it/
lo
cd themes/
lo
lo | more
lo bobby/
less  bobby/bobby.theme.bash 
lo
cd ..
lo
lo scripts/
lo
lo aliases/
lo aliases/available/
cat aliases/available/tmux.aliases.bash 
lo
lo completion/
lo completion/available/
cat completion/available/tmux.completion.bash 
less completion/available/tmux.completion.bash 
sudo pacman -Syyuu && yay -Syu
df -h
cal
date
sudo pacman -Syyuu && yay -Syu
yay -s xmind
python --version
yay -s xmind
sudo pacman -Syyuu && yay -Syu
date 
cal
cal --help
cal -m --color
date
cal -m -w --color
sudo pacman -Syyuu && yay -Syu
ssh mudrii@192.168.122.168
tmux att 
ssh mudrii@192.168.122.168
tmux att 
ssh mudrii@192.168.122.168
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
ssh mudrii@192.168.122.168
ssh-add -l
sudo ssh-add -l
ssh mudrii@192.168.122.168
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
cd ..
lo
mv .bash_it/ Sources/
cd Sources/
lo
mkdir github
cd github
lo
git clone git@github.com:linuxacademy/eks-deep-dive-2019.git
git clone https://github.com/linuxacademy/eks-deep-dive-2019.git
git clone https://github.com/Joe-at-LA/python-docs-samples.git
sudo pacman -S mucommander
yay -s mucommander
sudo pacman -Syyuu && yay -Syu
yay -s zoom
cal
lo
cd ..
l
lo
git clone 2
git clone git@github.com:mudrii/my_docs.git
git clone https://github.com/mudrii/my_docs.git
sudo pacman -Syyuu && yay -Syu
mucommander 
tmux
sudo pacman -Syyuu && yay -Syu
lshw 
lshw --help
lshw -short
lshw -X
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
aplay -l && lspci | grep -i audio && ls -l /dev/snd/
sudo pacman -S pacucontrol
sudo pacman -S pavucontrol
pavucontrol 
free -h
sudo pacman -Syyuu && yay -Syu
pwd
lo
git push origin manster
git push origin master
git push origin mastergit pull
git pull
git status
git add .
git status
git commit -am "merge"
git push
ssh mudrii@192.168.122.168
ssh mudrii@192.168.122.168
tmux
ssh mudrii@192.168.122.168
cal
ssh mudrii@192.168.122.168
docker build -t aws-prezi .
lo
cd prezi/AWS\ Meetup/aws_eks/
lo
docker build -t aws-prezi .
docker -ti --rm run -p 80:80 aws-prezi 
docker run -ti --rm -p 80:80 aws-prezi 
docker build -t aws-prezi .
docker run -ti --rm -p 80:80 aws-prezi 
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
ssh mudrii@192.168.122.168
scp mudrii@192.168.122.168:~/sources/1_aks_iam_setup.cast .
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
sudo pacman -Syyuu && yay -Syu
lo
cd Sources/
lo
cd my-github/
lo
git clone https://github.com/mudrii/aws_eks_meetup.git
lo
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
cd aws_eks_meetup/
lo
terraform init
lo
git pull
echo 'access_key = "AKIAIYQ7VZNNP657JH5A"' > terraform.tfvars
cat terraform.tfvars 
terraform init
aws configure
terraform init
vim variables.tf 
terraform plan
terraform apply
cd
cd Downloads/
ssh -i my.pem ec2-user@54.149.107.70
chmod 600 my.pem 
ssh -i my.pem ec2-user@54.149.107.70
ssh -i my.pem ec2-user@34.219.192.97
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
lo
docker build -t aws-prezi . && docker run -ti --rm -p 80:80 aws-prezi 
docker images
docker rmi $(docker images -f "dangling=true" -q)
docker images
docker rmi 248aa040bd69 248aa040bd69
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
docker images
docker ps -a
docker rmi aws-prezi
docker rmi mudrii/aws-prezi
docker rmi server
docker rmi client
docker rmi mudrii
docker rmi mudrii/server
docker rmi mudrii/client
docker rmi mudrii
docker images
docker rmi mudrii:server
docker rmi mudrii:client
docker images
pwd
lo
scp mudrii@192.168.122.168:~/sources/2_aks_create.cast .
lo
rm -rf my.pem 
lo
lo *.cast
scp mudrii@192.168.122.168:/home/mudrii/sources/2_aks_create.cast .
scp mudrii@192.168.122.168:/home/mudrii/.bashrc .
ssh mudrii@192.168.122.168
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
lo
asciinema
asciinema play 2_aks_create.cast 
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
asciinema play 3_eks_connect.cast
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
docker images
docker rmi $(docker images -f "dangling=true" -q)
docker images
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
aws iam list-access-keys --user-name terraform  --query 'AccessKeyMetadata[*].{ID:AccessKeyId}' --output text
AWS_KEY=$(aws iam list-access-keys --user-name terraform  --query 'AccessKeyMetadata[*].{ID:AccessKeyId}' --output text)
echo $AWS_KEY
docker build -t mudrii/aws-prezi . && docker run -ti --rm -p 80:80 mudrii/aws-prezi 
docker build -t mudrii/aws-meetup . && docker run -ti --rm -p 80:80 mudrii/aws-meetup
docker push mudrii/aws-meetup
sudo pacman -Syyuu && yay -Syu
docker build -t mudrii/aws-meetup . && docker run -ti --rm -p 80:80 mudrii/aws-meetup
sudo pacman -Syyuu && yay -Syu
docker push mudrii/aws-meetup
docker build -t mudrii/aws-meetup . && docker run -ti --rm -p 80:80 mudrii/aws-meetup
docker push mudrii/aws-meetup
sudo docker login quay.io
docker push quay.io/mudrii/aws-meetup
docker build -t quay.io/mudrii//aws-meetup . 
docker build -t quay.io/mudrii/aws-meetup . 
docker push quay.io/mudrii/aws-meetup
docker push quay.io/mudrii/aws-meetup
docker push quay.io/mudrii/aws-meetup/aws-meetup
docker images
docker rmi $(docker images -f "dangling=true" -q)
docker images
docker push quay.io/mudrii/aws-meetup:latest
docker login quay.io
docker push quay.io/mudrii/aws-meetup:latest
docker push quay.io/mudrii/aws-meetup
docker pull quay.io/mudrii/aws-meetup
lshw -short
dmesg
dmesg | grep -NV
dmesg | grep -i NV
dmesg | grep -i nvidia
dmesg | grep -i Nvidia
dmesg | grep  Nvidia
dmesg | grep  nvidia
dmesg
lshw -short
sudo nano /etc/modprobe.d/blacklist.conf
lspci | grep -e VGA -e 3D
docker push quay.io/mudrii/aws-meetuplo
cat /usr/lib/modprobe.d/nvidia.conf 
python --version
sudo pacman -Syyuu && yay -Syu
uname -a
lshw -short
lspci | grep -e VGA -e 3D
lspci | grep snd
lspci 
lspci | grep Audio
echo $USER
less ~/.Xresources
more ~/.Xresources
lo
scp -r .vim  mudrii@192.168.122.168:~/
ssh mudrii@192.168.122.168
lo .vim
vim ~/.bashrc 
lo .vim/backups/
less ~/.vimrc 
vim ~/.bashrc 
scp /home/mudrii/.vimrc   mudrii@192.168.122.168:~/
ssh mudrii@192.168.122.168
lo
sudo pacman -Syyuu && yay -Syu
vim ~/.config/i3/config 
sudo pacman -Syyuu && yay -Syu
tmux
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
sudo pacman -Syyuu && yay -Syu
la ~/.ssh/
lo ~/.ssh/
cat ~/.ssh/id_rsa.pub 
sudo pacman -Syyuu && yay -Syu
swapon --show
vim .git/config 
tmux
sudo pacman -Syyuu && yay -Syu
uname -a
sudo pacman -S imagemagick
yay -s imagemagick
yay -s xclip
yay -s imagemagick xclip
sudo pacman -S  imagemagick xclip
yay -s flameshot
yay -s maim
maim
1;2c1;2c1;2c1;2c1;2c1;2c1;2c1;2c
maim -s | xclip -selection clipboard -t image/png
lo
maim -i $(xdotool getactivewindow) ~/mypicture.jpg
sudo maim -i $(xdotool getactivewindow) ~/mypicture.jpg
sudo maim -i $(sudo xdotool getactivewindow) ~/mypicture.jpg
xclip -selection clipboard -t image/png
lo
sudo pacman -S  xorg-xwd
maim -i $(xdotool getactivewindow) ~/mypicture.jpg
maim -s | xclip -selection clipboard -t image/png
lo
yay -s Lightscreen
sudo maim -s | xclip -selection clipboard -t image/png
sudo ls -la /root
lo
sudo pacman -S  gpicview
cd .config/i3/
cd 
cd .local/
lo
mkdir bin
cd bin/
vim screensh
lo
chmod 760 screensh 
lo
scregcp -s /home/mudrii/Sources/
screenfetch -s /home/mudrii/Sources/
./screensh -s /home/mudrii/Sources/
lo ~/Sources/
cd
vim .bashrc 
. ~/.bashrc 
la
screensh
ls Sources/
la
rm 2019-02-24_16-42-58_screenshot.png 
la
⇞kdir Images
m⇞kdir Images
mkdir Images
vim ~/.config/i3/config 
la
⇞lo Images/
⇞la Images/
⇞la 
la
la Images/
screensh 
lo
rm 2019-02-24_16-47-54_screenshot.png
la
lo
la
tmux
vim ~/.config/i3/config 
yay -s xdtoo,
yay -s xdtoo
yay -s xdtool
yay -s xdotool
vim ~/.config/i3/config 
la Images/
sudo pacman -Syyuu && yay -Syu
ps -ef 
ps -ef | grep ranger
yay -R maim slop
lo Images/
la Images/
ls -la
uname -a
ps -ef
`yay -s rifle
yay -s rifle
gpicview 
yay -s xdg-utils
la ~/.local/share/
la ~/.local/share/Trash/
la ~/.local/share/Trash/files/
sudo pacman -Syyuu && yay -Syu
xdg-utils
xdg-open
xdg-open --namual
xdg-open --manual
cd Images/
xdg-open 1.vert.png 
gpicview Images/1.vert.png 
vim ~/.config/ranger/rifle.conf 
vim ~/.config/ranger/rc.conf 
diff
vim .bashrc
vim .vimrc 
viminfo
vim .vimrc 
less ~/.config/i3status/config 
less ~/.config/i3/config 
cd Sources/
la
rm 2019-02-24_16-35-39_screenshot.png 
vim config
less ~/.config/i3/config
lo
less ~/.config/i3/start_w1.sh 
less ~/.config/i3/config
la ~/.config/ranger/
ls -l ~/.config/ranger/
ls -a ~/.config/ranger/
vimdiff config ~/.config/i3/config 
less ~/.config/ranger/rc.conf 
vim ~/.config/ranger/rc.conf 
vim ~/.config/ranger/commands_full.py 
vim ~/.config/ranger/commands.py 
vim ~/.config/ranger/scope.sh 
vim ~/.config/ranger/rifle.conf 
vim ~/.config/ranger/commands.py 
less ~/.config/ranger/commands.py 
less ~/.config/ranger/rc.conf 
sudo pacman -Syyuu && yay -Syu
tmux
sudo pacman -Syyuu && yay -Syu
yay -S postman-bin spotify
sudo pacman -Syyuu && yay -Syu
htop 
uname -a
sudo pacman -Syyuu && yay -Syu
ssh mudrii@192.168.122.168
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
tmux
ssh mudrii@192.168.122.168
sudo reboot
sudo pacman -Syyuu && yay -Syu
tmux
kind
ssh mudrii@192.168.122.168
ssh mudrii@192.168.122.168
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
sudo reboot
yay -S nothvpn
yay -S northvpn
yay -S nordvpn
sudo pacman -Syyuu && yay -Syu
sudo systemctl enable nordvpnsd.service
systemctl --user enable nordvpnud
sudo systemctl start nordvpnsd
systemctl --user start nordvpnud
nordvpn login
nordvpn status
nordvpn connect 
nordvpn disconnect
yay -S tor
sudo pacman -s tor
sudo pacman -S tor
tor
sudo tor
usermod -a -G tor user
newgrp tor
sudo newgrp tor
sudo newgrp tor-browser
sudo pacman -S tor-browser
yay -S tor-browser
gpg --recv-keys 'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290'
yay -S tor-browser
tor-browser 
ssh mudrii@192.168.122.168
tmux
vim .tmux.conf 
tmux
vim .tmux.conf 
less .tmux.conf
tmux
ssh mudrii@192.168.122.168
tmux
vim .tmux.conf 
tmux
tmux -v
tmux -l
tmux --list
tmux -list
tmux -ls
tmux --ls
tmux ls
tmux v
tmux --version
tmux -version
tmux version
tmux v
man tmux
vim .tmux.conf 
tmux 
vim .tmux.conf 
tmux 
vim .tmux.conf 
tmux 
vim .tmux.conf 
tmux 
vim .tmux.conf 
tmux 
ssh mudrii@192.168.122.168
vim .tmux.conf 
la
tmux 
tail tmux-server-20571.log
tail tmux-client-20569.log
sudo pacman -S nix
yay -S nix
vim ~/.tmux.conf 
tmux 
tmux -V 
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
man tmux
tmux
man tmux
ssh mudrii@192.168.122.168
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
cd
ls -la
ps -ef
htop
ssh mudrii@192.168.122.168
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
pwd
la
cd ..
la
man tmux
la
la Sources/
la Sources/my-github/
la Sources/my-github/.files/
cd Sources/my-github/.files/
la
git pull
la
cd HWD_Arch/
la
cp ~/.tmux.conf .
cat .tmux.conf 
git status
git add .
git commit -am "change tmux config for new tmux 2.9"
git status
git push
ssh mudrii@192.168.122.168
cat .tmux.conf 
ssh mudrii@192.168.122.168
tmux
vim ~/.tmux.conf 
tmux
vim ~/.tmux.conf 
tmux
tmux att 
vim ~/.tmux.conf 
tmux 
cut -c3- ~/.tmux.conf 
cut -c3- ~/.tmux.conf | sh -s _toggle_mouse"
cut -c3- ~/.tmux.conf | sh -s _toggle_mouse
vim ~/.tmux.conf 
tmux 
cd Sources/my-github/.files/
cd HWD_Arch/
mv .tmux.conf .tmux.conf.old
cp ~/.tmux.conf .
la
cat .tmux.conf 
vim ~/.tmux.conf 
go get -u sigs.k8s.io/kind 
source /etc/profile.d/nix.sh
source /etc/profile.d/nix-daemon.sh
systemctl enable nix-daemon.socket
systemctl enable --now nix-daemon.socket
nix
nix verify
cat /etc/passwd 
cat /etc/group 
nix
yay -S nyx
yay -R nix
cat /etc/group 
cat /etc/passwd 
nyx
systemctl disable nix-daemon.soc
sudo systemctl disable nix-daemon.soc
nordvpn countries
nordvpn cities India
nordvpn cities Singapore
nordvpn cities United_States
ssh mudrii@192.168.122.168
vim ~/.tmux.conf 
tmux 
la
ps -ef
vim ~/.tmux.conf 
ps -ef
cd Sources/my-github/.files/HWD_Arch/
cp ~/.tmux.conf .
git commit -am "change tmux config for new tmux 2.9"
git diff .tmux.conf
git push
systemctl status tor
sudo systemctl start tor
systemctl status tor
nordvpn connect 
tor-browser 
nordvpn disconnect
nordvpn countries
nordvpn cities South_Korea
nordvpn connect South_Korea Seoul
nordvpn cities Taiwan
nordvpn connect Taiwan Taipei
nordvpn disconnect
nordvpn connect Taiwan Taipei
nordvpn disconnect
nordvpn connect 
nordvpn disconnect
sudo pacman -S opnevpn
sudo pacman -S openvpn
sudo pacman -Syyuu && yay -Syu
nordvpn status
yay -S nordpvn
yay -d nordpvn
yay -s nordpvn
pacman -S  nordpvn
sudo pacman -S  nordpvn
sudo pacman -S nordvpn
pacman -S nordpvn
yay -S nordpvn
yay -s nordpvn
yay -s nordvpn
nordselect 
nordvpn status
yay -s nordselect
yay -R nordselect
yay -s rust
sudo pacman -Syyuu && yay -Syu
sudo pacman -R rust
yay -s rust
kind
kind
la
la go/
la go/bin/
vim .bashrc 
kind 
kind list
kind get clusters
sudo pacman -Syyuu && yay -Syu
htop
sudo pacman -Syyuu && yay -Syu
nordvpn status
nordvpn connect 
nordvpn disconnect
nordvpn connect 
nordvpn disconnect
nordvpn connect 
nordvpn disconnect
ssh mudrii@192.168.122.168
sudo pacman -Syyuu && yay -Syu
yay -Syu
cat /etc/resolv.conf 
ping lookup aur.archlinux.org
ping aur.archlinux.org
la /etc/services 
la /etc/sysctl.d/
systemctl status systemd-resolved
cat /usr/lib/systemd/system/systemd-resolved.service
less /usr/lib/systemd/system/systemd-resolved.service
cat /etc/systemd/resolved.conf 
sudo systemctl restart systemd-resolved
systemctl status systemd-resolved
sudo pacman -Syyuu && yay -Syu
yay -Syu
ping aur.archlinux.org
ping archlinux.org
sudo systemctl restart systemd-networkd
ping archlinux.org
ping google.com
ip a
sudo systemctl restart systemd-networkd
sudo systemctl status systemd-networkd
sudo systemctl restart systemd-resolved
ping google.com
vim /etc/systemd/resolved.conf 
sudo /etc/systemd/resolved.conf
sudo vim /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved
ping google.com
ip a
ping 192.168.1.1
ping google.com
tmux 
sudo pacman -Syyuu && yay -Syu
nordvpn connect 
ssh mudrii@192.168.122.168
nordvpn status
nordvpn disconnect
sudo pacman -Syyuu && yay -Syu
ping google.com
sudo systemctl restart systemd-resolved
sudo systemctl restart systemd-networkd
ip ia
ip a
sudo systemctl restart systemd-networkd
sudo systemctl stop systemd-networkd
sudo systemctl start systemd-networkd
journalctl -xe
sudo systemctl status systemd-networkd
sudo systemctl status systemd-resolvd
sudo systemctl status systemd-resolved.service 
tmux 
ip a
sudo pacman -Syyuu && yay -Syu
sudo pacman -S fish
yay -s fish
yay -s ohmy-fish
fish
fish
cat .bashrc 
source ~/.bashrc
la /usr/lib/python3.7/site-packages/powerline/bindings/tmux/powerline.conf
vim .tmux.conf 
yay -s powerline
vim .vimrc 
fish
sudo pacman -S awesome-terminal-fonts powerline powerline-fonts 
yay -s powerline
yay -s powerline font
tmux 
la
fish
cat .bashrc 
ls -lha --color=auto --group-directories-first
fish
vim .bashrc 
source .bashrc 
vim .tmux.conf 
tmux 
xfontsel
yay -s xfontsel
xfontsel
fish
i3-msg reload
i3-msg restart
la
xfontsel
fc-match
xrdb -merge  ~/.Xresources
fc-match
fc-match --help
fc-match -all
fc-match -a
fish
fc-match -h
fc-match -b
man fc-match 
fc-match "DejaVu Sans Mono for Powerline" 
fc-list G "DejaVu Sans Mono"
fc-list G "DejaVu Sans"
fc-list G "DejaVu"
urxvt --help 2>&1 | grep options:
set -g default-terminal "screen-256color"
less .tmux.conf 
fish
xrdb -merge -I$HOME ~/.Xresources && urxvt
fish
la
less .Xresources 
la /etc/fonts/conf.d
xrdb -merge -I$HOME ~/.Xresources && urxvt
fish
xrdb -merge -I$HOME ~/.Xresources && urxvt
la
xrdb -merge -I$HOME ~/.Xresources && urxvt
fc-match "FuraCode Nerd Font Mono"
fish
xrdb -merge -I$HOME ~/.Xresources && urxvt
fish
xrdb -merge -I$HOME ~/.Xresources && urxvt
la
kind get clusters
kind list
kind list clusters
kind build cluster
kind -h
kind create cluster
kind --version
go get -u sigs.k8s.io/kind 
kind --version
kind -h
kind get clusters
kind delete cluster kind
kind delete cluster 
fish
./test-font.sh 
yay -S S ttf-devicons vim-devicons 
yay -S ttf-devicons vim-devicons 
sudo pacman -S nerd-fonts-complete
yay -s nerd-fonts-complete
yay -s devicons
./test-font.sh 
xrdb -merge -I$HOME ~/.Xresources && urxvt
kind create cluster
kind delete cluster 
xrdb -merge -I$HOME ~/.Xresources && urxvt
fc-list G "DejaVu"
fc-list "DejaVu"
fc-list 
fc-match "FuraCode Nerd Font Mono"
fc-match -a
fc-match -b
fc-match --help
fc-match -av
fish
xrdb -merge -I$HOME ~/.Xresources && urxvt
fish
omf destroy
fish
fish
sudo su -
echo 0$
echo $0
vim function fish_prompt
vim ~/.config/fish/functions/fish_prompt.fish
la ~/.config/fish/functions/
cat /home/mudrii/.local/share/omf/themes/bobthefish/fish_prompt.fish
rm -rf ~/.config/fish/functions/fish_prompt.fish 
vim ~/.config/fish/functions/fish_prompt.fish
fish
vim $(fzf)
fzf --height 40%
vim $(fzf --height 40%)
vim **
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fzf
la
fish
fish
vim .tmux.conf 
tmux 
vim .tmux.conf 
tmux 
vim .tmux.conf 
fish
tmux 
fish
sudo pacman -Syyuu && yay -Syu
tmux 
fish
tmux 
fish
vim .bashrc 
