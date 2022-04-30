sudo apt updade
sudo apt upgrade
sudo apt install freerdp2-x11 libavcodec-dev libasound2-dev libpulse-dev libxv-dev git xdotool xserver-xorg x11-xserver-utils xinit openbox cups hplip hplip-gui cockpit cockpit-pcp
cd /etc/
sudo git clone https://github.com/IELSMalta/ielskiosk.git
adduser ###
adduser #########
usermod -aG sudo ###
usermod -aG plugdev ###
echo 'SUBSYSTEM=="usb", MODE="0660", GROUP="plugdev"' > /etc/udev/rules.d/00-usb-permissions.rules 
udevadm control --reload-rules
sudo mv ./kiosk.service /lib/systemd/system/kiosk.service
sudo systemctl enable kiosk.service
sudo systemctl start kiosk.service
###   AUTOLOGIN ### USER   ###
sudo systemctl edit getty@tty1.service
#ADD#
[Service]

ExecStart=

ExecStart=-/sbin/agetty --noissue --autologin ### %I $TERM

Type=idle
#END#
nano .bash_profile
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx --
/etc/default/grub


sudo update-grub2
GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=3 vga=current rd.systemd.show_status=auto rd.udev.log-priority=3 vt.global_cursor_default=0"

/etc/systemd/logind.conf ==> HandlePowerKey=ignore

https://michlstechblog.info/blog/debian-shutdown-when-pressing-power-button/

BUG HUNTING AND FIX

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
https://shallowsky.com/blog/linux/prevent-sleep-systemd.html
https://askubuntu.com/questions/1127464/hdmi-disconnected-after-long-suspend
