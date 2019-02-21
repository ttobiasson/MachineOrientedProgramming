.PHONY: clean All

All:
	@echo "----------Building project:[ autopong_keypad - Debug ]----------"
	@cd "autopong_keypad" && "$(MAKE)" -f  "autopong_keypad.mk" && "$(MAKE)" -f  "autopong_keypad.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ autopong_keypad - Debug ]----------"
	@cd "autopong_keypad" && "$(MAKE)" -f  "autopong_keypad.mk" clean
