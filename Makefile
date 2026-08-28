KEYBOARD := keebio/iris_ce/rev1
KEYMAP := franken_keeb

.PHONY: setup doctor compile test flash

setup:
	qmk config user.overlay_dir="$(CURDIR)"

doctor:
	qmk userspace-doctor

compile:
	qmk compile -kb "$(KEYBOARD)" -km "$(KEYMAP)"

test: doctor compile

flash:
	qmk flash -kb "$(KEYBOARD)" -km "$(KEYMAP)"
