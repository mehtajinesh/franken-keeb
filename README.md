# Franken Keeb

Personal QMK configuration for a Keebio Iris CE Rev. 1 split keyboard.

This repository is an [external QMK userspace](https://docs.qmk.fm/newbs_external_userspace),
which keeps the personal keymap separate from the upstream `qmk_firmware`
repository.

## Hardware target

| Item | Value |
| --- | --- |
| Keyboard | Keebio Iris CE |
| PCB | Rev. 1 |
| QMK target | `keebio/iris_ce/rev1` |
| Controller | RP2040 |
| Keymap | `franken_keeb` |
| Firmware format | UF2 |

## Repository layout

```text
.github/                  Pull request and CI configuration
docs/                     Hardware and development documentation
keyboards/                Keyboard-specific QMK keymaps
users/franken_keeb/       Behavior shared by personal keymaps
Makefile                  Local setup and build commands
qmk.json                  External-userspace build targets
```

The keyboard-specific keymap will live at:

```text
keyboards/keebio/iris_ce/keymaps/franken_keeb/
```

## Local setup

Install QMK using the [official setup guide](https://docs.qmk.fm/newbs_getting_started),
then connect this repository to QMK and validate the environment:

```sh
make setup
make doctor
```

Once the keymap is added, compile it with:

```sh
make compile
```

The flashable UF2 is saved to
`output/keebio_iris_ce_rev1_franken_keeb.uf2`.

Flashing is intentionally a separate command so compilation cannot
accidentally modify the physical keyboard:

```sh
make flash
```

## Development workflow

Every incremental change starts from `dev`:

```sh
git switch dev
git pull --ff-only origin dev
git switch -c feature/<short-description>
```

Before pushing, compile, flash, and physically test the affected behavior:

```sh
make test
make flash
```

Then commit, push, and open a pull request into `dev`:

```sh
git add <changed-files>
git commit -m "Describe the keyboard change"
git push -u origin feature/<short-description>
gh pr create --base dev --fill
```

Review the diff and CI result before merging. A tested `dev` state can later be
promoted to `main` with a separate pull request. See
[`docs/workflow.md`](docs/workflow.md) for the complete policy.

## Planned OS-aware behavior

A later incremental change will introduce semantic QMK keycodes such as an
adaptive primary modifier and copy action:

| Operation | macOS / iOS | Windows / Linux |
| --- | --- | --- |
| Primary modifier | Command | Control |
| Copy | Command+C | Control+C |

This behavior will use QMK host OS detection and will be tested separately from
the repository foundation.
