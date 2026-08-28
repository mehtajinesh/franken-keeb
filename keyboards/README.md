# Keyboard keymaps

QMK external userspace mirrors the upstream keyboard directory structure. The
Iris CE keymap will be created in the next incremental change at:

```text
keyboards/keebio/iris_ce/rev1/keymaps/franken_keeb/
```

Create it with `qmk new-keymap`, then add the target to `qmk.json` with `qmk
userspace-add`. Do not copy the whole upstream keyboard implementation into this
repository; only the personal keymap belongs here.
