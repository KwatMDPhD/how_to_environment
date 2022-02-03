## Burn Ubuntu onto a USB using Etcher

## Set BIOS

Disable secure boot

## Boot from the USB and install

Install third-party software for graphics and Wi-Fi hardware and additional media formats

Erase disk and install Ubuntu

## Get software

```bash
sudo apt update &&

sudo apt full-upgrade --yes &&

sudo apt install --yes vim screen tree rename gnome-tweaks exfat-fuse exfat-utils testdisk network-manager-openconnect-gnome &&

sudo ubuntu-drivers autoinstall &&

sudo apt full-upgrade --yes &&

sudo apt autoremove --yes
```

## Set the default text editor to be Vim

```bash
sudo update-alternatives --config editor
```

## Set Settings

## Clear dock

## Set Files

## Fix suspend loop

```bash
sudo vim /etc/default/grub
```

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash button.lid_init_state=open"

```bash
sudo update-grub
```
