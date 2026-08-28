KEYBOARD := keebio/iris_ce/rev1
KEYMAP := franken_keeb
OUTPUT_DIR := output
FIRMWARE := $(subst /,_,$(KEYBOARD))_$(KEYMAP).uf2

.PHONY: setup doctor compile test flash

setup:
	qmk config user.overlay_dir="$(CURDIR)"

doctor:
	qmk userspace-doctor

compile:
	qmk compile -kb "$(KEYBOARD)" -km "$(KEYMAP)"
	mkdir -p "$(OUTPUT_DIR)"
	cp "$(FIRMWARE)" "$(OUTPUT_DIR)/$(FIRMWARE)"
	@echo "Firmware saved to $(OUTPUT_DIR)/$(FIRMWARE)"

test: doctor compile

flash:
	qmk flash -kb "$(KEYBOARD)" -km "$(KEYMAP)"
