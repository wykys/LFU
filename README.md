# LFU - Lazy Firmware Update

A script that allows you to conveniently update the firmware with orange pi on the electronic board of the 3D printer. It uses 2 pins on the Orange Pi, which are connected via `1 kΩ` resistors to the `NRST` and `BOOT0` signals on the printer's electronic board. This allows the script to automatically switch the device to DFU mode, help `dfu-util` update the FW, and then start the new FW.

## Install

⚠️ Submodules must be included when cloning.

```bash
# -j8 -j8 is an optional parameter that specifies
# how many cores can be used in cloning.
git clone -j8 --recurse-submodules https://github.com/wykys/LFU.git
```

Go to the cloned repository.

```bash
cd LFU
```

Run the installation script that compiles wiringOP, which is a library that allows you to control GPIO.

```bash
./install.sh
```

## Use

Firmware update.

```bash
sudo ./flash.sh
```

## Requirements

The tool assumes that you have the dfu-util tool installed and are using a single-board Orange Pi computer.
