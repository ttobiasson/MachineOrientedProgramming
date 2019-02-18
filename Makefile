.PHONY: clean All

All:
	@echo "----------Building project:[ 7seg - Debug ]----------"
	@cd "7seg" && "$(MAKE)" -f  "7seg.mk" && "$(MAKE)" -f  "7seg.mk" PostBuild
clean:
	@echo "----------Cleaning project:[ 7seg - Debug ]----------"
	@cd "7seg" && "$(MAKE)" -f  "7seg.mk" clean
