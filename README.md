# TL-WR841N-OpenWRT
The builds in this repository are only for v9 of the TL-WR841N(D) with 16MB SPI/64MB RAM. Builds for other versions will possibly be added.

## Installation
### Prerequisites
- You have upgraded your wr841n with 64MB RAM and 16MB SPI with a guide [like this](https://wiki.freifunk.net/TP-Link_WR841ND/Flash_und_RAM_erweitern_bis_v12)
- You have installed the [latest official version](https://openwrt.org/toh/tp-link/tl-wr841nd) 18.06 of OpenWRT **OR** a previous OpenWRT release from this repo
  
### Steps
- Download the latest release from [Releases](https://github.com/technikamateur/TP-Link-WR841N-OpenWRT/releases)
- Its recommend to verify the download with the provided checksum
- Go to your router web interface and upload the sysupgrade binary
- **Warning for users comming from 18.06 (latest official release):** Settings can **NOT** be kept because of the switch from *ar71xx* to *ath79*. Keeping the settings will lead to a boot loop and a recovery method will be necessary

## Information
These packages were compiled to save you some time. Build system config can be found in `diffconfig`. Basically it's the following:
- OpenWRT tiny ath79 target
- LuCI web interface
- Support for `ed25519` ssh keys
- [Quad9](https://quad9.net/) as default DNS resolver - this can be changed in settings!

Please note that the binaries have been tested, but there is **no warranty**. You are installing these packages at your own risk!

OpenWRT License can be found [here](https://github.com/openwrt/openwrt/blob/main/COPYING).

## Change DNS Server
If you want to change to a different DNS forwarder, just got to `Network`->`DHCP and DNS`->`Forwards` and paste your own DNS servers.

If you want to use the DNS server advertised by WAN, got to `Network`->`DHCP and DNS`->`Forwards` and remove all DNS entries. Afterward switch to `Resolv & Hosts Files` and remove the tick from `Ignore resolv file`.

## Wireguard benchmarks
For all who are interested in running wireguard on this old Router, here are some results from this [awesome wg bench script](https://github.com/cyyself/wg-bench):

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
