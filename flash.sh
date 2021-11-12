#!/bin/bash
# wykys 2021
# Lazy Firmware Update

RESET_PIN=25
BOOT0_PIN=23

GPIO_DRIVER="./wiringOP/gpio/gpio"

DEVICE="0483:df11"
FIRMWARE="/home/wcube/klipper/out/klipper.bin"

###############################################################################

delay () {
    sleep 0.5
}

gpio_init() {
    $GPIO_DRIVER mode $RESET_PIN OUTPUT
    $GPIO_DRIVER mode $BOOT0_PIN OUTPUT
    delay
}

reset_mcu () {
    $GPIO_DRIVER write $RESET_PIN 0
    delay
}

run_mcu () {
    $GPIO_DRIVER write $RESET_PIN 1
    delay
}

boot_dfu () {
    $GPIO_DRIVER write $BOOT0_PIN 1
    delay
}

boot_flash () {
    $GPIO_DRIVER write $BOOT0_PIN 0
    delay
}

flash () {
    dfu-util --device $DEVICE -D $FIRMWARE --alt 0 -s 0x08000000
}

main () {
    gpio_init
    reset_mcu
    boot_dfu
    run_mcu
    flash
    reset_mcu
    boot_flash
    run_mcu
}

###############################################################################

main
