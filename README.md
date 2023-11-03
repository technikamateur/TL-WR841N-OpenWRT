# TL-WR841N-OpenWRT
The builds in this repository are only for v9 of the TL-WR841N(D) with 16MB SPI/64MB RAM. Builds for other versions will possibly be added.

## Prerequisites
- You have upgraded your wr841n with 64MB RAM and 16MB SPI with a guide [like this](https://wiki.freifunk.net/TP-Link_WR841ND/Flash_und_RAM_erweitern_bis_v12)
- You have installed the [latest official version](https://openwrt.org/toh/tp-link/tl-wr841nd) 18.06 of OpenWRT

## Installation
- Download the latest release from [Releases](https://github.com/technikamateur/TP-Link-WR841N-OpenWRT/releases)
- Its recommend to verify the download with the checksum
- Go to your router web interface and upload the sysupgrade binary
- **Warning! Settings can NOT be kept because of the switch from *ar71xx* to *ath79*. Keeping the settings will lead to a boot loop and a recovery method will be necessary**

## Information
These packages have been compiled to save you some time. They were compiled with default settings and the luci web interface. Please note that the binaries have been tested, but there is **no warranty**. You are installing these packages at your own risk!

OpenWRT License can be found [here](https://github.com/openwrt/openwrt/blob/main/COPYING).
