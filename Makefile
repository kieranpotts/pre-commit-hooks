#
# Task runners for this project's development lifecycle.
#

.PHONY: version help

help:
	@echo "Available targets:"
	@echo "  version  - Tag a release point"
	@echo "  help     - Show this help message"

version:
	./run/version
