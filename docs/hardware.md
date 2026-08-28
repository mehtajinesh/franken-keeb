# Hardware

Keep enough detail here to reproduce the configuration or diagnose one half of
the keyboard independently.

## Keyboard

- Name or model: Keebio Iris CE
- PCB revision: Rev. 1
- Layout: Low-profile split 4x6 with four thumb keys per half
- Number of keys: 56
- Switch type: Kailh Choc
- Firmware: QMK
- QMK keyboard target: `keebio/iris_ce/rev1`
- QMK keymap name: `franken_keeb`
- Controller: RP2040
- Firmware file type: UF2

## Controllers

| Half | Controller | Bootloader | Connection |
| --- | --- | --- | --- |
| Left | Integrated RP2040 | RP2040 UF2 | USB-C host / USB-C split |
| Right | Integrated RP2040 | RP2040 UF2 | USB-C host / USB-C split |

## Wiring and peripherals

- Split transport: USB-C cable between halves
- Matrix wiring or pin map:
- Encoders:
- Displays:
- Pointing devices:
- LEDs:
- Batteries: None

## Notes

The stock Iris CE firmware supports VIA. QMK bootloader access is available by
holding the top-left key while connecting, holding the PCB reset button for at
least one second, or invoking `QK_BOOT` from the keymap.

Record future hardware quirks, repairs, and differences between the two halves
here.
