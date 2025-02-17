# OpenWRT Builds for TP-Link TL-WR841N/ND (16MB/64MB) 🚀

This repository contains pre-built OpenWRT images for the TP-Link TL-WR841N/ND router with 16MB SPI flash and 64MB RAM.

## Supported Hardware Versions

This project supports the following hardware versions of the TL-WR841N/ND:

* v9
* v10
* v11
* v12

## Installation

### Prerequisites

Before installing these builds, ensure you have:

1. **Upgraded your WR841N/ND's RAM and Flash:** You should have upgraded your router to 64MB RAM and 16MB SPI flash. A guide like [this one](https://wiki.freifunk.net/TP-Link_WR841ND/Flash_und_RAM_erweitern_bis_v12) can help.
2. **Installed a Base OpenWRT Release:** You must have either the [latest official OpenWRT 18.06 release](https://openwrt.org/toh/tp-link/tl-wr841nd) **OR** a previous OpenWRT release from this repository already installed.

### Installation Steps

1. **Download the Latest Release:** Download the latest pre-built OpenWRT image from the [Releases](https://github.com/technikamateur/TP-Link-WR841N-OpenWRT/releases) page
2. **Verify the Checksum (Recommended):**  It's highly recommended to verify the integrity of the downloaded image using the provided checksum
3. **Flash the Image:** Access your router's web interface (LuCI) and upload the downloaded sysupgrade binary
4. **Important Notice for 18.06 Users:**  If you're upgrading from the official OpenWRT 18.06 release, **you CANNOT keep your settings.**  This is due to a change in the target architecture from *ar71xx* to *ath79*. Attempting to keep settings will result in a boot loop, requiring a recovery process. Back up your settings if needed, but be prepared to configure from scratch.

## Key Features & Information

These OpenWRT images are compiled to save you time and effort. The build configuration can be found in the `diffconfig` file. Basically it's the following:

* OpenWRT *ath79/tiny* target
* LuCI Web Interface
* Support for `ed25519` SSH keys
* Pre-configured with [Quad9](https://quad9.net/) DNS servers for enhanced privacy and security

**Disclaimer:** While these binaries are tested, they are provided **without any warranty**. Installation and use are at your own risk.

The OpenWRT license can be found [here](https://github.com/openwrt/openwrt/blob/main/COPYING).

## Changing the DNS Server

To change the default DNS server:

1. **Static DNS:** Navigate to `Network` -> `DHCP and DNS` -> `Forwards` and enter your preferred DNS server addresses.
2. **Use WAN DNS:** To use the DNS server provided by your ISP via WAN, go to `Network` -> `DHCP and DNS` -> `Forwards` and remove all existing DNS entries. Then, go to `Resolv and Hosts Files` and uncheck the `Ignore resolv file` option.

## WireGuard Performance Benchmarks

For users interested in running WireGuard on this router, here are some benchmark results using the excellent [wg-bench script](https://github.com/cyyself/wg-bench):

```sh
Routers details:
{
        "kernel": "5.10.201",
        "hostname": "OpenWrt",
        "system": "Qualcomm Atheros QCA9533 ver 1 rev 1",
        "model": "TP-Link TL-WR841N/ND v9",
        "board_name": "tplink,tl-wr841-v9",
        "rootfs_type": "squashfs",
        "release": {
                "distribution": "OpenWrt",
                "version": "22.03.6",
                "revision": "r20265-f85a79bcb4",
                "target": "ath79/tiny",
                "description": "OpenWrt 22.03.6 r20265-f85a79bcb4"
        }
}
Connecting to host 169.254.200.2, port 4242
[  5] local 169.254.200.1 port 33388 connected to 169.254.200.2 port 4242
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec  2.29 MBytes  19.2 Mbits/sec    0    102 KBytes       
[  5]   1.00-2.00   sec  2.27 MBytes  19.0 Mbits/sec    0    132 KBytes       
[  5]   2.00-3.00   sec  2.27 MBytes  19.0 Mbits/sec    0    142 KBytes       
[  5]   3.00-4.00   sec  2.21 MBytes  18.5 Mbits/sec    0    142 KBytes       
[  5]   4.00-5.00   sec  2.27 MBytes  19.0 Mbits/sec    0    163 KBytes       
[  5]   5.00-6.00   sec  2.21 MBytes  18.5 Mbits/sec    0    163 KBytes       
[  5]   6.00-7.00   sec  2.33 MBytes  19.5 Mbits/sec    0    163 KBytes       
[  5]   7.00-8.00   sec  2.15 MBytes  18.0 Mbits/sec    0    163 KBytes       
[  5]   8.00-9.00   sec  2.33 MBytes  19.5 Mbits/sec    0    273 KBytes       
[  5]   9.00-10.00  sec  2.51 MBytes  21.1 Mbits/sec    0    273 KBytes       
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  22.8 MBytes  19.2 Mbits/sec    0             sender
[  5]   0.00-10.05  sec  22.5 MBytes  18.8 Mbits/sec                  receiver

iperf Done.

```
