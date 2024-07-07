// change to 16mb
define Device/tplink_tl-wr841-v9
  $(Device/tplink-16mlzma) //for 8M use tplink-8mlzma
  SOC := qca9533
  DEVICE_MODEL := TL-WR841N/ND
  DEVICE_VARIANT := v9
  TPLINK_HWID := 0x08410009
  SUPPORTED_DEVICES += tl-wr841n-v9
endef
TARGET_DEVICES += tplink_tl-wr841-v9
